#include "LinkedList.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/queue.h>
#if 0
typedef struct Data {
    char *val;
    int index;
} Data;
void printData(void *data) {
    Data *ptr = (Data *)data;
    printf("index: %d - val: %s\n", ptr->index, ptr->val);
}

int main() {
    printf("starting..");
    Node headS;
    headS.next = NULL;
    Node *head = &headS;
    printf("length() expected: 0 actual: %d\n", length(head));
    Data d1 = {"first", 0};
    append(head, &d1);
    printf("length() expected: 1 actual: %d\n", length(head));
    Data d2 = {"second", 1};
    append(head, &d2);
    printf("length() expected: 2 actual: %d\n", length(head));
    Data d3 = {"third", 2};
    append(head, &d3);
    printf("length() expected: 3 actual: %d\n", length(head));
    Data d4 = {"fourth", 3};
    append(head, &d4);
    printf("list after 4 appends:\n");
    printList(head, printData);

    Data d5 = {"inserted with insertFirst\n", 4};
    insertFirst(head, &d5);
    Data *dptr = (Data *)head->next->data;
    printf("firstElement, expected: inserted with... actual: %s\n", dptr->val);
    printf("length() expected: 5 actual: %d\n", length(head));

    Node *removed = removeFirst(head);
    printf("length() expected: 4 actual: %d\n", length(head));
    dptr = (Data *)removed->data;
    printf("removed expected: inserted with.. actual: %s\n", dptr->val);
    free(removed);

    dptr = (Data *)head->next->data;
    printf("first after remove expected: first, actual: %s\n", dptr->val);
    Data d6 = {"1.5", 5};
    insertAt(head, 1, &d6);
    printf("after insert at 1\n");
    printList(head, printData);

    Data d7 = {"2.5", 6};
    insertAt(head, 3, &d7);
    printf("after insert at 3 (2.5)\n");
    printList(head, printData);
    return 0;
    /*
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
    */
}

#endif

void append(Node *head, void *data) {
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;
    Node *curr = head;
    while (1) {
        if (curr->next == NULL)
            break;
        curr = curr->next;
    }
    curr->next = newNode;
    return;
}

int length(Node *head) {
    int len = 0;
    Node *curr;
    for (curr = head->next; curr != NULL; curr = curr->next) { len++; }
    return len;
}

Node *removeFirst(Node *head) {
    Node *removed = head->next;
    head->next = removed->next;
    removed->next = NULL;
    return removed;
}

void insertFirst(Node *head, void *data) {
    Node *newNode = (Node *)calloc(1, sizeof(Node));
    newNode->data = data;

    Node *originalFirst = head->next;
    head->next = newNode;
    newNode->next = originalFirst;
    return;
}

void insertAt(Node *head, int pos, void *data) {
    if (pos == 0)
        insertFirst(head, data);
    else
        insertFirst(nodeAt(head, pos - 1), data);
    return;
}

Node *removeAt(Node *head, int pos) {
    if (pos == 0)
        return removeFirst(head);
    else
        return removeFirst(nodeAt(head, pos - 1));
}

Node *nodeAt(Node *head, int pos) {
    int i = 0;
    Node *curr = head->next;
    while (i < pos) {
        curr = curr->next;
        i++;
    }
    return curr;
}

void printList(Node *head, void (*fn)(void *)) {
    int i = 0;
    Node *curr;
    for (curr = head->next; curr != NULL; curr = curr->next) { (*fn)(curr->data); }
}

void clear(Node *head) {
    while (head->next != NULL) free(removeFirst(head));
}