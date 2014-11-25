program ex25_2;
var x,y,z,u:real;
begin
readln(x);
readln(y);
readln(z);
u:=x+y+2.1;
u:=u/x-z-5.6;
u:=u*z;
u:=u+y;
u:=u*y;
u:=u+((z+1)/(z-1));
writeln(u)
end.