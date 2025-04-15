%{
#include <stdio.h>
#include <string.h>
int keyword_count = 0, identifier_count = 0, number_count = 0, operator_count = 0, unrecognized_count = 0;
%}
%%
"+"|"-"|"*"|"/" {
    printf("Operator: %s\n", yytext);
    operator_count++;
}
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|
"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|
"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|
"unsigned"|"void"|"volatile"|"while" {
    printf("Keyword: %s\n", yytext);
    keyword_count++;
}
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identifier: %s\n", yytext);
    identifier_count++;
}
[0-9]+ {
    printf("Number: %s\n", yytext);
    number_count++;
}
[ \t\n]+   { /* ignore whitespace */ }
. {
    printf("Unrecognized character: %s\n", yytext);
    unrecognized_count++;
}
%%
int main() {
    printf("Enter String: ");
    yylex();
    return 0;
}
