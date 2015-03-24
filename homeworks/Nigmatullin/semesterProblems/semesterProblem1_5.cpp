#include <iostream>

using namespace std;

int const N = 1000;

double myRandom(double from, double to)
{
    double f = (double)rand() / RAND_MAX;
    return from + f * (to - from);
}

double T(double u)
{
	int nums[11];
	nums[0] = (int)u;
	double temp;

	for (int i = 10; i >= 1; i--)
	{
		u *= 2;
		nums[i] = (int)(u);
		u = modf(u, &temp);
	}
	double ans = 0;
	for (int i = 0; i < 10; i++)
	{
		ans += nums[i] * pow(2, -1 * i);
	}
	return ans;
}

double phi(double z)
{
	return (1 + z) / (1 + z + pow(z, 2));
}

double g(double x)
{
	return x + sqrt(x);
}


double integrate(double t, int M)
{
	double ans = 0, z = 1;
	
	for (int i = 1; i <= M; i++)
	{
		// Неправильно
		z = T(phi(z));
		
		ans += g(1 + (t - 1) * z);
		/* правильно
		ans += g(myRandom(1, t));
		*/
	}

	ans *= (t - 1) / M;
	return ans;
}


int main()
{
	
	double t[N + 1], z = 1;
	int m, M;
	//cin >> m >> M;
	M = 250;
	m = 2;
	t[0] = 3;
	t[1] = 3.5;

	for (int i = 0; i < m; i++)
	{
		//cin >> t[i];
		cout << integrate(t[i], M) << endl;
		cout << endl;
	}
	
	return 0;
}
