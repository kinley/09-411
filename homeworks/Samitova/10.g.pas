
program pr;

function fact(x: real): real;
begin
  if x = 0 then 
    fact := 1
  else 
    fact := fact(x - 1) * x;
end;

var
  k, n: integer;
  S4, k_fact, d, x: real;

begin
  n := 1; {не могу использоать большие числа из-за факториала}
  S4 := 0;
  Read(x); 
  for k := 1 to 2 * n do
  
  begin 
    d := exp(Ln(x) * k);
    k_fact := fact(k);
    k_fact := Fact(k_fact);
    d := d / k_fact;
    S4 := S4 + k_fact;
  end;
  Write(S4);
end.
{или}
program pr;

function fact(x: real): real;
begin
  if x = 0 then 
    fact := 1
  else 
    fact := fact(x - 1) * x;
end;

var
  x,n,k: integer;
  k1, S4: real;

begin
  Read(x);
  n:=2;
  k := 1;
  S4 := x / k;
  for k := 2 to 2 * n do
  begin
    x := x * x;
    k1 := k * k;
    k1 := fact(k);
    S4 := S4 + x / k1;
  end;
  Write(S4);
end.
