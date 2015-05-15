// ConsoleApplication4.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

int const N = 1000;


void NewElements(vector<vector<double>> &arr, int n)
{
	for (int j = 0; j < n; j++)
	{
		for (int i = 0; i < n; i+=2){
			if (abs(arr[j][i]) > 1)
			{
				for (int i = 0; i < n; i++)
				arr[j][i] = 3 * arr[j][i];

			}
		}
	}
}


bool P(vector<vector<double>> arr, int n)
{
	double Summ;
	for (int i = 0; i < n-1; i++)
	{
		Summ = arr[n][i] + arr[n][i++];
	}
		bool flag = false;

		if (abs(Summ) > 2.5)
		{
			flag = true;
		}
	
}

int main()
{

	int n;

	cin >> n;

	vector<vector<double>> arr(n, vector<double>(n));

	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cin >> arr[i][j];
		}
	}
	// Предикат в последней строке сумма элементов в модуле больше 2,5
	cout << P(arr, n) << endl << endl;

	// Изменить элементы в столбце, если диоганальный элемент больше 1
	NewElements(arr, n);


	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << arr[i][j] << " ";
		}
		cout << endl;
	}

	return 0;
}

