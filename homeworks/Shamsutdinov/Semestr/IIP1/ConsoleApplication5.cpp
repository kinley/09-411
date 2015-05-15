// ConsoleApplication5.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
//#include <vector>
using namespace std;

const int N = 100;

//typedef vector<bool> vb;

void binaryToDecimal(bool *num, int n, int &ans)
{
	ans = 0;

	for (int i = n, k = 0; i >= 1; i--, k++)
	{
		
		ans += num[i] * _Pow_int(2, k);
	}
	ans * (num[0]) ? 1 : -1;
}

void decimalToBinary(bool *ans, int n, int num)
{
	for (int i = 0; i <= n; i++)
	{
		ans[i] = false;
	}
	if (num < 0)
	{
		num *= -1;
	}
	else
	{
		ans[0] = true;
	}

	for (int i = n; i >= 1; i--)
	{
		ans[i] = num % 2;
		num /= 2;
	}
}

void reversing(bool *num, int n)
{
	bool flag = false;
	for (int i = 1; i <= n; i++)
	{
		if (num[i] && !flag)
		{
			flag = true;
		}

		if (flag)
		{
			num[i] = !num[i];
		}
	}
}


void subtraction(bool *a, bool *b, bool *ans, int n)
{
	int temp, tempA = 0, tempB = 0;

	binaryToDecimal(a, n, tempA);
	binaryToDecimal(b, n, tempB);

	temp = tempA - tempB;

	decimalToBinary(ans, n, temp);
}

void copyArr(bool *from, bool *to, int n)
{
	for (int i = 0; i <= n; i++)
	{
		to[i] = from[i];
	}
}

void F(bool *x, bool *y, bool *z, bool *ans, int n)
{
	//((!x − y) − ((x − !z) − (x − y))) − (!y − z);

	bool temp1[N], temp2[N], temp3[N], notX[N], notY[N], notZ[N];

	copyArr(x, notX, n);
	copyArr(y, notY, n);
	copyArr(z, notZ, n);

	reversing(notX, n);
	reversing(notY, n);
	reversing(notZ, n);

	//temp1 = (x − !z)
	subtraction(x, notZ, temp1, n);

	//temp2 = (x − y)
	subtraction(x, y, temp2, n);

	//temp3 = (x − !z) − (x − y)
	subtraction(temp1, temp2, temp3, n);

	//temp1 = (!x − y)
	subtraction(notX, y, temp1, n);

	//temp2 = (!x − y) − ((x − !z) − (x − y))
	subtraction(temp1, temp3, temp2, n);

	//temp1 = (!y − z)
	subtraction(notY, z, temp1, n);

	//ans = ((!x − y) − ((x − !z) − (x − y))) − (!y − z)
	subtraction(temp2, temp1, ans, n);
}

int main()
{

	int n;
	bool x[N], y[N], z[N], ans[N];
	
	cin >> n;


	for (int i = 0; i <= n; i++)
	{
		cin >> x[i];
	}

	for (int i = 0; i <= n; i++)
	{
		cin >> y[i];
	}
	for (int i = 0; i <= n; i++)
	{
		cin >> z[i];
	}

	F(x, y, z, ans, n);

	cout << endl;
	for (int i = 0; i <= n; i++)
	{
		cout << z[i];
	}
	cout << endl;