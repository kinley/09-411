program thirty;

const
    E = 0.0001;
    
var
  a, b, X, Xo, pastX, currentX, ksi, p: real;
  i: integer;
  
function f(c: real): real;
begin
  result := sqr(sqr(c)) * c - c - 0.02;
end;

function f_pr1(c: real) : real;
begin
  result := 5 * sqr(sqr(c)) - 1;
end;

function f_pr2(c: real): real;
begin
  result := 20 * sqr(c) * c;
end;

BEGIN
  read(a, b);
  if (f(a) * f_pr2(a)) > 0 then
    Xo := a;
  if (f(b) * f_pr2(b)) > 0 then
    Xo := b;
  X := Xo - f(Xo)/f_pr1(Xo);
  pastX := Xo;
  currentX := X;
  i := 1;
  writeln('Xo = ', Xo);
  if ((abs(currentX - pastX) <= E) and (f(currentX) = 0)) then
  ksi := currentX
  else
  repeat
    p := pastX;
    pastX := currentX;
    currentX := p - f(p)/f_pr1(p);
    inc(i)
  until ((abs(currentX - pastX) > E) and (f(currentX) <> 0));
  ksi := currentX;
  writeln('Ksi = ', ksi:0:4);
  write('i = ', i);
END.
  