const n=10;
var i,j,c,k:integer;
a:array [1..n] of integer;
  begin
    c:=0;
    k:=0;
    for i:=1 to n do readln(a[i]);
    for i:=1 to n do 
      begin
        for j:=i+1 to n do
        if a[i]=a[j] then c:=c+1;
        if c=0 then k:=k+1;
        c:=0;
      end;
    writeln(k);
  end.
