uses functionT;

const
	M=150;
	n=3;

var
	x, fi: array[0..M] of real;
	t: array[1..n] of real;
	i, k: integer;

function h(z: real): real;
begin
	h:=sqr(cos(z))
end;

procedure GetRandom();
begin
	inc(k);
	fi[k]:=h(fi[k-1]);
	Magic(fi[k]);
end;

function g(x: real): real;
begin
	g:=x*x*x+x-1;
end;

function Integral(t: real): real;
var
	i: integer;
	sum: real;
begin
	Integral:=0;

	sum:=0;
	for i:=1 to M do
	begin
		x[i]:=1+(t-1)*fi[i];
		sum:=sum+g(x[i]);
	end;

	Integral:=sum*(t-1)/M
end;

begin
	t[1]:=5.8;
	t[2]:=8.2;
	t[3]:=12;
	k:=0;
	fi[0]:=1;

	for i:=1 to M do
		GetRandom();

	for i:=1 to n do
		writeln('If t=', t[i]:0:1, ' then result is ', Integral(t[i]):0:3);
end.
