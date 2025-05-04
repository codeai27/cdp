%{
#include <stdio.h>
int digit_count = 0, letter_count = 0, special_count = 0;
%}

/* Definitions */
DIGIT     [0-9]
LETTER    [a-zA-Z]
SPECIAL   [^a-zA-Z0-9\s]

%%

{DIGIT}      { digit_count++; }
{LETTER}     { letter_count++; }
{SPECIAL}    { special_count++; }

[ \t\n]+     ; // Ignore whitespace and new lines

%%

int main() {
    printf("Enter input: ");
    yylex();
    printf("\nDigits: %d, Letters: %d, Special Characters: %d\n", digit_count, letter_count, special_count);
    return 0;
}

int yywrap() {
    return 1;
}