#include <iostream>

struct node
{
	int i;
	int a;
	int b;
	node *next;	
};

void create_node(int x,int y,int z,node *n)
{
	n->i = x;
	n->a = y;
	n->b = z;
}

struct list
{
	int size;
	node *head,*tail,*current;

	list()
	{
		size = 0;
	}

	list(node *ln)
	{
		head = ln;
		current = ln;
		tail = ln;
		ln->next = NULL;
		size = 1;
	}

	~list()
	{}	
};

void push(list *l_list, node *ln) //to the end
{
	if (l_list->size == 0)
	{
		l_list->head = ln;
		l_list->current = ln;
		l_list->tail = ln;
		ln->next = NULL;
	}
	else
	{
	l_list->tail->next = ln;
	l_list->tail = ln;
	ln->next = NULL;
	}
	int ti = l_list->size;
	l_list->size=++ti;
}

void pop(list *l_list)            //from head
{
	if (l_list->size>0)
	{	
	int ti = l_list->size;
	l_list->size = --ti;
	
	if (l_list->head->next==NULL)
	{
		delete l_list->head;
		l_list->tail=NULL;
		l_list->current=NULL;
	}
	else
	{
		l_list->current = l_list->head->next;
		delete l_list->head;
		l_list->head = l_list->current;
	}}
}

void show_list(list *l_list)
{
	while (l_list->current!= NULL)
	{
		std::cout<<l_list->current->i<<" ";
		std::cout<<l_list->current->a<<" ";
		std::cout<<l_list->current->b<<" ";
		l_list->current = l_list->current->next;
	}
	l_list->current=l_list->head;
}

int size(list *l_list)
{
	return l_list->size;
}

node* get_element(int n_elem,list *l_list)
{
	for(int i=0;i<n_elem;i++)
	{
		l_list->current=l_list->current->next;
	}
	return l_list->current;
}

void delete_element(int n_elem,list *l_list)
{
	if (n_elem>=size(l_list))
	{
		n_elem = size(l_list)-1;
	}
	if (n_elem == 0)
	{
		pop(l_list);
	}
	else 
	{
		for(int i=0;i<n_elem-1;i++)
		{
		l_list->current=l_list->current->next;
		}
	}

	node *temp = l_list->current->next;
	l_list->current->next = temp->next;
	delete temp;
	l_list->current = l_list->head;
}

/*
int main()
{
	return 0;
}*/
