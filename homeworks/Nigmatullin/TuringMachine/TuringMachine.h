#include <list>
#include <set>
#include <vector>
#include <map>
#include <iterator>
#include <utility>

using namespace std;

class unknownSymbol : public exception
{

};

char const sep = '_';
enum M { L = -1, S, R };
typedef char symbol;
typedef list<symbol> stripe;
typedef list<symbol>::iterator cur;
typedef set<symbol> alphabet;
typedef int state;



struct transit
{
	symbol _a;
	M _m;
	state _q;
	transit(symbol a, M m, state q);
	transit();
};

typedef vector<map<symbol, transit>> transitions;

struct TM
{
	alphabet _A;
	transitions _T;
	cur _current;
	stripe _strip;


	void insertFunction(int inState, char inSymbol, char outSymbol, M motion, int outState);
	bool checkSymbols();
	void trim();
	void move(M m, cur &it, stripe &s);
	void process(state q);
};