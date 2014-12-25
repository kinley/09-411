var
  a, b: array[1..1000] of integer;
  n, i, s: integer;
begin
  write('enter sum of digit in array ');
  read(n);
  for i := 1 to n do
  begin
    a[i] := random(50);
  end;
  write('array a: ');
  for i := 1 to (n - 1) do
    write(a[i], ' ');
  writeln;
  b := a;
  write('array b: ');
  for i := 1 to (n - 1) do
    write(b[i], ' ');
end.
