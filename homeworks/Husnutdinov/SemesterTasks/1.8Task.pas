{The initial values}
const
  CN = 10;

type
  ta = array[1..CN, 1..CN] of real;

var
  n, i, j: integer;
  A, B: ta;
  l: boolean;

{Operation E1}
procedure calculationE1(m: integer; var A, B: ta);
var
  i, j: integer;
begin
  for i := 1 to m do
    for j := 1 to m do
      if (i >= j) then B[i, j] := A[j, i] else B[i, j] := A[i, j];
end;

{Operation E2}
{В таблице не была укзана операция E2,поэтому я взял операцию д}
procedure calculationE2(m: integer; var A, B: ta);
var
  i, j: integer;
begin
  for i := 1 to m do
    for j := 1 to m do
      if (i mod 2 <> 0) then B[i, j] := (A[i, j] + ln(A[i, j])) else B[i, j] := (A[i, j] + ln(A[i, j]));
end;

{Predicate}

function Predicate(m: integer; var A: ta): boolean;
var
  i, j: integer;
begin
  Predicate := true;
  
  for i := 1 to (m - 1) do
    for j := 1 to (m - 1) do
      if (A[i, j] * A[i + 1, j + 1] - A[i + 1, j] * A[i, j + 1] <= 0) then Predicate := false;
  
end;

begin
  write('Введите размерность матрицы: ');
  read(n);
  
  for i := 1 to n do
    for j := 1 to n do
      read(A[i, j]);
  
  l := Predicate(n, A);
  
  if l then calculationE1(n, A, B) else calculationE2(n, A, B);
  
  for i := 1 to n do
  begin
    writeln;
    for j := 1 to n do
      write(B[i, j]:3:2, ' ');
  end;
  
end.
