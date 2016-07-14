#include "dictstat.h"


TrieNode *root;


/*This is the main method and it looks at the two passed parameters which are the <argument1> and <argument2> mentioned in
the assignment and calls the two methods that will store the data in an efficient time*/
int main(int argc, char *argv[])
{
        /*Will open each file passed when excetuing program*/
        FILE *dict = (fopen(argv[1], "r"));
        FILE *data = (fopen(argv[2], "r"));

        root = malloc(sizeof(struct TrieNode));

        if(dict && data){
                        readDict(dict);
                        scanData(data);
        }else{
                        fprintf(stderr,"Invalid Input \n");
                      
        }
        printOutput(root);
        return 0;
}


/*This method creates a new node and declares intializes each variable inside each node*/
struct TrieNode *createNode()
{
                struct TrieNode *node = malloc(sizeof(struct TrieNode));
                /*node->parent = parent;*/
                node->EOW = false;
                node->superOccur = 0;
                node->preOccur = 0;
                node->occur = 0;
                return node;
}


/*This method creates the Trie Structure. It reads in the characters from the Dictionary file and then stores it in the trie*/
void readDict(FILE *dict_file)
{
        struct TrieNode *ptr = root;
        char currChar;/*currrent character*/
        int index=0;/*next character*/
        char tempword[101];
        char currCount=0;
	int areWordsThere = 0;
	root = createNode();

	ptr=root;
        if(dict_file==NULL)
        {
        	return;
        }
        else
        {
                while((currChar=fgetc(dict_file))!=EOF)
                {
                        if(isalpha(currChar))
                        {
				areWordsThere++;
                                currChar=tolower(currChar);
                                tempword[(int)currCount]=currChar;
                                currCount++;
                                index=currChar-97;
                                if(ptr->children[index]!=NULL)
                                {
                                        ptr=ptr->children[index];
                                }
                                else
                                {
                                        ptr->children[index]=createNode();
                                        ptr=ptr->children[index];
                                }

                        }
                        else
                        {
                               
                                        ptr->EOW=true;
                                        tempword[(int)currCount]='\0';
                                        if(tempword[0]!='\0')
                                        {
                                                int counter=0;
                                                while(counter<strlen(tempword))
                                                {
                                                        ptr->fullword[counter]=tempword[counter];
                                                        counter++;
                                                }
                                                ptr->fullword[counter]='\0';
                                                currCount=0;
                                                tempword[0]='\0';
                                        }
                                ptr=root;
                        }
                }
		if(areWordsThere == 0){
			fprintf(stderr, "empty dictionary\n");
			return;
		}
                if(isalpha(currChar)==true)
                {			
						int counter = 0;					
                								ptr->EOW=true;
                                                tempword[(int)currCount]='\0';
                                               
                                                while(counter<strlen(tempword))
                                                {
                                                        ptr->fullword[counter]=tempword[counter];
                                                        counter++;
                                                }
                                                ptr->fullword[counter]='\0';
                                                currCount=0;
                                                tempword[0]='\0';

                }
        }
}


/*This method reads in the data file and then counts uses the helper methods to count the occurences of each word by their
prefix superWord and occurences of the actual word itself*/
void scanData(FILE *data_file)
{
	   char wordBuilder[101];
       int index = 0;
       char currChar;
       root->EOW = false;
       if(data_file == NULL)
       {
       		return;
       }
       while((currChar = fgetc(data_file)) != EOF)
       {
       		if(isalpha(currChar))
       		{
       			currChar = tolower(currChar);
       			wordBuilder[index] = currChar;
       			index++;
       		}
       		else
       		{
       			wordBuilder[index] = '\0';
       			if(0 < strlen(wordBuilder))
       			{	
       				trieUpdate(wordBuilder);
       				index = 0;
       				wordBuilder[index] = '\0';
       			}
       		}
	
       }
	if(isalpha(currChar)== true){

		wordBuilder[index] = '\0';
		trieUpdate(wordBuilder);
	}
        /*printWord(wordArr, root, 0);*/

}

/*This method is recursive and it looks to see if we are at the end of a word so it can update the prefix occurence. This is a helper 
method for scanData*/
void getPrefix(struct TrieNode* jesse)
{
	int indexPos = 0;
	struct TrieNode *ptr = jesse;
	if(ptr->EOW == true)
	{	
		ptr->preOccur++;
	}
	while(indexPos <26)
	{
		
int a = 0;
		int count = 0;

		while(a < 26){
			if(ptr->EOW == true && ptr->children[a] == NULL)
			{
				count++;
			}
			a++;
		}
		if(count == 26){
			return;
		}
		if(ptr->children[indexPos] != NULL){
			getPrefix(ptr->children[indexPos]);
		}
		indexPos++;
	}
}

/*This method just gives the final print out of the word, occurence, prefix, and superWord respectively*/
void printOutput(struct TrieNode* jesse)
{
	int index = 0; 
	struct TrieNode *ptr = jesse;
	/*this is how we know we have reached the end of a word this is the base case */
	if(ptr->EOW == true){
		printf("%s  %i   %i   %i\n", ptr->fullword, ptr->occur, ptr->preOccur, ptr->superOccur);
	}
	/*This loop looks for the letter in each node array*/
	while(index<26)
	{
		int i = 0;
		int count = 0;
		while(i<26)
		{
			/*We have got to the bottum of the tree*/
			if(ptr->EOW == true && ptr->children[i] == NULL)
			{
				count++;
			}
			i++;
		}
		if(count == 26)
		{
			return;
		}
		if(ptr->children[index] != NULL)
		{
			printOutput(ptr->children[index]);
		}
		index++;
	}
}
/*This method updates the number of prefixes, occurences and superwords*/
void trieUpdate(char wordArr[])
{
	int i = 0;
	int index;
	int length = strlen(wordArr);
	struct TrieNode *ptr = root;
	while(i < length)
	{	
		index = wordArr[i] - 97;
		if(ptr->children[index] != NULL)
		{
			ptr = ptr->children[index];
			if(ptr->EOW == true){
				if(i == length - 1){
					ptr->occur++;
					ptr->preOccur--; 
				}
				else{
					ptr->superOccur++;
				}
			}
		}
		else
		{
			return;
		}
		i++;
	}
	getPrefix(ptr);

}


