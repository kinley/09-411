const
  n = 10;

type
  arr = array [1..n] of integer;

procedure random(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do a[i] := random(10);
end;

procedure sort(var a: arr);
var
  i, b, d: integer;
begin
  d := n div 2;
  while d > 0 do 
  begin
    i := 1;
    for i := 1 to n - d do 
    begin
      if a[i] > a[i + d] then begin
        b := a[i];
        a[i] := a[i + d];
        a[i + d] := b;
      end;
    end;
    d := d div 2;
  end;
end;

procedure print(a: arr);
var
  i: integer;
begin
  for i := 1 to n do write(a[i], ' ');
  writeln;
end;

var
  a: arr;

begin
  random(a);
  print(a);
  sort(a);
  print(a);
end.
