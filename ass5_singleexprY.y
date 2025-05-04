%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    char *str;
}

%token <str> VARIABLE NUMBER
%token PLUS MINUS MULT DIV LPAREN RPAREN

%type <str> expr term factor

%%

input:
    | input line
    ;

line:
    expr '\n'   { printf("Valid Expression\n"); free($1); }
    | '\n'      { /* ignore blank lines */ }
    | error '\n' { yyerror("Invalid Expression"); yyerrok; }
    ;

expr:
    term
    | expr PLUS term   { $$ = strdup("+"); free($1); free($3); }
    | expr MINUS term  { $$ = strdup("-"); free($1); free($3); }
    ;

term:
    factor
    | term MULT factor { $$ = strdup("*"); free($1); free($3); }
    | term DIV factor  { $$ = strdup("/"); free($1); free($3); }
    ;

factor:
    VARIABLE           { $$ = $1; }
    | NUMBER           { $$ = $1; }
    | LPAREN expr RPAREN { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Invalid Expression\n");
}

int main() {
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}
