#include "JackTokenizer.hpp"
#include "LinkedList.hpp"
#include <ctype.h>
#include <regex.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

const int LINE_SIZE = 1024;

static FILE *inFile;
char line[LINE_SIZE];
Node *tokensHead;
Node *currToken;
char *symbols = "{}()[].,;+-*/&|<>=~";

regex_t *kwRegex;
char kwRegexStr[] = "^(class|constructor|function|method|field|static|var|int|char|boolean|void|"
                    "true|false|null|this|let|do|if|else|while|return)\\b";

regex_t *intConstRegex;
char intConstRegexStr[] = "^\\d+";

regex_t *strConstRegex;
char strConstRegexStr[] = "^\"[^\"]*\"";

regex_t *identifierRegex;
char identifierRegexStr[] = "^[a-zA-Z_]\\w*";

// private functions
bool matches(regex_t *regex, char *str, TokenType type, int *i);
void parseNewLine();
void printTokens(void *);
void initTokenizer(FILE *_inFile) {
    inFile = _inFile;
    tokensHead = (Node *)calloc(1, sizeof(Node));
    // compile the regexes
    kwRegex = (regex_t *)malloc(sizeof(regex_t));
    regcomp(kwRegex, kwRegexStr, REG_EXTENDED | REG_ENHANCED);

    intConstRegex = (regex_t *)malloc(sizeof(regex_t));
    regcomp(intConstRegex, intConstRegexStr, REG_EXTENDED | REG_ENHANCED);

    strConstRegex = (regex_t *)malloc(sizeof(regex_t));
    regcomp(strConstRegex, strConstRegexStr, REG_EXTENDED | REG_ENHANCED);

    identifierRegex = (regex_t *)malloc(sizeof(regex_t));
    regcomp(identifierRegex, identifierRegexStr, REG_EXTENDED | REG_ENHANCED);
}

void freeTokenizer() {
    free(kwRegex);
    free(intConstRegex);
    free(strConstRegex);
    free(identifierRegex);
    clear(tokensHead);
    free(tokensHead);
}

/* returns ponter to the first non-space character */
char *skipSpaces(char *str) {
    while (*str == ' ' || *str == '\t') str++;
    return str;
}

bool hasMoreTokens() {
    // algorithm
    // skip over every line that either
    //  - starts with '//'
    //  - only contains spaces and a new line
    //  - starts with '/*' (and skip all lines until '*/' is found)
    // until we get to the next line or the EOF
    long pos;
    if (length(tokensHead) > 0)
        return true;

    while (true) {
        pos = ftell(inFile);
        if (fgets(line, LINE_SIZE, inFile) == NULL)
            return false;
        // skip whitespace
        char *ptr = line;
        while (isspace(*ptr)) ptr++;

        if (strnlen(ptr, LINE_SIZE) == 0)
            continue;

        if (*ptr == '/' && *(ptr + 1) == '/')
            continue;

        if (*ptr == '/' && *(ptr + 1) == '*') {
            ptr += 2; // move past the '/*' we just found
            // read lines until we find the closing tag
            while (!strstr(ptr, "*/")) {
                if (fgets(line, LINE_SIZE, inFile) == NULL)
                    return false;

                ptr = line;
            }
            continue;
        }
        break;
    }

    if (!strnlen(line, LINE_SIZE))
        return false;

    fseek(inFile, pos, SEEK_SET);
    return true;
}

void advance() {
    if (length(tokensHead) == 0)
        parseNewLine();

    currToken = removeFirst(tokensHead);
}

void parseNewLine() {
    /*
    algorithm:
    duplicate the input line so we always have the orignial line.
    keep an index of where we are in the line.
    loop through the line searching for tokens from dupLine[index] onward.
    when a token is identified append it to the tokens linked list
    and advance the index to the next character after that token.
    Continue to the next iteration.
    */
    fgets(line, LINE_SIZE, inFile);
    int lineLength = strnlen(line, LINE_SIZE);
    // printf("lineLength: %d\n", lineLength);
    char dupLine[lineLength + 1];
    strlcpy(dupLine, line, LINE_SIZE);

    int i = 0;
    while (i < lineLength) {
        if (dupLine[i] == '\n' || dupLine[i] == '\r')
            break;

        if (dupLine[i] == ' ' || dupLine[i] == '\t') {
            i++;
            continue;
        }

        // comment
        if (dupLine[i] == '/' && dupLine[i + 1] == '/')
            break;

        if (dupLine[i] == '/' && dupLine[i + 1] == '*') {
            i += 2;
            char *endComment = strstr(&dupLine[i], "*/");
            if (endComment == NULL)
                tokenizerError("Didn't find closing '*/' for comment.");

            i = (endComment - dupLine) + 2; //+2 to get just after the */
            continue;
        }

        // keyword
        if (matches(kwRegex, &dupLine[i], KEYWORD, &i))
            continue;

        // symbol
        if (strchr(symbols, dupLine[i])) {
            char *tok = (char *)calloc(2, sizeof(char));
            strlcpy(tok, &dupLine[i], 2);
            Token *tokPtr = (Token *)calloc(1, sizeof(Token));
            tokPtr->type = SYMBOL;
            tokPtr->value = tok;
            append(tokensHead, tokPtr);
            i++;
            continue;
        }

        // int const
        if (matches(intConstRegex, &dupLine[i], INT_CONST, &i))
            continue;

        // str const
        if (matches(strConstRegex, &dupLine[i], STR_CONST, &i))
            continue;

        // identifier
        if (matches(identifierRegex, &dupLine[i], IDENTIFIER, &i))
            continue;

        printf("unrecognized token(s): %s\n", &dupLine[i]);
        exit(1);
    }

    // printf("\n\nnew tokens:\n");
    // printList(tokensHead, printTokens);
}

bool matches(regex_t *regex, char *str, TokenType type, int *i) {
    regmatch_t *match = (regmatch_t *)calloc(1, sizeof(regmatch_t));
    if (regexec(regex, str, 1, match, 0) != REG_NOMATCH) {
        // the address of the current character (dupLine[i])
        // is passed so as far as the regex is concerned
        // we are at index 0. because of this `end` will contain
        // the length of the keyword, so we can just create a new token
        // and increment i by end to move past the keyword.
        int end = match[0].rm_eo;
        char *tok = (char *)calloc(end + 2, sizeof(char));
        if (type == STR_CONST)
            // end - 1 to offset the +1 to str & then to exclue the ending "
            strlcpy(tok, str + 1, end - 1);
        else
            strlcpy(tok, str, end + 1);

        Token *tokPtr = (Token *)calloc(1, sizeof(Token));
        tokPtr->type = type;
        tokPtr->value = tok;
        append(tokensHead, tokPtr);
        *i += end;
        free(match);
        return true;
    }
    free(match);
    return false;
}

TokenType tokenType() {
    Token *p = (Token *)currToken->data;
    return p->type;
}

char *tokenVal() { return ((Token *)currToken->data)->value; }

void tokenizerError(char *msg) {

    printf("ERROR: %s\nLine: %s\n ", msg, line);
    exit(1);
}

void printTokens(void *data) {
    Token *tok = (Token *)data;
    Token stok = *tok;
    printf("(%s) %s\n", ttStr(tok->type), tok->value);
}

char *getLine() { return line; }