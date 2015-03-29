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

template<typename T> void List<T>::append(T el)
{
	if (head == NULL)
	{
		head = new pElement<T>(el);
		tail = head;
	}
	else
	{
		tail->next = new pElement<T>(el);
		tail = tail->next;
	}
	size++;
}


template<typename T> void List<T>::prepend(T el)
{
	if (head == NULL)
	{
		pElement<T> *temp = new pElement<T>(head, el);
		head = temp;
		tail = head;
	}
	else
	{
		pElement<T> *temp = new pElement<T>(head, el);
		head = temp;
	}
	size++;
}

template<typename T> bool List<T>::del(int position)
{
	if (position > size - 1)
	{
		return false;
	}
	if (position == 0)
	{
		if (head != NULL)
		{
			pElement *temp = head;
			head = head->next;
			delete(temp);
			return true;
		}
		else
		{
			return false;
		}
	}
	else if (position == size - 1)
	{
		if (tail != NULL)
		{
			pElement *temp = head;
			for (int i = 0; i < position - 1; i++)
			{
				temp = temp->next;
			}
			delete(temp->next);
			temp->next = NULL;
			tail = temp;
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		pElement *temp = head;
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
template<typename T> bool List<T>::isEmpty()
{
	return (head == NULL);
}

template<typename T> int List<T>::Size()
{
	int i = 0;
	pElement<T> *temp = head;
	while (temp != NULL)
	{
		i++;
		temp = temp->next;
	}
	return i;
}

template<typename T> bool List<T>::insertElement(int position, T el)
{
	if (position > size)
	{
		return false;
	}
	if (position == 0)
	{
		if (head == NULL)
		{
			head = new pElement<T>(el);
			tail = tail;
			return true;
		}
		else
		{
			pElement<T> *temp = new pElement<T>(head, el);
			head = temp;
			return true;
		}
	}
	else if (position == size)
	{
		pElement<T> *temp = new pElement<T>(el);
		tail->next = temp;
		tail = tail->next;
		return true;
	}
	else
	{
		pElement<T> *temp = head;
		for (int i = 0; i < position - 1; i++)
		{
			temp = temp->next;
		}
		temp->next = new pElement<T>(temp->next, el);
		return true;
	}
}
