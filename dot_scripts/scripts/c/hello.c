/*
 * hello.c
 * function
 * Copyright (C) Jie
 * 2023-03-20
 *
 */
#include <stdio.h>

void handle_int(int *pt) {
    *pt = *pt + 1;
    printf("%d\n", *pt);
}

int main(void)
{
    int test = 1;    
    int *test_pt = &test;

    handle_int(test_pt);
    handle_int(test_pt);
    handle_int(test_pt);
    handle_int(test_pt);
    handle_int(test_pt);
    handle_int(test_pt);
    return 0;
}
