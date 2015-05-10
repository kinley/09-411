#pragma once

#include <iostream>


class Trie {
	struct TrieNode
	{
		char label;
		TrieNode *next;
		TrieNode *headList;

		void addTrieNode(TrieNode *t);
	};

	TrieNode *root;

	void addSubTree(TrieNode *cur,TrieNode *sub);
	TrieNode *createSubTree(std::string word);

public:
	Trie();
	~Trie();

	void pasteWord(std::string word);
	void deleteWord(std::string word);
	bool checkWord(std::string word);

};
