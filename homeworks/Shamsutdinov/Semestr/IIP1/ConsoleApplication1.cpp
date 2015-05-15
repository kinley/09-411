#include "stdafx.h"
#include "iostream"

using namespace std;

// Создаем массивы

double Mass[15];
double b[15];

// Заполняем массив X по условию

int Mas(){

	int i;
	for (i = 0; i < 15; i++)
	{
	
		Mass[i] = ((1, 2 + Mass[i - 1]) / (1, 8 + Mass[i - 1] - 1))*cos((Mass[i - 1] * Mass[i - 1]) + Mass[i - 1] + 1);
	}
	return 0;
}

// Сортируем возводя в квадрат, вносим массив X в массив Y

int sort(){
	int i,imin,j;
	double a;

	for (i = 0; i < 15; i++)
	{
		b[i] = Mass[i] * Mass[i];
	}
	
	for (i = 0; i<15; i++)
	{
		imin = i;
		for (j = i + 1; j<15; j++)
		if (b[j]<b[imin]) imin = j;
		a = b[i];
		b[i] = b[imin];
		b[imin] = a;
	}
	return 0;
}

int main()
{
	Mas();
	int i;
	cout << endl;
	cout << "Mass: " << endl;
	for (i = 0; i < 15; i++){
		cout << Mass[i] << ", ";
	}
	cout << endl << endl << "Y Mass:\n " << endl;
	sort();
	for (i = 0; i < 15; i++){
		cout << b[i] << ", ";
	}
	bool r;
	r = true;
	int m;
	cout << endl << endl;
	if (b[14] < 0)
	{
		r = false;
		cout << r;
	}
	else
		cout << r;
	cin>>r;
	return 0;
}

