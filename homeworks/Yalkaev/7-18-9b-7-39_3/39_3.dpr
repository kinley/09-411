program integral39c;

{$APPTYPE CONSOLE}

const
  eps = 0.0001;
type
  t = Real;
var
  a, b, delta, expenseI2n, expenseIn : real;
  n : Integer;
  alfa, beta : t;

function integral(alfa : t; beta : t; n : integer; a : real; b : real) : real;
var
  s, x, step : real;
  i : integer;
begin
  s := 0;

  step := (b - a) / n;
  x := a + step / 2;
  for i := 1 to n do
  begin
    s := s + 1 / sqrt((1 - 2 * alfa * x + alfa * alfa) * (1 - 2 * beta + beta * beta));
    x := x + step;
  end;
  integral := s * step;
end;


begin
  assign(Input, 'input.txt');
  reset(Input);
  assign(Output, 'output.txt');
  rewrite(Output);


  readln(alfa, beta);

  a := -1;
  b := 1;
  n := 2;

  repeat
    n := n * 2;

    expenseI2n :=  integral(alfa, beta, 2 * n, a, b);
    expenseIn :=   integral(alfa, beta, n, a, b);
    delta := 1/3 * (expenseI2n - expenseIn);
    
  until delta < eps;

  writeln(expenseI2n);

end.
