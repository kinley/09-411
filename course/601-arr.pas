const
  N = 5;
type
  T = 1..N;
  ArrayType = Array[T] of Integer;
var
  i,j: Integer;
  arr: Array[1..N] of Integer;
  matrix: Array[1..N] of Array[T] of Integer;
  arrN: Array[1..N, 2..5, 0..9] of Integer;
  a: ArrayType;

function ReadArray: ArrayType;
var
  i: Integer;
  arr: ArrayType;
begin
  writeln('Enter array elements: ');
  for i := 1 to N do
  begin
    read(arr[i]);
  end;
  ReadArray := arr;
end;

procedure PrintArray(arr: ArrayType);
var
  i: Integer;
begin
  for i := 1 to length(arr) do
  begin
    write(arr[i], ' ')
  end;
  writeln;
end;

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

  a := ReadArray();
  PrintArray(a);
END.