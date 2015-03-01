type
  ArrType = array[1..200] of integer;

procedure SelectionSort(n: integer; var a: ArrType);
var
  i, min, j, t: integer;
begin
  for i := 1 to n - 1 do 
  begin
  
    min := i;
    for j := i + 1 to n do
      if a[min] > a[j] then
        min := j;
    if min <> i then begin
      t := a[i];
      a[i] := a[min];
      a[min] := t;
    end;
    
  end;
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

var
  i, n: integer;
  mas: ArrType;
  Check: boolean;

begin
  write('Введите массив размерностью ');
  read(n);
  for i := 1 to n do read(mas[i]);
  
  SelectionSort(n, mas);
  
  write('Результат: ');
  for i := 1 to n do
    write(mas[i], ' ');
  
  Check := Checking(n, mas);
  
  write(Check);
end.
