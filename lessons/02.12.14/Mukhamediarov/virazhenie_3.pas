var
 a,b,x,y:real;
begin
  read(a,b);
  x:=a-a*b*b+2.3*b*b*b;
  if x>0 then x:=x 
         else x:=-x;
  y:=a*a+x;
  write(y);
end.
