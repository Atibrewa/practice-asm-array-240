CFLAGS= -Og -Wall  -std=c99 -msse3

all: matrix matrix.s

matrix: matrix.c
	gcc ${CFLAGS} -o matrix matrix.c
    
matrix.s: matrix.c
	gcc ${CFLAGS} -S matrix.c

compare:
	diff -b -B -I '.file*' -I '.ident*' matrix.s matrix_correct.s

clean:
	rm -f matrix matrix.s 
