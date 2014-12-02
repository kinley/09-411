#include <iostream>

using namespace std;

int main()
{
	double x, y;

	cin >> x;
	y = 2;
	for (int i = 7; i >= 0; i--)
	{
		if (i == 0)
		{
			y = 1 + x / y;
		}
		else if (i % 2 == 0)
		{
			y = 2 + x / y;
		}
		else
		{
			y = i - x / y;
		}
	}

	cout << y << endl;

	return 0;
}

