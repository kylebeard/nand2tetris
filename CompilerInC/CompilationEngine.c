#include "CompilationEngine.h"
#include "JackTokenizer.h"
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

void eat(char **, size_t);
void eat_tt(TokenType);
void eat_str(char *);
void advanceTokenizer();
void writeToken();
void startRule(GrammarRule);
void endRule(GrammarRule);
char *join(char **, char *, size_t);
void eatType(); // int, char, boolean or className (identifier)
bool maybe_eat(char *);
void error(char *msg);

FILE *out;
char *currentToken;
TokenType currentTokenType;
const int MAX_TOKEN_SIZE = 255;
const int MAX_TOKEN_TYPE_SIZE = 16; // longest string retuned by getTokenTypeStr()

void initCompilationEngine(FILE *_outFile) {
    out = _outFile;
    advanceTokenizer();
}


void compileClass() {
    /*
    'class' className '{' classVarDec* subroutineDec* '}'
    */
    startRule(CLASS_RULE);

    compileClassVarDec();
    compileClassVarDec();
    compileClassVarDec();
    compileClassVarDec();

    endRule(CLASS_RULE);
}
void compileClassVarDec() {
    /*
    ('static'|'field' ) type varName (',' varName)* ';'
    */
    startRule(CLASS_VAR_DEC);

    char *expected[2] = {getKeywordStr(STATIC), getKeywordStr(FIELD)};
    eat((char **)expected, 2);
    eatType();
    eat_tt(IDENTIFIER);
    while (maybe_eat(",")) { eat_tt(IDENTIFIER); }
    eat_str(";");

    endRule(CLASS_VAR_DEC);
}

void compileSubroutineDec() {
    /*
    ('constructor' | 'function' | 'method') ('void' | type) subroutineName
    '(' parameterList ')' subroutineBody
    */
}
void compileParamList() {
    /*
    ((type varName) (',' type varName)*)?
    */
}
void compileSubroutineBody() {
    /*
    '{' varDec* statements '}'
    */
}
void compileVarDec() {
    /*
    'var' type varName (', ' varName)* ';'
    */
}
void compileStatements() {
    /*
    Statement*
    Statement:
    letStatement | ifStatement| whileStatement | doStatement | returnStatement
    */
}
void compileLet() {
    /*
    'let' varName ('[' expression ']')? '=' expression ';'
    */
}
void compileIf() {
    /*

    'if' '(' expression ')' '{' statements "}' ('else' '{' statements '}')?
    */
}
void compileDo() {
    /*

    'do' subroutineCall';'
    */
}
void compileWhile() {
    /*

    'while' '(' expression ')' '{' statements '}'
    */
}
void compileReturn() {
    /*

    'return' expression? ':'
    */
}
void compileExpr() {
    /*

    */
}
void compileTerm() {
    /*

    */
}
void compileExprList() {
    /*

    */
}

void advanceTokenizer() {
    if (hasMoreTokens()) {
        advance();
        currentToken = tokenVal();
        currentTokenType = tokenType();
    } else {
        printf("WARNING: Tried to advance tokenizer with no more tokens left.");
    }
}

void eat(char **possibilities, size_t len) {
    for (int i = 0; i < len; i++) {
        if (strncmp(currentToken, possibilities[i], MAX_TOKEN_SIZE) == 0) {
            writeToken();
            advanceTokenizer();
            return;
        }
    }

    char *joined = join(possibilities, ", ", len);
    char **ret = malloc(sizeof(char **));
    asprintf(ret, "Expected Token(s): %s", joined);
    error(*ret);
}

void eat_tt(TokenType tt) {
    if (currentTokenType == tt) {
        writeToken();
        advanceTokenizer();
        return;
    }
    char **ret = malloc(sizeof(char **));
    asprintf(ret, "Expected Token Type: %s", getTokenTypeStr(currentTokenType));
    error(*ret);
}

// int, char, boolean or className (identifier)
void eatType() {
    int i = strncmp(currentToken, getKeywordStr(INT), 3);
    int c = strncmp(currentToken, getKeywordStr(CHAR), 4);
    int b = strncmp(currentToken, getKeywordStr(BOOLEAN), 7);
    if (!i || !c || !b || currentTokenType == IDENTIFIER) {
        writeToken();
        advanceTokenizer();
        return;
    }

    error("Expected Type (int, char, boolean or className (identifier))");
}

bool maybe_eat(char *expected) {
    if (!strncmp(currentToken, expected, strlen(expected))) {
        writeToken();
        advanceTokenizer();
        return true;
    }

    return false;
}

void eat_str(char *str) {
    if (!maybe_eat(str)) {
        char **ret = malloc(sizeof(char **));
        asprintf(ret, "Expected '%s'", str);
        error(*ret);
    }
}

void writeToken() {
    char *ttStr = getTokenTypeStr(currentTokenType);
    char *val = tokenVal();
    val = toXml(currentToken);
    fprintf(out, "<%s> %s </%s>\n", ttStr, val, ttStr);
}

void startRule(GrammarRule rule) { fprintf(out, "<%s>\n", getRuleStr(rule)); }

void endRule(GrammarRule rule) { fprintf(out, "</%s>\n", getRuleStr(rule)); }

void error(char *msg) {
    printf("ERROR: %s\n", msg);
    printf("Current Token: %s\n", currentToken);
    printf("Current Line: %s\n", getLine());
    exit(1);
}

char *join(char **vals, char *sep, size_t len) {
    size_t seplen = strlen(sep);
    char *joined = calloc(1, strlen(vals[0]) + 1);
    strcpy(joined, vals[0]);
    for (int i = 1; i < len; i++) {
        size_t joinedlen = strlen(joined);
        size_t currValLen = strlen(vals[i]);
        joined = realloc(joined, joinedlen + seplen + currValLen + 1);
        strlcat(joined, sep, joinedlen + seplen + 1);
        strlcat(joined, vals[i], joinedlen + seplen + currValLen + 1);
    }

    return joined;
}