const
  n = 15;

type
  T = real; 
  arr = array [0..n] of T;

function F(var x: T): T;
var
  b: T;
begin
  b := 1.2 + abs(x);
  b := b * cos(x * x + x + 1);
  b := b / (1.8 + abs(x - 1));
  F := b;
end;

procedure arrangeSequence(B: arr; var C: arr; n: integer);
var
  i, min, j: integer;
  m: T;
begin
  for i := 1 to n - 1 do
  begin
    min := i;
    for j := i + 1 to n do
      if abs(B[min]) > abs(B[j]) then 
        min := j;
    if min <> i then begin
      m := B[min];
      B[min] := B[i];
      B[i] := m;
    end;
  end;
  for i := 1 to n do
    C[i] := B[i];
end;

procedure print(a: arr);
var
  i: integer;
begin
  for i := 1 to n do write(a[i]:5:2, ' ');
  writeln;
end;

var
  x, y: arr;
  i: integer;

begin
  x[0] := -5.1;
  for i := 1 to n do
    x[i] := F(x[i - 1]);
  arrangeSequence(x, y, n);
  print(x);
  print(y);
  i := n;
  while (y[i] > 0) or (i = 0) do
    i := i - 1;
  writeln('r=', i);
end.
