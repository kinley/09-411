uses
  UDouble, MT;

var
  list: tDoubleList;
  mt: s;
  st: string;
  i, j: integer;
  abc: alphabet;

procedure st_in_list(var list: tDoubleList; st: string);
var
  i, len: integer;
begin
  len := length(st);
  first(list, st[1]);
  for i := 2 to len do to_end(list, st[i])
end;

begin
  inputAlphabet(abc);
  readln(st);
  
  st_in_list(list, st);
  multiplication(MT, abc);
  list.current := list.tail^.prev;
  j := number_ch(list.current^.data);
  i := 1;
  q(list, i, j, mt, abc);
  
  print(list);
  print_mt(mt);
end.
