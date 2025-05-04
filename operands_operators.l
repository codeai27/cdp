%{
#include <stdio.h>
int operand_count = 0, operator_count = 0;
%}

/* Definitions */
OPERAND    [a-zA-Z0-9_]+
OPERATOR   [+\-*/=<>!&|^%]

%%

{OPERAND}    { operand_count++; printf("Operand: %s\n", yytext); }
{OPERATOR}   { operator_count++; printf("Operator: %s\n", yytext); }

[ \t\n]+     ; // Ignore whitespace and new lines

%%

int main() {
    printf("Enter input: ");
    yylex();
    printf("\nOperands: %d, Operators: %d\n", operand_count, operator_count);
    return 0;
}

int yywrap() {
    return 1;
}