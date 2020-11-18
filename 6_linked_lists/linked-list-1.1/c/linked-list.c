#include "linked-list.h"
#include <stdlib.h>
#include <stdio.h>

//Structures ListNode and List are in the header file

struct List *list_create()
{
    struct List *l = malloc(sizeof(struct List));
    l->first = NULL;
    return l;
}

status list_append(struct List *list, int value)
{
    if (list == NULL){
        return UNINITIALIZED_LIST;
    }
    struct ListNode *new_node = malloc(sizeof(struct ListNode));
    if (new_node == NULL){
        return OUT_OF_MEMORY;
    }
    new_node->value = value;
    new_node->next = NULL;

    if (list->first==NULL){
        list->first = new_node;
    }
    else{
        struct ListNode *node = list->first;
        while (node->next != NULL){
            node = node->next;
        }
        node->next=new_node;
    }
    return OK;
}

int list_length(struct List *list)
{
    if (list == NULL){
        return UNINITIALIZED_LIST;
    }
    struct ListNode *node = list->first;
    if (node == NULL){
        return 0;
    }
    int length = 1;
    while (node->next != NULL){
        node = node->next;
        length++;
    }
    return length;
}

status list_get(struct List *list, int index, int *value)
{
    if (list == NULL){
        return UNINITIALIZED_LIST;
    }
    struct ListNode *node = list->first;
    if (node == NULL || index < 0){
        return INDEX_OUT_OF_BOUNDS;
    }
    for (int i = 0; i < index; i++){
        node = node->next;
        if (node == NULL){
            return INDEX_OUT_OF_BOUNDS;
        }
    }
    if (value == NULL){
        return UNINITIALIZED_RETVAL;
    }
    *value = node->value;
    return OK;
}

int list_print(struct List *list)
{
    if (list == NULL){
        return UNINITIALIZED_LIST;
    }
    struct ListNode *node = list->first;
    while (node->next != NULL){
        fprintf(stderr, "%i ", node->value);
        node = node->next;
    }
    fprintf(stderr, "\n");
    return OK;
}

status list_remove_item(struct List *list, int index)
{
    if (list == NULL){
        return UNINITIALIZED_LIST;
    }
    struct ListNode *node = list->first;
    struct ListNode *prev_node;
    if (node == NULL || index < 0){
        return INDEX_OUT_OF_BOUNDS;
    }
    if (index == 0){
        list->first = node->next;
        if (list->first == NULL){
            return INDEX_OUT_OF_BOUNDS;
        }
        free(node);
        return OK;
    }
    for (int i = 0; i < index; i++){
        prev_node = node;
        node = node->next;
        if (node == NULL){
            return INDEX_OUT_OF_BOUNDS;
        }
    }
    struct ListNode *next_node = node->next;
    if (next_node == NULL){
        //Node was the last node; No need to link two elements together. Just make prev_node->next = NULL
        prev_node->next = NULL;
    }
    else{
        prev_node->next = next_node;
    }
    free(node);
    return OK;
}

status list_delete(struct List *list)
{
    if (list == NULL){
        return UNINITIALIZED_LIST;
    }
    struct ListNode *node = list->first;
    struct ListNode *next_node = node;
    if (node != NULL){
        while (node->next != NULL){
            next_node = node->next;
            free(node);
            node = next_node;
        }
    }
    free(node);
    free(list);
    return OK;
}

status list_insert(struct List *list, int index, int value)
{
    //TODO implement
    exit(-1);
}
