#include "stdafx.h"
#include "Trie.h"
#include <string>

Trie::Trie()
{
	root=new TrieNode;
	root->label='!';	
}

Trie::~Trie()
{
	// нет времени реализовать
}

void Trie::addKey(std::string key)
{
	TrieNode *cur=root;
	bool found=false;
	int j=0;	

	while (j<key.length())
	{
		int i;
		for(i=0;i<cur->child.Size();i++)
		{
			TrieNode *t=cur->child.Get(i);
			if(t->label==key[j])
			{				
				cur=cur->child.Get(i);
				found = true;
			}
			else
			{
				found = false;
				break;
			}
		}

		if(!found)
		{
			TrieNode *subTree=createSubTree(key.substr(j,key.length()-j));
			cur->child.Add(subTree);
			break;
		}
		j++;
	}
}

Trie::TrieNode *Trie::createSubTree(std::string key)
{
	key+='$';
	TrieNode *root=new TrieNode;
	root->label=key[0];
	TrieNode *subRoot;
	subRoot=root;	

	for(int i=1;i<key.length();i++)
	{
		TrieNode *t=new TrieNode();
		t->label=key[i];
		
		root->child.Add(t);
		root=t;		
	}

	return subRoot;
}

bool Trie::checkKey(std::string key)
{
	key+='$';
	TrieNode *cur=root;	

	bool found=false;
	int j=0;
	while (j<key.length())
	{
		int i;
 		for(i=0;i<cur->child.Size();i++)
		{
			if(cur->child.Get(i)->label==key[j])
			{
				cur=cur->child.Get(i);
				found=true;
				break;
			}
			else			
				found=false;			
		}
		if(!found)
			return false;

		j++;
	}		
	return true;	
}

void Trie::deleteKey(std::string key)
{
	key+='$';
	TrieNode *cur=root;	
	TrieNode *startNode=root;
	int childNodeID;

	bool found=false;
	int j=0;
	while (j<key.length())
	{
		int i;
 		for(i=0;i<cur->child.Size();i++)
		{		
			
			if(cur->child.Get(i)->label==key[j])
			{
				if(cur->child.Size()>1)
				{
					startNode=cur;
					childNodeID=i;
				}
				cur=cur->child.Get(i);				

				found=true;
				break;
			}
			else			
				found=false;			
		}	
		j++;
	}		
	if(found)
	{
		startNode->child.Delete(childNodeID);
		deleteSubTree(startNode);
	}
}

void Trie::deleteSubTree(TrieNode *root)
{
	while(root->child.Size()>0)
	{
		TrieNode *t=root;
		root=root->child.Get(0);
		delete t;
	}
}
