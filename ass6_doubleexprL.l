%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

[a-zA-Z][a-zA-Z]    { yylval.str = strdup(yytext); return VARIABLE; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return MULT; }
"/"                 { return DIV; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
[ \t]               ; /* skip whitespace */
\n                  { return '\n'; }
.                   { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
