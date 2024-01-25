all:
	bison -t -v -d parser.y
	flex lexer.lex
	g++ -o parser lex.yy.c parser.tab.c -lfl
