const
  n = 10;

type
  arr = array[1..n] of integer;

var
  a: arr;

procedure sort(var a: arr);
var
  i, j, b: integer;
begin
  for i := 1 to n do 
    for j := 1 to i do
      if a[i] < a[j] then begin
        b := a[i];
        a[i] := a[j];
        a[j] := b;
      end;
end;

procedure rand(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do
    a[i] := random(50);
end;

procedure print(a: arr);
var
  i: integer;
begin
  for i := 1 to n do write(a[i], ' ');
  writeln;
end;

begin
  rand(a);
  print(a);
  sort(a);
  print(a);
end.
