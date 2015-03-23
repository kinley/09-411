program p3;

const
  CN = 500;
  e = 2.718281828459;
  
type
  tArr = array[1..CN] of real;
  
var
  M: integer;// n = m
  t: real;
  x: tArr;
  
function funcT(u: real): real;
var
  i: integer;
  temp: real;
  nums: array[0..10] of 0..1;
begin
  temp := 0;
  nums[0] := trunc(u);
  for i := 2 to 10 do
  begin
    u := u * 2;
    nums[i] := trunc(u);
    u := frac(u);
  end;
  nums[1] := (nums[3] + trunc(u * 2)) mod 2;
  for i := 0 to 10 do
    temp := temp + nums[i] * power(2, (-1) * i);
  result := temp;
end;

function F(z: real): real;
begin
  result := funcT(power(e, (-1) * z));
end;

procedure myRandom;
var
  i, M: integer;
  t, x: real;
  fi: array[0..CN] of real;
begin
  write('t = ');
  readln(t);
  write('M = ');
  readln(M);
  fi[0] := 1;
  for i := 1 to M do
  begin
    fi[i] := F(fi[i - 1]);
    x := 1 + (t - 1) * fi[i];
    write(x, ' ');
  end;
  writeln;
end;

procedure fill_x(var x: tArr; M: integer);
var
  i: integer;
begin
  for i := 1 to M do
    read(x[i]);
end;

function g(x: real): real;
begin
  result := 2 * x - 0.8;
end;

function MonteCarlo(x: tArr; t: real; M: integer): real;
var
  i: integer;
  temp: real;
begin
  temp := 0;
  for i := 1 to M do
    temp := temp + g(x[i]);
  result := (t - 1) / M * temp;
end;

BEGIN

  write('t = ');
  readln(t);
  write('M = ');
  readln(M);
  myRandom;
  fill_x(x, M);
  MonteCarlo(x, t, M);
  
END.