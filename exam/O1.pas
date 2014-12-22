const
  b = 10;

var
  arr: array[1..b] of integer;
  i, a, k, max: integer;

begin
  randomize;
  
  write('Massiv before sorting: ');
  for a := 1 to b do 
  begin
    arr[a] := random(10);
    write(arr[a], ' ');
  end;
  writeln;
  
  for k := 1 to b - 1 do
    for i := 1 to b - k do
      if arr[i] > arr[i + 1] then begin
        max := arr[i];
        arr[i] := arr[i + 1];
        arr[i + 1] := max
      end;
  
  write('Massiv after sorting: ');
  for a := 1 to b do
    write(arr[a], ' ');
  writeln;
end.
