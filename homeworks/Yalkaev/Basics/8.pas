program p8;
var
a,b,c: integer;
i,n: byte;
begin
readln(n);
a:=0;
b:=1;
for i:= 2 to n do begin
c:= b + a;
a:=b;
b:=c
end;
if n=0 then b:=0;
writeln(b)
end.
