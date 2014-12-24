var 
  m,sum,n:real;

begin
  readln(n);
  m:=1;
  sum:=0;
  
  while m <= n do begin
    sum:= sum + (power(-1, m - 1)) / power(m, 2);
    m:= m + 1;
  end;
  
  writeln(sum);
end.