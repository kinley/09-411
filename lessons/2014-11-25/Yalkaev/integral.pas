const n=100;
a=0;
b=pi/4;
var 
  ik,h,y,x:real;
  i,k:integer;
begin
  x:=a;
  h:=(b-a)/n;
  for i:=1 to n do
       begin
            x:=x+h;
            y:=sqr(sin(x));
            y:=1-y/2;
            y:=sqrt(y);
            ik:=ik+y*h
       end;
   writeln('I~',ik:0:10);
end.