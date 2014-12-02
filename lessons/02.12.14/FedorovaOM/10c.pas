var y,a,b:real;
begin
read(a,b);
y:=a*a;
x:=a-a*b*b+2.3*b*b*b;
if x>=0 then
x:=a-a*b*b+2.3*b*b*b
else
x:=-(a-a*b*b+2.3*b*b*b);
y:=y+x;
writeln(y);
end.
