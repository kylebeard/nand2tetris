#include "utils.h"
#ifndef LINKED_LIST_H
#define LINKED_LIST_H 1
typedef struct token {
    char *value;
    TokenType type;
    struct token *next;
} token;

void append(token *head, char *val, TokenType type);
int length(token *head);
token *removeFirst(token *head);
void insertFirst(token *head, char *val, TokenType type);
void insertAt(token *head, int pos, char *val, TokenType type);
token *removeAt(token *head, int pos);
token *tokenAt(token *head, int pos);
void printList(token *head);
void clear(token *head);
#endif