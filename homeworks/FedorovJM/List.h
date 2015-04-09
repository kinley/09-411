#pragma once
#include "Node.h"


const int SIZE_STR = 50;
class List
{
public:
	Node *first;
	Node *current;
	List();
	List(char);
	List(char[SIZE_STR]);
	void constructor(char);
	bool next();
	void currenGoToFirst();
	void addNode(char);
	void addNode();
	void addInfo(char);
	char get();
	int length();
	void deleteNode();
	void deleteList();
	bool checing(List *, int &, int &);
	bool checing(List *);
	void insert(List *, int, int);
	void showList();
};


