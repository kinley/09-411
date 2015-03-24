#include <iostream>
#include <cmath>

using namespace std;

int const N_MAX = 1000;
double const PI = 3.14159265358979323846;

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

double F(double x, double y, double z, double a)
{
	return T(abs(sin((x + y)) + sin((z + a))) / 2);
	//return T(abs(sin((x + y) / PI * 180) + sin((z + a) / PI * 180)) / 2);
}

void sequence(double *arr, int N, double x, double y, double z, double a)
{
	arr[0] = x;
	arr[1] = F(arr[0], y, z, a);
	arr[2] = F(arr[1], arr[0], y, a);

	for (int i = 3; i <= N; i++)
	{
		arr[i] = F(arr[i - 1], arr[i - 2], arr[i - 3], a);
	}
}

void numberInInterval(double *intervals, int R, double arr[], int N)
{

	for (int k = 0; k < R; k++)
	{
		intervals[k] = 0;
		for (int i = 1; i <= N; i++)
		{
			if ((arr[i] >= (double)((double)k / (double)R)) && (arr[i] < (double)(((double)k + 1) / (double)R)))
			{
				intervals[k]++;
			}
		}
	}
}

double expectedValue(int N, int R, double intervals[])
{

	double M = 0;

	for (int k = 0; k < R; k++)
	{
		double temp = (2 * (double)k + 1) / 2 * R;
		temp *= intervals[k] / (double)N;

		M += temp;
	}

	return M;
}

double varience(int N, int R, double M, double intervals[])
{
	double D = 0;

	for (int k = 0; k < R; k++)
	{
		double temp = ((2 * (double)k + 1) / (2 * R) - M);
		temp *= temp;
		temp *= intervals[k] / (double)N;

		D += temp;
	}

	return D;
}

int main()
{
	int N, R, a;
	double arr[N_MAX], x, y, z, intervals[N_MAX];

	//cin >> N >> R >> x >> y >> z;

	N = 100;
	R = 10;
	x = 0.025;
	y = 0.211;
	z = 0.714;

	a = 0;

	// Последовательность
	sequence(arr, N, x, y, z, a);

	for (int i = 1; i <= N; i++)
	{
		cout << arr[i] << endl;
	}
	cout << endl;

	// Количество чисел в полуинтервалах
	numberInInterval(intervals, R, arr, N);

	for (int k = 0; k < R; k++)
	{
		cout << intervals[k] << endl;
	}
	cout << endl;

	// Математическое ожидание
	double M = expectedValue(N, R, intervals);
	cout << M << endl;
	cout << endl;

	// Дисперсия
	cout << varience(N, R, M, intervals) << endl;
	cout << endl;

	//
	a = 1;

	// Последовательность
	sequence(arr, N, x, y, z, a);

	for (int i = 1; i <= N; i++)
	{
		cout << arr[i] << endl;
	}
	cout << endl;

	// Количество чисел в полуинтервалах
	numberInInterval(intervals, R, arr, N);

	for (int k = 0; k < R; k++)
	{
		cout << intervals[k] << endl;
	}
	cout << endl;

	// Математическое ожидание
	M = expectedValue(N, R, intervals);
	cout << M << endl;
	cout << endl;

	// Дисперсия
	cout << varience(N, R, M, intervals) << endl;
	cout << endl;



	return 0;
}

