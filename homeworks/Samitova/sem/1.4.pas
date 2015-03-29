const
  n = 150;
  r = 12;
  nn = 10;

type
  arr = array[-2..n] of real;
  arrint = array [0..r - 1] of integer;
  tArray = array [1.. nn] of real;

procedure Binf(var f: real; var T: tArray);
var
  u, i: integer;
begin
  while (f <> 0)  do {В двоичную}
    for u := 1 to 10 do
    begin;
      f := f * 2;
      T[u] := int(f);
      f := F - T[u];
    end;
end;

procedure Decf(var f: real; var T: tArray );
var
  u, i: integer; res: real;
begin
  for u := 5 downto 1 do {Так как числа в обратном порядке} 
    for i := 1 to 5 do
      res := res + T[u] * power(2, i);
  for u := 6 downto 10 do
    for i := 1 to 5 do
      res := res + T[u] * power(2, i);
  res := res / power(10, 4);
  res := res / power(10, 4);
  res := res / power(10, 2); 
  f := res;
end;

procedure DoTu(var f: real );
var
  T: tArray;
begin
  Binf(f, T);
  Decf(f, T);
end;

function find_x(x, y, z, a: real): real;
var
  f: real;

begin
  f := x + y + z + a;
  f := f / 4;
  DoTu(f);
  result := f;
end;

procedure find_inter(r: integer; x: arr; var e: arrint);
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
  for a := 0 to 1 do 
  begin
    for i := 1 to n do 
    begin
      x[i] := find_x(x[i - 1], x[i - 2], x[i - 3], a);
    end;
    find_inter(R, x, e);
    for i := 0 to r - 1 do 
    begin
      writeln(e[i]);
    end;
    for i := 0 to r - 1 do
      M := M + ((2 * i + 1) * e[i]) / (2 * r * n);
    for i := 0 to r - 1 do
      D := D + sqr((2 * i + 1) / 2 * r - M) * e[i] / n;
    writeln('M=', M, ' D=', D);
  end;
end.
