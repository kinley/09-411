program punktD;
var
  max,min,a,b,c,d,e,f,y:real;
begin
readln(a,b,c);
d:=(a+b+c)/3;
e:=a*b*c;
f:=sqr(a)-b-c;
  if f<0 then f:=f*(-1)
       else f:=sqr(a)-b-c;
  if d>e then max:=d
       else max:=e;
  if a<b then min:=a
       else min:=b;
y:=max+min/f;
writeln(y);
end.