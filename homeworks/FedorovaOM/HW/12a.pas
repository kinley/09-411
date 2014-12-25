var U,y,x,E,x1,f:real;
n,k:integer;
begin
read(x,E);
U:=1;
y:=U;
k:=1;
x1:=1;
while abs(U)<E do begin
for n:=1 to k do begin
x1:=x1*x;
f:=f*n; end;
U:=U+(x1/f); end;
write(y);
end.
