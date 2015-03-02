#include <iostream>
#include "Stack.h"

using namespace std;

int main()
{

	stack s = stack();
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

