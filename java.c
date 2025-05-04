#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

const char *java_keywords[] = {
    "int", "float", "double", "char", "boolean", "void", "if", "else", "for", "while", "do", "switch", "case",
    "break", "continue", "return", "class", "public", "private", "protected", "new", "this", "super",
    "try", "catch", "finally", "throw", "throws", "true", "false", "null", "static", "import", "package", "extends", "implements"
};
int num_java_keywords = sizeof(java_keywords) / sizeof(java_keywords[0]);

int isKeyword(const char *word) {
    for (int i = 0; i < num_java_keywords; ++i) {
        if (strcmp(word, java_keywords[i]) == 0)
            return 1;
    }
    return 0;
}

int isOperator(char ch) {
    return strchr("+-*/%=<>!&|^~", ch) != NULL;
}

void tokenizeJava(const char *input) {
    int i = 0;
    char token[100];
    int idx;

    while (input[i] != '\0') {
        if (isspace(input[i])) {
            i++;
        } else if (isalpha(input[i]) || input[i] == '_') {
            idx = 0;
            while (isalnum(input[i]) || input[i] == '_')
                token[idx++] = input[i++];
            token[idx] = '\0';
            if (isKeyword(token))
                printf("Keyword: %s\n", token);
            else
                printf("Identifier: %s\n", token);
        } else if (isdigit(input[i])) {
            idx = 0;
            while (isdigit(input[i]))
                token[idx++] = input[i++];
            token[idx] = '\0';
            printf("Number: %s\n", token);
        } else if (input[i] == '"') {
            idx = 0;
            token[idx++] = input[i++];
            while (input[i] != '"' && input[i] != '\0')
                token[idx++] = input[i++];
            token[idx++] = input[i++];
            token[idx] = '\0';
            printf("String Literal: %s\n", token);
        } else if (input[i] == '/' && input[i + 1] == '/') {
            printf("Single-line Comment: //...\n");
            break;
        } else if (isOperator(input[i])) {
            printf("Operator: %c\n", input[i++]);
        } else if (strchr("();{},.[]", input[i])) {
            printf("Punctuation: %c\n", input[i++]);
        } else {
            printf("Unknown: %c\n", input[i++]);
        }
    }
}

int main() {
    char code[512];
    printf("Enter Java code line: ");
    fgets(code, sizeof(code), stdin);
    tokenizeJava(code);
    return 0;
}

//public class Test { int x = 10; System.out.println("Hi"); }
