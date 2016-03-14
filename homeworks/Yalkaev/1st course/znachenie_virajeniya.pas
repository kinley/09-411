program ex25;

var
  x, y, z, u: real;

begin
  readln(x);
  readln(y);
  readln(z);
  u := ((((2.3 - x) / y * z + 3.15) / x) - y) * z + x;
  writeln(u)
end.