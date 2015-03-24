#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

int const N = 1000;

typedef vector<vector<double>> vvd;
typedef vector<double> vd;

void replaceElements(vvd &arr, int n)
{
	for (int i = 0; i < n; i++)
	{
		if (abs(arr[0][i]) <= 1)
		{
			for (int j = 0; j < n; j++)
			{
				arr[j][i] = sin(arr[j][i]);
			}
		}
	}
}

bool P(vvd arr, int n)
{
	for (int i = 0; i < n; i++)
	{
		bool row = false, col = false;
		for (int j = 0; j < n; j++)
		{
			if (abs(arr[i][j]) <= 1)
			{
				col = true;
			}
			if (abs(arr[j][i]) <= 1)
			{
				row = true;
			}
		}

		if (!row || !col)
		{
			return false;
		}
	}
	return true;
}

int main()
{
	
	int n;

	cin >> n;

	vvd arr(n, vd(n));

	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cin >> arr[i][j];
		}
	}
	// Предикат есть в каждой строке и в каждом столбце 1
	cout << P(arr, n) << endl << endl;
	
	// Изменить элементы в столбце, если в первом элементе столбца значение по модулю меншье 1
	replaceElements(arr, n);


	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << arr[i][j] <<  " ";
		}
		cout << endl;
	}

	return 0;
}

