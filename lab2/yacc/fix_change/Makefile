.PHONY: all clean

all: mid2back

mid2back:  
	yacc mid2back.y
	gcc y.tab.c -o mid2back

test:
	./mid2back
clean:
	rm -f mid2back y.tab.c 
