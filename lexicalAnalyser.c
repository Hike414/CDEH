#include <stdio.h>
#include <ctype.h>
#include <string.h>

int is_keyword(const char *str) { ... }
int is_identifier(const char *str) { ... }
int is_number(const char *str) { ... }

int main() {
    char input[1000], word[50];
    int i = 0, j = 0;
    int keyword_count = 0, identifier_count = 0, number_count = 0, operator_count = 0;

    printf("Enter input: ");
    fgets(input, sizeof(input), stdin);
    if (input[strlen(input) - 1] == '\n') input[strlen(input) - 1] = '\0';

    while (input[i]) {
        if (isspace(input[i])) { i++; continue; }

        if (isalpha(input[i]) || input[i] == '_') {
            j = 0;
            while (isalnum(input[i]) || input[i] == '_') word[j++] = input[i++];
            word[j] = '\0';
            if (is_keyword(word)) keyword_count++;
            else if (is_identifier(word)) identifier_count++;
        }
        else if (isdigit(input[i])) {
            j = 0;
            while (isdigit(input[i])) word[j++] = input[i++];
            word[j] = '\0';
            if (is_number(word)) number_count++;
        }
        else {
            operator_count++;
            i++;
        }
    }

    printf("\nSummary:\n");
    printf("Keywords   : %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    printf("Numbers    : %d\n", number_count);
    printf("Operators  : %d\n", operator_count);

    return 0;
}
