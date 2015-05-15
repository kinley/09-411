#include <iostream>
#include <fstream>
//#include <stack> 
using namespace std;
template <typename T>struct Ttree{
	T data;
	Ttree* l;
	Ttree* r;
};
template <typename T2> void Add(Ttree<T2>  *& T, T2 a){
	if (T != NULL){
		if (a > T->data){
			Add(T->r, a);
		}
		else{
			Add(T->l, a);
		}

	}
	else{
		T = new Ttree<T2>;
		T->data = a;
		T->l = T->r = NULL;
	}
}
//Я (Самат) не стал выкладывать все свои функции для работы со списками, деревьями, стеками и очередями 
//по причине того что там не все функции доработаны и проверены на работоспособность.
//Мы решили делать все по алгаритму, не смотря на то что возможны много способов решений этой задачи используя алгаритмы по легче.
//Итог: мы решили задачу при помощи рекурсии, и не успели решить ее по алгаритму заданной в книге
/*template <typename T> int childcount(Ttree<T>* tree){
	if (tree != NULL){
		int l = childcount(tree->l, 0);
		int r = childcount(tree->r, 0);
		if (l > r) return l;
		else return r;
	}
	else
		return 0;
}
template <typename T> int childcount(Ttree<T>* tree, int a){
	if (tree != NULL){
		int l = childcount(tree->l, a + 1);
		int r = childcount(tree->r, a + 1);
		if (l > r) return l;
		else return r;
	}
	else
		return a;
}
template <typename T> void rectree(Ttree<T>* &tree){
	stack<Ttree<T>*> a;
	Ttree<T> * temp=tree;
	a.push(tree);
	while (!a.empty())
	{
		temp = a.top();
		a.pop();
		if (temp->l != NULL){
			a.push(temp->l);
		}
		if (temp->r != NULL){
			a.push(temp->r);
		}
		temp->data = childcount(temp);
	}
	temp = tree; //Закончил пронумеровывать ветви

}
template <typename T> bool izomorphSpi(Ttree<T>* b1, Ttree <T>* b2){




}*/
template <typename T> bool izomorphRec(Ttree<T>* b1, Ttree <T>* b2){
	if ((b1 == NULL) && (b2 == NULL)){
		return true;
	}
	else if ((b1 == NULL) || (b2 == NULL)) {
		return false;
	}
	else {
		bool RtoR, RtoL, LtoR, LtoL;
		RtoR = izomorph(b1->r, b2->r);
		LtoL = izomorph(b1->l, b2->l);
		RtoL = izomorph(b1->r, b2->l);
		LtoR = izomorph(b1->l, b2->r);
		return ((RtoR && LtoL) || (RtoL && LtoR));
	}
}


int main(){
	ifstream fin1("in1.txt");
	ifstream fin2("in2.txt");
	Ttree<int>* bintree1 = NULL;
	Ttree<int>* bintree2 = NULL;
	int data;
	while (!fin1.eof()){
		fin1 >> data;
		Add(bintree1, data);
	}
	while (!fin2.eof())
	{
		fin2 >> data;
		Add(bintree2, data);
	}

	return 0;
}