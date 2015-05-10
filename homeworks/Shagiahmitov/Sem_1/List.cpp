#include <iostream>
#include "List.h"

List::List()
{
    head = new Node();
    head->c='H';
}
List::~List()
{
    Node *i;
    while(head!=NULL)
    {
        i=head;
        head=head->next;
        delete i;
    }
}
void List::Add(char c)
{
    Node *node = new Node();
    node->c=c;
    node->next=0;

    Node *i;
    i=head;
    while(i->next!=NULL)
        i=i->next;

    i->next=node;
}

void List::Print()
{
    Node *i;
    i=head->next;
    while(i!=NULL){
        std::cout << i->c;
        i=i->next;
    }
}


Node *List::Search(std::string s)
{	
    Node *i=head->next;
    Node *pos=head;
    int j=0;

    while(i!=NULL)
    {
        if(i->c==s[j])
            j++;
        else
	{
           j=0;
           pos=i;
	}

        if(j==s.length())
            return pos;
        
        i=i->next;
    }
    return NULL;
}


bool List::Replace(std::string req, std::string rep)
{	
    Node *h;  
    Node *startCont;
    Node *endContains;
    h=Search(req);
    startCont=h;
    if(h!=NULL)
    {
        endContains=clearContains(h,req.length());
       
	Node *headPasteStr;
	Node *tailPasteStr;

	createPasteStr(rep,headPasteStr,tailPasteStr);

        // join list
        startCont->next=headPasteStr;
	tailPasteStr->next=endContains;

        return true;
    }
    else    
        return false;    
}

Node *List::clearContains(Node *start, int count)
{
    Node *i;
    start=start->next;
    int j=0;
    while(j!=count)
    {
        i=start;
        start=start->next;
        delete i;
	j++;
    }
	return start;
}

void List::createPasteStr(std::string rep,Node *&h,Node *&t)
{
    int k=rep.length()-1;
    h=new Node;    
    h->c=rep[k];
    h->next=NULL;

    t=h;

    while(k)
    {
	k--;
	Node *n = new Node;
	n->c=rep[k];
	n->next=h;
	h=n;
    }
}
