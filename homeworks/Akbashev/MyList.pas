unit MyList;

interface

const
  BolvankaValue = 0;

type
  tData = integer;
 
  pElement = ^tElement;
 
  tElement = Record
    data1: tData; 
    data2: tData; 
    data3: tData; 
    next: pElement; 
  end;
 
  tList = Record
    head, tail, current: pElement;
    size: Integer;
  end;




procedure initList(var list: tList);

procedure reset(var list: tList);
procedure next(var list: tList);
procedure moveTo(var list: tList; position: Integer);
procedure print(list: tList);

function isEmpty(list: tList): Boolean;
procedure pushFront(var list: tList; data1, data2, data3: tData);
procedure insertElement(var list: tList; position: Integer; data1, data2, data3: tData);
function getData1(var list: tList; position: Integer): tData;
function getData2(var list: tList; position: Integer): tData;
function getData3(var list: tList; position: Integer): tData;
procedure delete(var list: tList; position: Integer);

implementation

function initElement(data1, data2, data3: tData): pElement;
var
  el: pElement;
begin
  new(el);
  el^.data1 := data1;
  el^.data2 := data2;
  el^.data3 := data3;
  el^.next := nil;  Result := el;
end;

procedure initList(var list: tList);
begin 
 list.head := initELement(BolvankaValue,BolvankaValue,BolvankaValue); 
 list.tail := list.head;
  list.current := nil;
  list.size := 0;
end;

function isEmpty(list: tList): Boolean;
begin
  Result := list.size = 0;
end;

procedure pushFront(var list: TList; data1,data2,data3: TData);
begin
  list.tail^.next := initElement(data1,data2,data3);
  list.tail := list.tail^.next;
  inc(list.size);
end;

procedure insertElement(var list: tList; position: Integer; data1,data2,data3: tData);
var
  el: pElement;
begin
  reset(list);
  moveTo(list, position - 1);
  new(el);
  el^.data1 := data1;
  el^.data2 := data2;
  el^.data3 := data3;
  el^.next := list.current^.next;
  list.current^.next := el;
  inc(list.size);
end;

procedure reset(var list: tList);
begin
  list.current := list.head^.next;
end;

procedure print(list: tList);
begin
  reset(list);
  while list.current <> nil do 
  begin
    write(list.current^.data1,' ');
    write(list.current^.data2,' ');
    write(list.current^.data3);
    writeln;
    next(list);
  end;
end;

procedure next(var list: tList);
begin
  list.current := list.current^.next;
end;

procedure moveTo(var list: tList; position: Integer);
var
  i: Integer;
begin
  reset(list);
  if position > 1 then
    for i := 1 to position - 1 do
      next(list);
end;

function getData1(var list: tList; position: Integer): tData;
begin
  reset(list);
  moveTo(list, position);
  Result := list.current^.data1;
end;

function getData2(var list: tList; position: Integer): tData;
begin
  reset(list);
  moveTo(list, position);
  Result := list.current^.data2;
end;

function getData3(var list: tList; position: Integer): tData;
begin
  reset(list);
  moveTo(list, position);
  Result := list.current^.data3;
end;

procedure delete(var list: tList; position: Integer);
var
  el: pElement;
begin
  reset(list);
  moveTo(list, position - 1);
  el := list.current^.next;
  list.current^.next := list.current^.next^.next;
  dispose(el);
  dec(list.size);
end;

end.