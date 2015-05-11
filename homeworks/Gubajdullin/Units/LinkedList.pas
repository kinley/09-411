unit LinkedList;

interface

type
  Tcomponent = char;
  Pcomponent = ^Container;
  Container = record
    Data: Tcomponent;
    Next: Pcomponent;
    Previous: Pcomponent;
  end;
  List = record
    Head: Pcomponent;
    Tail: Pcomponent;
  end;

var
  spisok: List;
  p: Pcomponent;


function Create(var spisok: List): List;
function Isempty(var spisok: List): boolean;
procedure PushFront(var spisok: List; x: Tcomponent);
procedure PushBack(var spisok: List; x: Tcomponent);
function PopFront(var spisok: List; var Success: boolean): Tcomponent;
function PopBack(var spisok: List; var Success: boolean): Tcomponent;
implementation

function Create(var spisok: List): List;
begin
  new(p);
  p^.Next := nil;
  p^.Previous := nil;
  spisok.Head := p;
  spisok.Tail := p;
end;

function Isempty(var spisok: List): boolean;
begin
  if (spisok.Head = spisok.Tail) then
    Result := true
  else 
    Result := false;
end;

procedure PushFront(var spisok: List; x: Tcomponent);
begin
  new(p);
  p^.Data := x;
  p^.Previous := spisok.Head;
  p^.Previous^.Next := p;
  spisok.Head := p;
  spisok.Head^.Next := nil;
end;

procedure PushBack(var spisok: List; x: Tcomponent);
begin
  new(p);
  p^.Data := x;
  p^.Next := spisok.Tail;
  p^.Next^.Previous := p;
  spisok.Tail := p;
  spisok.Tail^.Previous := nil;
end;

function PopFront(var spisok: List; var Success: boolean): Tcomponent;
var
  swapper: pointer;
begin
  if (not Isempty(spisok)) then 
  begin
    Success := true;
    swapper := spisok.Head^.Previous;
    Result := spisok.Head^.Data;
    spisok.Head^.Previous^.Next := nil;
    dispose(spisok.Head);
    spisok.Head := swapper;
  end
  else Success := false;
end;

function PopBack(var spisok: List; var Success: boolean): Tcomponent;
var
  swapper: pointer;
begin
  if (not Isempty(spisok)) then 
  begin
    Success := true;
    swapper := spisok.Head^.Next;
    Result := spisok.Tail^.Data;
    spisok.Tail^.Next^.Previous:= nil;
    dispose(spisok.Tail);
    spisok.Tail := swapper;
  end
  else Success := false;
end;

end.