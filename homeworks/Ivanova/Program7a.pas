var y,x: real;
begin
read (x);
y:=x+4;
y:=y+y*(x+3);
y:=y+(x+4)*(x+3)*(x+2);
y:=y+(x+4)*(x+3)*(x+2)*(x+1);
y:=y+(x+4)*(x+3)*(x+2)*(x+1)*x;
writeln('y = ',y);
end.