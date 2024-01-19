%option noyywrap
%{
#include <stdio.h>

#define YY_DECL int yylex(void)

#include "calc.tab.h"

char *create_string(char *text, int len) {
  char *string_value = new char[len + 1];
  strcpy(string_value, text);
  return string_value;
}

%}

%%
[ \t]	; // ignore all whitespace
[a-z]+  {yylval.op_value = create_string(yytext, yyleng); return IDENTIFIER;}
"("     {return LEFT_PAREN;}
")"     {return RIGHT_PAREN;}
%%
