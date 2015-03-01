type
  ArrType = array[1..200] of integer;

procedure InsertionSort(n: integer; var a: ArrType);
var
  i, j, key: integer;
begin
  for j := 2 to n do 
  begin
    
    key := A[j];
    
    i := j - 1;
    
    while (i > 0) and (A[i] > key) do 
    begin
      A[i + 1] := A[i];
      i := i - 1;
    end;
    A[i + 1] := key;
    
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
  
  InsertionSort(n, mas);
  
  write('Результат: ');
  for i := 1 to n do
    write(mas[i], ' ');
  
  Check := Checking(n, mas);
  
  write(Check);
  
end.
