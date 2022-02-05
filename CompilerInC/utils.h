#include <stdlib.h>
#ifndef UTILS_H
#define UTILS_H 1
char *toXml(char *);
enum TokenType { KEYWORD, SYMBOL, IDENTIFIER, INT_CONST, STR_CONST, UNKNOWN };
typedef enum TokenType TokenType;
char *getTokenTypeStr(TokenType tt);

enum Keyword {
    CLASS,
    CONSTRUCTOR,
    FUNCTION,
    METHOD,
    FIELD,
    STATIC,
    VAR,
    INT,
    CHAR,
    BOOLEAN,
    VOID,
    TRUE,
    FALSE,
    NULL_KW,
    THIS,
    LET,
    DO,
    IF,
    ELSE,
    WHILE,
    RETURN
};
typedef enum Keyword Keyword;

char *getKeywordStr(Keyword kw);

// rules handled directly type, class name, subroutine name, variable name, statement,
// subroutine call,
enum GrammarRule {
    CLASS_RULE,
    CLASS_VAR_DEC,
    SUBROUTINE_DEC,
    PARAMETER_LIST,
    SUBROUTINE_BODY,
    VAR_DEC,
    STATEMENTS,
    LET_STATEMENT,
    IF_STATEMENT,
    WHILE_STATEMENT,
    DO_STATEMENT,
    RETURN_STATEMENT,
    EXPRESSION,
    TERM,
    EXPRESSION_LIST

};
typedef enum GrammarRule GrammarRule;
char *getRuleStr(GrammarRule);

#endif