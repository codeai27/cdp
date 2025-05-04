%{
#include <stdio.h>
#include <ctype.h>

int vowel_count = 0;
int word_count = 0;
int char_count = 0;
int line_count = 0;
int in_word = 0;  // Tracks whether we are inside a word
%}

%%

[aeiouAEIOU]    { vowel_count++; printf("Vowel: %c\n", yytext[0]); }
[a-z]           { printf("%c\n", toupper(yytext[0])); } /* Convert lowercase to uppercase */
[A-Z]           { printf("%c\n", tolower(yytext[0])); } /* Print uppercase as is */ 

[ \t]+         { word_count++; }  
\n             { 
                  char_count++; 
                  line_count++; 
                  if (in_word) { word_count++; in_word = 0; }  
                  putchar('\n');  
               }  
.              { char_count++; putchar(yytext[0]); }  
[^ \t\n]       { in_word = 1; }  

%%

int main() {
    printf("Enter input text (Ctrl+D to end input):\n");
    yylex();  

    if (in_word) word_count++;  

    printf("\n\nStatistics:\n");
    printf("Total Vowels: %d\n", vowel_count);
    printf("Total Words: %d\n", word_count);
    printf("Total Characters: %d\n", char_count);
    printf("Total Lines: %d\n", line_count);
    
    return 0;
}

int yywrap() {
    return 1;
}
