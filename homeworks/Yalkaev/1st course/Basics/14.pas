program p14;

var
  a: array[1..1000] of integer;
  n, i, s: integer;

begin
  write('Vvedite kolichestvo chisel massiva ');
  readln(n);
  for i := 1 to n do
  begin
    a[i] := random(10); // randomno zapolnyaem massiv
  end;
  write('Massive: ');
  for i := 1 to (n - 1) do
    write(a[i], ', ');
  writeln(' ');
  s := 0;
  for i := 1 to (n - 1) do
    s := s + a[i]; //schitaem summu elementov
  writeln('Summa elementov = ', s);
end.