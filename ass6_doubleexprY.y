%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%union {
    char *str;
}

%token <str> VARIABLE
%token PLUS MINUS MULT DIV LPAREN RPAREN

%type <str> expr term factor

%%

input: 
    /* empty */
    | input line
    ;

line: '\n'        { printf("\nWrite an expression: "); }
    | expr '\n'   { printf("Valid expression: %s\n", $1); free($1); 
                    printf("\nWrite an expression: "); }
    ;

expr: term
    | expr PLUS term { $$ = malloc(strlen($1) + strlen($3) + 2); sprintf($$, "%s+%s", $1, $3); free($1); free($3); }
    | expr MINUS term { $$ = malloc(strlen($1) + strlen($3) + 2); sprintf($$, "%s-%s", $1, $3); free($1); free($3); }
    ;

term: factor
    | term MULT factor { $$ = malloc(strlen($1) + strlen($3) + 2); sprintf($$, "%s*%s", $1, $3); free($1); free($3); }
    | term DIV factor { $$ = malloc(strlen($1) + strlen($3) + 2); sprintf($$, "%s/%s", $1, $3); free($1); free($3); }
    ;

factor: VARIABLE { $$ = $1; }
    | LPAREN expr RPAREN { $$ = $2; }
    ;

%%

int main() {
    printf("Write an expression: ");
    yyin = stdin;
    yyparse();
    return 0;
}
