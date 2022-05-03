#include <stdio.h>


char c_checkValidity(int x){
    if (x >= 0)
        return 1;
    return 0;
}

int main(int argc, char** argv) {
    int user_input;
    printf("please enter a decimal number: \n");
    scanf("%d", &user_input);
    extern void assFunc(int);
    assFunc(user_input);
    return 0;
}
