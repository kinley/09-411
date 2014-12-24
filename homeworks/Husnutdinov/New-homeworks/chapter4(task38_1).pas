program chapter4(task38_1);

var
  i, param: integer;
  Ef: real;

{Сounting factorial function}
function factorial(s: integer): integer;
var
  l, rez1: integer;
begin
  rez1 := 1;
  
  for l := 2 to s do
    rez1 := rez1 * l;
  
end;

{Сounting formula function}
function formula1(x: integer): real;
var
  rez: real;
  i, m: integer;
begin
  m := -1;
  for i := 0 to x do
  begin
    m := m + 1;
    rez := rez + (power((x - m), m) * factorial(x - m)) / factorial(x);
  end;
end;

{Сounting emprirc formula function}
function formula2(x1: integer): real;
var
  rez2: real;
begin
  
  rez2 := sqrt(Pi * x1 / 2) - (2 / 3) + (11 / 24) * sqrt(Pi / (2 * x1)) + 4 / (135 * x1) - (71 / 1152) * sqrt(Pi / (2 * x1 * x1 * x1));
  
end;



begin
  
  for i := 1 to 50 do
  begin
    Ef := abs(formula1(i) - formula2(i));
    if Ef = 0 then param := param + 1;
    Ef := 0;
  end;
  
  if param = 50 then write('Empiric fucntion is true');
end.
