uses
  twolinklist;

var
  l: list;
  x, y: inf;

procedure fill(var l: list);
//заполнение списка
var
  i, m: integer;
begin
  m := random(10);
  create(l, m);
  for i := 2 to 10 do 
  begin
    m := random(10);
    in_end(l, m);
  end;
end;

procedure insert(var l: list; x, y: inf);
//вставка х перед у
begin
  l.current := l.head^.next;
  while l.current^.next <> nil do 
  begin
    if l.current^.data = y then insert_between(l, x);
    next(l);
  end;
end;

begin
  readln(x);
  readln(y);
  fill(l);
  print(l);
  insert(l, x, y);
  print(l);
end.
