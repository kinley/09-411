#pragma once
class Node
{
public:
	char info;
	Node *next;
	Node(Node *, char);
	Node(char);
	Node();
	void addInfo(char);
	char get();
};

