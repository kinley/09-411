#include <iostream>
#include "TuringMachine.h"

using namespace std;


int main()
{
	TM tm;
	tm._A.insert('0');
	tm._A.insert('1');
	tm._A.insert('+');
	tm._A.insert(sep);

	tm._T = transitions(6);

	//1 <-> 0
	//tm.insertFunction(1, '0', '1', R, 1);
	//tm.insertFunction(1, '1', '0', R, 1);
	//tm.insertFunction(1, sep, sep, S, 0);

	//добавить в конце последний знак
	//tm.insertFunction(1, '0', '0', R, 1);
	//tm.insertFunction(1, '1', '1', R, 1);
	//tm.insertFunction(1, sep, sep, L, 2);

	//tm.insertFunction(2, '0', '0', R, 3);
	//tm.insertFunction(2, '1', '1', R, 4);
	//tm.insertFunction(2, '+', '+', L, 3);

	//tm.insertFunction(3, sep, '0', S, 0);

	//tm.insertFunction(4, sep, '1', S, 0);

	//Сложение
	tm.insertFunction(1, '0', '1', L, 1);
	tm.insertFunction(1, '1', '0', L, 2);
	tm.insertFunction(1, '+', sep, R, 5);

	tm.insertFunction(2, '0', '0', L, 2);
	tm.insertFunction(2, '1', '1', L, 2);
	tm.insertFunction(2, '+', '+', L, 3);

	tm.insertFunction(3, '0', '1', R, 4);
	tm.insertFunction(3, '1', '0', L, 3);
	tm.insertFunction(3, sep, '1', R, 4);

	tm.insertFunction(4, '0', '0', R, 4);
	tm.insertFunction(4, '1', '1', R, 4);
	tm.insertFunction(4, '+', '+', R, 4);
	tm.insertFunction(4, sep, sep, L, 1);

	tm.insertFunction(5, '1', sep, R, 5);
	tm.insertFunction(5, sep, sep, S, 0);


	tm._strip = { '1', '1', '0', '+', '1', '0', '1', '0', '1' };

	try
	{
		tm.process(4);
	}
	catch (unknownSymbol e)
	{
		cout << "unknown symbol" << endl;
	}

	for (cur it = tm._strip.begin(); it != tm._strip.end(); it++)
	{
		cout << *it << " ";
	}
	cout << endl;

	return 0;
}