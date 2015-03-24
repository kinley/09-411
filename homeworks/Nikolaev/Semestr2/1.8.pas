const
	n=6;

type
	matrix=array[1..n, 1..n] of real;

var
	A, B: matrix;
	i, j: integer;

procedure E(m: integer; A: matrix; var B: matrix);
var
	i, j: integer;
begin
	for i:=1 to m do
		for j:=1 to m do
			if i mod 2 = 0 then
				b[i,j]:=a[i,j]
			else
				b[i,j]:=a[i,j]+ln(a[i,j]);
end;

procedure printMatr(X: matrix; m:integer);
var
	i, j: integer;
begin
	for i:=1 to m do
	begin
		for j:=1 to m do
			write(x[i,j]:10:3);
		writeln;
	end;
	writeln;
end;

begin randomize;
	for i:=1 to n do
		for j:=1 to n do
			a[i,j]:=10*random;
			
	writeln('Matrix A:');
	printMatr(A, n);
	
	E(n, A, B);
	writeln('Matrix B:');
	printMatr(B, n);
end.
