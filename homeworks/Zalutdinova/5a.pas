program p5a;
var
  m, n, k : integer;
begin
  readln(m, n);
  k := 1;
  while (m >= n) do
  begin
    n := n * n;
    inc(k);
  end;
  writeln(k);
end.