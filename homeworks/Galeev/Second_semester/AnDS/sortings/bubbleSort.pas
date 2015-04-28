program bubble;

const
  CN = 1000000;
  
type
  tArr = array[1..CN] of real;
  
var
  arr: tArr;
  i, n: integer;
  
procedure swap(var a: real; var b: real);
var
  temp: real;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure printRandomArr(var arr: tArr; n: integer);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    arr[i] := random(1000) - 500;
    write(arr[i], ' ');
  end;
  writeln;
end;

procedure bubbleSort(var arr: tArr; n: integer);
var
  i, j: integer;
begin
  for i := 1 to n - 1 do
    for j := 1 to n - i do
      if arr[j] > arr[j + 1] then
        swap(arr[j], arr[j + 1]);
end;

function check(arr: tArr; n: integer): boolean;
var
  i: integer;
begin
  for i := 1 to (n - 1) do
    if arr[i] <= arr[i + 1] then
      result := true
    else
      result := false;
end;

BEGIN
  readln(n);
  writeln;
  writeln('Enter: ');
  writeln;
  printRandomArr(arr, n);
  writeln;
  writeln('Exit: ');
  writeln;
  bubbleSort(arr, n);
  for i := 1 to n do
    write(arr[i], ' ');
  writeln;
  write(check(arr, n));
END.