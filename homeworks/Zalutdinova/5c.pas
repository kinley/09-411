program p5c;
var
  m, k : integer;
begin
  readln(m);
  while m > 0 do
  begin
    m := m div 10;
    inc(k);
  end;
  writeln(k);
end.
