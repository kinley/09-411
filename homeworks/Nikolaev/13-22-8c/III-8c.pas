var y,x:real;
	i:integer;

function step(x:real; n:integer):real;
var i:integer;
begin
	step:=1;
	for i:=1 to n do step:=step*x;
end;

procedure readx(var x:real);
begin
	repeat
		write('x=');
		readln(x);
		if (x<0)or(x>0.5) then writeln('	0<=x<=0.5 (!!!)');
	until (x>=0)and(x<=0.5);
end;

begin
	readx(x);
	y:=0;
	for i:=1 to 5 do
		if i mod 2=0 then
			y:=y-step(x,i)/i
		else
			y:=y+step(x,i)/i;
	writeln('y=',y:0:7);
end.
