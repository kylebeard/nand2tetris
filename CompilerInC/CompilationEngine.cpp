#include "CompilationEngine.hpp"
#include "JackTokenizer.hpp"
#include "SymbolTable.hpp"
#include <boost/algorithm/string/join.hpp>
#include <fstream>
#include <iostream>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <vector>
CompilationEngine::CompilationEngine(ofstream *_outFile) : out(_outFile) {
    advanceTokenizer();
}

void CompilationEngine::compileClass() {
    /*
    'class' className '{' classVarDec* subroutineDec* '}'
    */
    startRule(CLASS_RULE);

    eat(kwStr(CLASS_KW));

    eat(IDENTIFIER, "className");
    eat("{");
    while (cmpTok(kwStr(STATIC_KW)) || cmpTok(kwStr(FIELD_KW)))
        compileClassVarDec();

    while (cmpTok(kwStr(CONSTRUCTOR)) || cmpTok(kwStr(METHOD)) || cmpTok(kwStr(FUNCTION)))
        compileSubroutineDec();

    eat("}");

    endRule(CLASS_RULE);
}

void CompilationEngine::compileClassVarDec() {
    /*
    ('static'|'field' ) type varName (',' varName)* ';'
    */
    startRule(CLASS_VAR_DEC);

    vector<string> expect = {kwStr(STATIC_KW), kwStr(FIELD_KW)};
    string kind = currentToken;
    eat(expect);

    string varType = currentToken;
    eatType();

    SymbolKind sk = kind == kwStr(FIELD_KW) ? FIELD_SK : STATIC_SK;
    st.define(currentToken, varType, sk);

    string tag = "define::" + kind + "::" + varType + "::";
    eat(IDENTIFIER, tag + to_string(st.indexOf(currentToken)));
    while (maybeEat(",")) {
        st.define(currentToken, varType, sk);
        eat(IDENTIFIER, tag + to_string(st.indexOf(currentToken)));
    }
    eat(";");

    endRule(CLASS_VAR_DEC);
}

void CompilationEngine::compileSubroutineDec() {
    /*
    ('constructor' | 'function' | 'method') ('void' | type) subroutineName
    '(' parameterList ')' subroutineBody
    */
    startRule(SUBROUTINE_DEC);
    st.startSubroutine();

    vector<string> expect = {kwStr(CONSTRUCTOR), kwStr(FUNCTION), kwStr(METHOD)};
    string kind = currentToken;
    eat(expect);
    eatReturnType();

    eat(IDENTIFIER, "define::" + kind);
    eat("(");
    compileParamList();
    eat(")");
    compileSubroutineBody();
    endRule(SUBROUTINE_DEC);
}
void CompilationEngine::compileParamList() {
    /*
    ((type varName) (',' type varName)*)?
    */

    startRule(PARAMETER_LIST);

    if (currentToken == ")") {
        endRule(PARAMETER_LIST);
        return;
    }
    string varType = currentToken;
    eatType();
    st.define(currentToken, varType, ARG_SK);
    string tag = "define::arg::";
    eat(IDENTIFIER, tag + to_string(st.indexOf(currentToken)));
    while (maybeEat(",")) {
        varType = currentToken;
        eatType();
        st.define(currentToken, varType, ARG_SK);

        eat(IDENTIFIER, tag + to_string(st.indexOf(currentToken)));
    }

    endRule(PARAMETER_LIST);
}
void CompilationEngine::compileSubroutineBody() {
    /*
    '{' varDec* statements '}'
    */
    startRule(SUBROUTINE_BODY);
    eat("{");
    while (currentToken == kwStr(VAR_KW))
        compileVarDec();
    compileStatements();
    eat("}");
    endRule(SUBROUTINE_BODY);
}
void CompilationEngine::compileVarDec() {
    /*
    'var' type varName (', ' varName)* ';'
    */
    startRule(VAR_DEC);

    eat(kwStr(VAR_KW));
    string varType = currentToken;
    eatType();

    st.define(currentToken, varType, VAR_SK);
    string tag = "define::var::";
    eat(IDENTIFIER, tag + to_string(st.indexOf(currentToken)));
    while (maybeEat(",")) {
        st.define(currentToken, varType, VAR_SK);
        eat(IDENTIFIER, tag + to_string(st.indexOf(currentToken)));
    }

    eat(";");

    endRule(VAR_DEC);
}
void CompilationEngine::compileStatements() {
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
void CompilationEngine::compileLet() {
    /*
    'let' varName ('[' expression ']')? '=' expression ';'
    */
    startRule(LET_STATEMENT);
    eat(kwStr(LET));
    auto sym = st.get(currentToken);
    string tag = "access::" + toString(sym.kind) + "::" + to_string(sym.index);
    eat(IDENTIFIER, tag);
    if (maybeEat("[")) {
        compileExpr();
        eat("]");
    }
    eat("=");
    compileExpr();
    eat(";");
    endRule(LET_STATEMENT);
}
void CompilationEngine::compileIf() {
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
void CompilationEngine::compileDo() {
    /*
    'do' subroutineCall';'
    */
    startRule(DO_STATEMENT);
    eat(kwStr(DO));
    eat(IDENTIFIER);
    if (maybeEat("."))
        eat(IDENTIFIER);
    eat("(");
    compileExprList();
    eat(")");
    eat(";");
    endRule(DO_STATEMENT);
}
void CompilationEngine::compileWhile() {
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
void CompilationEngine::compileReturn() {
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
void CompilationEngine::compileExpr() {
    /*
    term (op term)*
    */
    startRule(EXPRESSION);
    compileTerm();
    while (find(begin(binOps), end(binOps), currentToken) != end(binOps)) {
        eat(SYMBOL);
        compileTerm();
    }
    endRule(EXPRESSION);
}
void CompilationEngine::compileTerm() {
    /*
    integerConstant | stringConstant | keywordConstant | varName|
    varName ' [' expression ']' | subroutineCall | ' (' expression ') ' | unaryOp term

    subroutineCall:
        subroutineName ' (' expressionList ') ' I ( className| varName) '. ' subroutineName
    '('expressionList")"
    */
    startRule(TERM);
    if (maybeEat(INT_CONST) || maybeEat(STR_CONST)) {
    } else if (maybeEat(kwConstants)) {
    } else if (maybeEat("(")) {
        compileExpr();
        eat(")");
    } else if (find(begin(unaryOps), end(unaryOps), currentToken) != end(unaryOps)) {
        eat(SYMBOL);
        compileTerm();
    } else if (currentTokenType == IDENTIFIER) {
        if (st.exists(currentToken)) {
            auto sym = st.get(currentToken);
            string tag = "access::" + toString(sym.kind) + to_string(sym.index);
            eat(IDENTIFIER, tag);
        } else {
            eat(IDENTIFIER);
        }

        if (maybeEat("[")) {
            compileExpr();
            eat("]");
        } else if (cmpTok(".") || cmpTok("(")) {
            compileSubCall();
        }
    }
    endRule(TERM);
}

void CompilationEngine::compileSubCall() {
    /*
     subroutineCall:
        subroutineName ' (' expressionList ') ' I ( className| varName) '. ' subroutineName
    '('expressionList")"
    */
    if (maybeEat("."))
        eat(IDENTIFIER);

    eat("(");
    compileExprList();
    eat(")");
}

void CompilationEngine::compileExprList() {
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

void CompilationEngine::advanceTokenizer() {
    if (hasMoreTokens()) {
        advance();
        currentToken = string(tokenVal());
        currentTokenType = tokenType();
    } else {
        printf("WARNING: Tried to advance tokenizer with no more tokens left.\n");
    }
}

void CompilationEngine::eat(vector<string> vals) {
    for (int i = 0; i < vals.size(); i++) {
        if (currentToken == vals[i]) {
            writeToken();
            advanceTokenizer();
            return;
        }
    }
    string joined = join(vals, ", ");
    error("Expected token(s): " + joined);
}

bool CompilationEngine::maybeEat(vector<string> vals) {
    for (int i = 0; i < vals.size(); i++) {
        if (currentToken == vals[i]) {
            writeToken();
            advanceTokenizer();
            return true;
        }
    }
    return false;
}
void CompilationEngine::eat(TokenType tt, string tag) {
    if (currentTokenType == tt) {
        writeToken(tag);
        advanceTokenizer();
        return;
    }

    error("Expected Token Type: " + string(ttStr(currentTokenType)));
}

// int, char, boolean or className (identifier)
void CompilationEngine::eatType() {
    bool i = currentToken == string(kwStr(INT));
    bool c = currentToken == string(kwStr(CHAR));
    bool b = currentToken == string(kwStr(BOOLEAN));
    if (i || c || b || currentTokenType == IDENTIFIER) {
        writeToken();
        advanceTokenizer();
        return;
    }

    error("Expected Type (int, char, boolean or className (identifier))");
}

bool CompilationEngine::maybeEat(string expected, string tag) {
    if (currentToken == expected) {
        writeToken(tag);
        advanceTokenizer();
        return true;
    }

    return false;
}

bool CompilationEngine::maybeEat(TokenType tt) {
    if (currentTokenType == tt) {
        writeToken();
        advanceTokenizer();
        return true;
    }
    return false;
}
void CompilationEngine::eat(string str, string tag) {
    if (!maybeEat(str, tag)) {
        error("Expected: " + str);
    }
}

void CompilationEngine::eatReturnType() {
    if (!maybeEat(kwStr(VOID)))
        eatType();
}
void CompilationEngine::writeToken(string tag) {
    string tt = tag == "" ? ttStr(currentTokenType) : tag;
    *out << "<" << tt << ">"
         << " " << toXml(currentToken) << " "
         << "</" << tt << ">\n";
}

void CompilationEngine::startRule(GrammarRule rule) {
    *out << "<" << ruleStr(rule) << ">\n";
}

void CompilationEngine::endRule(GrammarRule rule) {
    *out << "</" << ruleStr(rule) << ">\n";
}
bool CompilationEngine::cmpTok(string s) {
    return currentToken == s;
}
void CompilationEngine::error(string msg) {
    cout << "ERROR: " << msg << endl;
    cout << "Current Token: " << currentToken << endl;
    cout << "Current Line: " << getLine() << endl;
    exit(1);
}

string CompilationEngine::join(vector<string> vals, string sep) {
    size_t seplen = sep.size();
    string joined = vals.at(0);
    for (int i = 1; i < vals.size(); i++) {
        joined += sep;
        joined += vals[i];
    }

    return joined;
}