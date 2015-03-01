const
  n = 10;

type
  arr = array [1..n] of integer;

procedure random(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do a[i] := random(10);
end;

procedure sort(var a: arr);
var
  i, b, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n - 1 do
      if a[j] > a[j + 1] then begin
        b := a[j];
        a[j] := a[j + 1];
        a[j + 1] := b;
      end;
end;

procedure print(a: arr);
var
  i: integer;
begin
  for i := 1 to n do write(a[i], ' ');
  writeln;
end;

var
  a: arr;

begin
  random(a);
  print(a);
  sort(a);
  print(a);
end.
