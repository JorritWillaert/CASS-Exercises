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
    //TODO implement
    exit(-1);
}

status list_get(struct List *list, int index, int *value)
{
    //TODO implement
    exit(-1);
}

int list_print(struct List *list)
{
    //TODO implement
    exit(-1);
}

status list_remove_item(struct List *list, int index)
{
    //TODO implement
    exit(-1);
}

status list_delete(struct List *list)
{
    //TODO implement
    exit(-1);
}

status list_insert(struct List *list, int index, int value)
{
    //TODO implement
    exit(-1);
}
