var
 x,a,b,y:real;
begin 
 read(a,b);
  if (a*a-b)>(b*b-a) then x:=(b*b-a)
                     else x:=(a*a-b);
                     
  if (a*a*a-x)>0 then y:=(a*a*a-x)
                 else y:=(-1)*(a*a*a-x);
 y:=y+2.3*b;
 write(y);
end.
