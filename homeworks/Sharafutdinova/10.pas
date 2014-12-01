var n,c,i:integer;
  begin
    readln(n);
    c:=0;
    for i:=1 to n do
    if n mod i=0 then c:=c+1;
    if c=2 then writeln('prostoe') else writeln('sostavnoe');
  end.
