#include "Stack.h"

stack::stack()
{
	current = -1;
}

void push(stack &s, int el)
{
	if (s.current < N - 1)
	{
		s.data[++s.current] = el;
	}
}

bool isEmpty(stack &s)
{
	return !(s.current > -1);
}

int pop(stack &s)
{
	if (!isEmpty(s))
	{
		return s.data[s.current--];
	}
	else
	{
		return -1;
	}
}

void empty(stack &s)
{
	s.current = -1;
}

