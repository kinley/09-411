#include <iostream>
#include <stdio.h>
#include "List.h"
using namespace std;

List::List()
{
	first = new Node();
	current = first;
}
List::List(char infoIn){
	first = new Node(infoIn);
	current = first;
}
List::List(char str[SIZE_STR]){
	int i = 0;
	first = new Node(str[i]);
	current = first;
	i++;
	while (str[i] != '\0'){
		addNode(str[i]);
		i++;
	}
} 
void List::constructor(char infoIn){
	first = new Node(infoIn);
	current = first;
}
bool List::next(){
	if (current->next != NULL){
		current = current->next;
		return true;
	}
	else{
		return false;
	}
}
void List::currenGoToFirst(){
	current = first;
}
void List::addNode(char infoIn){
	while (current->next != NULL)
	{
		next();
	}
	current->next = new Node(infoIn);
	next();
}
void List::addNode(){
	while (current->next != NULL)
	{
		next();
	}
	current->next = new Node();
	next();
}
void List::addInfo(char infoIn){
	current->addInfo(infoIn);
}
char List::get(){
	if (current != NULL){
		return current->get();
	}
	else{
		cout << endl << "Current an null pointer" << endl;
		return ' ';
	}
}
int List::length(){
	currenGoToFirst();
	int caunt = 1;
	while (next()){
		caunt++;
	}
	return caunt - 1;
}
void List::deleteNode(){
	if (current->next == NULL){
		Node *currentTwo;
		currentTwo = first;
		while (currentTwo->next != current){
			currentTwo = currentTwo->next;
		}
		currentTwo->next = NULL;
		delete(current);
		current = currentTwo;
	}
	else{
		Node *currentTwo, *currentThree;
		currentTwo = first;
		while (currentTwo->next != current){
			currentTwo = currentTwo->next;
		}
		currentThree = current->next;
		delete(current);
		currentTwo->next = currentThree;
		current = currentThree;
	}
}
void List::deleteList(){
	while (first->next != NULL){
		deleteNode();
	}
	delete (first);
}
bool List::checing(List *chekList, int &begin, int &end){
	int namber = 0;
	Node *currentP = first, *currentPMain = first, *currentR = chekList->first;
	while (currentPMain != NULL){
		while (currentP != NULL && currentP->get() == currentR->get()){
			currentP = currentP->next;
			currentR = currentR->next;
			if (currentR == NULL){
				break;
			}
		}
		if (currentR == NULL){
			begin = namber;
			end = namber + chekList->length();
			return true;
		}
		currentPMain = currentPMain->next;
		currentP = currentPMain;
		namber++;
		currentR = chekList->first;
	}
	return false;
}
bool List::checing(List *chekList){
	Node *currentP = first, *currentPMain = first, *currentR = chekList->first;
	while (currentPMain != NULL){
		while (currentP != NULL && currentP->get() == currentR->get()){
			currentP = currentP->next;
			currentR = currentR->next;
			if (currentR == NULL){
				break;
			}
		}
		if (currentR == NULL){
			return true;
		}
		currentPMain = currentPMain->next;
		currentP = currentPMain;
		currentR = chekList->first;
	}
	return false;
}
void List::insert(List *listIn, int with, int to){
	currenGoToFirst();
	for (int i = 0; i < with; i++){
		next();
	}
	for (int i = 0; i < (to - with + 1); i++){
		deleteNode();
	}
	currenGoToFirst();
	for (int i = 0; i < (with - 1); i++){
		next();
	}
	Node *buff;
	buff = current->next;
	current->next = listIn->first;
	int sizeOfListIn = listIn->length();
	for (int i = 0; i < sizeOfListIn; i++){
		listIn->next();
	}
	listIn->current->next = buff;
}

void List::showList(){
	currenGoToFirst();
	while (current->next != NULL){
		cout << current->get() << ", ";
		next();
	}
	cout << current->get();
}
