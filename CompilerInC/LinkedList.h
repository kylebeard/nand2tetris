#include "utils.h"
#ifndef LINKED_LIST_H
#define LINKED_LIST_H 1

typedef struct Node {
    void *data;
    struct Node *next;
} Node;

void append(Node *, void *);
int length(Node *);
Node *removeFirst(Node *);
void insertFirst(Node *, void *);
void insertAt(Node *, int, void *);
Node *removeAt(Node *, int);
Node *nodeAt(Node *, int);
void printList(Node *, void (*)(void *));
void clear(Node *);
#endif