var a,b,y,min:real;
begin
read(a,b);
min:=a*a-b;
if min>(b*b-a) then
min:=b*b-a;
y:=a*a*a;
y:=y-min;
if y>=0 then
y:=y-min
else
y:=-(y-min);
y:=y+2.3*b;
writeln(y);
end.
