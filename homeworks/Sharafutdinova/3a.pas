var
  x, y: real;

begin
  readln(x);
  y := x * x * x - 15.3 * x * x;
  y := y / (2.3 - x);
  y := y + 3.4 * x * x * x - x * x;
  writeln(y);
end.
