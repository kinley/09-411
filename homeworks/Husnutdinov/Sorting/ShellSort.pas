type
  ArrType = array[1..200] of integer;

procedure ShellSort(n: integer; var a: ArrType);
begin
  var str, j, i, mit: integer;
  
  str := n div 2;{ Step length }
  
  while str > 0 do { Step reduction }
  begin
    for j := n - str downto 1 do
    begin
      i := j;
      while i <= n - str do 
      begin
        if a[i] > a[i + str] then	
        begin
          mit := a[i];
          a[i] := a[i + str];
          a[i + str] := mit;
        end; 
        i := i + str;
      end; 
    end;
    str := str div 2;	
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
  
  ShellSort(n, mas);
  
  write('Результат: ');
  for i := 1 to n do
    write(mas[i], ' ');
  
  Check := Checking(n, mas);
  
  write(Check);
end.
