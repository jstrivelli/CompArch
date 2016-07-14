#include <cim-sim.h>

NewCache *cacheSim;
int reads;
int writes;
int hits;
int misses;


int main(int arc, char *argv[])
{

	/*assuming this is a direct for associative*/
	FILE *traceFile;
	int cacheSize;
	int blockSize;
	int numSets;
	int setBits;
	int blockBits;
	int tagSize;
	char *assoc;
	int setIndex;
	char *writePol;
	/*iterates through Loop #1*/
	int i;
	/*iterates through Loop #2*/ 
	int a;

	cacheSim[numSets];
	if(strcmp(argv[1], "-h")){
		printf("./sim <cache size> <associativity> <block size> <write policy> <trace file>\n");
		return 0;
	}
	traceFile = fopen(argv[5], "r")
	cacheSize = atoi(argv[1]);
	blockSize = atoi(argv[3]);
	assoc = argv[2];
	writePol = argv[4];
	setIndex = 0;


	if(strcmp(assoc, "direct")){
		numSets = cacheSize/BlockSize;
	}


	else if(strcmp(assoc, "assoc")){
		numSets =1;
	}


	else{
		setIndex = atoi(assoc[str.length -1]);	
		numSets = cacheSize/(setIndex *blockSize);
	}



	/*These operations are performed because program takes arguments as power of 2*/
	setBits = (log(numSets))/(log(2));
	blockBits = (log(blockSize))/(log(2));
	tagSize = 64 - (blockBits +setBits);


	/*Loop #1*/
	for(i = 0; i<numSets; i++){


		cacheSim[i].tag = (char *)malloc(sizeof(char) *(tagSize +1));
		cacheSim[i].block = (char *)malloc(sizeof(char) *(blockBits + 1));
		/*Loop #2*/
		for(a = 0; a<tagSize; a++){

			cacheSim[i].tag[a] = '0';
		}

		cacheSim[i].valid = 0;
	}


	if(traceFile == 'r'){

		reads(cacheSim, tag);
	}
	else if(traceFile == 'w'){

		writes(cacheSim, tag);
	}


	printf("Hits: %d\n", hits);
    printf("Misses: %d\n", misses);
    printf("Writes: %d\n", writess);
    printf("Reads: %d\n", reads);
}




void reads(NewCache *cacheSim, char *tag){
	reads++;
}
void writes(NewCache *cacheSim){
	writes++;
}
void updateLRU(){

}



