%{ 
#include <stdio.h> 
#include <string.h>
int word_count = 0; 
char target_word[100];
%}


%%
[a-zA-Z]+ {
if (strcmp(yytext, target_word) == 0) word_count++;
}
[ \t\n]+ ; /* Ignore whitespace */
. ; /* Ignore any other characters */
<<EOF>> { return 0; } /* Stop when EOF is encountered */
%%


int main() {
printf("Enter the word to count: ");
 
scanf("%s", target_word);
printf("Enter text (Ctrl+D to end input):\n"); yylex();
printf("Frequency of '%s': %d\n", target_word, word_count); return 0;
}


int yywrap() { return 1;
}