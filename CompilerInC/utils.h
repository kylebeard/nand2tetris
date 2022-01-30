#include <stdlib.h>
#ifndef UTILS_H
#define UTILS_H 1
enum TokenType
{
    KEYWORD,
    SYMBOL,
    IDENTIFIER,
    INT_CONST,
    STR_CONST,
    UNKNOWN
};
typedef enum TokenType TokenType;

char *getTokenTypeStr(TokenType tt);

enum Keyword
{
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

#endif