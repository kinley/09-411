#include <iostream>

using namespace std;

const int N = 100;

void quickSort(int *arr, int first, int last)
{
	int i = first, j = last, m = arr[(i + j) / 2];

	do
	{
		for (; arr[i] < m; i++);
		for (; arr[j] > m; j--);

		if (i <= j)
		{
			swap(arr[i], arr[j]);
			i++;
			j--;
		}

	}
	while (i < j);


	if (first < j)
	{
		quickSort(arr, first, j);
	}

	if (i < last)
	{
		quickSort(arr, i, last);
	}
}

bool checkSortingArray(int *arr, int n)
{
	for (int i = 0; i < n - 1; i++)
	{
		if (arr[i] > arr[i + 1])
		{
			return false;
		}
	}

	return true;
}

int main()
{
	int n, arr[N];
	cin >> n;

	for (int i = 0; i < n; i++)
	{
		cin >> arr[i];
	}

	cout << checkSortingArray(arr, n) << endl;

	quickSort(arr, 0, n - 1);

	cout << checkSortingArray(arr, n) << endl;

	for (int i = 0; i < n; i++)
	{
		cout << arr[i] << " ";
	}

	return 0;
}

