unit StackModule;

interface 

const
  StackSize = 10;

type
  arrType = array [1..StackSize] of Integer;

var
  Stack: arrType; { Storage for the stack }
  StackTop: Integer; { Top of stack  }
  x, kol, i: integer;

function isEmpty: Boolean;
procedure Push(Value: Integer );
function Pop: Integer;
function OutputStack: arrType;

implementation 

{ Сhecking for emptiness }
function isEmpty: Boolean;
begin
  isEmpty := StackTop = 0;
end;

{ Pushing element in stack }
procedure Push(Value: Integer );
begin
  Inc(StackTop);
  Stack[StackTop] := Value;
end;

{ Deleting elements from the stack }
function Pop: Integer;
begin
  Pop := Stack[StackTop];
  Dec( StackTop );
end;

{ Outputting Stack }
function OutputStack: arrType;
var
  i: integer;
begin
  for i := 1 to StackTop do write(Stack[i], ' ');
end;

end.
