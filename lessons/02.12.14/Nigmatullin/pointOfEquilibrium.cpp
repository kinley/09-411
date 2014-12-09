#include <iostream>

using namespace std;
int const N = 100;


int equi(int arr[], int n)
{

	int arrRight[N], arrLeft[N], sum = 0;
	for (int i = 0; i < n; i++)
	{
		sum += arr[i];
	}
	arrRight[0] = sum - arr[0];
	for (int i = 1; i < n; i++)
	{
		arrRight[i] = arrRight[i - 1] - arr[i];
	}
	arrLeft[n - 1] = sum - arr[n - 1];
	for (int i = n - 2; i >= 0; i--)
	{
		arrLeft[i] = arrLeft[i + 1] - arr[i];
	}


	for (int i = 0; i < n; i++)
	{
		if (arrRight[i] == arrLeft[i])
		{
			return i;
		}
	}
	return -1;
}

int main()
{
	
	int n, arr[N], sum = 0;
	cin >> n;

	for (int i = 0; i < n; i++)
	{
		cin >> arr[i];
	}
	

	cout << equi(arr, n) << endl;

	return 0;
}

