#pragma once
#include <iostream>

template<class T> class List {
private:
    struct Node{
        T info;
        Node *next;
    };
    Node *head;
    int count;
public:
    List();
    ~List();
    void Add(T elem);
    T Get(int index);
	bool Delete(int index);
	void Clear();
    void Print();
    bool isEmpty();
    int Size();
};

template <typename T> List<T>::List()
{
    head=new Node;
	head->next=NULL;
    count=0;
}

template <typename T> List<T>::~List()
{
    Node *i=head;
    while(head!=NULL)
    {
        i=head;        
        head=head->next;
		delete i;
    }
}

template <typename T> void List<T>::Add(T elem)
{
	Node *i=head;
	while(i->next!=NULL)
		i=i->next;

    Node *t=new Node();
    t->info=elem;
    t->next=NULL;
    
	i->next=t;
    count++;
}

template <typename T> T List<T>::Get(int index)
{
	if(index>=0 && index<count)
	{
		Node *i=head->next;		
		for(int j=0;j<index;j++)
			i=i->next;
		return i->info;
	}
	return NULL;
}

template <typename T> bool List<T>::Delete(int index)
{
	if(index>=0 && index<count)
	{		
		Node *i=head->next;
		Node *prev=head;
		for(int j=0;j<index;j++)
		{
			prev=i;
			i=i->next;
		}

		Node *tail=prev->next->next;

		prev->next=tail;
		count--;
		return true;
	}
	else
		return false;
}

template <typename T> void List<T>::Clear()
{
	Node *i=head->next;

	while (i->next!=NULL)
	{
		Node *t=i;
		i=i->next;
		delete t;
	}

	head->next=NULL;
}

template <typename T> void List<T>::Print()
{
    Node *i=head->next;
    while(i!=NULL)
    {
        std::cout << i->info<<std::endl;
        i=i->next;
    }
}

template <typename T> bool List<T>::isEmpty()
{
    if(head)
        return false;
    else
        return true;
}

template <typename T> int List<T>::Size()
{
    return count;
}
