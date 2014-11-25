program zad1;
var x,y,z,u:real;
begin
read(x,y,z);
if (y=0) or (x=0) then write('ERROR1') else 
begin
u:=(((((2.3-x)/y)*z+3.15)/x)-y)*z+x;
write(u);
end;
end.