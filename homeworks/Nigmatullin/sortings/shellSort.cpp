#include <iostream>

using namespace std;

const int N = 100;

void shellSort(int *arr, int n)
{
	for (int step = n / 2; step > 0; step /= 2)
	{
		for (int i = step; i < n; i++)
		{
			int temp = arr[i];
			int j;
			for (j = i; j >= step; j -= step)
			{
				if (temp < arr[j - step])
				{
					arr[j] = arr[j - step];
				}
				else
				{
					break;
				}
			}
			arr[j] = temp;
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

	shellSort(arr, n);

	for (int i = 0; i < n; i++)
	{
		cout << arr[i] << " ";
	}

	return 0;
}

