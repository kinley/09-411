#include "TuringMachine.h"


transit::transit(symbol a, M m, state q)
{
	_a = a;
	_m = m;
	_q = q;
}
transit::transit()
{
	_a = sep;
	_m = S;
	_q = 0;
}


void TM::insertFunction(int inState, char inSymbol, char outSymbol, M motion, int outState)
{
	_T[inState].insert(make_pair(inSymbol, transit(outSymbol, motion, outState)));
}


bool TM::checkSymbols()
{
	for (transitions::iterator state = _T.begin(); state != _T.end(); state++)
	{

		for (map<symbol, transit>::iterator s = (*state).begin(); s != (*state).end(); s++)
		{
			if (!_A.count((*s).first) || !_A.count((*s).second._a))
			{
				return false;
			}
		}
	}
	return true;
}

void TM::trim()
{
	for (cur it = _strip.begin(); it != _strip.end();)
	{
		if (*it == sep)
		{
			it++;
			_strip.erase(prev(it));
		}
		else
		{
			break;
		}
	}

	if (_strip.size() > 0)
	{
		for (cur it = prev(_strip.end()); it != _strip.begin();)
		{
			if (*it == sep)
			{
				it--;
				_strip.erase(next(it));
			}
			else
			{
				break;
			}
		}
	}
}

void TM::move(M m, cur &it, stripe &s)
{
	switch (m)
	{
	case L:

		if (it == _strip.begin())
		{
			_strip.push_front(sep);
		}
		it--;

		break;
	case R:
		if (next(it) == _strip.end())
		{
			_strip.push_back(sep);
		}
		it++;

		break;
	case S:

		break;
	}
}

void TM::process(state q)
{

	if (!checkSymbols())
	{
		throw unknownSymbol();
	}

	cur it = _strip.begin();
	bool flag = true;

	while (q)
	{
		symbol temp = *it;
		M m = _T[q][*it]._m;
		if (!_A.count(_T[q][*it]._a) || !_A.count(temp))
		{
			throw unknownSymbol();
		}
		(*it) = _T[q][*it]._a;
		q = _T[q][temp]._q;

		move(m, it, _strip);
	}

	trim();

}