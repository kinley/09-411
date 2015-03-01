#include <iostream>

using namespace std;

const int N = 100;

void insertionSort(int *arr, int n)
{
	for (int i = 1; i < n; i++)
	{
		int k = i - 1;
		int temp = arr[i];

		while (k >= 0 && arr[k] > temp)
		{
			arr[k + 1] = arr[k];
			arr[k] = temp;
			k--;
		}

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

	insertionSort(arr, n);

	for (int i = 0; i < n; i++)
	{
		cout << arr[i] << " ";
	}

	return 0;
}

