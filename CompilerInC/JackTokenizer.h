#include "utils.hpp"
#include <stdbool.h>
#include <stdio.h>
#ifndef TOKENIZER_H
#define TOKENIZER_H 1
typedef struct Token {
    char *value;
    TokenType type;
} Token;

void initTokenizer(FILE *inFile);
void freeTokenizer();
bool hasMoreTokens();
void advance();
TokenType tokenType();
char *tokenVal();
char *getLine();
void tokenizerError(char *msg);
#endif