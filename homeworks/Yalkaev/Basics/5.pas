program p5;
var a,b,n,i: integer;
begin
readln(a);
readln(n);
b:=a;
if n=0 then b:=1;
if (n>=2) then 
            for i:=2 to n do 
            b:=a*b;
writeln(b);
end.