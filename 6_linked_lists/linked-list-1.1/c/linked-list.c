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
    //TODO implement
    exit(-1);
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
