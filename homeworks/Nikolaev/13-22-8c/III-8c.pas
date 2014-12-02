var y,x:real;
	i:integer;

function step(x:real; n:integer):real;
var i:integer;
begin
	step:=1;
	for i:=1 to n do step:=step*x;
end;

begin
	repeat
		write('x=');
		readln(x);
		if (x<0)or(x>0.5) then writeln('	0<=x<=0.5 (!!!)');
	until (x>=0)and(x<=0.5);
	for i:=1 to 5 do
		y:=y-step(-1,i)*step(x,i)/i;
	writeln('y=',y:0:7);
end.
