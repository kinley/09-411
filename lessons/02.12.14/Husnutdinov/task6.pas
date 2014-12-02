var a,b,c,x1,x2,y:real;
begin
read(a,b,c);
if (a*a-b)<=(b*b-a) then x1:=(a*a-b) else x1:=(b*b-a);
if (a*a*a-x1)>=0 then x2:=a*a*a-x1 else x2:=-(a*a*a-x1);
y:=x2+2.3*b;
write(y:3:2);
end.
