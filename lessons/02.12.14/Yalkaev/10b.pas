program punktB;
var 
  a,b,c,d,e,min,y:real;
begin
readln(a);
readln(b);
readln(c);
d:=(a+b+c)/3;
e:=a*b*c;
if d<e then min:=d
       else min:=e;
y:=min/(1+sqr(min));
writeln(y);
end.