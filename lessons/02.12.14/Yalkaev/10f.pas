program punktE;
var a,c,d,min,b,y:real;
begin
readln(a,b);
c:=sqr(a)-b;
d:=sqr(b)-a;
if c<d then min:=c
       else min:=d;
y:=a*a*a-min;
if y<0 then y:=y*(-1)
       else y:=a*a*a-min;
y:=y+2.3*b;
writeln(y);
end.