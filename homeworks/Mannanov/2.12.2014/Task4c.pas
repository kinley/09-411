var
  n: integer;
  J: real;

function Hn(m: integer): real;
var
  i: integer;
  g: real;
begin
  g := 0;
  for i := 1 to m do
    g := g + 1 / i;
  Hn := g; 
end;

function PrCh(m: integer): real;

begin
  PrCh := ln(n) - 1 / (2 * n) + 1 / (12 * sqr(n)) - 1 / (120 * sqr(sqr(n))) + 1 / (256 * sqr(sqr(sqr(n))))
end;

begin
  readln(n);
  J := Hn(n) - PrCh(n);
  writeln(J);
end.
