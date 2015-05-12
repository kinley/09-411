Unit UDLL;

Interface

Const
  BolvankaValue = '_';

Type
  tData = char;
  pElement = ^tElement;
  tElement = Record
    data: tData;
    next, prev: pElement;
  end;
  tDoubleList = Record
    head, tail, current: pElement;
    size: Integer;
  end;

function initElement(data: tData): pElement;
procedure initList(var list: tDoubleList);

procedure reset(var list: tDoubleList);
procedure next(var list: tDoubleList);
procedure prev(var list: tDoubleList);
procedure moveTo(var list: tDoubleList; position: Integer);
procedure print(list: tDoubleList);

function isEmpty(list: tDoubleList): Boolean;
procedure pushBack(var list: tDoubleList; data: tData);
procedure pushTop(var list: tDoubleList; data: tData);
procedure insertElement(var list: tDoubleList; position: Integer; data: tData);
function get(var list: tDoubleList; position: Integer): tData;
procedure delete(var list: tDoubleList; position: Integer);

Implementation

function initElement(data: tData): pElement;
var
  el: pElement;
begin
  new(el);
  el^.data := data;
  el^.next := nil;
  el^.prev := nil;
  Result := el;
end;

procedure initList(var list: tDoubleList);
begin
  list.head := initELement(BolvankaValue);
  list.tail := list.head;
  list.current := nil;
  list.size := 0;
end;

function isEmpty(list: tDoubleList): Boolean;
begin
  Result := list.size = 0;
end;

procedure pushBack(var list: tDoubleList; data: tData);
var
  el: pElement;
begin
  new(el);
  el^.data := data;
  el^.next := nil;
  el^.prev := list.tail;
  list.tail^.next := el;
  list.tail := list.tail^.next;
  inc(list.size);
end;

procedure pushTop(var list: tDoubleList; data: tData);
var
  el: pElement;
begin
  if list.size <> 0 then
  begin
    reset(list);
    new(el);
    el^.data := data;
    el^.next := list.current;
    el^.prev := list.head;
    list.head^.next := el;
    list.current^.prev := el;
    inc(list.size)
  end
  else
    pushBack(list, data);
end;

procedure insertElement(var list: tDoubleList; position: Integer; data: tData);
var
  el: pElement;
begin
  reset(list);
  moveTo(list, position - 1);
  new(el);
  el^.data := data;
  el^.next := list.current^.next;
  el^.prev := list.current;
  list.current^.next := el;
  list.current^.next^.prev := el;
  inc(list.size);
end;

procedure reset(var list: tDoubleList);
begin
  list.current := list.head^.next;
end;

procedure print(list: tDoubleList);
begin
  reset(list);
  while list.current <> nil do 
  begin
    write(list.current^.data,' ');
    next(list);
  end;
end;

procedure next(var list: tDoubleList);
begin
  list.current := list.current^.next;
end;

procedure prev(var list: tDoubleList);
begin
  list.current := list.current^.prev;
end;

procedure moveTo(var list: tDoubleList; position: Integer);
var
  i: Integer;
begin
  reset(list);
  if position > 1 then
    for i := 1 to position - 1 do
      next(list);
end;

function get(var list: tDoubleList; position: Integer): tData;
begin
  reset(list);
  moveTo(list, position);
  Result := list.current^.data;
end;

procedure delete(var list: tDoubleList; position: Integer);
var
  el: pElement;
begin
  moveTo(list, position);
  el := list.current;
    if position = list.size then
      list.current^.prev^.next := nil
    else
    if position = 1 then
      list.current^.next^.prev := nil
    else
    begin
      list.current^.prev^.next := el^.next;
      list.current^.next^.prev := el^.prev;
    end;
  dispose(el);
  dec(list.size);
end;

end.
