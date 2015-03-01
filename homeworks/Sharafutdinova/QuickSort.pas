const
  n = 10;

type
  arr = array [1..n] of integer;

procedure sort(var a: arr; first, last: integer);
var
  f, l, b, d: integer;
begin
  f := first;
  l := last;
  b := a[(f + l) div 2];
  repeat
    while a[f] < b do f := f + 1;
    while a[l] > b do l := l - 1;
    if f <= l then begin
      d := a[l];
      a[l] := a[f];
      a[f] := d;
      f := f + 1;
      l := l - 1;
    end;
  until f > l;
  if first < l then sort(a, first, l);
  if f < last then sort(a, f, last);
end;

procedure random(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do a[i] := random(10);
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
  first, last, i: integer;

begin
  first := 1;
  last := n;
  random(a);
  print(a);
  sort(a, first, last);
  print(a);
end.
