#include <iostream>

using namespace std;


int main()
{
	double x, y, z, u;

	cin >> x >> y >> z;

	if ((x - z == 5.6) || (z == 1))
	{
		cout << "division by 0" << endl;
	}

	u = (x + y + 2.1) * z;
	u /= (x - z - 5.6);
	u += y;
	u *= y;
	u += (z + 1) / (z - 1);

	cout << u << endl;

	return 0;
}

