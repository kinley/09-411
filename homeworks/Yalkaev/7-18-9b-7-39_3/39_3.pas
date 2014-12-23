// c=альфа, d=бета. По условию: альфа>0, бета<1.

program integral_39_3;

const
  n = 4;
  a = -1;
  b = 1;
  e = 0.0001;

var
  ik, h, y, x, c, d, fK, S, P: real;
  i, k: integer;

begin
  fK := 0;
  ik := 1;
  k := 1;
  for k := 1 to N do
  begin
    S := 2 * ik;
  end;
  for k := k + 1 to N do
  begin
    P := 2 * ik;
  end;
  fK := abs(S - P);
  if fK > e then inc(k)
  else writeln(ik);
  
  write('Введите c (c>0): ');
  readln(c);
  
  write('Введите d (d<1): ');
  readln(d);
  
  x := a;
  h := (b - a) / n;
  for i := 1 to n do
  
  begin
    x := x + h;
    y := (1 - 2 * c * x + sqr(c));
    y := y * (1 - 2 * d + sqr(d));
    y := sqrt(y);
    y := 1 / y;
    ik := ik + y * h;
  end;
  
  writeln('При n=4: I=', ik:0:10);
end.
