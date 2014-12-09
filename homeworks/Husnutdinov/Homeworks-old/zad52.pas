program zad52;
var n,m,k,h:real;
begin
read(m,n);

k:=1;

if m<n then write('0') else
if m=n then write('1') else 
begin
repeat
k:=k+1;
h:=power(n,k);
until h>=m;

write(k-1);
end;
end.
