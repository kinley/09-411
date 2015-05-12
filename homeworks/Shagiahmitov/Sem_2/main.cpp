
#include "Trie.h"
#include "List.h"


int main()
{
	Trie trie;

	trie.addKey("the");
	trie.addKey("thepk");		

	if(trie.checkKey("thepk"))
		std::cout << "Found key!\n";
	else
		std::cout << "Not Found Key\n";

	trie.deleteKey("thepk");

	if(trie.checkKey("thepk"))
		std::cout << "Found key!\n";
	else
		std::cout << "Not Found key\n";	
	
	getchar();
	return 0;
}

