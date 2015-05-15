unit Tool;//instruments

interface

uses
  Data;

procedure MAKENULL(var guys: DICTIONARY);
procedure INSERT(subject: nametype; var guys: DICTIONARY);
procedure DELETE(subject: nametype; var guys: DICTIONARY);
function MEMBER(subject: nametype; guys: DICTIONARY): boolean;

implementation

procedure MAKENULL(var guys: DICTIONARY);
var
  p: pCell;
begin
  new(p);
  guys.Head := p;
  guys.Current := p;
end;

procedure INSERT(subject: nametype; var guys: DICTIONARY);
var
  i: integer;
  p: pCell;
begin
  guys.Current := guys.Head;
  for i := 1 to LenOfName do
  begin
    if (guys.Current^.next[subject[i]] = nil) then
    begin
      new(p);
    //p.Data := subject[i];
      p^.parent := guys.Current;
      guys.Current^.next[subject[i]] := p;
      guys.Current := p;
    end
    else 
      guys.Current := guys.Current^.next[subject[i]]
  end; 
end;

procedure DELETE(subject: nametype; var guys: DICTIONARY);
var
  i: integer;
begin
  i := 1;
 guys.Current := guys.Head;
  while (guys.Current^.next[subject[i]] <> nil) and (i <> LenOfName) do 
  begin
    guys.Current := guys.Current^.next[subject[i]];
    inc(i); 
  end;
  if (i = LenOfName) then dispose(guys.Current^.next[subject[i]]);
end;

function MEMBER(subject: nametype; guys: DICTIONARY): boolean;
var
  i: integer;
begin
  i := 1;
  Result := false;
  guys.Current := guys.Head;
  while (guys.Current^.next[subject[i]] <> nil) and (i <> LenOfName) do 
  begin
    guys.Current := guys.Current^.next[subject[i]];
    inc(i); 
  end;
  if (i = LenOfName) and (guys.Current^.next[subject[i]] <> nil) then Result := true;
end;
end.