var a,b,c,x,max,min,y:real;
begin
read (a,b,c);
max:=(a+b+c)/3;
if max<(a*b*c) then
max:=(a*b*c);
if a<b then
min:=a
else min:=b;
x:=(a*a-b-c);
if x>=0 then x:=(a*a-b-c)
else x:=-(a*a-b-c);
y:=min/x;
y:=y+max;
writeln(y);
end.
