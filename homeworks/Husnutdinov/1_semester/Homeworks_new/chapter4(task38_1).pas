program chapter4(task38_1);

var
  i, param: integer;
  Ef: real;

{Сounting factorial function}
function fact(n: integer): longint;
begin
  if (n = 1) or (n = 0) then fact := 1
  else fact := fact(n - 1) * n;         
end;

{Сounting formula function}
function formula1(x: integer): real;
var
  i: integer;
begin
  for i := 0 to x do
  begin
    if i = 0 then formula1 := 1 else formula1 := formula1(i - 1) + (power((x - i), i) * fact(x - i)) / fact(x);
  end;
end;

{Сounting emprirc formula function}
function formula2(x: integer): real;
begin
  formula2 := sqrt(Pi * x / 2) - (2 / 3) + (11 / 24) * sqrt(Pi / (2 * x)) + 4 / (135 * x) - (71 / 1152) * sqrt(Pi / (2 * x * x * x));
end;

begin
  for i := 1 to 50 do
  begin
    Ef := abs(formula1(i) - formula2(i));
    writeln(Ef:3:2);
    if Ef = 0 then param := param + 1;
    Ef := 0;
  end;
end.
