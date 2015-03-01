type
  ArrType = array[1..200] of integer;

procedure BubbleSort(n: integer; var a: ArrType);
var
  i, j, key: integer;
begin
  for i := 1 to n - 1 do
    for j := 1 to n - i do
      if a[j] > a[j + 1] then begin
        key := a[j];
        a[j] := a[j + 1];
        a[j + 1] := key;
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
  
  BubbleSort(n, mas);
  
  write('Результат: ');
  for i := 1 to n do
    write(mas[i], ' ');
  
  Check := Checking(n, mas);
  
  write(Check);
  
  
end.
