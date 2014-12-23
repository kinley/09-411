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
S3:=0;
 Read(x);
For k:=1 to n do
 begin

  d:=exp(Ln(x)*2*k);
  k_fact:=fact(2*k-1);
  k_fact:=fact(k_fact);
  d:=d*k_fact;
  k_fact:=fact(2*k);
  k_fact:=fact(k_fact);
  S3:=d+S3;
 end;
 Write(S3);
End.
