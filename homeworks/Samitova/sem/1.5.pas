procedure find_t(var t: tArr);
begin
  t[1] := 3;
  t[2] := 3.5;
end;

function Funct_for_i(z: real): real;
var
  h: real;
begin
  h := cos(z) * cos(z);
  result := h;
end;

procedure Binf(var f: real; var T:  Array10);
var
  u: integer;
begin
  while (f <> 0)  do {В двоичную}
    for u := 1 to 10 do
    begin;
      f := f * 2;
      T[u] := int(f);
      f := F - T[u];
    end;
end;

procedure Decf(var f: real);
var
  T:  Array10;
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


function find_fi(f: real): real;
var
  T: Array10;
begin
  Binf(f, T);
  Decf(f);
  result := f;
end;

procedure set_i(var  x: tArray);
var
  i, j: integer; fi: tArray; t: tArr;
begin
  find_t(t);
  fi[0] := 1;
  for j := 1 to 2 do
    for i := 1 to Mb do
    begin
      fi[i] := Funct_for_i(fi[i - 1]);
      fi[i] := find_fi(fi[i]);
      x[i] := 1 + (t[j] - 1) * fi[i];
    end;
  
end;

function  find_g(x: real): real;
begin
  find_g := x + sqrt(x);
end;

procedure g_dif(var x: tArray );
var
  i: integer; summ, g: real; t: tArr;
begin
  set_i(x);
  for i := 1 to Mb do
    summ := summ + find_g(x[i]);
  for i := 1 to m do
  begin
    g := ((t[1] - 1) / Mb) * summ;
  end; 
  Write(g);
end;

var
  x: tArray;

begin
  g_dif(x);
end.
