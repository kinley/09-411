program pr;

var
  S1, f: real;
  k, a, b, c, d, n, x: integer;

begin
  Read(x);
  n := 10;
  a := -1;
  b := x * x * x;
  c := 1;
  d := 3;
  S1 := -x * x * x / 3;
  for k := 2 to n do
  begin
    if k mod 2 = 0 then
      a := 1
    else a := -1;
    b := b * x * x;
    c := c * k;
    d := d + 2;
    f := a * b / (c * d);
    S1 := S1 + f;
  end;
  Write(S1);
end.
