%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token IF ELSE LBRACE RBRACE LPAREN RPAREN SEMICOLON NUMBER ID

%%

program:
    stmt
    ;

stmt:
    if_stmt
    ;

if_stmt:
    IF LPAREN condition RPAREN block
    {
        printf("Valid if statement\n");
    }
    | IF LPAREN condition RPAREN block ELSE block
    {
        printf("Valid if-else statement\n");
    }
    | IF error RPAREN block
    {
        yyerror("Syntax error: Missing or invalid '(' in if condition");
    }
    | IF LPAREN condition error
    {
        yyerror("Syntax error: Missing ')' in if condition");
    }
    | IF LPAREN condition RPAREN error
    {
        yyerror("Syntax error: Missing block for if statement");
    }
    ;

condition:
    ID
    | NUMBER
    ;

block:
    LBRACE stmt_list RBRACE
    ;

stmt_list:
    /* Empty */
    | stmt_list stmt
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter C-like if/if-else statements:\n");
    return yyparse();
}