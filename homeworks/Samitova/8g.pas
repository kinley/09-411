program pr;

var
  x: integer;
  y: real;

begin
  Read(x);
  y := x;
  y := y + sqr(x) / 3;
  y := y + 4 * (sqr(x)) / 5;
  y := y + 9 * (sqr(x)) / 7;
  y := y + 16 * (sqr(x)) / 9;
  Write(y);
end.
{изменила}
program pr;
Var x,y:real;
a,k,b:integer;
Begin
Read(x);
a:=0;
b:=1;
y:=x/1;
For k:=1 to 4 do
Begin
a:=a+b;
b:=b+2;
x:=x*x;
y:=y+a*x/b;
End;
Write(y);
End.
