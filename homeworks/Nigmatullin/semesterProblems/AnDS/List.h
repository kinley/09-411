template<typename T> struct pElement
{
	T data;
	pElement *next;
	pElement(pElement *n, T el);
	pElement(int el);
	pElement();
	//T &operator *(){ return data; }
};


template<typename T> struct List
{
	pElement<T> *head, *tail, *current;
	int size;
	List();
};

template <typename T> void append(List<T> &list, T el);
template <typename T> void prepend(List<T> &list, T el);
template <typename T> bool del(List<T> &list, int position);
template <typename T> bool isEmpty(List<T> &list);
template <typename T> int size(List<T> &list);
template <typename T> bool insertElement(List<T> &list, int position, T el);
