#include "Node.h"
#include <cstdlib>
#include <ctime> 
#include <iostream>
#include <fstream>
#pragma once
using namespace std;
int const STEP_RAND = 2;
class SkipList
{
public:
	int sizeList;
	Node *next[MAX_LEVEL];
	Node *pointer;

	SkipList(){
		begin = new Node();
		pointer = begin;
		sizeList = 0;
	}
	~SkipList();

	Node* getBegin(){ return begin; }

	void Add(Node *nodeIn){
		int levelRand;                           // stepLevel = 1;
		levelRand = 1 + rand() % 33;             // 2^MAX_LEVEL;
		sizeList++;
		int level = 0;
		// Заменить на нормальную функцию подсчета количества ссылок
		if (levelRand < 8){
			level = 2;
		}
		if (levelRand > 27){
			level = 1;
		}
		pointer = begin;
		int levelOfSeorch = MAX_LEVEL - 1;
		while (levelOfSeorch >= 0){
			while (pointer->next[levelOfSeorch] != NULL)
			{
				if (comparison(nodeIn, pointer->next[levelOfSeorch]) == -1){
					break;
				}
				pointer = pointer->next[levelOfSeorch];
			}
			if (level >= levelOfSeorch){
				nodeIn->next[levelOfSeorch] = pointer->next[levelOfSeorch];
				pointer->next[levelOfSeorch] = nodeIn;
			}
			levelOfSeorch--;
		}
	}


	void Add(char *str){
		Node *nodeIn = new Node(str);
		Add(nodeIn);
	}


	int comparison(Node* smoll, Node* big){ 
		int i = 0;
		if (big->data[i] == '_'){
			return 1;  // 
		}
		while (big->data[i] == smoll->data[i] && i < MAX_LONG_DATA){
			i++;
		}
		if (i == MAX_LONG_DATA){
			return 0; // big == smoll
		}
		else{
			if (big->data[i] > smoll->data[i]){
				return -1; // smoll < big
			}
			else{
				return 1; // smoll > big
			}
		}
	}


	Node* seorch(char *s){
		Node *in = new Node(s);
		return seorch(in);
	}

	Node* seorch(Node *in){
		int level = MAX_LEVEL - 1;
		if (comparison(in, pointer) == -1){//
			pointer = begin;
		}
		while (level >= 0){
			while (pointer->next[level] != NULL)
			{
				if (comparison(in, pointer) == 0){
					return pointer;
				}
				if (comparison(in, pointer->next[level]) == -1){
					break;
				}
				pointer = pointer->next[level];
			}
			level--;
		}
		return NULL;
	}


	void deleteNode(Node *in){
		Node *before = NULL, *buff = NULL;
		int level = MAX_LEVEL - 1;
		while (level >= 0){
			pointer = begin;
			before = begin;
			while (pointer->next[level] != NULL)
			{
				if (comparison(in, pointer) == 0){
					before->next[level] = pointer->next[level];
					buff = pointer;
					pointer = before;
					break;
				}
				if (comparison(in, pointer->next[level]) == -1){
					break;
				}
				before = pointer;
				pointer = pointer->next[level];
			}
			level--;
		}
		delete(buff);
	}


	void deleteNode(char *str){
		Node *in = new Node(str);
		deleteNode(in);
	}


	bool readFile(string adress){
		ifstream file;
		file.open(adress);
		if (!file.is_open()){
			return false;
		}
		else{
			while (!file.eof()){
				char *name = new char[];
				file.getline(name, 10);
				Add(name);
			}
		}
		return true;
	}


	void readCommand(char comm, char *name, SkipList *good, SkipList *bad){
		switch (comm)
		{
		case 'F': {
			good->Add(name);
			bad->deleteNode(name);
			break;
		}
		case 'U':{
			bad->Add(name);
			good->deleteNode(name);
			break;
		}
		case'E':{
			if (good->seorch(name) != NULL){
				cout << "goodBoys";
			}
			else{
				cout << "badBoys";
			}
			break;
		}
		default:
			cout << "Command not faund";
			break;
		}
	}


	Node *begin;
};









/*

	void AddTuEnd(char *str){
		int levelRand;                           // stepLevel = 1;
		levelRand = 1 + rand() % 33;             // 2^MAX_LEVEL;
		sizeList++;
		int level = 0;
		// Заменить на нормальную функцию подсчета количества ссылок
		if (levelRand < 8){
			level = 2;
		}
		if (levelRand > 27){
			level = 1;
		}
		Node *newNode = new Node(str, sizeList);
		pointer = begin;
		int levelOfSeorch = MAX_LEVEL - 1;
		while (levelOfSeorch >= 0){
			while (pointer->next[levelOfSeorch] != NULL)
			{
				pointer = pointer->next[levelOfSeorch];
				//break;
			}
			if (level >= levelOfSeorch){
				pointer->next[levelOfSeorch] = newNode;
			}
			levelOfSeorch--;
		}
		} */