var n,c,d,a:integer;
 begin
  readln(n);
  a:=1;
  d:=0;
  while n>=2 do 
    begin
      c:=n mod 2;
      n:=n div 2;
      d:=d+c*a;
      a:=a*10;
    end;
  if n=1 then d:=d+n*a;
  writeln(d);
 end.
