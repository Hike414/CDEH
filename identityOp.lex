%{
#include <stdio.h>
int operator_count = 0, identifier_count = 0;
%}
%%
"+"|"-"|"*"|"/" {
    printf("Operator: %s\n", yytext);
    operator_count++;
}
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identifier: %s\n", yytext);
    identifier_count++;
}
[ \t\n]+   { /* ignore whitespace */ }
. {
    printf("Unrecognized character: %s\n", yytext);
}
%%
int main() {
    printf("Enter string:\n");
    yylex();
    return 0;
}
