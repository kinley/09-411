var
  a,b,c,x,x1,z,q,y:real;
begin
   read(a,b,c);
   x:=(a+b+c)/3;
   x1:=(a*a-b-c);
   z:=(a*b*c);
   
 if x>z then y:=x
        else y:=z;
        
 if a>b then q:=b
        else q:=a;
        
 if x1<0 then x1:=-x1
         else x:=x1;
    y:=y+q/x1;
 write(y);
end.
        
