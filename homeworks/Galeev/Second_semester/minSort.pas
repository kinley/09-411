program min;

const
  CN = 1000000;
  
type
  tArr = array[1..CN] of real;
  
var
  i, n: integer;
  arr: tArr;

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
  
procedure minSort(var arr: tArr; n: integer);
var
  i, j, k: integer;
  min: real;
begin
  min := arr[n];
  for i := 1 to n - 1 do
  begin
    for j := n downto i do
      if arr[j] < min then
      begin
        min := arr[j];
        k := j;
      end;
    if min = arr[n] then
      k := n;
  swap(arr[i], arr[k]);
  min := arr[n];
  end;
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
  printRandomArr(arr, n);
  writeln;
  minSort(arr, n);
  for i := 1 to n do
    write(arr[i], ' ');
  writeln;
  write(check(arr, n));
END.