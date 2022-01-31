#include "CompilationEngine.h"
#include "JackTokenizer.h"
#include <stdio.h>
// type: 'int' | 'char' | 'boolean' | className

void initCompilationEngine(FILE *_outFile) {}
void compileClass() {
    /*
    'class' className '{' classVarDec* subroutineDec* '}'
    */
}
void compileClassVarDec() {
    /*
    ('static'|'field' ) type varName (',' varName)* ';'
    */
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