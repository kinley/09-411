const
  CN = 1000;

type
  T = Real;
  arrT = array[1..CN, 1..CN] of T;

var
  arr: arrT;
  i, j, n: integer;

procedure replaceElements(var arr: arrT; n: integer);
var
  i, j: integer;
begin
  for i := 1 to n do
  begin
    if Abs(arr[1, i]) <= 1 then
    begin
      for j := 1 to n do
      begin
        arr[i, j] := sin(arr[i, j]);
      end;
    end;
  end;
end;

function P(arr: arrT; n: integer): Boolean;
var
  i, j: integer;
  row, col: Boolean;
begin
  result := true;
  for i := 1 to n do
  begin
    row := False;
    col := false;
    for j := 1 to n do
    begin
      if Abs(arr[i, j]) <= 1 then
      begin
        col := True;
      end;
      if Abs(arr[j, i]) <= 1 then
      begin
        row := true;
      end;
    end;
    if(not row or not col) then
    begin
      Result := false;
    end;
  end;
end;

begin
  read(n);
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      read(arr[i, j]);
    end;
  end;
  Writeln(P(arr, n));
  replaceElements(arr, n);
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      write(arr[i, j], ' ');
    end;
    Writeln;
  end;
end.