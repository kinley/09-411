uses functionT;

const
	N=150;
	R=12;

type
	OoZ=0..1; //One or zero

var
	i, k: integer;
	x: array[-2..n] of real;
	a: OoZ;
	E: array[1..R] of integer;
	expectedValue, dispersion: real;

function F(x, y, z: real; a: OoZ): real;
begin
	F:=abs(sin(x-y)-cos(z-a));
	F:=f/2;
	Magic(F)
end;

procedure count(k:integer; var E: integer);
var
	i: integer;
begin
	for i:=1 to N do
		if ( x[i]>=k/R )and( x[i]<(k+1)/R ) then
			inc(E);
end;

function Msummand(k, E: integer): real;
begin
	Msummand:=(2*k+1)/(2*R);
	Msummand:=Msummand*E/N;
end;

function Dsummand(k, E: integer): real;
begin
	Dsummand:=(2*k+1)/(2*R)-expectedValue;
	Dsummand:=sqr(Dsummand);
	Dsummand:=Dsummand*E/N;
end;

begin
	x[-2]:=0.385;
	x[-1]:=0.126;
	x[0]:=0.841;

	for a:=0 to 1 do
	begin
		expectedValue:=0;
		dispersion:=0;
		for k:=0 to R-1 do
			E[k]:=0;

		for i:=1 to N do
			x[i]:=f(x[i-1], x[i-2], x[i-3], a);

		for k:=0 to R-1 do
		begin
			count(k, E[k]);
			expectedValue:=expectedValue+Msummand(k, E[k]);
		end;
	
		for k:=0 to R-1 do
			dispersion:=dispersion+Dsummand(k, E[k]);
		
		writeln('For a=', a, ':');
		
		write('	E={');
		for k:=0 to R-2 do
			write(E[k], ', ');
		writeln(E[R-1], '}');
		writeln('	ExpectedValue=', expectedValue:0:3);
		writeln('	Dispersion=', dispersion:0:3);
		writeln;
	end
end.
