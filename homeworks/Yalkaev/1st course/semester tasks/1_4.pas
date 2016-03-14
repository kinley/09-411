const
  n = 100;
  r = 10;

type
  arr = array[-2..n] of real;
  arrint = array [0..r - 1] of integer;
  boolArr = array[1..10] of boolean;

function T(a: real): real;
var
  b: boolarr;
  i, a1: integer;
begin
  a1 := round(a * 1000);
  a := 0;
  for i := 10 downto 1 do
    if (a1 mod 2 = 1) then begin
      b[i] := true;
      a1 := a1 div 2
    end
    else a1 := a1 div 2;
  for i := 1 to 10 do
    if b[i] = true
      then b[i] := false
    else b[i] := true;
  for i := 1 to 10 do
    if b[i] = true then a := a + exp(ln(2) * i);
  T := a / 1000;
end;

function F(x, y, z, a: real): real;
begin
  result := T((ln(1 + abs(x + y * y + z * z * a))) / (1 + abs(x + y * y + z * z * a)));
end;

procedure creat_E(r: integer; x: arr; var e: arrint);
var
  a1, a2: real;
  i, k: integer;
begin
  for k := 0 to r - 1 do
  begin
    a1 := k / r;
    a2 := (k + 1) / r;
    for i := 1 to n do
      if (x[i] >= a1) and (x[i] < a2) then e[k] := e[k] + 1;
  end;
end;

var
  x: arr;
  e: arrint;
  i, a: integer;
  D, M: real;

begin
  x[0] := 0.025;
  x[-1] := 0.211;
  x[-2] := 0.714;
  write('For a = 0');
  a := 0;
  for i := 1 to n do
    x[i] := F(x[i - 1], x[i - 2], x[i - 3], a);
  creat_E(R, x, e); 
  writeln;
  for i := 0 to r - 1 do write(E[i], ' ');
  writeln; 
  for i := 0 to r - 1 do
    M := M + ((2 * i + 1) * e[i]) / (2 * r * n);
  for i := 0 to r - 1 do
    D := D + sqr((2 * i + 1) / 2 * r - M) * e[i] / n;
  writeln('M=', M);
  writeln('D=', D);
  writeln;
  write('For a = 1');
  a := 1;
  for i := 1 to n do
    x[i] := F(x[i - 1], x[i - 2], x[i - 3], a);
  creat_E(R, x, e); 
  writeln;
  for i := 0 to r - 1 do write(E[i], ' ');
  writeln; 
  for i := 0 to r - 1 do
    M := M + ((2 * i + 1) * e[i]) / (2 * r * n);
  for i := 0 to r - 1 do
    D := D + sqr((2 * i + 1) / 2 * r - M) * e[i] / n;
  writeln('M=', M);
  writeln('D=', D);
end.