program Stack;

uses
  StackModule;

var
  p: integer;

begin
  writeln('Введите ', StackSize, ' элементов стека');
  
  for p := 1 to StackSize do
  begin
    read(x);
    push(x);
  end;
  
  writeln('Введите число удаляемых элементов');
  read(kol);
  
  for p := 1 to kol do
    pop;
  
  writeln('Проверка на пустоту');
  
  if isEmpty then write('Пуст') else
  begin
    writeln('Не пуст');
    OutputStack;
  end;
end.
