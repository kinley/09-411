const
	n=15;

type
	arr=array[0..n] of real;

var
	i, j, r: integer;
	x, y: arr;
	
function Next(x: real): real;
begin
	next:=1.2+abs(x);
	next:=next/(1.8+abs(x-1));
	next:=next*cos(x*x+x+1)
end;

procedure swap(var a,b:real);
begin
	a:=a+b;
	b:=a-b;
	a:=a-b;
end;

procedure LetThereBeY();
begin
	y:=x;
	for i:=1 to n-1 do
		for j:=i+1 to n do
			if sqr(y[i])>sqr(y[j]) then
				swap(y[i],y[j]);
end;

procedure print(inArr: arr);
begin
	write('{');
	for i:=1 to n do
	begin
		write(inArr[i]:0:3);
		if i<>n then
			write(', ');
	end;
	writeln('}')
end;

begin
	r:=0;
	x[0]:=-5.1;
	
	for i:=0 to n-1 do
		x[i+1]:=next(x[i]);
	
	write('X='); print(x);
			
	LetThereBeY();
	write('Y='); print(y);
	
	for i:=1 to n do
		if y[i]<0 then r:=i;
	writeln('r=', r);
end.
