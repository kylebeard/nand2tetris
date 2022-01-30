#include <stdbool.h>
#include <stdio.h>
#include "utils.h"
#ifndef TOKENIZER_H
#define TOKENIZER_H 1
void initTokenizer(FILE *inFile);
void freeTokenizer();
bool hasMoreTokens();
void advance();
TokenType tokenType();
char *tokenVal();

void error(char *msg);
#endif