#pragma once
#include <iostream>

struct Node{
    char c;
    Node *next;
};

class List {
private:
    Node *head;
public:
    List();
    ~List();
    void Add(char c);
    void Print();
    Node *Search(std::string s);
    bool Replace(std::string req, std::string rep);
};
