var
  a: array[1..100] of integer;
  n, i, s: integer;

begin
  write('enter sum of digit in array');
  readln(n);
  for i := 1 to n do
  begin
    a[i] := random(50);
  end;
  write('array: ');
  for i := 1 to (n - 1) do
    write(a[i], ', ');
  writeln(' ');
  s := 0;
  for i := 1 to (n - 1) do
    s := s + a[i];
  writeln('Sum of elements= ', s);
end.
