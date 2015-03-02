type
  ArrType = array[1..200] of integer;

var
  i, n, first, last: integer;
  mas: ArrType;
  Check: boolean;

procedure QuickSort(var mas: arrType; first, last: integer);
var
  f, l, mid, count: integer;
begin
  f := first;
  l := last;
  mid := mas[(f + l) div 2]; { reference element }
  repeat
    while mas[f] < mid do inc(f);
    while mas[l] > mid do dec(l);
    if f <= l then 
    begin
      count := mas[f];
      mas[f] := mas[l];
      mas[l] := count;
      inc(f);
      dec(l);
    end;
  until f > l;
  if first < l then quickSort(mas, first, l);
  if f < last then QuickSort(mas, f, last);
end;


function Checking(n: integer; a: ArrType): Boolean;
var
  i: integer;
begin
  i := 1;
  while (i < n) and (a[i] <= a[i + 1]) do
    i := i + 1;
  Checking := i > n - 1
end;



begin
  write('Введите массив размерностью ');
  read(n);
  for i := 1 to n do read(mas[i]);
  
  first := 1; last := n;
  QuickSort(mas, first, last);
  
  write('Результат: ');
  for i := 1 to n do
    write(mas[i], ' ');
  
  Check := Checking(n, mas);
  
  write(Check);
  
end.
