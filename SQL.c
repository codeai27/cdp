#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define MAX_TOKEN_LEN 100

// List of SQL keywords
const char *keywords[] = {"SELECT", "FROM", "WHERE", "INSERT", "INTO", "VALUES", "UPDATE", "SET", "DELETE", "CREATE", "TABLE", "DROP"};
int num_keywords = sizeof(keywords) / sizeof(keywords[0]);

// Function to check if a word is an SQL keyword
int isKeyword(char *word) {
    for (int i = 0; i < num_keywords; i++) {
        if (strcasecmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}

// Function to check if a character is an operator
int isOperator(char ch) {
    return (ch == '=' || ch == '>' || ch == '<' || ch == '!' || ch == '+' || ch == '-' || ch == '*' || ch == '/');
}

// Function to tokenize SQL input
void tokenizeSQL(char *input) {
    char token[MAX_TOKEN_LEN];
    int index = 0;
    
    for (int i = 0; input[i] != '\0'; i++) {
        if (isspace(input[i])) {
            continue; // Skip whitespace
        } 
        else if (isalpha(input[i])) { // Identifier or keyword
            index = 0;
            while (isalnum(input[i]) || input[i] == '_') {
                token[index++] = input[i++];
            }
            token[index] = '\0';
            i--;
            if (isKeyword(token)) {
                printf("Keyword: %s\n", token);
            } else {
                printf("Identifier: %s\n", token);
            }
        } 
        else if (isdigit(input[i])) { // Numeric literals
            index = 0;
            while (isdigit(input[i])) {
                token[index++] = input[i++];
            }
            token[index] = '\0';
            i--;
            printf("Number: %s\n", token);
        } 
        else if (input[i] == '\'') { // String literals
            index = 0;
            token[index++] = input[i++];
            while (input[i] != '\'' && input[i] != '\0') {
                token[index++] = input[i++];
            }
            if (input[i] == '\'') {
                token[index++] = input[i];
            }
            token[index] = '\0';
            printf("String Literal: %s\n", token);
        } 
        else if (isOperator(input[i])) { // Operators
            printf("Operator: %c\n", input[i]);
        } 
        else if (input[i] == ',' || input[i] == ';' || input[i] == '(' || input[i] == ')') { // Punctuation
            printf("Punctuation: %c\n", input[i]);
        } 
        else {
            printf("Unknown Token: %c\n", input[i]);
        }
    }
}

int main() {
    char input[256];
    printf("Enter SQL command: ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = 0; // Remove newline character
    tokenizeSQL(input);
 return 0;
}
