template<typename T> struct pElement
{
	T data;
	pElement *next;
	pElement(pElement *, T);
	pElement(int el);
	pElement();
};

template<typename T> struct List
{
	pElement<T> *head, *tail, *current;
	int size;
	List();
	void append(T);
	void prepend(T);
	bool del(int);
	bool isEmpty();
	int Size();
	bool insertElement(int, T);
};

