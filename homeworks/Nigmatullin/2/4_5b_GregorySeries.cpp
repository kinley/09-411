#include <iostream>
#include <iomanip>

using namespace std;


int main()
{
	//5б
	double const eps = 0.0001;
	double const pi = 3.1415926;

	double sn = 0;

	int i;
	for (i = 1; abs(sn - pi / 4) > eps; i++)
	{
		if (i % 2 == 1)
		{

			sn += (1 / (2 * (double)i - 1));
		}
		else
		{
			sn -= (1 / (2 * (double)i - 1));
		}

	}

	cout << i << endl;

	return 0;
}

