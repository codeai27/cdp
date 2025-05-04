%{
#include <stdio.h> 
#include <ctype.h>

int sentence_count = 0;
int last_was_newline = 1; // Tracks if the last character was a newline

%}


%%
[.!?] { sentence_count++; last_was_newline = 0; }
\n {
if (!last_was_newline) sentence_count++; // Count only if previous wasn't a newline last_was_newline = 1;
}
. { last_was_newline = 0; } /* Ignore other characters but reset newline flag */
%%


int main() {
printf("Enter text (Ctrl+D to end input):\n"); 
yylex();
printf("Number of sentences: %d\n", sentence_count); 
return 0;
}


int yywrap() { 
return 1;
}