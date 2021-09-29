all: calc
calc.tab.c calc.tab.h:	calc.y
	bison -t -v -d calc.y
lex.yy.c: calc.lex calc.tab.h
	flex calc.lex 
calc: lex.yy.c calc.tab.c calc.tab.h
	gcc -o calc calc.tab.c lex.yy.c
clean:
	rm calc calc.tab.c lex.yy.c calc.tab.h calc.output
