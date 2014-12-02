var 
a,b,c,y,x1:real;
begin
  read(a,b,c);
  if (a+b+c)/3>=a*b*c then x1:=(a*b*c) else x1:=(a+b+c)/3;
  y:=x1/(1+x1*x1);
  write(y);
end.
