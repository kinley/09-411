const
  M = 150;
  n = 4;

type
  arr = array [0..M] of real;

function g(x: real): real;
begin
  g := 1 + x + x * x;
end;

procedure AddX(var x: real; t, fi: real);
begin
  x := 1 + (t - 1) * fi;
end;

procedure AddFi(var fi: arr);
var
  i, j: integer;
  h, st, a, b: real;
begin
  fi[0] := 1;
  for i := 1 to m do 
  begin
    h := (1 + fi[i - 1])/(1 + fi[i - 1] + sqr(fi[i - 1]));
    st := 1 / 2;
    a := 0;
    if h = 1 then fi[i] := 1 else begin
      for j := 1 to 10 do 
      begin
        h := h * 10;
        b := int(h);
        h := h - b;
        b := b * st;
        a := a + b;
        st := st / 2;
      end;
      fi[i] := a;
    end;
  end;
end;

function integral(fi: arr; t: real): real;
var
  i: integer;
  x, summa: real;
begin
  summa := 0;
  for i := 1 to M do 
  begin
    AddX(x, t, fi[i - 1]);
    summa := summa + g(x);
  end;
  summa := summa * (t - 1) / M;
  result := summa;
end;

var
  f: array [1..n] of real;
  fi: arr;
  i: integer;
  t: real;

begin
  AddFi(fi);
  t := 5.4;
  f[1] := integral(fi, t);
  t := 5.4;
  f[2] := integral(fi, t);
   t := 7.2;
  f[3] := integral(fi, t);
   t := 8.3;
  f[4] := integral(fi, t);
  for i := 1 to n do writeln(f[i]);
end.