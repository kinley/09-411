#include "stdafx.h"
#include "Trie.h"


Trie::Trie()
{
	root=new TrieNode;
	root->label='!';
	root->headList=new TrieNode;
	root->next=NULL;
}

Trie::~Trie()
{

}

void Trie::pasteWord(std::string word)
{
	TrieNode *cur=root;
	bool found=true;
	int j=0;
	while (j!=word.length())
	{
		TrieNode *i=cur->headList;
		
		while(i!=NULL)
		{
			if(i->label==word[j])
			{
				cur=i;
				j++;
				break;
			}
			else
				found=false;

			i=i->next;
		}
		if(!found)
		{
			TrieNode *subRoot;
			subRoot=createSubTree(word);
			addSubTree(cur,subRoot);
		}
	}
}

Trie::TrieNode *Trie::createSubTree(std::string word)
{
	int i=0;
	TrieNode *root=new TrieNode;
	TrieNode *subRoot;
	subRoot=root;
	root->label=word[i];
	root->headList=new TrieNode;
	root->next=NULL;
	i++;

	while (i!=word.length())
	{
		TrieNode *t=new TrieNode();
		t->label=word[i];
		t->headList=NULL;
		root->addTrieNode(t);
		root=t;
	}
	return root;
}

void Trie::TrieNode::addTrieNode(TrieNode *t)
{
	TrieNode *i=headList;
	while (i->next!=NULL)	
		i=i->next;
	i->next=t;
}

void Trie::addSubTree(TrieNode *cur,TrieNode *sub)
{
	cur->addTrieNode(sub);
}