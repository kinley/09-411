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
  i, k, b, j: integer;
begin
  for i := 1 to n - 1 do
  begin
    k := i + 1;
    b := a[k];
    for j := i + 1 downto 2 do
    begin
      if (b < a[j - 1]) then begin
        a[j] := a[j - 1];
        k := j - 1;
      end;
    end;
    a[k] := b;
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
