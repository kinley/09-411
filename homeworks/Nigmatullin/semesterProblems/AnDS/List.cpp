#include "List.h"


template<typename T> pElement<T>::pElement(pElement<T> *n, T el)
{
	data = el;
	next = n;
}

template<typename T> pElement<T>::pElement(int el)
{
	data = el;
	next = NULL;
}

template<typename T> pElement<T>::pElement()
{
	data = NULL;
	next = NULL;
}



template<typename T> List<T>::List()
{
	tail = NULL;
	head = tail;
	current = tail;
	size = 0;
}

template <typename T> void append(List<T> &list, T el)
{
	if (list.head == NULL)
	{
		list.head = new pElement<T>(el);
		list.tail = list.head;
	}
	else
	{
		list.tail->next = new pElement<T>(el);
		list.tail = list.tail->next;
	}
	list.size++;
}

template <typename T> void prepend(List<T> &list, T el)
{
	if (list.head == NULL)
	{
		pElement<T> *temp = new pElement<T>(list.head, el);
		list.head = temp;
		list.tail = list.head;
	}
	else
	{
		pElement<T> *temp = new pElement<T>(list.head, el);
		list.head = temp;
	}
	list.size++;
}

template <typename T> bool del(List<T> &list, int position)
{
	if (position > list.size - 1)
	{
		return false;
	}
	if (position == 0)
	{
		if (list.head != NULL)
		{
			pElement *temp = list.head;
			list.head = list.head->next;
			delete(temp);
			return true;
		}
		else
		{
			return false;
		}		
	}
	else if (position == list.size - 1)
	{
		if (list.tail != NULL)
		{
			pElement *temp = list.head;
			for (int i = 0; i < position - 1; i++)
			{
				temp = temp->next;
			}
			delete(temp->next);
			temp->next = NULL;
			list.tail = temp;
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		pElement *temp = list.head;
		for (int i = 0; i < position - 1; i++)
		{
			temp = temp->next;
		}
		pElement *t = temp->next;

		temp->next = temp->next->next;
		delete(t);
		return true;
	}
}
template <typename T> bool isEmpty(List<T> &list)
{
	return (list.head == NULL);
}

template <typename T> int size(List<T> &list)
{
	int i = 0;
	pElement<T> *temp = list.head;
	while (temp != NULL)
	{
		i++;
		temp = temp->next;
	}
	return i;
}

template <typename T> bool insertElement(List<T> &list, int position, T el)
{
	if (position > list.size)
	{
		return false;
	}
	if (position == 0)
	{
		if (list.head == NULL)
		{
			list.head = new pElement<T>(el);
			list.tail = list.tail;
			list.size++;
			return true;
		}
		else
		{
			pElement<T> *temp = new pElement<T>(list.head, el);
			list.head = temp;
			list.size++;
			return true;
		}
	}
	else if (position == list.size)
	{
		pElement<T> *temp = new pElement<T>(el);
		list.tail->next = temp;
		list.tail = list.tail->next;
		list.size++;
		return true;
	}
	else
	{
		pElement<T> *temp = list.head;
		for (int i = 0; i < position - 1; i++)
		{
			temp = temp->next;
		}
		temp->next = new pElement<T>(temp->next, el);
		list.size++;
		return true;
	}
}
