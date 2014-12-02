var a,b,c,y,x1,x2,x3:real;
begin
read(a,b,c);
x1:=(a+b+c)/3;
x2:=a*b*c;
if x1>=x2 then y:=x1 else y:=x2;
if a>=b then x3:=b else x3:=a;
if (a*a-b-c)>=0 then y:=y+x3/(a*a-b-c) else y:=y-x3/(a*a-b-c);
write(y:3:2);
end.
