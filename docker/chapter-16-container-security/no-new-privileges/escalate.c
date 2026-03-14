#include <stdio.h>
#include <unistd.h>

int main() {
    printf("Before escalation UID: %d\n", getuid());

    setuid(0);

    printf("After escalation UID: %d\n", getuid());

    return 0;
}