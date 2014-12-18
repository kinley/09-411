const n=3;
type Example=record
 chislitel:integer;
 znamenatel:integer;
end; 
var a:array[1..n] of Example;
x,s:real; 
i:integer;

begin
read(x);
for i:=1 to n do
readln(a[i].chislitel,a[i].znamenatel);
s:=0;
for i:=n downto 1 do
  s:=a[i].chislitel/a[i].znamenatel+s*x;
writeln(s)
end.  
  
