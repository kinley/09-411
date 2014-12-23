program pr;
function fact(x: real): real;
begin
  if x = 0 then 
    fact := 1
  else 
    fact := fact(x - 1) * x;
end;
Var k,n:integer;
k_fact,x,S3,d:real;
Begin
n:=2; 
d:=0;
 Read(x);
For k:=1 to n do
 begin

  S3:=exp(Ln(x)*2*k);
  k_fact:=fact(2*k-1);
  k_fact:=fact(k_fact);
  S3:=S3*k_fact;
  k_fact:=fact(2*k);
  k_fact:=fact(k_fact);
  d:=d+S3;
 end;
 Write(d);
End.
