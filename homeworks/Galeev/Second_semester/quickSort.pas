program quick;

const
  CN = 1000000;
  
type
  T = integer;
  tArr = array[1..CN] of T;
  
var
  arr: tArr;
  left, right, i, n: integer;
  
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
  
procedure quickSort(var arr: tArr; var left, right: integer);
var
  l, r, point: integer;
begin
  l := left;
  r := right;
  point := (l + r) div 2;
  while l <= r do
  begin
    while arr[l] < arr[point] do
      inc(l);
    while arr[r] > arr[point] do
      dec(r);
    if l <= r then
      swap(arr[l], arr[r]);
  end;
  if left < r then
    quickSort(arr, left, r);
  if l < right then
    quickSort(arr, l, right);
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
  readln(left, right);
  n := right;
  printRandomArr(arr, right);
  writeln;
  quickSort(arr, left, right);
  for i := 1 to n do
    write(arr[i], ' ');
  writeln;
  write(check(arr, right));
END.