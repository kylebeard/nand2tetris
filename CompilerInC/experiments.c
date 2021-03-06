#include "utils.h"
#include <ctype.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
void test_isspace();
void teststrtok();
void test_substr();
void test_strptr();
void test_alloc();
void test_regex();
void test_strstr();
void test_strlcpy();
void test_charptrs(char ***);
void test_speed();
char *join(char **, char *, size_t);
void test_join();
void test_not();
typedef int *intp;
int main() {
    test_not();
    return 0;
}

void test_not() {
    int zero = 0;
    int negOne = -1;
    int posOne = 1;
    if (!zero)
        printf("!zero\n");
    if (!negOne)
        printf("!negOne\n");
    if (!posOne)
        printf("!posOne\n");
}
void test_join() {
    char **vals = malloc(3 * sizeof(char *));
    char *s1 = "str1";
    char *s2 = "str2";
    char *s3 = "str3";
    *vals = s1;
    *(vals + 1) = s2;
    *(vals + 2) = s3;
    for (int i = 0; i < 3; i++) { printf("%s\n", vals[i]); }
    char *joined = join(vals, ", ", 3);
    printf("joined: %s\n", joined);
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


void test_speed() {
    int count = 500;
    for (int i = 0; i < 500; i++) {
        int x = 2 * 50;
        int y = 46 * x;
    }
}
void test_charptrs(char ***paths) {

    *paths = malloc(sizeof(char *));
    char *path = "/a/path/to/something";
    **paths = path;
}

void test_strlcpy() {
    char ln[] = "{ let x = 2; }";
    char *tok = calloc(2, sizeof(char));
    strlcpy(tok, &ln[0], 2);
    printf("tok: %s\n", tok);
}
void test_strstr() {
    char line[] = "/* a comment */ static int a;";
    int i = 2;
    char *endComment = strstr(&line[i], "*/");
    printf("line: %p\nendComment: %p\n", line, endComment);
    i = endComment - line;
    printf("i: %d\n&line[i]: %s\n", i, &line[i]);
    printf("line[i]: %c", line[i]);
}
void test_regex() {
    regex_t *regex = malloc(sizeof(regex_t));
    regmatch_t *match = calloc(1, sizeof(regmatch_t));
    char kwRegex[] = "^(class|constructor|function|method|field|static|var|int|char|boolean|void|"
                     "true|false|null|this|let|do|if|else|while|return)\\b";
    // char kwRegex[] =
    // "^(class|constructor|function|method|field|static|var|int|char|boolean|void|true|false|null|this|let|do|if|else|while|return)[[:>:]]";
    printf("kwRegex: %s\n", kwRegex);

    char str[] = "class ";
    int rv, rv2;
    rv = regcomp(regex, kwRegex, REG_EXTENDED | REG_ENHANCED);
    printf("rv: %d\n", rv);

    rv2 = regexec(regex, str, 1, match, 0);

    printf("rv2: %d\n", rv2);

    if (rv2 == REG_NOMATCH)
        printf("no match found\n");
    else
        printf("match found\n");

    for (int i = 0; i < 1; i++) {
        printf("[%d] match start: %lld, match end: %lld", i, match[i].rm_so, match[i].rm_eo);
    }
}

void test_alloc() {
    char line[] = "let x[3 + (-1)*(1 - 3)] = svar*3+(1/(2*6));";
    char *tokens[3];
    char *dupLine = malloc(sizeof(line));
    strcpy(dupLine, line);
    char *tok;
    // initialize strtok to read of of dupLine
    tok = strtok(dupLine, " ");
    tokens[0] = tok;
    void *nullPtr = NULL;
    int i = 1;
    while ((tok = strtok(nullPtr, " "))) {
        printf("i: %d, tok: %s", i, tok);
        if (i >= (sizeof(tokens) / sizeof(*tokens))) {
            // *tokens = realloc(*tokens, (i + 5) * sizeof(*tokens));
            printf("new sizeof(tokens): %lu\n", sizeof(tokens) / sizeof(*tokens));
        }
        tokens[i] = tok;
        i++;
    }

    return;
}

void test_strptr() {
    char sarr[] = "a dummy string // a line comment";
    char *ptr = sarr;
    printf("strlen(ptr): %lu", strlen(ptr));
    ptr = strstr(sarr, "//");
    printf("strlen(ptr) after strstr: %lu", strlen(ptr));
    return;
}

void test_substr() {
    char line[] = "/* a block comment */";
    char *str = line + 2;
    printf("line+2: %s", str);
    // char *str2 = &line + 2;
    // printf("&line+2: %s", str2);
}

void test_isspace() {
    char nl = '\n';
    char spc = ' ';
    char tab = '\t';

    printf("isspace(nl,spc,tab): %d, %d, %d ", isspace(nl), isspace(spc), isspace(tab));
    return;
}

void teststrtok() {
    char str[] = "class Main {\n   \t\t     static int a;\n";
    printf("sizeof(str): %lu\n", sizeof(str));
    printf("strlen(str): %lu\n", strlen(str));
    char dupStrArr[255];
    strcpy(dupStrArr, str);
    printf("dupStrArr: %s\n", dupStrArr);
    void *nullPtr = NULL;
    char *tok;
    char seps[] = "\t\n ";
    printf("str: %s\n", str);
    tok = strtok(dupStrArr, seps);
    while (tok != NULL) {
        printf("tok: %s\n", tok);
        printf("strlen(tok): %lu\n", strlen(tok));
        tok = strtok(nullPtr, seps);
    }
}