%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
  char *op_value;
}

%define parse.error verbose

%left LEFT_PAREN RIGHT_PAREN IDENTIFIER

%start expr 

%%

expr: LEFT_PAREN expr RIGHT_PAREN expr 
    | IDENTIFIER
    | %empty
;

%%

int main() {
  yyin = stdin;
  yyparse();
  return 0;
}

void yyerror(const char* s) {
  fprintf(stderr, "Parse error: %s. Parenthesis are not balanced!\n", s);
  exit(1);
}

