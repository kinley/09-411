program punktG;

var
  a, b, c, d, y: real;

begin
  readln(a, b, c);
  d := b + c;
  if d < 0 then d := d * (-1) else d := b + c;
  y := a / (1 + d);
  y := y + d;
  y := y + b / (a + d);
  writeln(y);
end.