Program Romb;

Uses crt;

var
x,y:real;
 
begin
clrscr;
readln(x,y);
  if (x<=1) and (x>=-1) and (y<=1) and (y>=-1) then
    writeln('Принадлежит')
      else
writeln('Не принадлежит')
end.