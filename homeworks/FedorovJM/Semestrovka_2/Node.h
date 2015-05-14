#pragma once
#include <string>
static const int MAX_LEVEL = 3, MAX_LONG_DATA = 10;
class Node
{
public:
	Node* next[MAX_LEVEL];
	char data[MAX_LONG_DATA];
	Node();
	Node(char* str);
	~Node();
};

