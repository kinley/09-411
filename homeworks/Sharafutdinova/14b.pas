var
  x, b, a: integer;
  t, s1, s: real;

begin
  readln(x, b);
  a := b;
  t := 1 / a;
  s1 := t * ln(t * x);
  s := 0;
  while t > 0.0001 do 
  begin;
    a := a * b;
    t := 1 / a;
    if t < 0.0001 then break;
    s1 := t * ln(t * x);
    s := s + s1;
  end;
  writeln(s);
end.
