const n=5;
var i,j,c:integer;
a: array [1..n] of integer;
b: array [1..n] of integer;
  begin
    for i:=1 to n do 
      begin
        readln(a[i]);
        readln(b[i]);
      end;
    c:=0;
    for i:=1 to n do
    for j:=1 to n do
    if a[i]=b[j] then c:=c+1;
    writeln(c);
  end.
