var x,y,z,y:real;
  begin
    readln(x,y,z);
    if (z=1) or (x-z-5.6=0) then writeln('Ошибка');
    u:=x+y+2.1;
    u:=u*z/(x-z-5.6);
    u:=(u+y)*y;
    u:=u+(z+1)/(z-1);
    writeln(u);
  end.
