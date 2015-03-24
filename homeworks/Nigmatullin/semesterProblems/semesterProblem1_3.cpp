#include <iostream>
#include <cmath>
#include <algorithm>

using namespace std;

int const N = 1000;

bool compare(double i, double j)
{
	return pow(i, 2) <= pow(j, 2);
}

double F(double x)
{
	double ans = 1.2 + abs(x);
	ans *= cos(pow(x, 2) + x + 1);
	ans /= (1.8 + abs(x - 1));
	return ans;
}

void sequence(double *arr, double x0, int n)
{
	arr[0] = x0;

	for (int i = 1; i <= n; i++)
	{
		arr[i] = F(arr[i - 1]);
	}

}

void arrangeSequence(double *arr, double *orderedArr,  int n)
{
	for (int i = 0; i <= n; i++)
	{
		orderedArr[i] = arr[i];
	}
	sort(orderedArr + 1, orderedArr + n + 1, compare);
}

int firstRightNegative(double *arr, int n)
{
	for (int i = n; i > 0; i--)
	{
		if (arr[i] < 0)
		{
			return i;
		}
	}
	return 0;
}

int main()
{

	int n;
	double arr[N + 1], orderedArr[N + 1], x0;
	//cin >> x0 >> n;

	// IV.
	x0 = -5.1, n = 15;

	// I. Создание последовательности
	sequence(arr, x0, n);
	cout << endl;

	for (int i = 1; i <= n; i++)
	{
		cout << arr[i] << endl;
	}
	cout << endl;

	// II. Упорядочивание последовательности
	arrangeSequence(arr, orderedArr, n);

	for (int i = 1; i <= n; i++)
	{
		cout << orderedArr[i] << endl;
	}
	cout << endl;

	// III. Первое справа отрицательное число
	cout << firstRightNegative(orderedArr, n) << endl;
	cout << endl;

	return 0;
}
