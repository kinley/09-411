unit UDouble;

interface

const
  BolvankaValue = '0';

type
  {Тип основных данных}
  tData = char;
  {Тип, описывающий указатель на элемент}
  pElement = ^tElement;
  {Тип, описывающий элементы списка}
  tElement = Record
    data: tData; 
    next, prev: pElement; {Указатель на следующий элемент}
  end;
  {Тип, описывающий список}
  tDoubleList = Record
    head, tail, current: pElement; {Указатели на первый,текущий и последний элементы списка}
    size: Integer;
  end;

{Процедуры и функции для работы со списком}

function initElement(data: tData): pElement;
procedure initList(var list: tDoubleList);

procedure reset(var list: tDoubleList);
procedure next(var list: tDoubleList);
procedure prev(var list: tDoubleList);
procedure moveTo(var list: tDoubleList; position: Integer);
procedure print(list: tDoubleList);

function isEmpty(list: tDoubleList): Boolean;
procedure pushBack(var list: tDoubleList; data: tData);
procedure pushFront(var list: tDoubleList; data: tData);
procedure insertElement(var list: tDoubleList; position: Integer; data: tData);
function getData(var list: tDoubleList; position: Integer): tData;
procedure delete(var list: tDoubleList; position: Integer);
procedure first(var list: tDoubleList; data: tData);
procedure to_end(var list: tDoubleList; data: tData);
procedure to_begin(var list: tDoubleList; data: tData);

implementation

function initElement(data: tData): pElement;
var
  el: pElement;
begin
  new(el);
  el^.data := data;
  el^.next := nil;
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

procedure pushFront(var list: tDoubleList; data: tData);
var
  el: pElement;
begin
  new(el);
  el^.data := data;
  el^.next := list.tail;
  el^.prev := list.tail^.prev;
  list.tail^.prev^.next := el;
  list.tail^.prev := el;
  inc(list.size);
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
  list.current^.next := el;
  inc(list.size);
end;

procedure reset(var list: tDoubleList);
begin
  list.current := list.head^.next;
end;

procedure print(list: tDoubleList);
begin
  reset(list);
  while list.current <> list.tail do 
  begin
    write(list.current^.data);
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

function getData(var list: tDoubleList; position: Integer): tData;
begin
  reset(list);
  moveTo(list, position);
  Result := list.current^.data;
end;

procedure delete(var list: tDoubleList; position: Integer);
var
  el: pElement;
begin
  reset(list);
  moveTo(list, position - 1);
  el := list.current^.next;
  list.current^.next := list.current^.next^.next; // el^.next
  dispose(el);
  dec(list.size);
end;

procedure first(var list: tDoubleList; data: tData);
begin
  new(list.current);
  new(list.tail);
  new(list.head);
  list.tail^.data := 'n';
  list.head^.data := 'n';
  list.current^.data := data;
  list.current^.next := list.tail;
  list.current^.prev := list.head;
  list.head^.next := list.current;
  list.tail^.prev := list.current;
  list.size := 1;
end;

procedure to_end(var list: tDoubleList; data: tData);
begin
  list.current := list.tail^.prev;
  new(list.current^.next);
  list.current^.next^.data := data;           
  list.current^.next^.prev := list.current;   
  list.current^.next^.next := list.tail; 
  list.tail^.prev := list.current^.next;
  list.size := list.size + 1;
end;

procedure to_begin(var list: tDoubleList; data: tData);
begin
  list.current := list.head^.next;
  new(list.current^.prev);
  list.current^.prev^.data := data;
  list.current^.prev^.next := list.current;
  list.current^.prev^.prev := list.head;
  list.head^.next := list.current^.prev;
  list.size := list.size + 1;
end;

end.
