#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <ctype.h>
#include <string.h>

void readDict(FILE *dict_file);
void scanData(FILE *data_file);
int charCount(FILE *fp);

typedef enum{false, true} bool;

typedef struct TrieNode{
        char info;
        struct TrieNode *children[26];
        bool EOW;
        int preOccur;
        int superOccur;
        int occur;
        char fullword[101];
}TrieNode;


void isWordInDictionary(char* searchWord);
void printWhichPointersNodeHas(TrieNode* check);
struct TrieNode *createNode();
void destroy_node(struct TrieNode *node);
void getPrefix(struct TrieNode* jesse);
void printOutput(struct TrieNode* jesse);
void trieUpdate(char wordArr[]);
