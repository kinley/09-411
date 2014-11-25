#include <iostream>
#include <vector>

using namespace std;

int main()
{
	int n;
	cin >> n;
	vector<bool> primes(n + 1, true);

	primes[0] = false;
	primes[1] = false;

	for (int i = 1; i <= n; i++)
	{
		if (primes[i] != false)
		{
			for (int j = 2; j * i <= n; j++)
			{
				primes[i * j] = false;
			}
		}
	}

	bool flag = false;
	for (int i = 0; i < n; i++)
	{
		int temp = n - i;
		if ((temp + i == n) && (primes[i] == true) && (primes[temp] == true))
		{
			flag = true;
			cout << i << " " << temp << endl;
			break;
		}

	}
	if (!flag)
	{
		cout << -1 << endl;
	}
	return 0;
}

