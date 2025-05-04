%{
#include <stdio.h>
int balance = 0;
%}

%%
\( { balance++; }
\) { balance--; }
. ; /* Ignore any other characters */
%%

int main() {
printf("Enter text (Ctrl+D to end input):\n"); yylex();
if (balance == 0)
printf("Parentheses are balanced.\n"); else
printf("Parentheses are not balanced.\n"); return 0;
}


int yywrap() { return 1;
}