var
  a,b,c,x,y:real;
begin
  read(a,b,c);
  x:=b+c;
  if x>0 then x:=x
         else x:=-x;
  y:=a/(1+x);
  y:=y+x;
  y:=b/(a+x);
  write(y);
  end.
 
