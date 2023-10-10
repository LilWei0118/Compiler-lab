.PHONY: all clean

all: complex_expr

complex_expr:  
	yacc complex_expr.y
	gcc y.tab.c -o complex_expr
test:
	./complex_expr
clean:
	rm -f complex_expr y.tab.c 
