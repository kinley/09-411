uses
  twolinklist;

var
  l: list;

procedure fill(var l: list);
//заполнение списка
var
  i, m: integer;
begin
  m := random(10);
  create(l, m);
  for i := 1 to 10 do 
  begin
    m := random(10);
    in_end(l, m);
  end;
end;

function sort(l: list): list;
var
  l2: list;
begin
  l.current := l.head^.next;
  create(l2, l.current^.data);
  next(l);
  while l.current^.next <> nil do 
  begin
    l2.current := l2.head^.next;
    if l.current^.data > l2.current^.data then begin
      while (l.current^.data > l2.current^.data) and (l2.current^.next <> nil) do next(l2);
      insert_between(l2, l.current^.data);
    end else in_begin(l2, l.current^.data);
    next(l);
  end;
  result := l2;
end;

begin
  fill(l);
  print(l);
  l := sort(l);
  print(l);
end.
