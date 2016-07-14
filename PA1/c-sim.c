#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	int *cacheSize = argv[1];
	char[] *asoc = argv[2];
	int *block = argv[3];
	char[] *policy = argv[4];
	FILE *trace = (fopen(argv[5]), "r"));
	if(trace){
		getHits(trace);
		getMisses(trace);
		memReads(trace);
		memWrites(trace);
	}
	else{
		fprintf(stdrr, "Invalid Input\n");
	}
	return 0;


}
int getHits(FILE *trace){

}
int getMisses(FILE *trace){

}
int memReads(FILE *trace){

}
int memWrites(FILE *trace){

}