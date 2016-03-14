program p13;

var
  a, b: array[1..1000] of integer;
  n, i, s: integer;

begin
  write('Vvedite kolichestvo chisel massiva ');
  readln(n);
  for i := 1 to n do
  begin
    a[i] := random(10); //random massiva a
  end;
  write('Massiv a: ');
  for i := 1 to (n - 1) do
    write(a[i], ' ');
  writeln;
  b := a;
  write('Massive b: ');
  for i := 1 to (n - 1) do
    write(b[i], ' ');
end.