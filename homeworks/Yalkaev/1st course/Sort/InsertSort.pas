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

procedure InsertSort(var A: mas );
var
  i, k: Integer;
  x: itp;
begin
  for i := 2 to max do
  begin
    k := i;
    x := A[i];
    while (k > 1) and (A[k - 1] > x) do
    begin
      A[k] := A[k - 1];
      k := k - 1;
    end;
    A[k] := x;
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
  InsertSort(a);
  PrintArray(a);
  writeln(CheckArray(a))
end.