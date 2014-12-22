#include <stdio.h>
#include <math.h>
#include <conio.h>
#include <iostream.h>

float a,b,c,d,x1,x2;
void main ()
{
clrscr();
cout << \"\\nVvedit A->\";
cin >> a;
cout << \"\\nVvedit B->\";
cin >> b;
cout << \"\\nVvedit C->\";
cin >> c;
d = pow(b,2)-(4*a*c);
if (d < 0) goto d1;
if (d==0) goto d2;
if (d>0) goto d3;
 d1: {
  printf("\\nKoreniv nema");
  goto exit;
 }
 d2: {
  x1=-b/(2*a)
  printf(\"\\nx = %f\",x1);
  goto exit;
  }
 d3:  {
  x1=(-b-sqrt(d))/(2*a);
  x2=(-b+sqrt(d))/(2*a);
  printf("\\nx1 = %f\",x1);
  printf("\\nx2 = %f\",x2);
  goto exit;
 }
exit:

getch();
}