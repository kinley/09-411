uses
  UList;

var
  list1, list2, list3: tList;
  i, l, m, param1, param2: integer;//Счетчик

{Ввод многочлена}
procedure inputExpression(var list: tList; var param: integer);
begin
  while not eof(input) do
  begin
    i := i + 1;
    readln(input, l, m);
    pushFront(list, i, l, m);
    param := i;
  end;
end;

{Вывод многочлена}
procedure outputExpression(param1, param2: integer; var list1, list2: tList);
var
  i: integer;
begin
  Assign(output, 'output.txt');
  rewrite(output);
  
  {Условные операторы нужны для того,чтобы не выводить члены с нулевыми коэффициентами}
  if (param1 <= param2) then
    for i := 1 to param2 do
    begin
      if (i <= param1) and (((getData2(list1, i) + getData2(list2, i)) <> 0) or ((getData3(list1, i) + getData3(list2, i)) <> 0)) then
        pushFront(list3, getData1(list1, i), getData2(list1, i) + getData2(list2, i), getData3(list1, i) + getData3(list2, i))
        else
      if (getData2(list2, i) <> 0) or (getData3(list2, i) <> 0) then
        pushFront(list3, getData1(list2, i), getData2(list2, i), getData3(list2, i));
    end
  
  else
  
  {Условные операторы нужны для того,чтобы не выводить члены с нулевыми коэффициентами}
    for i := 1 to param1 do
    begin
      if (i <= param2) and (((getData2(list1, i) + getData2(list2, i)) <> 0) or ((getData3(list1, i) + getData3(list2, i)) <> 0)) then
        pushFront(list3, getData1(list2, i), getData2(list1, i) + getData2(list2, i), getData3(list1, i) + getData3(list2, i))
      else
      if (getData2(list1, i) <> 0) or (getData3(list1, i) <> 0) then
        pushFront(list3, getData1(list1, i), getData2(list1, i), getData3(list1, i));
    end;
  
  print(list3);
end;

begin
  
  {1-ый многочлен}
  i := 0;
  
  Assign(input, 'input.txt');
  Reset(input);
  
  initList(list1);
  
  inputExpression(list1, param1);
  
  
  {2-ой многочлен}
  i := 0;
  
  Assign(input, 'input1.txt');
  Reset(input);
  
  initList(list2);
  
  inputExpression(list2, param2);
  
  {Результат}
  
  initList(list3);
  
  outputExpression(param1, param2, list1, list2);
  
end.
