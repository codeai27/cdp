%{
#include <stdio.h>
%}

/* Definitions */
DIGIT      [0-9]
LETTER     [a-zA-Z]
INTEGER    {DIGIT}+
FLOAT      {DIGIT}+"."{DIGIT}+
CHAR       {LETTER}
INVALID    .

%%

{INTEGER}   { printf("Integer: %s\n", yytext); }
{FLOAT}     { printf("Floating-point: %s\n", yytext); }
{CHAR}      { printf("Character: %s\n", yytext); }
{INVALID}   { printf("Invalid token: %s\n", yytext); }

\n          ;  // Ignore newlines
[ \t]+      ;  // Ignore whitespace

%%

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}