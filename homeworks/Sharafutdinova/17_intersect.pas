const n=6;
var i:integer;
a:array [1..n] of integer;
b:array [1..n] of integer;
  begin
    randomize;
    for i:=1 to n do 
      begin
        a[i]:=random(10);
        b[i]:=random(10);
        if a[i]=b[i] then writeln('i=',i);
      end;
  end.
