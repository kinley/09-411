program zad53;
var k:real;
m:integer;
begin
read(m);

k:=1;

while (m<>0) and (m<>1) do
begin
m:=m div 2;
k:=k+1;
end;

write(k);

end.
