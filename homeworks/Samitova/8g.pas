program pr;

var
  x: integer;
  y: real;

begin
  Read(x);
  y := x;
  y := y + sqr(x) / 3;
  y := y + 4 * (sqr(x)) / 5;
  y := y + 9 * (sqr(x)) / 7;
  y := y + 16 * (sqr(x)) / 9;
  Write(y);
end.
