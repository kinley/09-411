var x,y,z,u:real;
   begin
     readln(x,y,z);
     if x=0 then writeln('Ошибка');
     u:=(2.3-x)*2/y;
     u:=(u+3.15)/x-y;
     u:=u*z+x;
     writeln(u);
   end.
