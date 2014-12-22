const n=5; k=3;
{set necessary random values to the constants}
var t,x,p,s,y:real;
    i,j:integer;
begin
read(y);
p:=1;
s:=0;
for i:=2 to n do
for j:=0 to k do
              begin
              x:=ln(i+cos(j*y));
              p:=p*x;
              s:=s+p;
              t:=s;
              end;
writeln('t=',t:0:2);
end.              
       
