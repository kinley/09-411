Program eightA;
var x,y : real;
begin
  readln(x);
  if (x<0) or (x>1) then
  writeln('ERROR')
  else
    begin
    y:=1+x+x*x/2;
    y:=y+x*x*x/2*3;
    y:=y+x*x*x*x/2*3*4;
    end;
writeln('e^x==', y);    
end.
