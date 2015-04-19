Unit UList;

Interface

Const
  BolvankaValue = 0;

Type
  TData = Integer;
  PElement = ^TElement;
  TElement = Record
    data: TData;
    next: PElement;
  end;
  TList = Record
    head, tail, current: PElement;
    size: Integer;
  end;

function initElement(data: TData): PElement;
procedure initList(var list: TList);

procedure reset(var list: TList);
procedure next(var list: TList);
procedure moveTo(var list: TList; position: Integer);
procedure print(list: TList);

function isEmpty(list: TList): Boolean;
procedure append(var list: TList; data: TData);
procedure insertElement(var list: TList; position: Integer; el: PElement);
function get(var list: TList; position: Integer): TData;
procedure delete(var list: TList; position: Integer);

Implementation

function initElement(data: TData): PElement;
var
  el: PElement;
begin
  new(el);
  el^.data := data;
  el^.next := nil;
  Result := el;
end;

procedure initList(var list: TList);
begin
  list.head := initELement(BolvankaValue);
  list.tail := list.head;
  list.current := nil;
  list.size := 0;
end;

function isEmpty(list:TList): Boolean;
begin
  Result := list.size = 0;
end;

procedure append(var list: TList; data: TData);
begin
  list.tail^.next := initElement(data);
  list.tail := list.tail^.next;
  inc(list.size);
end;

procedure insertElement(var list: TList; position: Integer; el: PElement);
begin
  moveTo(list, position - 1);
  // el := initElement(data) // if we use data instead of el
  el^.next := list.current^.next;
  list.current^.next := el;
  inc(list.size);
end;

procedure print(list: TList);
begin
  reset(list);
  while list.current <> nil do begin
    write(list.current^.data,' ');
    next(list);
  end;
end;

procedure reset(var list: TList);
begin
  list.current := list.head^.next;
end;

procedure next(var list: TList);
begin
  list.current := list.current^.next;
end;

procedure moveTo(var list: TList; position: Integer);
var
  i: Integer;
begin
  reset(list);
  for i := 2 to position - 1 do
    next(list);
end;

function get(var list: TList; position: Integer): TData;
begin
  reset(list);
  moveTo(list, position);
  Result := list.current^.data;
end;

procedure delete(var list: TList; position: Integer);
var
  el: PElement;
begin
  reset(list);
  moveTo(list, position - 1);
  el := list.current^.next;
  list.current^.next := list.current^.next^.next; // el^.next
  dispose(el);
end;

end.
