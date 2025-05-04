%{
#include <stdio.h>
#include <string.h>
%}

%%

auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|inline|int|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while {
    printf("Reserved Word: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identifier: %s\n", yytext);
}

[ \t\n]+   ;   // Ignore whitespace

"/*"([^*]|\*+[^*/])*\*+"/"   { /* Ignore multi-line comments */ }
"//".*                       { /* Ignore single-line comments */ }

. {
    printf("Unknown character: %s\n", yytext);
}

%%

int main() {
    printf("Enter C code (Ctrl+D to end input):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}