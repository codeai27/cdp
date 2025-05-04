%{
#include <stdio.h>
%}

/* Regular Expressions (Macros) */
EMAIL      [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}
DATE       [0-9]{2}-[0-9]{2}-[0-9]{4}
PHONE      [0-9]{10}
FLOAT      [-+]?[0-9]*\.[0-9]+
INT        [-+]?[0-9]+

%%

{EMAIL}    { printf("Email: %s\n", yytext); }
{DATE}     { printf("Date: %s\n", yytext); }
{PHONE}    { printf("Phone Number: %s\n", yytext); }
{FLOAT}    { printf("Float: %s\n", yytext); }
{INT}      { printf("Integer: %s\n", yytext); }

[ \t\n]+   ; // Ignore whitespace
.          { printf("Invalid/Unrecognized: %s\n", yytext); }

%%

int main() {
    printf("Enter data (Ctrl+D to end input):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}