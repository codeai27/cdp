%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>

%}

%%
[a-zA-Z]      { yylval.str = strdup(yytext); return VARIABLE; }
[0-9]+        { yylval.str = strdup(yytext); return NUMBER; }
"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return MULT; }
"/"           { return DIV; }
"("           { return LPAREN; }
")"           { return RPAREN; }
\n            { return '\n'; }
[ \t]         ;  // skip whitespace
.             { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
