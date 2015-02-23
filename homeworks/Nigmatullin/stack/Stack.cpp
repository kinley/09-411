#include <iostream>

using namespace std;

const int N = 100;

struct stack
{
	int data[N];
	int current = -1;
};

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



int main()
{

	stack s;
	push(s, 10);

	for (int i = 0; i < 10; i++)
	{
		push(s, i);
	}
	bool ie = isEmpty(s);
	int a = pop(s);

	empty(s);

	ie = isEmpty(s);


	return 0;
}

