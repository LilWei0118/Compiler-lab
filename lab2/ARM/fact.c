#include <stdio.h>
    int num;
    int i;
    int fact = 1;

int main() {

    scanf("%d", &num);

    for (i = 1; i <= num; ++i) {
        fact *= i;
    }
    printf("%d", fact);
    

    return 0;
}
