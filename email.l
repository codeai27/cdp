%{
#include <stdio.h>
#include <string.h>
%}

%%

[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}  { printf("Valid Email: %s\n", yytext); }
[^ \t\n]+                                       { printf("Invalid Email: %s\n", yytext); }
[ \t\n]+                                        ;  /* Ignore whitespace and newlines */

%%

int main() {
    printf("Enter email addresses (Ctrl+D to end input):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}