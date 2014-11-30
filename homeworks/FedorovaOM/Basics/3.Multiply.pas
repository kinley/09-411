var m, n, k, i:integer;
begin
readln(n,k);
m:=0;
 for i:=1 to n do
  if ((n>0) and (k>0))
   then
    m:=m+k;
 for i:=1 to n do
  if ((n>0) and (k<0))
   then
    m:=m+k;
 for i:=-1 downto n do
  if ((n<0) and (k>0))
   then
    m:=m-k
    else
  if (n<0) and (k<0)
   then
    m:=m-k;
 writeln(m);
end.
    

