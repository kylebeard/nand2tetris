#include "LinkedList.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/queue.h>
#if 0
int main()
{
    printf("starting..");
    token headS;
    headS.next = NULL;
    token *head = &headS;
    printf("length() expected: 0 actual: %d\n", length(head));
    append(head, "first", STR_CONST);
    printf("length() expected: 1 actual: %d\n", length(head));
    append(head, "second", STR_CONST);
    printf("length() expected: 2 actual: %d\n", length(head));
    append(head, "third", STR_CONST);
    printf("length() expected: 3 actual: %d\n", length(head));
    append(head, "fourth", STR_CONST);
    printf("list after 4 appends:\n");
    printList(head);

    insertFirst(head, "inserted with insertFirst\n", STR_CONST);
    printf("firstElement, expected: inserted with... actual: %s\n", head->next->value);
    printf("length() expected: 5 actual: %d\n", length(head));

    token *removed = removeFirst(head);
    printf("length() expected: 4 actual: %d\n", length(head));
    printf("removed expected: inserted with.. actual: %s\n", removed->value);
    free(removed);

    printf("first after remove expected: first, actual: %s\n", head->next->value);

    insertAt(head, 1, "1.5", INT_CONST);
    printf("after insert at 1\n");
    printList(head);

    insertAt(head, 3, "2.5", INT_CONST);
    printf("after insert at 3 (2.5)\n");
    printList(head);

    removed = removeAt(head, 3);
    free(removed);
    removed = removeAt(head, length(head) - 1);
    free(removed);
    printf("after removeAt 3 and removeAt length -1\n");
    printList(head);

    clear(head);
    printf("length after clear: %d", length(head));
    printf("printList: \n");
    printList(head);
    append(head, "class", KEYWORD);
    append(head, "static", KEYWORD);
    append(head, "field", KEYWORD);
    printf("after 3 appends:\n");
    printList(head);
    printf("tokenAt(1): %s\n", tokenAt(head, 1)->value);
    return 0;
}

#endif

void append(token *head, char *val, TokenType type)
{
    token *newToken = malloc(sizeof(token));
    newToken->value = val;
    newToken->type = type;
    newToken->next = NULL;
    token *curr = head;
    while (1)
    {
        if (curr->next == NULL)
            break;
        curr = curr->next;
    }
    curr->next = newToken;
    return;
}

int length(token *head)
{
    int len = 0;
    token *curr;
    for (curr = head->next; curr != NULL; curr = curr->next)
    {
        len++;
    }
    return len;
}

token *removeFirst(token *head)
{
    token *removed = head->next;
    head->next = removed->next;
    removed->next = NULL;
    return removed;
}

void insertFirst(token *head, char *val, TokenType type)
{
    token *newToken = calloc(1, sizeof(token));
    newToken->value = val;
    newToken->type = type;

    token *originalFirst = head->next;
    head->next = newToken;
    newToken->next = originalFirst;
    return;
}

void insertAt(token *head, int pos, char *val, TokenType type)
{
    if (pos == 0)
        insertFirst(head, val, type);
    else
        insertFirst(tokenAt(head, pos - 1), val, type);
    return;
}

token *removeAt(token *head, int pos)
{
    if (pos == 0)
        return removeFirst(head);
    else
        return removeFirst(tokenAt(head, pos - 1));
}

token *tokenAt(token *head, int pos)
{
    int i = 0;
    token *curr = head->next;
    while (i < pos)
    {
        curr = curr->next;
        i++;
    }
    return curr;
}

void printList(token *head)
{
    int i = 0;
    token *curr;
    for (curr = head->next; curr != NULL; curr = curr->next)
    {
        printf("[%d] (%s) %s\n", i++, getTokenTypeStr(curr->type), curr->value);
    }
}

void clear(token *head)
{
    token *removed;
    int len;
    while ((len = length(head)))
    {
        removed = removeAt(head, len - 1);
        free(removed);
    }
}