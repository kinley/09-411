program p4;

const
  CN = 100;
  
type
  tArr = array[1..CN,1..CN] of real;
  
var
  n, i, j: integer;
  A, B: tArr;
  
function P(A: tArr; n: integer): boolean;
var
  i, j: integer;
  summ_left, summ_right: real;
begin
  summ_left := 0;
  summ_right := 0;
  result := false;
  for i := 1 to n do
    for j := 1 to n do
    begin
      if i > j then
        summ_left := summ_left + A[i, j]
      else
      if i < j then
        summ_right := summ_right + A[i, j];
    end;
  if summ_left = 2 * summ_right then
    result := true;
end;

procedure change_AtoB(A: tArr; var B: tArr; n: integer);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      B[j, i] := A[i, j];
end;

procedure printMatrix(Matrix: tArr; n: integer);
var
  i, j: integer;
begin
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(Matrix[i ,j], ' ');
    writeln;
  end;
end;

BEGIN
  
  readln(n);
  for i := 1 to n do
    for j := 1 to n do
      read(A[i, j]);
  writeln;
  
  if P(A, n) then
  begin
    change_AtoB(A, B, n);
    printMatrix(B, n);
  end
  else
    write('P(A) = False');
  
END.