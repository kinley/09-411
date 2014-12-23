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
  S1, x, K_fact, d: real;

begin
  Read(x);
  d := 0;
  n := 1;
  S1 := -1;
  for k := 1 to n do
  begin
    S1 := exp(Ln(S1) * k);
    x := exp(Ln(x) * (2 * k + 1));
    S1 := S1 * x;
    K_fact := fact(k);
    S1 := S1 / k_fact;
    S1 := S1 / (2 * k + 1);
    d := d + S1;
  end;  
  Write(d); 
end.
