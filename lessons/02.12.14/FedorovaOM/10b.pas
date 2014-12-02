var y,a,b,c,min:real;
begin
read(a,b,c);
min:=((a+b+c)/3);
if min>(a*b*c) then
min:=(a*b*c);
y:=min/(1+min*min);
writeln(y);
end.
