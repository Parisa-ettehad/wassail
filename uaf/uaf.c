#include <stdlib.h>
#include <string.h>

void bad() {
    char *data = malloc(100);
    free(data);
    memset(data, 'A', 100);
}

int main() {
    bad();
    return 0;
}