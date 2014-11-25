var
   x,y:real;
begin
write('Vvedite x: ');
read(x);
y:=sqr(sin(x))+1;
y:=sqrt(y);
y:=y*arctan(abs(x)+1);
writeln('Y = ', y);
readln;
end.