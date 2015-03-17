{The initial values}
const
  n = 13;
  x_0 = -3.6;

type
  ta = array[1..n] of real;

{The function calculates the value of F (x) with the formal parameter x}
function F_x(x: real): real;
begin
  F_x := ((1.2 + abs(x)) / (1.8 + abs(x - 1))) * cos(x * x + x + 1);
end;

{Sorting an array according to the rule}
procedure Ordering(m: integer; var B, C: ta);
var
  key, key1: real;
  i, j: integer;
begin
  for i := 1 to m do
    C[i] := B[i];
  
  for j := 2 to m do 
  begin
    
    key := C[j];
    key1 := C[j] * C[j];
    
    i := j - 1;
    
    while (i > 0) and (C[i] * C[i] > key1) do 
    begin
      C[i + 1] := C[i];
      i := i - 1;
    end;
    C[i + 1] := key;
  end;
end;

var
  X, Y: ta;
  i, r, key: integer;
  z: real;

begin
  
  z := x_0;
  
  {Filling of the array X}
  for i := 1 to n do
  begin
    X[i] := F_x(z);
    z := F_x(z);
  end;
  
  {Sorting according to the rule}
  Ordering(n, X, Y);
  
  for i := 1 to n do
    write(X[i]:3:4, ' ');
  
  writeln;
  
  for i := 1 to n do
    write(Y[i]:3:4, ' ');
  
  writeln;
  
  r := 1;
  
  while Y[r] <= 0 do
  begin
    r := r + 1;
    if r > n then 
    begin
      write(n + 1); 
      key := 1; 
      break;
    end;
  end; 
  
  
  if key <> 1 then write('Номер первого слева положительного числа: ', r);
  
end.
