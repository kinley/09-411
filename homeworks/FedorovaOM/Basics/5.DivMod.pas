var n, m, chastnoe, ostatok:integer;
begin
repeat
Writeln('enter positive m, n');
Read(m, n);
until (m>0)and(n>0);
chastnoe:=0;
while m>=n do
 begin
  chastnoe:=chastnoe+1;
  m:=m-n;
 end;
ostatok:=m;
writeln('div=',chastnoe,' mod=',ostatok);
end.
