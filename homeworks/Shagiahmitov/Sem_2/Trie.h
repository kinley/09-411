#pragma once

#include <iostream>
#include "List.h"

class Trie {
	struct TrieNode
	{
		char label;
		List<TrieNode*> child;
	};

	TrieNode *root;
	
	TrieNode *createSubTree(std::string key);
	void deleteSubTree(TrieNode *root);
public:
	Trie();
	~Trie();

	void addKey(std::string key);
	void deleteKey(std::string key);
	bool checkKey(std::string key);
};