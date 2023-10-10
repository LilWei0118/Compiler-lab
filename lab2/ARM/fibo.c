#include <stdio.h>

int main() {
    int n;
    int i;
    int t1=0;
    int t2=1;
    int fibo=0;
    int nextTerm;
    scanf("%d", &n);
    
    for (i = 1; i <= n; ++i) {
        fibo = t1;
        nextTerm = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
    }
    printf("%d", fibo);
    return 0;
}
