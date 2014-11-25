program romb;
var
 x,y:real;
 b: boolean;
begin
readln(x);
readln(y);
if (abs(x)+abs(y))<=1 then b:=true
else b:=false; 
writeln(b)
end.