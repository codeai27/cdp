%{
#include <stdio.h>
int sentence_count = 0;
int last_was_newline = 1; // Track newlines to avoid double counting
%}


%%
[.!?] { sentence_count++; last_was_newline = 0; }
\n {
if (!last_was_newline) sentence_count++; // Count only if previous wasn't a newline last_was_newline = 1;
}
[ \t]+ ; /* Ignore spaces and tabs */
\/\*([^*]|\*+[^*/])*\*+\/ ; /* Ignore multi-line comments */
\/\/.* ; /* Ignore single-line comments */
. { last_was_newline = 0; } /* Reset newline flag for normal text */
%%


int main() {
printf("Enter text (Ctrl+D to end input):\n"); yylex();
printf("Number of sentences: %d\n", sentence_count); return 0;
}
 
int yywrap() { return 1;
}