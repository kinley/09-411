type
matrix = array [1..5,1..5] of real;
var
A : matrix;
X : matrix;
i : integer;
j : integer;
p_res : boolean;

procedure E1(A : matrix; var X : matrix);
var
i: integer;
j: integer;
begin
  for i:=1 to 5 do
  begin
    if (A[i][i] > 1) then
    begin
      for j:=1 to 5 do
      begin
        X[i][j] := A[i][j]*3;
      end;
    end
    else
    begin
    for j:=1 to 5 do
      begin
        X[i][j] := A[i][j];
      end;
    end; 
  end;    
end;

procedure E2(A: matrix; var X : matrix);
var 
i : integer;
j : integer;
begin
  for i:=1 to 5 do
  begin
    for j:=1 to 5 do
    X[i][j] := A[i][j];
   end;
end;

function P(A : matrix) : boolean;
var
i : integer;
j : integer;
max : real;
current_max : real;
begin
  max := 0;
  current_max := 0;
  for i:=1 to 5 do
  begin
    max := max + A[i][1];
  end;
  
  for j:=2 to 5 do
  begin
    for i:=1 to 5 do
    begin
      current_max := current_max + A[i][j];
    end;
    if (current_max > max) then
    begin
      max := current_max;
      current_max := 0;
    end;
  end;
  P:= max > 2.5;  
end;

begin
  writeln('Введите матрицу размерности 5 на 5');
  for i:=1 to 5 do
  begin
    for j:=1 to 5 do
    begin
      read(A[i][j]);
    end;
  end;
  p_res := P(A);
  
  if (p_res = true) then
  begin
    E1(A,X);
  end  
  else
  begin
    E2(A, X);
  end;
  
  writeln('Вывод матрицы X');
  
  for i:=1 to 5 do
  begin
    for j:=1 to 5 do
    begin
      write(X[i][j], ' ');
    end;
    writeln();
   end;
end.
   
   