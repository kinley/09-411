uses
  twolinklist;

const
  n = 10;

var
  l: list;
  b: boolean;

procedure fill(var l: list);
var
  i, m: integer;
begin
  m := random(50);
  create(l, m);
  for i := 1 to n do 
  begin
    m := random(50);
    in_end(l, m);
  end;
end;

function check_sort(l: list): boolean;
var
  b: boolean;
begin
  b := true;
  l.current := l.head^.next;
  while ((l.current^.next <> l.last) and (b <> false)) do 
  begin
    if l.current^.data <= l.current^.next^.data then next(l) else b := false;
  end;
  result := b;
end;

begin
  fill(l);
  print(l);
  b := check_sort(l);
  writeln(b);
end.
