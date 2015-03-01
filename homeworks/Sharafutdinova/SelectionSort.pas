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
  i, min, b, j: integer;
begin
  for i := 1 to n - 1 do 
  begin
    min := i;
    for j := i + 1 to n do
      if a[min] > a[j] then
        min := j;
    if min <> i then begin
      b := a[i];
      a[i] := a[min];
      a[min] := b;
    end;
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
