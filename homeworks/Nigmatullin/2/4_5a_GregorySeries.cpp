#include <iostream>
#include <iomanip>

using namespace std;

// Различия в вычисляниях из-за того, что double хранит до 15 знака после запятой
// то есть цифры после 15 знака округляются, как следствие зависит ещё порядок сложения чисел

int main()
{
	int n;
	double s1 = 0, s2 = 0, s3 = 0, s4 = 0;
	
	cin >> n;
	//5а
	// Слева направо
	for (int i = 1; i <= n; i++)
	{
		if (i % 2 == 1)
		{
			
			s1 += (1 / (2 * (double)i - 1));
		}
		else
		{
			s1 -= (1 / (2 * (double)i - 1));
		}
		 
	}

	// Справа налево
	for (int i = n; i >= 1; i--)
	{
		if (i % 2 == 1)
		{

			s2 += (1 / (2 * (double)i - 1));
		}
		else
		{
			s2-= (1 / (2 * (double)i - 1));
		}

	}

	// Слева направо. Сначала положительные потом отрицательные
	for (int i = 1; i <= n; i += 2)
	{
		s3 += (1 / (2 * (double)i - 1));
	}
	for (int i = 2; i <= n; i += 2)
	{
		s3 -= (1 / (2 * (double)i - 1));
	}

	// Справо налево. Сначала положительные потом отрицательные
	for (int i = (n % 2 == 1) ? n : n - 1; i >= 1; i -= 2)
	{
		s4 += (1 / (2 * (double)i - 1));
	}
	for (int i = (n % 2 == 0) ? n : n - 1; i >= 1; i -= 2)
	{
		s4 -= (1 / (2 * (double)i - 1));
	}

	cout << setprecision(15) << s1 << endl;
	cout << setprecision(15) << s2 << endl;
	cout << setprecision(15) << s3<< endl;
	cout << setprecision(15) << s4 << endl;

	return 0;
}

