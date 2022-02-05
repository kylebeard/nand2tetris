
#ifndef COMPENGINE_H
#define COMPENGINE_H 1
#include <stdio.h>

void initCompilationEngine(FILE *_outFile);
void compileClass();
void compileClassVarDec();
void compileSubroutineDec();
void compileParamList();
void compileSubroutineBody();
void compileVarDec();
void compileStatements();
void compileLet();
void compileIf();
void compileDo();
void compileWhile();
void compileReturn();
void compileExpr();
void compileTerm();
void compileExprList();

#endif // COMPENGINE_H