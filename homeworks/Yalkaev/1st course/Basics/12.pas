var
  a: array[1..1000] of integer;
  n, i, s: integer;

begin
  write('Vvedite kolvo chisel massiva ');
  readln(n);
  for i := 1 to n do
  begin
    a[i] := random(50);
  end;
  write('Massiv: ');
  for i := 1 to (n - 1) do
    write(a[i], ', ');
  writeln(' ');
  s := 0;
  for i := 1 to (n - 1) do
    if a[i] = 0 then s := s + 1;
  writeln('Kolvo nulei v massive = ', s)
end.