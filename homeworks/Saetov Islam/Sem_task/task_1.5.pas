const
  M = 250;
  n = 2;

type
  arr = array [0..M] of real;

function g(x: real): real;
begin
  g := x * x - 1;
end;

function dvoichnoe(a: real): real;
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

procedure calculationX(var x: real; t, fi: real);
begin
  x := 1 + (t - 1) * fi;
end;

procedure formationFi(var fi: arr);
var
  i, j: integer;
  h, st, a, b: real;
begin
  fi[0] := 1;
  for i := 1 to n do 
  begin
    h := (sin(fi[i - 1]) + sin(fi[i - 1]) * sin(fi[i - 1])) / 2;
    h := dvoichnoe(h);
    st := 1 / 2;
    a := 0;
    //преобразование числа по правилу “; задача 1.4(г)
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

function integral(fi: arr; t: real): real;
var
  i: integer;
  x, sum: real;
begin
  sum := 0;
  for i := 1 to M do 
  begin
    calculationX(x, t, fi[i - 1]);
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
  formationFi(fi);
  t := 3;
  f[1] := integral(fi, t);
  t := 3.5;
  f[2] := integral(fi, t);
  for i := 1 to n do writeln(f[i]);
end.