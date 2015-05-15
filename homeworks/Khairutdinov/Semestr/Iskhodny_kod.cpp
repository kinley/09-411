#include <fstream>
#include <iostream>
#include <string>
using namespace std;
template <typename T> struct mylist{
	T data;
	mylist* next;
};
template <typename T> inline void AddFirst(mylist<T>* &l, T data){
	mylist<T>* t = new mylist<T>;
	t->data = data;
	t->next = l;
	l = t;
}
template <typename T> void AddLast(mylist<T>* &l, T data){
	if (l == NULL){ l = new mylist < T >; l->data = data; l->next = NULL; }
	else{
		mylist<T>* t = l;
		while (t->next != NULL)
		{
			t = t->next;
		}
		t->next = new mylist<T>;
		t->next->data = data;
		t->next->next = NULL;

	}
}
template <typename T> void DeleteFirst(mylist<T>* &l)
{

	if (l == NULL){}
	else{
		if (l->next == NULL){
			l = NULL;
		}
		else{
			mylist<T>* temp = l;
			l = l->next;
			delete temp;
		}
	}
}
int main(){
	ifstream  fin ("words.txt");
	string s;
	getline(fin, s);
	mylist <char>* l=NULL;
	for (int i = 0; i < s.length(); i++){
		AddLast(l, s[i]);
	}
	bool b=1;
	mylist<char>* slovo = l;
	for (int i = 0; i < (s.length() - 2) && b; i++){
		switch (slovo->data)
		{
		case '1':{
			switch (slovo->next->data){
			case 'a':{
				DeleteFirst(slovo); DeleteFirst(slovo);
				AddFirst(slovo, '1');
				AddFirst(slovo, 'a');
				AddFirst(slovo, 'a'); break;

			}
			case 'b':{
				DeleteFirst(slovo); DeleteFirst(slovo);
				AddFirst(slovo, '2');
				AddFirst(slovo, 'b'); break;
			}
			}
			break; }
		case '2':{
			switch (slovo->next->data){
			case 'a':{
				DeleteFirst(slovo); DeleteFirst(slovo);
				AddFirst(slovo, '2');
				AddFirst(slovo, 'c');
				AddFirst(slovo, 'a'); break;

			}
			case 'b':{
				DeleteFirst(slovo); DeleteFirst(slovo);
				AddFirst(slovo, '3');
				AddFirst(slovo, 'b'); break;
			}
			}
			break; }
		case '3':{
			switch (slovo->next->data){
			case 'a':{
				DeleteFirst(slovo); DeleteFirst(slovo);
				AddFirst(slovo, '3');
				AddFirst(slovo, 'c');
				AddFirst(slovo, 'a');
				AddFirst(slovo, 'a'); break;

			}
			case 'b':{
				DeleteFirst(slovo); DeleteFirst(slovo);
				AddFirst(slovo, '1'); 
				b = 0; break;
			}
			}
			break; }
		case ' ':{
			DeleteFirst(slovo);
			AddFirst(slovo, '1'); break;
			break; }
		}
		slovo = slovo->next;
	}
	slovo = l;
	while (slovo!=NULL)
	{
		cout << slovo->data;
		slovo = slovo->next;
	}
	system("pause");
}