uses UList;
var
  list: TList;
  el: PElement;
begin
  initList(list);
  append(list, 10);
  append(list, 12);
  append(list, 14);
  print(list);
  write(list.size);
  readln;
end.
