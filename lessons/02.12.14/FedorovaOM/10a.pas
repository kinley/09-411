var a,b,max,y:real;
begin
read(a,b);
max:=(a-2.3*b*b);
if max<((b-1.2)/b) then
max:=((b-1.2)/b);
y:=a*a+max;
writeln(y);
end.
