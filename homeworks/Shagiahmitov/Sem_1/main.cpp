#include <iostream>
#include "List.h"

using namespace std;

bool checkStr(string s);

int main()
{
    const int count=6;
    string req[count] = {"0","13","111","41","2","22"}; // require
    string rep[count] = {"44","31","3","000","4","2"}; // replace
    int command[count] = {2,1,5,1,3,1}; // command number

    List list;

    string s="121041322";
    if(checkStr(s))
    {
       for(int i=0;i<s.length();i++)
        list.Add(s[i]);

        list.Print();
    }
    else
        cout <<"Sting not valid\n";


    int L=1;
    while(L!=count)
    {
        if(list.Replace(req[L-1], rep[L-1]))
        {
            cout <<"\n" << req[L-1] <<"->" << rep[L-1]<<"\n";
            list.Print();
            L=command[L-1];

        }
        else
        {
            L++;
        }
    }


    return 0;
}

bool checkStr(string s)
{
    const int N=5;
    char A[N] = {'0','1','2','3','4'};
    bool f=false;
    for(int i=0;i<s.length();i++)
    {
        for(int j=0;j<N;j++)
        {
            if(s[i]==A[j])
                f=true;
        }
        if(!f)
            return false;
        f=false;
    }
    return true;
}
