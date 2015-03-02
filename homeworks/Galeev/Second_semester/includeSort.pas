program include;

const
  CN = 1000000;
  
type
  index = 1..CN;
  tArr = array [index] of real;
  
var 
  i, n: integer;
  arr: tArr;

procedure includeArr(var arr: tArr; fromIndex: index; toIndex: index);
var
  i: integer;
  temp: real;
begin
  temp := arr[fromIndex];
  for i := fromIndex downto toIndex + 1 do
    arr[i] := arr[i - 1];
  arr[toIndex] := temp;
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

function includeSort(arr: tArr; n: integer): tArr;
var
  k, i: integer;
begin
  for i := 2 to n do
  begin
    k := i;
    repeat
    if arr[k] >= arr[i] then
      dec(k);
    until (k = 0) or (arr[k] < arr[i]);
    inc(k);
    includeArr(arr, i, k);
  end;
  result := arr;
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
  arr := includeSort(arr, n);
  for i := 1 to n do
    write(arr[i],' ');
  writeln;
  write(check(arr, n));
END.