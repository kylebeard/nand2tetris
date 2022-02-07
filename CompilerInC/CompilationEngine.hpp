
#ifndef COMPENGINE_H
#define COMPENGINE_H 1
#include "JackTokenizer.h"
#include "utils.hpp"
#include <fstream>
#include <stdio.h>
#include <vector>
using namespace std;
class CompilationEngine {
  private:
    ofstream *out;
    string currentToken;
    TokenType currentTokenType;
    vector<string> kwConstants = {kwStr(TRUE), kwStr(FALSE), kwStr(NULL_KW), kwStr(THIS)};
    string binOps[9] = {"+", "-", "*", "/", "&", "|", "<", ">", "="};
    string unaryOps[2] = {"-", "~"};
    const int MAX_TOKEN_SIZE = 255;
    const int MAX_TOKEN_TYPE_SIZE = 16; // longest string retuned by ttStr()

  public:
    CompilationEngine(ofstream *);
    ~CompilationEngine();
    void compileClass();

  private:
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
    void compileSubCall();
    void eat(vector<string>);
    void eat(TokenType);
    void eat(string);
    bool maybeEat(vector<string>);
    bool maybeEat(TokenType);
    bool maybeEat(string);
    void eatType();       // int, char, boolean or className (identifier)
    void eatReturnType(); // 'void' || eatType()
    bool cmpTok(string);
    void advanceTokenizer();
    void writeToken();
    void startRule(GrammarRule);
    void endRule(GrammarRule);
    string join(vector<string>, string);
    void error(string);
};

#endif // COMPENGINE_H