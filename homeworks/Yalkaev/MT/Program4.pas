uses
  list1, MT;

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
  inputALPH(abc);
  readln(st);
  st_in_list(l, st);
  print(l);
  subtraction(mt, abc);
  //inputMT(mt, abc);
  l.current := l.last^.pred;
  j := number_ch(l.current^.data);
  i := 1;
  q(l, i, j, mt, abc);
  print(l);
  print_mt(mt);
end.
