uses
  twolinklist;

const
  n = 10;

var
  l1, l2, l3: list;

procedure fill(var l: list);
var
  i, m: integer;
begin
  readln(m);
  create(l, m);
  for i := 1 to n do 
  begin
    readln(m);
    in_end(l, m);
  end;
end;

function difference(l1, l2: list): list;
var
  l3: list;
begin
  create(l3, 0);
  l1.current := l1.head^.next;
  l2.current := l2.head^.next;
  while ((l1.current^.next <> nil) and (l2.current^.next <> nil)) do 
  begin
    if l1.current^.data = l2.current^.data then begin
      next(l2);
      next(l1);
    end else
    if l1.current^.data < l2.current^.data then begin
      in_end(l3, l1.current^.data);
      next(l1)
    end else begin
      next(l2);
    end;
  end;
  if l1.current^.next <> nil then while l1.current^.next <> nil do 
    begin
      in_end(l3, l1.current^.data);
      next(l1);
    end;
  l3.current := l3.head^.next;
  del_cur(l3);
  result := l3;
end;

begin
  fill(l1);
  fill(l2);
  print(l1);
  print(l2);
  l3 := difference(l1, l2);
  print(l3);
end.
