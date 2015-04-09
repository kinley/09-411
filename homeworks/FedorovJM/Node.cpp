#include <iostream>
#include <stdio.h>
#include "Node.h"


Node::Node()
{
	info = ' ';
	next = NULL;
}
Node::Node(char infoIn){
	info = infoIn;
	next = NULL;
}
Node::Node(Node *nextIn, char infoIn){
	info = infoIn;
	next = nextIn;
}
void Node::addInfo(char infoIn){
	info = infoIn;
}
char Node::get(){
	return info;
}

