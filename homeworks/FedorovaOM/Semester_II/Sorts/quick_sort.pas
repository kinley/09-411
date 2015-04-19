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

{ Разбиения массива для быстрой сортировки }
function Partition( var A : mas; l, r : Integer; x : itp ) : Integer;
var
      i, j : Integer;
      t : itp;
begin
      i := l - 1;
      j := r + 1;
      repeat
 
        repeat
          j := j - 1;
        until x >= A[j];
 
        repeat
          i := i + 1;
        until A[i] >= x;
        
        if i < j then
          begin
            t := A[i];
            A[i] := A[j];
            A[j] := t;
          end;
      until i >= j;
      Partition := j;
end;

{ Рекурсивная процедура быстрой сортировки }    
procedure RecoursiveQuick(var A: mas; l, r: Integer );
var
  m: Integer;
begin
  if l < r then
  begin
    m := Partition(A, l, r, A[(l + r) div 2]);
    RecoursiveQuick(A, l, m);
    RecoursiveQuick(A, m + 1, r);
  end;
end;

procedure QuickSort(var A: mas );
begin
  RecoursiveQuick(A, 1, max);
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
  QuickSort(a);
  PrintArray(a);
  writeln(CheckArray(a))
end.