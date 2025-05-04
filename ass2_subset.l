%{
#include <stdio.h>
%}

/* Enable line numbers and disable yywrap */
%option yylineno
%option noyywrap

/* Definitions of tokens */
ARTICLE  the|The|a|A|an|An
NOUN     boy|Boy|girl|Girl|dog|Dog|cat|Cat|man|Man|woman|Woman
VERB     is|Is|are|Are|was|Was|were|Were|swimming|Swimming|running|Running|walking|Walking

%%

{ARTICLE}   { printf("Line %d: Lexeme: %s\tToken: ARTICLE\n", yylineno, yytext); }
{NOUN}      { printf("Line %d: Lexeme: %s\tToken: NOUN\n", yylineno, yytext); }
{VERB}      { printf("Line %d: Lexeme: %s\tToken: VERB\n", yylineno, yytext); }
\n           { /* Ignore newline character */ }
[ \t]+      { /* Ignore whitespaces and tabs */ }
.           { printf("Line %d: Lexeme: %s\tToken: UNKNOWN\n", yylineno, yytext); }

%%

int main() {
    printf("Enter input (Ctrl+D or Ctrl+Z to stop):\n");
    yylex();  // Start lexical analysis on user input
    return 0;
}
