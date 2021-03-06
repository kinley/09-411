program p1;

const
  CN = 100;
  
type
  T = real;
  tArr = array[1..CN] of T;

var
  X, Y: tArr;
  r, Xo: T;
  i, n: integer;
  
procedure swap(var a, b: T);
var
  temp: T;
begin
  temp := a;
  a := b;
  b := temp;
end;

function F(x: T): T;
begin
  result := ln(1 + x * x);
  result := result / (2 * (x * x * x * x) + 3 * (x * x) + 1);
end;

procedure fill_X(var X: tArr; Xo: T; n: integer);
var
  i: integer;
begin
  X[1] := F(Xo);
  for i := 2 to n do
  begin
    X[i] := F(X[i - 1]);
    if (i mod 2 = 1) then
      X[i] := X[i] * (-1);
  end;
end;

procedure change_XtoY(var X, Y: tArr; n: integer);
var
  i, left, right: integer;
begin
  left := 1;
  right := n;
  for i := 1 to n do
  begin
    if X[i] < 0 then
    begin
      Y[left] := X[i];
      inc(left);
    end
    else
    begin
      Y[right] := X[i];
      dec(right);
    end;  
  end;
end;

function search_r(Y: tArr; n : integer): integer;
var
  i: integer;
begin
  i := 1;
  while (Y[i] <= 0) and (i <= n) do
    inc(i);
  if (Y[i] > 0) then
    result := i
  else
    result := n + 1;
end;

BEGIN
  readln(Xo, n);
  fill_X(X, Xo, n);
  for i := 1 to n do
    write(X[i] : 0 : 10, ' ');
  writeln;
  change_XtoY(X, Y, n);
  for i := 1 to n do
    write(Y[i] : 0 : 10, ' ');
  writeln;
  r := search_r(Y, n);
  write('r = ', r);
END.