#pragma once
#include <iostream>

struct Node{
    char c;
    Node *next;
};

class List {
private:
    Node *head;
	Node *clearContains(Node *start, int count);
	void createPasteStr(std::string rep,Node *&h,Node *&t);
public:
    List();
    ~List();
    void Add(char c);
    void Print();
    Node *Search(std::string s);
    bool Replace(std::string req, std::string rep);
};
