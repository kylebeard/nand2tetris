#include "utils.hpp"
#include <iostream>
#include <string.h>
using namespace std;
string toXml(string tok) {
    if (tok.size() > 1)
        return tok;

    switch (tok[0]) {
    case '<':
        return "&lt;";
    case '>':
        return "&gt;";
    case '"':
        return "&quot;";
    case '&':
        return "&amp;";
    default:
        return tok;
    }
}

char *ttStr(TokenType tt) {
    switch (tt) {
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
    default:
        return "unknown";
    }
}

char *kwStr(Keyword kw) {
    switch (kw) {
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

char *ruleStr(GrammarRule rule) {
    switch (rule) {
    case CLASS_RULE:
        return "class";
    case CLASS_VAR_DEC:
        return "classVarDec";
    case SUBROUTINE_DEC:
        return "subroutineDec";
    case PARAMETER_LIST:
        return "parameterList";
    case SUBROUTINE_BODY:
        return "subroutineBody";
    case VAR_DEC:
        return "varDec";
    case STATEMENTS:
        return "statements";
    case LET_STATEMENT:
        return "letStatement";
    case IF_STATEMENT:
        return "ifStatement";
    case WHILE_STATEMENT:
        return "whileStatement";
    case DO_STATEMENT:
        return "doStatement";
    case RETURN_STATEMENT:
        return "returnStatement";
    case EXPRESSION:
        return "expression";
    case TERM:
        return "term";
    case EXPRESSION_LIST:
        return "expressionList";
    default:
        return "unknownRule";
    }
}
