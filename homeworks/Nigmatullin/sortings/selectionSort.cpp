#include <iostream>

using namespace std;

const int N = 100;

void selectionSort(int *arr, int n)
{
	for (int i = 0; i < n; i++)
	{
		int min = i;
		for (int j = i + 1; j < n; j++)
		{
			if (arr[j] < arr[min])
			{
				min = j;
			}
		}
		swap(arr[min], arr[i]);
	}
}

int main()
{
	int n, arr[N];
	cin >> n;

	for (int i = 0; i < n; i++)
	{
		cin >> arr[i];
	}

	selectionSort(arr, n);

	for (int i = 0; i < n; i++)
	{
		cout << arr[i] << " ";
	}

	return 0;
}

