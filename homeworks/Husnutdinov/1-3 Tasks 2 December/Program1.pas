program zad3;
var u,v,w,x,y:real;
begin
read(x);
u:=power(x,2);
v:=power(x,3);
w:=power(x,5);

y:=(w+5.7*v);
y:=y/(u-7.5);
y:=y+4.2*w-8.9*u;
write(y:3:2);
end.