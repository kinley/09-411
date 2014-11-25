#include <iostream>

using namespace std;

int main()
{
	double x, y, z, u;
	cin >> x >> y >> z;

	if (y == 0 || x == 0)
	{
		cout << "division by 0" << endl;
		return 0;
	}

	u = (((((2.3 - x) * z / y) + 3.15) / x) - y) * z + x;

	cout << u << endl;
	return 0;
}

