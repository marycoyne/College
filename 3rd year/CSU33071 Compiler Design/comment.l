%{
#include <stdlib.h>
#include <string.h>
int i = 0;
%}

%%

["][^"]*["]             {for (i=0; i < strlen(yytext); i++){putchar(yytext[i]);}}
[/*]{2}[^\n]*           /*  Nothing */
[{][^}]*[}]             /*  Nothing */
[{][^}]*                {printf("syntax error\n");return 0;}
[}]                     {printf("syntax error\n"); return 0;}

%%

int main()
{
    yylex();
    return 0;
}