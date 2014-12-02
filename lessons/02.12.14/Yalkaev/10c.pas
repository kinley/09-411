program punktV;
var 
  a,b,y,c:real;
begin
readln(a);
readln(b);
c:=a-a*sqr(b)+2.3*b*b*b;
if c<0 then c:=c*(-1)
       else c:=a-a*sqr(b)+2.3*b*b*b;
y:=sqr(a)+c;
writeln(y);
end.