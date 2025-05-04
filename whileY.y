%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token WHILE DO LBRACE RBRACE LPAREN RPAREN SEMICOLON NUMBER ID

%%

program:
    stmt
    ;

stmt:
    while_stmt
    | do_while_stmt
    ;

while_stmt:
    WHILE LPAREN condition RPAREN block
    {
        printf("Valid while loop\n");
    }
    | WHILE error RPAREN block
    {
        yyerror("Syntax error in while loop condition (missing '('?)");
    }
    | WHILE LPAREN condition error
    {
        yyerror("Syntax error: Missing ')' in while loop");
    }
    ;

do_while_stmt:
    DO block WHILE LPAREN condition RPAREN SEMICOLON
    {
        printf("Valid do-while loop\n");
    }
    | DO block WHILE error RPAREN SEMICOLON
    {
        yyerror("Syntax error in do-while loop condition (missing '('?)");
    }
    | DO block WHILE LPAREN condition error
    {
        yyerror("Syntax error: Missing ')' in do-while loop");
    }
    | DO block WHILE LPAREN condition RPAREN error
    {
        yyerror("Syntax error: Missing semicolon at the end of do-while");
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
    // Empty
    | stmt_list stmt
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter C-like while/do-while statements:\n");
    return yyparse();
}