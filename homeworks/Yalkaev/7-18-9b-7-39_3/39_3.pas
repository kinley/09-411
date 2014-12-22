// c=альфа, d=бета. По условию: альфа>0, бета<1.
// Возможно, я не совсем правильно понял условие, связанное с ε.
// С интегралами, зависящими от параметров, встретился в первый раз.

program integral_39_3;

const
  n = 1;
  a = -1;
  b = 1;
  e = 0.0001;

var
  ik, h, y, x, c, d: real;
  i, k: integer;

begin
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
  
  writeln('При n=4: I=', ik:0:5);
  ik := ik * e;
  writeln('С учетом погрешности ε: I=', ik:0:15);
end.
