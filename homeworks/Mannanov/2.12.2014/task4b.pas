var
t:real;
i,Nm:integer;
function Hn(m:integer):real;
var
 j:integer;
 g:real;
begin
  g:=0;
  for j:=1 to m do
   g:=g+1/j;
  Hn:=g; 
end;
begin
readln(t);
i:=2;
Nm:=0;
repeat
  if (t>Hn(i-1)) and (t<Hn(i)) then 
    Nm:=i;
  i:=i+1;
until Nm<>0; 
writeln(Nm);
end. 
