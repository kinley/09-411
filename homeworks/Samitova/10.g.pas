
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
  d := 0;
  Read(x); 
  for k := 1 to 2 * n do
  
  begin 
    S4 := exp(Ln(x) * k);
    k_fact := fact(k);
    k_fact := Fact(k_fact);
    S4 := S4 / k_fact;
    d := d + k_fact;
  end;
  Write(d);
end.
