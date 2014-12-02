const n=10;
var  i:integer;
a:array [1..n] of integer;
b:array [1..n] of integer;
  begin
    randomize;
    for i:=1 to n do 
      begin
        a[i]:=random(100);
        b[i]:=a[i];
        writeln(b[i]);
      end;
  end.
