#include <iostream>
#include <cmath>

using namespace std;

int main()
{
        float x, y;
  
        cin >> x;
        y = pow(sin(x), 2) + 1;
        y = sqrt(y);
        y = y * atan(abs(x) + 1);
        cout << y << endl;
        
        system("PAUSE");
        return 0;
}
