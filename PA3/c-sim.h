#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

typedef struct NewCache{
	char *tag;
	int valid;
	char *block;
}NewCache;

void reads(NewCache *cacheSim, char *tag);

void writes(NewCache *cacheSim);

void updateLRU();