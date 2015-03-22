const
  n = 18;

type
  bool = array[0..n] of boolean;

procedure massiv(var x: bool);
var
  i, a: integer;
begin
  for i := 1 to n do 
  begin
    a := random(0, 1);
    if a = 0 then x[i] := false 
    else x[i] := true;
  end;
end;

procedure chislo(x: bool; var a: integer);
//преобразовывает булевский массив в число
var
  i: integer;
  st: integer;
begin
  a := 0;
  st := 1;
  for i := n downto 1 do 
  begin
    if x[i] = true then 
      a := a + st;
    st := st * 2;
  end;
  if x[0] = false then a := -a;
end;

function sdvig(x: integer; i: integer): integer;
//циклический сдвиг на i позиций вправо
var
  j, st, m: integer;
  a: array[1..50]of integer;
begin
  j := 0;
  while x > 0 do 
  begin
    j := j + 1;
    a[j] := x mod 10;
    x := (x - a[j]) div 10;
  end;
  x := 0;
  st := 1;
  m := j;
  for j := i + 1 to m do 
  begin
    a[j] := a[j] * st;
    x := x + a[j];
    st := st * 10;
  end;
  for i := 1 to i do 
  begin
    a[i] := a[i] * st;
    x := x + a[i];
    st := st * 10;
  end;
  result := x;
end;

function vichitanie(x, y, n2: integer): integer;
//вычитание по модулю 2^n
begin
  result := (x - y) mod n2;
end;

function F(x, y, z: integer): integer;
var
  a, b, c, d, i, n2: integer;
begin
  n2 := 1;
  for i := 1 to n do
    n2 := n2 * 2;
  a := sdvig(x, 3);
  b := sdvig(z, 2);
  d := vichitanie(a, b, n2);
  a := sdvig(x, 4);
  b := sdvig(y, 5);
  c := vichitanie(a, b, n2);
  c := sdvig(c, 1);
  d := vichitanie(d, c, n2);
  a := vichitanie(y, z, n2);
  a := sdvig(a, 2);
  d := vichitanie(d, a, n2);
  result := d;
end;

procedure u_bool(var u_b: bool; u: integer);
//преобразовывает число u в булевский массив
var
  i, st: integer;
begin
  if u < 0 then begin
    u_b[0] := false;
    u := -u;
  end else u_b[0] := true;
  write(u_b[0], ' ');
  st := 1;
  for i := 1 to n do st := st * 2;
  for i := 1 to n do 
  begin
    if u - st >= 0 then begin
      u := u - st;
      u_b[i] := true
    end else u_b[i] := false;
    st := st div 2;
    write(u_b[i], ' ');
  end;
end;

var
  a, b, c, u_b: bool;
  x, y, z: integer;
  u, i: integer;

begin
  massiv(a);
  massiv(b);
  massiv(c);
  chislo(a, x);
  chislo(b, y);
  chislo(c, z);
  u := F(x, y, z);
  writeln(u);
  u_bool(u_b, u);
end.
