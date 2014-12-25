var
  a: array[1..50] of integer;
  n, i, j, l, b: integer;

begin
  write('n = ');
  readln(n);
  write('array: ');
  for i := 1 to n do
  begin
    a[i] := random(50);
    write(a[i], ' ');
  end;
  writeln;
  i := 1;
  b := 0;
  while i <= n do
  begin
  for j := n downto i + 1 do
   if a[j] = a[i] then
 begin
  for l := j to n - 1 do
      a[l] := a[l + 1];
      n := n - 1;
 end;
    b := b + 1;
    i := i + 1;
  end;
writeln('different digits= ', b)
end.
