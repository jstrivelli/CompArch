COMPILER = gcc
CCFLAGS  = -Wall -ansi -pedantic -m32
all: game

game: game.c
	$(COMPILER) $(CCFLAGS) -o game game.c conway.h conway.s

clean:
	rm -f *.o
