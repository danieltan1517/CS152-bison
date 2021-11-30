%option noyywrap

%{
#include <stdio.h>

#define YY_DECL int yylex(void)

#include "calc.tab.h"
%}

%%
[ \t]	; // ignore all whitespace
"("		{return LEFT_PAREN;}
")"		{return RIGHT_PAREN;}
%%
