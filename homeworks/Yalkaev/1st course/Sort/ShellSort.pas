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


procedure ShellSort( var A : mas );
const
      steps = 12;
var
      i, j, l, k, p, n : Integer;
      x : itp;
      s : array [1..steps] of Integer;
begin
      k := 1;
      for i := steps downto 1 do
        begin
          s[i] := k;
          k := k * 2 + 1;
        end;
      for k := 1 to steps do
        begin
          l := s[k];
          for p := 1 to l do
            begin
              i := max - l;
              n := 1;
              while n > 0 do
                begin
                  n := 0;
                  j := p;
                  while j <= i do
                    begin
                      if A[j] > A[j + l] then
                        begin
                          x := A[j];
                          A[j] := A[j + l];
                          A[j + l] := x;
                          n := 1;
                        end;
                      j := j + l;
                    end;
                  i := i - l;
                end;
            end;
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
  ShellSort(a);
  PrintArray(a);
  writeln(CheckArray(a))
end.