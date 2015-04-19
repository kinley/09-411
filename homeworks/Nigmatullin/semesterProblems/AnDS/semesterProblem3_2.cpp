#include <iostream>
#include "List.cpp"

using namespace std;


List<pair<int, int>> sum(List<pair<int, int>> num1, List<pair<int, int>> num2)
{
	if (num1.size > num2.size)
	{
		swap(num1, num2);
	}

	List<pair<int, int>> ans;
	num1.current = num1.head;
	num2.current = num2.head;

	int temp = num1.current->data.second + num2.current->data.second;
	ans.prepend(make_pair(2, temp % 2));
	int i = 1;
	for (; i < num1.size; i++)
	{
		num2.current = num2.current->next;
		num1.current = num1.current->next;

		temp /= 2;
		temp += num1.current->data.second + num2.current->data.second;

		ans.prepend(make_pair(2, temp % 2));
	}

	for (; i < num2.size; i++)
	{
		num2.current = num2.current->next;
		temp /= 2;
		temp += num2.current->data.second;

		ans.prepend(make_pair(2, temp % 2));
	}

	temp /= 2;
	if (temp != 0)
	{
		ans.prepend(make_pair(2, temp % 2));
	}

	return ans;
}


int main()
{	
	int n1, n2;
	List<pair<int, int>> num1, num2, ans;

	cin >> n1 >> n2;

	for (int i = 0; i < n1; i++)
	{
		int temp;
		cin >> temp;
		num1.prepend(make_pair(2, temp));
	}

	for (int i = 0; i < n2; i++)
	{
		int temp;
		cin >> temp;
		num2.prepend(make_pair(2, temp));
	}

	ans = sum(num1, num2);

	ans.current = ans.head;
	for (int i = 0; i < ans.size; i++)
	{
		cout << ans.current->data.second;
		ans.current = ans.current->next;
	}
	cout << endl;

	return 0;
}

