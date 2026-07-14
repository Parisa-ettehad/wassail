extern void *malloc(unsigned long size);
extern void free(void *ptr);
extern void *memset(void *ptr, int value, unsigned long size);

void bad() {
    char *data = malloc(100);
    free(data);
    memset(data, 'A', 100);
}