var 
  n,k,y,i,j,sum,proz:real;

begin
  writeln('¬ведите n');
  readln(n);
  
  writeln('¬ведите k');
  readln(k);
  
  writeln('¬ведите y');
  readln(y);
  
  i:=2;
  proz:=1;
  
  while i<=n do begin
    j:=0;
    sum:=0;
    while j<=k do begin
      sum:= sum + ln(i + cos(j * y));
      j:=j + 1;
    end;
    proz:= proz * sum;
    i:= i + 1;
  end;
  
  writeln(proz);
  
end.
    
      
  