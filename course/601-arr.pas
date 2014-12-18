const
  N = 5;
var
  i,j: Integer;
  arr: Array[1..N] of Integer;
  matrix: Array[1..N] of Array[1..N] of Integer;
  arrN: Array[1..N, 2..5, 0..9] of Integer;

BEGIN
  for i := 1 to N do
    arr[i] := i;
  for i := 1 to N do
    write(arr[i],'; ');
  writeln;
  writeln('arr length: ', Length(arr));
  writeln;

  for i := 1 to N do
    for j := 1 to N do
      matrix[i][j] := i * j;

  for i := 1 to N do
  begin
    for j := 1 to N do
      write(matrix[i][j], ' ');
    writeln;
  end;

  writeln(Length(arrN));
END.