const
  max = 10;
  randmax: Longint = 50;

type
  itp = Longint;
  mas = array [0..max] of itp;
  Func = procedure(var A: mas );

var
  A: mas;
  i, j: Integer;

procedure FillRand(var A: mas );
var
  i: Integer;
  t: LongInt;
begin
  for i := 1 to max do
  begin
    t := Random(32768);
    t := t * 32768;
    t := t + Random(32768);
    A[i] := t mod randmax;
  end;
end;

procedure SelectSort(var A: mas );
var
  i, j, m: Integer;
  x: itp;
begin
  for i := 1 to max - 1 do
  begin
    m := i;
    for j := i + 1 to max do
      if A[j] < A[m] then
        m := j;
    x := A[i];
    A[i] := A[m];
    A[m] := x;
  end;
end;

function CheckArray(var A: mas ): Boolean;
var
  i: Integer;
begin
  CheckArray := TRUE;
  for i := 1 to max - 1 do
    if A[i] > A[i + 1] then
      CheckArray := FALSE;
end;

procedure PrintArray(var A: mas );
var
  i: Integer;
begin
  WriteLn;
  for i := 1 to max do
    Write(A[i]: 5);
  WriteLn;
end;


begin
  FillRand(a);
  SelectSort(a);
  PrintArray(a);
  writeln(CheckArray(a))
end.