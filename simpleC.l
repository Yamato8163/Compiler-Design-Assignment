%{
#include <stdlib.h>
#include "simpleC.h"
#include "y.tab.h"
void yyerror(char *);


%}

%%

[a-z]       { 
                yylval.symbolIndex = *yytext - 'a';
                return Var;
            }

0           {
                yylval.indexValue = atoi(yytext);
                return INT;
            }

[1-9][0-9]* {
                yylval.indexValue = atoi(yytext);
                return INT;
            }

[-()<>=+*/;{}.] {
                return *yytext;
             }

">="            return GE;
"<="            return LE;
"=="            return EQ;
"!="            return NE;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;

[ \t\n]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
