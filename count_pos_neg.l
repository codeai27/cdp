%{
#include <stdio.h>

int positive_count = 0, negative_count = 0;
%}

%%

\-?[1-9][0-9]*  {
    if (yytext[0] == '-') 
        negative_count++;
    else
        positive_count++;
}

[ \t\n]+        ;  /* Ignore whitespace */
.               ;  /* Ignore any other characters */

%%

int main() {
    printf("Enter integers (Ctrl+D to end input):\n");
    yylex();

    printf("Positive integers: %d\n", positive_count);
    printf("Negative integers: %d\n", negative_count);
    
    return 0;
}

int yywrap() {
    return 1;
}