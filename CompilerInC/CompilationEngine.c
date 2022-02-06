#include "CompilationEngine.h"
#include "JackTokenizer.h"
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

void eatOneOf(char **, size_t);
bool maybeEatOneOf(char **, size_t);
void eatTT(TokenType);
bool maybeEatTT(TokenType);
void eat(char *);
void eatReturnType(); // 'void' || eatType()
bool maybeEat(char *);
void eatType(); // int, char, boolean or className (identifier)
bool cmpTok(char *);
void advanceTokenizer();
void writeToken();
void startRule(GrammarRule);
void endRule(GrammarRule);
char *join(char **, char *, size_t);
void error(char *msg);
void compileSubCall();

FILE *out;
char *currentToken;
TokenType currentTokenType;

char *kwConstants[4] = {"true", "false", "null", "this"};
char *binOps = "+-*/&|<>=";
char *unaryOps = "-~";

const int MAX_TOKEN_SIZE = 255;
const int MAX_TOKEN_TYPE_SIZE = 16; // longest string retuned by ttStr()

void initCompilationEngine(FILE *_outFile) {
    out = _outFile;
    advanceTokenizer();
}

void compileClass() {
    /*
    'class' className '{' classVarDec* subroutineDec* '}'
    */
    startRule(CLASS_RULE);

    eat(kwStr(CLASS));
    eatTT(IDENTIFIER);
    eat("{");
    while (cmpTok(kwStr(STATIC)) || cmpTok(kwStr(FIELD)))
        compileClassVarDec();

    while (cmpTok(kwStr(CONSTRUCTOR)) || cmpTok(kwStr(METHOD)) || cmpTok(kwStr(FUNCTION)))
        compileSubroutineDec();

    eat("}");

    endRule(CLASS_RULE);
}


void compileClassVarDec() {
    /*
    ('static'|'field' ) type varName (',' varName)* ';'
    */
    startRule(CLASS_VAR_DEC);

    char *expect[2] = {kwStr(STATIC), kwStr(FIELD)};
    eatOneOf((char **)expect, 2);
    eatType();
    eatTT(IDENTIFIER);
    while (maybeEat(",")) {
        eatTT(IDENTIFIER);
    }
    eat(";");

    endRule(CLASS_VAR_DEC);
}

void compileSubroutineDec() {
    /*
    ('constructor' | 'function' | 'method') ('void' | type) subroutineName
    '(' parameterList ')' subroutineBody
    */
    startRule(SUBROUTINE_DEC);

    char *expect[3] = {kwStr(CONSTRUCTOR), kwStr(FUNCTION), kwStr(METHOD)};
    eatOneOf((char **)expect, 3);
    eatReturnType();
    eatTT(IDENTIFIER);
    eat("(");
    compileParamList();
    eat(")");
    compileSubroutineBody();
    endRule(SUBROUTINE_DEC);
}
void compileParamList() {
    /*
    ((type varName) (',' type varName)*)?
    */

    startRule(PARAMETER_LIST);

    if (!strncmp(currentToken, ")", 2)) {
        endRule(PARAMETER_LIST);
        return;
    }

    eatType();
    eatTT(IDENTIFIER);
    while (maybeEat(",")) {
        eatType();
        eatTT(IDENTIFIER);
    }

    endRule(PARAMETER_LIST);
}
void compileSubroutineBody() {
    /*
    '{' varDec* statements '}'
    */
    startRule(SUBROUTINE_BODY);
    eat("{");
    while (!strncmp(currentToken, kwStr(VAR), 4))
        compileVarDec();
    compileStatements();
    eat("}");
    endRule(SUBROUTINE_BODY);
}
void compileVarDec() {
    /*
    'var' type varName (', ' varName)* ';'
    */
    startRule(VAR_DEC);

    eat(kwStr(VAR));
    eatType();
    eatTT(IDENTIFIER);
    while (maybeEat(","))
        eatTT(IDENTIFIER);

    eat(";");

    endRule(VAR_DEC);
}
void compileStatements() {
    /*
    Statement*
    Statement:
    letStatement | ifStatement| whileStatement | doStatement | returnStatement
    */
    startRule(STATEMENTS);
    while (cmpTok(kwStr(LET)) || cmpTok(kwStr(IF)) || cmpTok(kwStr(WHILE)) || cmpTok(kwStr(DO))
           || cmpTok(kwStr(RETURN))) {
        if (cmpTok(kwStr(LET)))
            compileLet();
        else if (cmpTok(kwStr(IF)))
            compileIf();
        else if (cmpTok(kwStr(WHILE)))
            compileWhile();
        else if (cmpTok(kwStr(DO)))
            compileDo();
        else if (cmpTok(kwStr(RETURN)))
            compileReturn();
    }
    endRule(STATEMENTS);
}
void compileLet() {
    /*
    'let' varName ('[' expression ']')? '=' expression ';'
    */
    startRule(LET_STATEMENT);
    eat(kwStr(LET));
    eatTT(IDENTIFIER);
    if (maybeEat("[")) {
        compileExpr();
        eat("]");
    }
    eat("=");
    compileExpr();
    eat(";");
    endRule(LET_STATEMENT);
}
void compileIf() {
    /*

    'if' '(' expression ')' '{' statements "}' ('else' '{' statements '}')?
    */
    startRule(IF_STATEMENT);
    eat(kwStr(IF));
    eat("(");
    compileExpr();
    eat(")");

    eat("{");
    compileStatements();
    eat("}");
    if (maybeEat(kwStr(ELSE))) {
        eat("{");
        compileStatements();
        eat("}");
    }
    endRule(IF_STATEMENT);
}
void compileDo() {
    /*
    'do' subroutineCall';'
    */
    startRule(DO_STATEMENT);
    eat(kwStr(DO));
    eatTT(IDENTIFIER);
    if (maybeEat("."))
        eatTT(IDENTIFIER);
    eat("(");
    compileExprList();
    eat(")");
    eat(";");
    endRule(DO_STATEMENT);
}
void compileWhile() {
    /*

    'while' '(' expression ')' '{' statements '}'
    */
    startRule(WHILE_STATEMENT);

    eat(kwStr(WHILE));
    eat("(");
    compileExpr();
    eat(")");

    eat("{");
    compileStatements();
    eat("}");

    endRule(WHILE_STATEMENT);
}
void compileReturn() {
    /*

    'return' expression? ':'
    */
    startRule(RETURN_STATEMENT);

    eat(kwStr(RETURN));
    if (!maybeEat(";")) {
        compileExpr();
        eat(";");
    }

    endRule(RETURN_STATEMENT);
}
void compileExpr() {
    /*
    term (op term)*
    */
    startRule(EXPRESSION);
    compileTerm();
    while (strnlen(currentToken, 2) == 1 && strchr(binOps, *currentToken)) {
        eatTT(SYMBOL);
        compileTerm();
    }
    endRule(EXPRESSION);
}
void compileTerm() {
    /*
    integerConstant | stringConstant | keywordConstant | varName|
    varName ' [' expression ']' | subroutineCall | ' (' expression ') ' | unaryOp term

    subroutineCall:
        subroutineName ' (' expressionList ') ' I ( className| varName) '. ' subroutineName
    '('expressionList")"
    */
    startRule(TERM);
    if (maybeEatTT(INT_CONST) || maybeEatTT(STR_CONST)) {
    } else if (maybeEatOneOf((char **)kwConstants, 4)) {
    } else if (maybeEat("(")) {
        compileExpr();
        eat(")");
    } else if (strnlen(currentToken, 2) == 1 && strchr(unaryOps, *currentToken)) {
        compileTerm();
    } else if (maybeEatTT(IDENTIFIER)) {
        if (maybeEat("[")) {
            compileExpr();
            eat("]");
        } else if (cmpTok(".") || cmpTok("(")) {
            compileSubCall();
        }
    }
    endRule(TERM);
}

void compileSubCall() {
    /*
     subroutineCall:
        subroutineName ' (' expressionList ') ' I ( className| varName) '. ' subroutineName
    '('expressionList")"
    */
    if (maybeEat("."))
        eatTT(IDENTIFIER);

    eat("(");
    compileExprList();
    eat(")");
}

void compileExprList() {
    /*
    (expression ("', ' expression)* )?
    */
    startRule(EXPRESSION_LIST);
    if (cmpTok(")")) {
        endRule(EXPRESSION_LIST);
        return;
    }
    compileExpr();
    while (maybeEat(","))
        compileExpr();
    endRule(EXPRESSION_LIST);
}

void advanceTokenizer() {
    if (hasMoreTokens()) {
        advance();
        currentToken = tokenVal();
        currentTokenType = tokenType();
    } else {
        printf("WARNING: Tried to advance tokenizer with no more tokens left.\n");
    }
}

void eatOneOf(char **vals, size_t len) {
    for (int i = 0; i < len; i++) {
        if (strncmp(currentToken, vals[i], MAX_TOKEN_SIZE) == 0) {
            writeToken();
            advanceTokenizer();
            return;
        }
    }

    char *joined = join(vals, ", ", len);
    char **ret = malloc(sizeof(char **));
    asprintf(ret, "Expected Token(s): %s", joined);
    error(*ret);
}

bool maybeEatOneOf(char **vals, size_t len) {
    for (int i = 0; i < len; i++) {
        if (strncmp(currentToken, vals[i], MAX_TOKEN_SIZE) == 0) {
            writeToken();
            advanceTokenizer();
            return true;
        }
    }
    return false;
}
void eatTT(TokenType tt) {
    if (currentTokenType == tt) {
        writeToken();
        advanceTokenizer();
        return;
    }
    char **ret = malloc(sizeof(char **));
    asprintf(ret, "Expected Token Type: %s", ttStr(currentTokenType));
    error(*ret);
}

// int, char, boolean or className (identifier)
void eatType() {
    int i = strncmp(currentToken, kwStr(INT), 3);
    int c = strncmp(currentToken, kwStr(CHAR), 4);
    int b = strncmp(currentToken, kwStr(BOOLEAN), 7);
    if (!i || !c || !b || currentTokenType == IDENTIFIER) {
        writeToken();
        advanceTokenizer();
        return;
    }

    error("Expected Type (int, char, boolean or className (identifier))");
}

bool maybeEat(char *expected) {
    if (!strncmp(currentToken, expected, strlen(expected))) {
        writeToken();
        advanceTokenizer();
        return true;
    }

    return false;
}

bool maybeEatTT(TokenType tt) {
    if (currentTokenType == tt) {
        writeToken();
        advanceTokenizer();
        return true;
    }
    return false;
}
void eat(char *str) {
    if (!maybeEat(str)) {
        char **ret = malloc(sizeof(char **));
        asprintf(ret, "Expected '%s'", str);
        error(*ret);
    }
}

void eatReturnType() {
    if (!maybeEat(kwStr(VOID)))
        eatType();
}
void writeToken() {
    char *tt = ttStr(currentTokenType);
    char *val = tokenVal();
    val = toXml(currentToken);
    fprintf(out, "<%s> %s </%s>\n", tt, val, tt);
}

void startRule(GrammarRule rule) {
    fprintf(out, "<%s>\n", ruleStr(rule));
}

void endRule(GrammarRule rule) {
    fprintf(out, "</%s>\n", ruleStr(rule));
}
bool cmpTok(char *s) {
    return !strncmp(currentToken, s, MAX_TOKEN_SIZE);
}
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