var a,b,y:real;
begin
read(a,b);
y:=(a-a*b*b+2.3*b*b*b);
if y>=0 then y:=y else y:=-y;
y:=a*a+y;
write(y:3:2);
end.
