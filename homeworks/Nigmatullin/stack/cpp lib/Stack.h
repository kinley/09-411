const int N = 100;

struct stack
{
	int data[N];
	int current;
	stack::stack();
};


void push(stack &s, int el);
bool isEmpty(stack &s);
int pop(stack &s);
void empty(stack &s);

