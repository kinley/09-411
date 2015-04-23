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
  //mt_1(mt, abc);//копирование последнего элемента
  //mt_2(mt, abc);//замена 1 на 0, 0 на 1
  mt_3(mt, abc);//копирование
  //vvod_mt(mt, abc);
  j := number_ch(l.head^.next^.data, abc);
  l.current := l.head^.next;
  i := 1;
  q(l, i, j, mt, abc);
  print(l);
  print_mt(mt);
end.
