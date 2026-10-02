#include <stdlib.h>

void sink(int *p) {
    *p = 42;
}

/* Vulnerable: Use-After-Free */
void bad_uaf() {

    int *v1 = (int *)malloc(5 * sizeof(int));

    if (v1 == NULL)
        return;

    free(v1);

    sink(v1);
}

/* Safe: Using a different allocated pointer */
void good_different_pointer() {

    int *v1 = (int *)malloc(5 * sizeof(int));
    int *v2 = (int *)malloc(5 * sizeof(int));

    if (v1 == NULL || v2 == NULL) {
        free(v1);
        free(v2);
        return;
    }

    free(v1);

    sink(v2);

    free(v2);
}

/* Safe: Using a stack variable */
void good_stack_pointer() {

    int x = 5;

    int *v1 = (int *)malloc(5 * sizeof(int));

    if (v1 == NULL)
        return;

    free(v1);

    sink(&x);
}
