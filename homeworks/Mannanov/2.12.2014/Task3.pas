var
x,y:real;
begin
writeln('Введите ваше X');
readln(x);
x:=abs(x);
y:=1+cos(x);
y:=y/(x+1);
y:=ln(y)*exp(x);
writeln('Получите ваше Y');
writeln(y);
end.
