const
  n = 150;
  r = 12;

type
  arr = array[-2..n] of real;
  arrint = array [0..r - 1] of integer;

function vichislenieX(x, y, z, a: real): real;
var
  t, b, c, f: real;
  i: integer;
begin
  f := (sin(x - y) - cos(z - a)) / 2;
  f := f * 10;
  t := 1 / 2;
  c := 0;
  for i := 1 to 10 do 
  begin
    b := int(f);
    f := f - b;
    if i = 10 then b := b / 2 else begin
      t := t / 2;
      b := b * t;
      f := f * 10;
    end;
    c := c + b;
  end;
  vichislenieX := c;
end;

procedure polyinterval(r: integer; x: arr; var e: arrint);
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
  x[0] := 0.841;
  x[-1] := 0.126;
  x[-2] := 0.385;
  for a := 0 to 1 do 
  begin
    for i := 1 to n do 
    begin
      x[i] := vichislenieX(x[i - 1], x[i - 2], x[i - 3], a);
    end;
    polyinterval(R, x, e);
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
