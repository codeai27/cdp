%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void replace_with_digits(const char *word);
void replace_with_words(const char *digit);
%}

%%

[0-9]+               { replace_with_words(yytext); }
[a-zA-Z]+            { replace_with_digits(yytext); }
[ \t\n]+             ;  /* Ignore whitespace */
.                    ;  /* Ignore any other characters */

%%

void replace_with_digits(const char *word) {
    if (strcmp(word, "one") == 0)       printf("1 ");
    else if (strcmp(word, "two") == 0)  printf("2 ");
    else if (strcmp(word, "three") == 0)printf("3 ");
    else if (strcmp(word, "four") == 0) printf("4 ");
    else if (strcmp(word, "five") == 0) printf("5 ");
    else if (strcmp(word, "six") == 0)  printf("6 ");
    else if (strcmp(word, "seven") == 0)printf("7 ");
    else if (strcmp(word, "eight") == 0)printf("8 ");
    else if (strcmp(word, "nine") == 0) printf("9 ");
    else                                printf("%s ", word);
}

void replace_with_words(const char *digit) {
    if (strcmp(digit, "1") == 0)       printf("one ");
    else if (strcmp(digit, "2") == 0)  printf("two ");
    else if (strcmp(digit, "3") == 0)  printf("three ");
    else if (strcmp(digit, "4") == 0)  printf("four ");
    else if (strcmp(digit, "5") == 0)  printf("five ");
    else if (strcmp(digit, "6") == 0)  printf("six ");
    else if (strcmp(digit, "7") == 0)  printf("seven ");
    else if (strcmp(digit, "8") == 0)  printf("eight ");
    else if (strcmp(digit, "9") == 0)  printf("nine ");
    else                               printf("%s ", digit);
}

int main() {
    printf("Enter text (Ctrl+D to end input):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}