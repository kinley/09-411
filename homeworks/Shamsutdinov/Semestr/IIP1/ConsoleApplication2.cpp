
#include"stdafx.h"
#include<conio.h>
#include<iostream>
#include<math.h>

using  namespace std;
int const  N = 100, R = 10;

// Наша функция г)
double f(double x, double y, double z, double a)
{
	return abs((sin(x + y) + sin(z + a)) / 2);
}

double T(double u)
{
	// Перевод в двоичную систему
	int d[10];
	for (int i = 0; i < 10; i++)
	{
		u = u * 2;
		if (u < 1)
			d[i] = 0;
		else
		{
			d[i] = 1;
			u = u - 1;
		}
	}
	int dd[10];
	dd[0] = (d[9] + d[2]) % 2;
	for (int i = 1; i < 10; i++)
		dd[i] = d[i - 1];

	double uu = 0;
	// Обратно в десятичную
	for (int i = 0; i < 10; i++)
	{
		uu += dd[i] * pow(2, (-1)*(i + 1));
	}


	return u;
}


double F(double x, double y, double z, double a)
{
	double res1 = f(x, y, x, a);
	double res2 = T(res1);
	return res2;
}


// Матожидание
double M(int *E)
{
	double sum = 0;
	for (int i = 0; i < R; i++)
	{
		sum += ((2 * ((double)i) + 1)*E[i]) / (2 * R*N);
	}
	return sum;
}


// Дисперсия
double D(int *E, double M)
{
	double sum = 0;
	for (int i = 0; i < R; i++)
	{
		sum += pow(((2 * ((double)i) + 1) / (2 * R) - M), 2)*E[i] / N;
	}
	return sum;
}

int main()
{
	setlocale(LC_ALL, "Russian");// Для чтения русского языка

	// Инициализируем переменные а)
	double x0 = 0.025, x1 = 0.211, x2 = 0.714;

	double X1[100];// a=0
	X1[0] = 0.025;
	X1[1] = 0.211;
	X1[2] = 0.714;
	for (int i = 3; i < N; i++)
		X1[i] = F(X1[i - 1], X1[i - 2], X1[i - 3], 0);

	double X2[100];// a=1
	X2[0] = 0.025;
	X2[1] = 0.211;
	X2[2] = 0.714;
	for (int i = 3; i < N; i++)
		X2[i] = F(X2[i - 1], X2[i - 2], X2[i - 3], 1);

	int E1[R];
	for (int i = 0; i < R; i++)
		E1[i] = 0;
	for (int j = 0; j < N; j++)
	for (int i = 0; i < R; i++)
	{
		if (((double)i) / R <= X1[j] && X1[j] <= (((double)i) + 1) / R)
		{
			E1[i]++;
			break;
		}
	}

	int E2[10];
	for (int i = 0; i < R; i++)
		E2[i] = 0;
	for (int j = 0; j < N; j++)
	for (int i = 0; i < R; i++)
	{
		if (((double)i) / R <= X2[j] && X2[j] <= (((double)i) + 1) / R)
		{
			E2[i]++;
			break;
		}
	}

	double M1 = M(E1);// a=0
	double M2 = M(E2);// a=1

	double D1 = D(E1, M1);// a=0
	double D2 = D(E2, M2);// a=1

	// Вывод:
	cout << "a=0:" << endl;
	cout << "E: ";
	for (int i = 0; i < R; i++)
	{
		cout << E1[i] << "  ";
	}
	cout << endl << "Матожидание = " << M1 << "  Дисперсия = " << D1 << endl << endl;

	// Вывод:
	cout << "a=1:" << endl;
	cout << "E: ";
	for (int i = 0; i < R; i++)
	{
		cout << E2[i] << "  ";
	}
	cout << endl << "Матожидание = " << M2 << "  Дисперсия = " << D2 << endl << endl;



	char s[200];
	cin >> s;// Пауза, чтобы консоль не закрылась
}