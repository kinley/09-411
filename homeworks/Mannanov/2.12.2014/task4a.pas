var
  h: real;
  n: integer;

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

begin
  readln(n);
  h := Hn(n);
  writeln(h);
end.
