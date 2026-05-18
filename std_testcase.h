#ifndef STD_TESTCASE_H
#define STD_TESTCASE_H

#define NULL ((void*)0)

typedef unsigned long size_t;

void *malloc(size_t size);
void free(void *ptr);
void *memset(void *s, int c, size_t n);

void exit(int status);
void srand(unsigned int seed);
long time(long *t);

static void printLine(const char * line)
{
    /* empty */
}

#endif