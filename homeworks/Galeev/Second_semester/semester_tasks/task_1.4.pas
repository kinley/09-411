program p2;

const
  CN = 500;
  PI = 3.1415926535897932;
  
type
  tBinary = 0..1;
  tArr = array[-2..CN] of real;
  tArrE = array[0..CN] of real;
  
var
  i, N, R: integer;
  x, y, z: real;
  a: tBinary;
  arr: tArr;
  E: tArrE;
  
function T(u: real): real;
var
  i: integer;
  temp: real;
  nums: array[0..10] of tBinary;
begin
  temp := 0;
  nums[0] := trunc(u);// trunc возвращает целую часть числа
  for i := 2 to 10 do
  begin
    u := u * 2;
    nums[i] := trunc(u);
    u := frac(u);// frac возвращает дробную часть числа
  end;
  nums[1] := (nums[3] + trunc(u * 2)) mod 2;
  for i := 0 to 10 do
    temp := temp + nums[i] * power(2, (-1) * i);
  result := temp;
end;

function F(x, y, z: real; a: tBinary): real;
begin
  result := T(abs(sin((a * x + y - x * z) / 180 * PI)));
end;

procedure sequence(var arr: tArr; x, y, z: real; a: tBinary; N: integer);
var
  i: integer;
begin
  arr[-2] := z;
  arr[-1] := y;
  arr[0] := x;
  for i := 1 to N do
    arr[i] := F(arr[i - 1], arr[i - 2], arr[i - 3], a);
end;

procedure create_E(var E: tArrE; arr: tArr; R, N: integer);
var
  i, k: integer;
begin
  k := 0;
  i := 1;
  while (k <= R - 1) and (i <= N) do
  begin
    if (arr[i] >= k / R) and (arr[i] < (k + 1) / R) then
    begin
      E[k] := arr[i];
      inc(i);
      inc(k);
    end
    else
      inc(i);
  end;
  if k <= R - 1 then
    for i := k to R - 1 do
      E[i] := 0;
end;

function M(E: tArrE; R, N: integer): real;
var
  k: integer;
  temp: real;
begin
  temp := 0;
  for k := 0 to R - 1 do
  begin
    temp := (2 * k + 1) * E[k];
    temp := temp / (2 * R * N);
    result := result + temp;
  end;
end;

function D(E: tArrE; R, N: integer): real;
var
  k: integer;
  temp: real;
begin
  temp := 0;
  for k := 0 to R - 1 do
  begin
    temp := sqr(((2 * k + 1) / (2 * R)) - M(E, R, N));
    temp := temp * (E[k] / N);
    result := result + temp;
  end;
end;

BEGIN

  readln(x, y, z);
  readln(R, N);
  writeln;
  
  writeln('For a = 0');
  a := 0;
  sequence(arr, x, y, z, a, N);
  create_E(E, arr, R, N);
  write('E[0, R - 1] = ');
  for i := 0 to R - 1 do
    write(E[i], ' ');
  writeln;
  writeln('M = ', M(E, R, N));
  write('D = ', D(E, R, N));
  
  writeln;
  writeln;
  
  writeln('For a = 1');
  a := 1;
  sequence(arr, x, y, z, a, N);
  create_E(E, arr, R, N);
  write('E[0, R - 1] = ');
  for i := 0 to R - 1 do
    write(E[i], ' ');
  writeln;
  writeln('M = ', M(E, R, N));
  write('D = ', D(E, R, N));
  
END.
  