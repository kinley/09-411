const m=10;
var  n,i:integer;
a: array [1..m] of integer;
  begin
   n:=0;
   randomize;
   for i:=1 to m do
    begin
      a[i]:=random(10);
      writeln(a[i]);
      if a[i]=0 then n:=n+1;
    end;
   writeln(n);
  end.
