uses
  twolinklist;

var
  l1, l2: list;

procedure fill(var l1: list);
var
  i, m: integer;
begin
  m := random(100) - 50;
  create(l1, m);
  for i := 1 to 10 do 
  begin
    m := random(100) - 50;
    in_end(l1, m);
  end;    
end;

procedure new_list(var l2: list; l1: list);
begin
  create(l2, 0);
  l1.current := l1.head^.next;
  while l1.current^.next <> nil do 
  begin
    if l1.current^.data > 0 then in_end(l2, l1.current^.data);
    next(l1);
  end;
  l2.current := l2.head^.next;
  del_cur(l2);
end;

begin
  fill(l1);
  new_list(l2, l1);
  print(l1);
  print(l2);
end.
