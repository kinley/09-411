unit TNC;


interface

uses
  data, hush;

procedure MAKENULL(var A: DICTIONARY);
function MEMBER(x: nametype; var A: DICTIONARY): boolean;
procedure INSERT(x: nametype; var A: DICTIONARY);
procedure DELETE(x: nametype; var A: DICTIONARY);

implementation

procedure MAKENULL(var A: DICTIONARY);
var
  i: integer;
begin
  for i := 0 to B - 1 do
    A[i] := nil
end;

function MEMBER(x: nametype; var A: DICTIONARY): boolean;
var
  current: ^celltype;
begin
  current := A[h(x)];
  member := false;
  while (current <> nil) do
    if current^.element = x then begin
      member := true;
      exit;
    end
    else current := current^.next;
end;

procedure INSERT(x: nametype; var A: DICTIONARY);
var
  bucket: integer;
  oldheader: ^celltype;
begin
  if not MEMBER(x, A) then begin
    bucket := h(x);
    oldheader := A[bucket];
    new(A[bucket]);
    A[bucket]^.element := x;
    A[bucket]^.next := oldheader;
  end;
end;

procedure DELETE(x: nametype; var A: DICTIONARY);
var
  bucket: integer;
  current: ^celltype;
begin
  bucket := h(x);
  if A[bucket] <> nil then begin
    if A[bucket]^.element = x then
      A[bucket] := A[bucket]^.next
    else begin
      current := A[bucket];
      while (current^.next <> nil) do 
        if current^.next^.element = x then begin
          current^.next := current^.next^.next;
          exit;
        end
        else current := current^.next;
    end
  end
end;
end.