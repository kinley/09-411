var
  i, x, k: integer;
  s, t, m: real;

begin
  readln(x);
  i := 0;
  k := 1;
  s := 0;
  while t > 0.0001 do 
  begin
    i := i + 1;
    k := k * i;
    t := 1 / k;
    if t < 0.001 then break;
    m := t * sin(t * x) * sin(t * x);
    if i mod 2 > 0 then s := s - m else s := s + m;
  end;
  writeln(s);
end.
