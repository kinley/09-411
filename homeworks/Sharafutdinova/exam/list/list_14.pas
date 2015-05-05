uses
  twolinklist;

const
  n = 10;

var
  l: list;

procedure fill(var l: list);
var
  i, m: integer;
begin
  m := random(10);
  create(l, m);
  for i := 1 to n do 
  begin
    m := random(10);
    in_end(l, m);
  end;
end;

function reverse_order(l: list): list;
var
  l2: list;
begin
  l.current := l.last^.pred;
  create(l2, l.current^.data);
  pred(l);
  while l.current^.pred <> nil do 
  begin
    in_end(l2, l.current^.data);
    pred(l);
  end;
  result := l2;
end;

begin
  fill(l);
  print(l);
  l := reverse_order(l);
  print(l);
end.
