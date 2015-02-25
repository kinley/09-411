program matrix;

const
  CN = 100;
  
type
  T = 0..1;
  tArr = array[1..CN,1..CN] of T;
  
var
  n: integer;
  arr: tArr;
  
procedure printMatrix(var arr: tArr; n: integer);
var
  i, j: integer;
begin
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(arr[i, j], ' ');
    writeln;
  end;
end;

procedure singleMatrix(var arr: tArr; n: integer);
var
  i, j: integer;
begin
  for i := 1 to n do 
    for j := 1 to n do
    begin
      if i = j then
        arr[i, j] := 1
      else
        arr[i, j] := 0
    end;
end;

BEGIN
  read(n);
  singleMatrix(arr, n);
  printMatrix(arr, n);
END.