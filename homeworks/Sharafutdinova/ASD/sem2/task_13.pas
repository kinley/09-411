uses
  graph, onelinklist;

type
  arr_min = array[1..n] of integer;

var
  gr: arr;//массив списков смежности
  min: arr_min;

procedure print_gr(gr: arr);
var
  i: integer;
begin
  writeln('список смежности');
  i := 1; 
  while gr[i].head^.next^.data <> 0 do
  begin
    write(i, ': ');
    print(gr[i]);
    i := i + 1;
    writeln();
  end;
end;

procedure lower(gr: arr; var min: arr_min);
//поиск минимального узла в списке смежности
var
  i: integer;
begin
  i := 1; 
  while gr[i].head^.next^.data <> 0 do
  begin
    gr[i].current := gr[i].head^.next;
    min[i] := i;
    while gr[i].current^.next <> nil do 
    begin
      if min[i] > gr[i].current^.data then min[i] := gr[i].current^.data;
      next(gr[i]);
    end;
    i := i + 1;
  end;
  min[i + 1] := 0;//обозначение конца нулем
end;

procedure search(min: arr_min);
//поиск двусвязных компонент
var
  i, k: integer;
begin
  k := 0;
  i := 1;
  while min[i] <> 0 do
  begin
    if min[i] = min[i + 1] then begin
      k := k + 1;
      if k = 1 then write('двусвязные компоненты: ');
      if (k = 1) and (min[i] <> i) then write(min[i], ' ');
      write(i, ' ')
    end else
    if min[i] = min[i - 1] then begin
      k := 0;
      write(i, ' ');
      writeln()
    end;
    i := i + 1;
  end;
end;

begin
  input_gr1(gr);
  //input_gr2(gr);
  //input_gr3(gr);
  print_gr(gr);
  lower(gr, min);
  search(min);
end.
