const n=10;
var i,c:integer;
a:array [1..n] of integer;
  begin
    randomize;
    c:=0;
    for i:=1 to n do 
      begin
        a[i]:=random(100);
        c:=c+a[i];
      end;
    writeln(c);
  end.
