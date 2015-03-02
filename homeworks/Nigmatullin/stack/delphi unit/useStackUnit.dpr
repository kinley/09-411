program useStackUnit;

{$APPTYPE CONSOLE}

uses
    stack;
var
    s : myStack;
    i : integer;
    ie : Boolean;
    a : T;
    
begin
    Writeln(s.current);
    push(s, 10);

    for i := 0 to 10 do
    begin
        push(s, i);
    end;

    writeln(isEmpty(s));

    Writeln(pop(s));

    empty(s);

    writeln(isEmpty(s));

    readln;
end.
