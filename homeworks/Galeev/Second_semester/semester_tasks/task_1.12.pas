program p5;

const
  CN = 50;

type
  tArr = array[0..CN] of boolean;
  
  myType = record
    num: integer;
    arr: tArr;
  end;
  
var
  u, n, i: integer;
  x, y, z: myType;

function myPower(a, b: integer): integer;
var
  i, temp: integer;
begin
  temp := 1;
  for i := 1 to b do
    temp := temp * a;
  result := temp;
end;

function toChar(a: integer): char;
begin
  result := chr(a + ord('0'));
end;

function scale_2to10(Arr: tArr; n: integer): integer;
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

function scale_10to16(u: integer): string;
var
  i: integer;
  temp: string;
  Arr: array[1..CN] of 0..16;
begin
  temp := '';
  i := 1;
  if u < 0 then
  begin
    temp := '-';
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
      10: temp := temp + 'A';
      11: temp := temp + 'B';
      12: temp := temp + 'C';
      13: temp := temp + 'D';
      14: temp := temp + 'E';
      15: temp := temp + 'F';
    else
      temp := temp + toChar(Arr[i]);
    end;
    dec(i);
  end;
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

BEGIN

  readln(n);
  writeln('Write 3 arrays {true/false}, (n + 1) elements');
  for i := 0 to n do
    read(x.arr[i]);
  readln;
  for i := 0 to n do
    read(y.arr[i]);
  readln;
  for i := 0 to n do
    read(z.arr[i]);
  readln;
  
  x.num := scale_2to10(x.arr, n);
  y.num := scale_2to10(y.arr, n);
  z.num := scale_2to10(z.arr, n);
  
  u := F(x.num, y.num, z.num, n);
  writeln('Result in 10th system:');
  writeln(u);
  
  writeln('Result in 16th system:');
  writeln(scale_10to16(u));
  
END.