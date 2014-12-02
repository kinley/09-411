program punktA;
var 
  a,b,y,c,d, max:real;
begin
readln(a);
readln(b);
c:=a-2.3*sqr(b);
d:=(b-1.2)/b;
if c>d then max:=c
       else max:=d;
y:=sqr(a)+max;
writeln(y);
end.