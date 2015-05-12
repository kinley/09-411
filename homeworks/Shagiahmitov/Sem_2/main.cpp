
#include "Trie.h"
#include "List.h"


int main()
{
	Trie trie;

	trie.addKey("the");
	trie.addKey("thepk");		

	if(trie.checkKey("thepk"))
		std::cout << "Right word!\n";
	else
		std::cout << "Wrong word\n";

	trie.deleteKey("thepk");

	if(trie.checkKey("thepk"))
		std::cout << "Right word!\n";
	else
		std::cout << "Wrong word\n";	
	
	getchar();
	return 0;
}

