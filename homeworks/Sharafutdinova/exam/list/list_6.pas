uses
  onelinklist, twolinklist;

var
  l1: list_1;
  l2: list;

procedure fill(var l: list_1);
//заполнение неупорядоченного односвязного списка
var
  i, m: integer;
begin
  create(l, 2);
  for i := 1 to 10 do 
  begin
    m := random(50) - 30;
    in_list(l, m);
  end;
end;

procedure fill_l2(var l2: list);
//заполнение упорядоченного двусвязного списка
var
  i, m: integer;
begin
  readln(m);
  create(l2, 0);
  for i := 1 to 10 do 
  begin
    readln(m);
    in_end(l2, i);
  end;
end;

procedure union(var l2: list; l1: list_1);
//объединение двух списков в упорядоченный
begin
  l1.current := l1.head^.next;
  l2.current := l2.head^.next;
  while (l1.current^.next <> nil) do 
  begin
    if l1.current^.data < l2.current^.data then 
      while ((l2.current^.pred <> nil) and (l1.current^.data < l2.current^.data)) do pred(l2); 
    if l1.current^.data > l2.current^.data then 
      while ((l2.current^.next <> nil) and (l1.current^.data > l2.current^.data)) do next(l2);
    insert_between(l2, l1.current^.data);
    next(l1);
  end;
end;

begin
  fill(l1);
  fill_l2(l2);
  print(l1);
  print(l2);
  union(l2, l1);
  print(l2);
end.
