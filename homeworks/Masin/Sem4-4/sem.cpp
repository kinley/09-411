#include <iostream>
#include <stdlib.h>
#include <string>
#include "form_list.cpp"

void summ_lists(list *l1,list *l2,list *sum_list)
{
	while (l1->current != NULL || l2->current != NULL)
	{
		if (l1->current == NULL && l2->current != NULL)
		{
			node *p = new node;
			create_node(l2->current->i,l2->current->a,l2->current->b,p);
			push(sum_list,p);
			l2->current = l2->current->next;
		}
		else if (l1->current != NULL && l2->current == NULL)
		{
			node *p = new node;
			create_node(l1->current->i,l1->current->a,l1->current->b,p);
			push(sum_list,p);
			l1->current = l1->current->next;
		}
		else if (l1->current->i == l2->current->i)
		{
			node *p = new node;
			create_node(l1->current->i,l1->current->a + l2->current->a,l1->current->b + l2->current->b,p);
			push(sum_list,p);
			l1->current = l1->current->next;
			l2->current = l2->current->next;
		}
		else if (l1->current->i >= l2->current->i)
		{
			node *p = new node;
			create_node(l2->current->i,l2->current->a,l2->current->b,p);
			push(sum_list,p);
			l2->current = l2->current->next;
		}
		else
		{
			node *p = new node;
			create_node(l1->current->i,l1->current->a,l1->current->b,p);
			push(sum_list,p);
			l1->current = l1->current->next;
		} 
	}	
	l1->current=l1->head;
	l2->current=l2->head;	
}

std::string form_input(list *l_list)
{
	std::string str,t_str;
	if (l_list->current->a != 0)
	{
		t_str = std::to_string(l_list->current->a);
		str = str + t_str;
		l_list->current = l_list->current->next;   
	}

	if (l_list->current->i ==1)
	{
		if (l_list->current->a !=0)
		{
			t_str = std::to_string(l_list->current->a);
			str = str + " + " + t_str + "sin(x)";
		}
		if (l_list->current->b !=0)
		{
			t_str = std::to_string(l_list->current->a);
			str = str + " + " + t_str + "cos(x)";
		}
		l_list->current = l_list->current->next; 
	}

	while (l_list->current != NULL)
	{
		if (l_list->current->a != 0)
		{
			if (l_list->current->a != 1)
			{
			t_str = std::to_string(l_list->current->a);
			str = str + " + " + t_str + "sin(";
			t_str = std::to_string(l_list->current->i);
			str = str + t_str + "x)";
			}
			else
			{
			t_str = std::to_string(l_list->current->i);
			str = str + " + sin(" + t_str + "x)";	
			}	
		}

		if (l_list->current->b != 0)
		{
			if (l_list->current->b != 1)
			{
			t_str = std::to_string(l_list->current->b);
			str = str + " + " + t_str + "cos(";
			t_str = std::to_string(l_list->current->i);
			str = str + t_str + "x)";
			}
			else
			{
			t_str = std::to_string(l_list->current->i);
			str = str + " + cos(" + t_str + "x)";	
			}	
		}

		l_list->current = l_list->current->next;
	}

	return str;
}


int main()
{
	char l[80] = "ex.txt";
	char t[80] = "ex1.txt";
	char output[80] = "output.txt";
	list ls,lt,u;
	form_list(l,&ls);
	form_list(t,&lt);
	summ_lists(&ls,&lt,&u);
	std::string out = form_input(&u);
    	std::ofstream f_output(output);
    	f_output << out;
    	f_output.close();
	return 0;
}
