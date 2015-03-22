program p5;

const
  CN = 50;

type
  tArr = array[0..CN] of boolean;
  
var
  x, y, z, u, n, i: integer;
  xArr, yArr, zArr: tArr;

function myPower(a, b: integer): integer;
var
  i, temp: integer;
begin
  temp := 1;
  for i := 1 to b do
    temp := temp * a;
  result := temp;
end;

function toNum(Arr: tArr; n: integer): integer;
var
  i: integer;
  temp: integer;
  a: 0..1;
begin
  temp := 0;
  for i := 1 to n do
  begin
    a := 0;
    if Arr[i] then
      a := 1;
    temp := temp + a * myPower(2, n - i);
  end;
  if not(Arr[0]) then
    temp := temp * (-1);
  result := temp;
end;

function F(x, y, z, n: integer): integer;
var
  temp: integer;
begin
  temp := myPower(2, n);
  result := ((x + y) mod temp - (x + z) mod temp) mod temp;
  result := (result + (y - z) mod temp) mod temp;
end;

procedure printResult(u: integer);
var
  i: integer;
  Arr: array[1..CN] of 0..16;
begin
  i := 1;
  if u < 0 then
  begin
    write('-');
    u := u * (-1);
  end;
  while u <> 0 do
  begin
    Arr[i] := u mod 16;
    inc(i);
    u := u div 16;
  end;
  dec(i);
  while i <> 0 do
  begin
    case Arr[i] of
      10: write('A');
      11: write('B');
      12: write('C');
      13: write('D');
      14: write('E');
      15: write('F')
    else
      write(Arr[i]);
    end;
    dec(i);
  end;
end;

BEGIN

  readln(n);
  writeln('Write 3 arrays {true/false}, (n + 1) elements');
  for i := 0 to n do
    read(xArr[i]);
  readln;
  for i := 0 to n do
    read(yArr[i]);
  readln;
  for i := 0 to n do
    read(zArr[i]);
  readln;
  
  x := toNum(xArr, n);
  y := toNum(yArr, n);
  z := toNum(zArr, n);
  
  u := F(x, y, z, n);
  writeln('Result in 10th system:');
  writeln(u);
  
  writeln('Result in 16th system:');
  printResult(u);
  
END.