#include <iostream>

using namespace std;

int main()
{
	double x, y;

	cin >> x;
	y = 2;
	for (int i = 7; i > 0; i--)
	{
		switch (i % 2)
		{
		case 0:
			y = 2 + x / y;
			break;
		case 1:
			y = i - x / y;
			break;
		default:
			break;
		}
	}
	y = 1 + x / y;
	cout << y << endl;

	return 0;
}
