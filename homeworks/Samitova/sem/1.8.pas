program pr;

const
  n = 5;

type
  bArray = Array[1..n, 1..n] of boolean;

function findA(A: boolean): boolean;
begin
  Read(A);
  result := A;
end;

function findCheck(Check: boolean): boolean;
var
  A: boolean;
begin
  A := findA(A);
  Result := A; 
end;

function find_check_i(): integer;
var
  b_true, b_false, i, j, check_i: integer;
  Check, A: bArray;
begin
  
  check_i := 0;
  for i := 1 to n do
  begin
    b_true := 0;
    b_false := 0;
    
    for j := 1 to n do
    begin
      Check[i, j] := findCheck(A[i, j]);
      if Check[i, j] then inc(b_true)
      else inc(b_false);
    end;
    if (b_true > b_false) then 
      inc(check_i);
  end;
  Result := check_i;
end;

function Check_all(): boolean;
begin
  if find_check_i() = n then Result := true
  else Result := false;
end;

procedure Degree(var E1, A: bArray);
var
  m, d, i, j: integer;
begin
  for m := 1 to 2 do
    for i := 1 to n do
    begin
      for j := 1 to n do  
        E1[i, j] := (A[i, 1]) and (A[1, i]);
      begin
        for d := 2 to n do
        begin
          E1[i, j] :=  (E1[i, d]) xor ((A[i, d]) and (A[d, i]));{Неэквивалентность иквивалента умножению по модулю 2}
        end;
      end;
    end;
  Writeln('Со степенью 3');
  for i := 1 to n do
  begin
    Writeln;
    for j := 1 to n do
    begin
      Write(E1[i, j], '  ');
    end;
  end;
  for i := 1 to n do
  begin
    for j := 1 to n do  
      E1[i, j] := (A[i, 1]) and (A[1, i]);
    begin
      for d := 2 to n do
      begin
        E1[i, j] :=  (E1[i, d]) xor ((A[i, d]) and (A[d, i]));
      end;
    end;
  end;
  Writeln();
  Writeln('Со степенью 4');
  for i := 1 to n do
  begin
    Writeln;
    for j := 1 to n do
    begin
      Write(E1[i, j], '  ');
    end;
  end;
end;

var
  A, E1, Check: bArray;
  i, j: integer;

begin
  for i := 1 to n do
    for j := 1 to n do
    begin
      A[i, j] := findA(A[i, j]);
    end;
  if Check_all() then Degree(E1, A);
end.
