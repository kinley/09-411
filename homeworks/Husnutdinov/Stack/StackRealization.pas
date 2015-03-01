{ Stack size }
const StackSize = 10; 

var
  Stack : array [1..StackSize] of Integer; { Storage for the stack }
  StackTop : Integer; { Top of stack  }
  x,kol,i:integer;



{ Emptiness checking }
function isEmpty : Boolean;
begin
  isEmpty := StackTop = 0;
end;

{ Adding an element to the stack }
procedure Push( Value : Integer );
begin
  Inc(StackTop);
  Stack[StackTop] := Value;
end;

{ Removing an item from the stack }
function Pop : Integer;
begin
  Pop := Stack[StackTop];
  Dec( StackTop );
end;


begin
writeln('Введите ',StackSize,' элементов стека');

for i:=1 to StackSize do
begin
read(x);
push(x);
end;

writeln('Введите число удаляемых элементов');
read(kol);

for i:=1 to kol do
pop;

writeln('Проверка на пустоту');

if isEmpty then write('Пуст') else
begin
writeln('Не пуст');
for i:=1 to StackTop do write(Stack[i],' ');
end;

end.
