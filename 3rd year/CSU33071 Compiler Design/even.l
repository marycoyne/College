%{
#include <math.h>
int evenNumbers = 0;
%}

%%
[0-9]+  {if(atoi(yytext)%2==0) evenNumbers++;} 
\n      /* Do Nothing */
.       /* Do Nothing */
%%
            
int main()
{
    yylex();
    printf("%d\n",evenNumbers);
    return 0;
}