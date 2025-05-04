%{
#include "assignment7_if.tab.h"
%}

%%
"if"        { return IF; }
"else"      { return ELSE; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
";"         { return SEMICOLON; }
[0-9]+      { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]     ;  // Skip whitespace
.           { printf("Unknown character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}