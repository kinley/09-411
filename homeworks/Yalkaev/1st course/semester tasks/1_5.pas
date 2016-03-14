const
  M = 250;
  n = 2;

type
  arr = array [0..M] of real;

function g(x: real): real;
begin
  g := x * sqrt(x) - 0.5;
end;

function real2binary(a: real): real;
var
  st, b, z: real;
begin
  st := 1;
  if a < 0 then begin
    a := -a;
    z := -1;
  end;
  if a < 1 then
    while a > 0 do
    begin
      a := a * 2;
      b := int(a);
      a := a - b;
      st := st / 10;
      result := result + b * st;
    end else result := 1;
  if z = -1 then result := -result;
end;

procedure calculateX(var x: real; t, fi: real);
begin
  x := 1 + (t - 1) * fi;
end;

procedure phi(var fi: arr);
var
  i, j: integer;
  h, st, a, b: real;
begin
  fi[0] := 1;
  for i := 1 to m do
  begin
    h := (1 + fi[i - 1]) / (1 + fi[i - 1] + sqr(fi[i - 1]));
    h := real2binary(h);
    st := 1 / 2;
    a := 0;
    if h = 1 then fi[i] := 1 else begin
      for j := 1 to 10 do
      begin
        h := h * 10;
        b := int(h);
        h := h - b;
        if j = 10 then b := b / 2 else begin
          st := st / 2;
          b := b * st;
        end;
        a := a + b;
      end;
      fi[i] := a;
    end;
  end;
end;

function integrate(fi: arr; t: real): real;
var
  i: integer;
  x, sum: real;
begin
  sum := 0;
  for i := 1 to M do
  begin
    calculateX(x, t, fi[i - 1]);
    sum := sum + g(x);
  end;
  sum := sum * (t - 1) / M;
  result := sum;
end;

var
  f: array [1..n] of real;
  fi: arr;
  i: integer;
  t: real;

begin
  phi(fi);
  t := 3;
  f[1] := integrate(fi, t);
  t := 3.5;
  f[2] := integrate(fi, t);
  for i := 1 to n do writeln(f[i]);
end.