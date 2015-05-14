#include "Node.h"


Node::Node()
{
	for (int i = 0; i < MAX_LONG_DATA; i++){
		if (i < MAX_LEVEL){
			next[i] = NULL;
		}
		data[i] = '_';
	}
}
Node::Node(char* str){
	bool f = true;
	for (int i = 0; i < MAX_LONG_DATA; i++){
		if (str[i] != NULL && f){
			data[i] = str[i];
		}
		else{
			data[i] = '_';
			f = false;
		}
		if (i < MAX_LEVEL){
			next[i] = NULL;
		}
	}
}


Node::~Node()
{
}
