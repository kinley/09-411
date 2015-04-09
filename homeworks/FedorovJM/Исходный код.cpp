#include <iostream>
#include <stdio.h>
#include <windows.h>
#include "List.h"
using namespace std;

void main(){
	setlocale(LC_CTYPE, "rus");
	char word[SIZE_STR];
	cout << "¬ведите исходное слово: ";
	gets_s(word);
	int i = 0;
	List *listP = new List(word);
	listP->showList();
	
	List *listR[9];
	List *listS[9];

	listR[1] = new List("*lapa");
	listS[1] = new List("pal*");

	listR[2] = new List("*la");
	listS[2] = new List("*");

	listR[3] = new List("*p");
	listS[3] = new List("pila*");

	listR[4] = new List("*a");
	listS[4] = new List("pli*");

	listR[5] = new List("*l");
	listS[5] = new List("lipa*");

	listR[6] = new List("*i");
	listS[6] = new List(".");

	listR[7] = new List("*");
	listS[7] = new List(" i");

	listR[8] = new List(" ");
	listS[8] = new List("*");

	List *listTochka = new List('.');

	for (int i = 1; i < 9; i++){
		int begin = 0, end = 0;
		if (listP->checing(listR[i], begin, end)){
			if (listS[i]->checing(listTochka)){
				listP->insert(listS[i], begin, end);
				cout << endl;
				listP->showList();
				break;
			}
			listP->insert(listS[i], begin, end);
			cout << endl;
			listP->showList();
		}
	}
	cout << endl;
	system("pause");
}