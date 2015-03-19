const
  n = 5;

type
  matr = array[1..n, 1..n] of real;
  bool = array[1..n, 1..n] of boolean;

procedure matrisa(var E: matr);
var
  i, j: integer;
begin
  for i := 1 to n do 
    for j := 1 to n do 
      read(E[i, j]);
end;

procedure predikat(var b: bool; E: matr);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := i to n do
      if (i < j) and (E[i, j] < E[j, i]) then b[i, j] := true;
end;

procedure preobrazovanie(var X: real; E: real);
begin
  x := exp(3.4 * ln(e));
end;

procedure matrX(b: bool; var X: matr; E: matr);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      if b[i, j] = true then preobrazovanie(X[i, j], E[i, j]) else X[i, j] := E[i, j];
end;

procedure print(a: matr);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to n do
      write(a[i, j]:3:2, ' ');
    writeln();
  end;
end;

var
  E, X: matr;
  b: bool;

begin
  matrisa(E);
  predikat(b, E);
  matrX(b, X, E);
  print(E);
  print(X);
end.
