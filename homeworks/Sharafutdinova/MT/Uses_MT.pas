uses
  list2, mt;

var
  l: list;
  mt: s;
  st: string;
  i, j: integer;
  abc: alphabet;

procedure st_in_list(var l: list; st: string);
var
  i, len: integer;
begin
  len := length(st);
  first(l, st[1]);
  for i := 2 to len do in_end(l, st[i])
end;

begin
  vvod_alph(abc);
  readln(st);
  st_in_list(l, st);
  print(l);
  //mt_1(mt, abc);
  //mt_2(mt, abc); 
  mt_3(mt, abc);
  //vvod_mt(mt, abc);
  j := f(l.head^.next^.data, abc);
  l.current := l.head^.next;
  i := 1;
  q(l, i, j, mt, abc);
  print(l);
end.
