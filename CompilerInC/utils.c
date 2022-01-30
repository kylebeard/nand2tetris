#include "utils.h"
char *getTokenTypeStr(TokenType tt)
{
    switch (tt)
    {
    case KEYWORD:
        return "keyword";
    case SYMBOL:
        return "symbol";
    case IDENTIFIER:
        return "identifier";
    case INT_CONST:
        return "integerConstant";
    case STR_CONST:
        return "stringConstant";
    case UNKNOWN:
        return "unknown";

    default:
        return (char *)NULL;
    }
}

char *getKeywordStr(Keyword kw)
{
    switch (kw)
    {
    case CLASS:
        return "class";
    case CONSTRUCTOR:
        return "constructor";
    case FUNCTION:
        return "function";
    case METHOD:
        return "method";
    case FIELD:
        return "field";
    case STATIC:
        return "static";
    case VAR:
        return "var";
    case INT:
        return "int";
    case CHAR:
        return "char";
    case BOOLEAN:
        return "boolean";
    case VOID:
        return "void";
    case TRUE:
        return "true";
    case FALSE:
        return "false";
    case NULL_KW:
        return "null";
    case THIS:
        return "this";
    case LET:
        return "let";
    case DO:
        return "do";
    case IF:
        return "if";
    case ELSE:
        return "else";
    case WHILE:
        return "while";
    case RETURN:
        return "return";
    default:
        return (char *)NULL;
    }
}