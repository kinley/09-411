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


// рефакторить
Node *List::Search(std::string s)
{
    Node *i;
    Node *p=head; // pointer first entry
    i=head->next;
    while(i!=NULL){
        int j=0;
        while(i->c==s[j])
        {
            i=i->next;
            j++;
            if(j==s.length())
                return p;
			if(i==NULL)
				break;
        }

        p=i;
        if(i==NULL)
            break;
        else
            i=i->next;
    }
    return NULL;
}


bool List::Replace(std::string req, std::string rep)
{
    Node *h; // pointer on element before entry
    Node *i;
    Node *st; // pointer on element before entry
    h=Search(req);
    st=h;
    if(h!=NULL)
    {
        // clean elemets entry
        h=h->next;
        int j=0;
        while(j!=req.length())
        {
            i=h;
            h=h->next;
            delete i;
            j++;
        }

        // create paste list
        int k=rep.length()-1;
        Node *p=new Node;
        Node *tl;
        p->c=rep[k];
        p->next=NULL;

        tl=p;

        while(k)
        {
            k--;
            Node *n = new Node;
            n->c=rep[k];
            n->next=p;
            p=n;
        }

        // join list
        st->next=p;
        tl->next=h;

        return true;
    }
    else
    {
        return false;
    }
}
