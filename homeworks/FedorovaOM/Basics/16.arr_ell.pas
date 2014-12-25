const k=10;
const l=10;
var
  x: array[1..k] of integer;
  y: array[1..l] of integer;
 k1,l1,n,i:integer;
begin
for i := 1 to k do begin
    x[i] := random(50);
    write (x[i],' ');
    end;
    writeln;
    for i := 1 to l do  begin
    y[i] := random(50);
    write (y[i],' ');
    end;
  k1 := 0;
  l1 := 0;
  n := 0;
  while (k1 <> k) and (l1 <> l) do
  begin
    if x[k1 + 1] < y[l1 + 1] then
    begin
      k1 := k1 + 1;
    end
  else if x[k1 + 1] > y[l1 + 1] then
  begin
      l1 := l1 + 1;
    end
 else
begin
k1 := k1 + 1;
l1 := l1 + 1;
n := n + 1;
end;
  end;
  writeln;
  writeln(n);
    end.

