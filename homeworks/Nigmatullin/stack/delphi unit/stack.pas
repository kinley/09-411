unit stack;

interface

const
    N = 100;

type
    index = 0..N;
    T = integer;

    myStack = record
        data : array[1..N] of T;
        current : index;
    end;
    
procedure push(var s : myStack; el : T);
function isEmpty(var s : myStack) : boolean;
function pop(var s : myStack) : T;
procedure empty(var s : myStack);



implementation

procedure push(var s : myStack; el : T);
begin
    if s.current < N then
    begin
        Inc(s.current);
        s.data[s.current] := el;
    end;
end;


function isEmpty(var s : myStack) : boolean;
begin
    isEmpty := not (s.current > 0);
end;

function pop(var s : myStack) : T;
begin
    if not isEmpty(s) then
    begin
        pop := s.data[s.current];
        Dec(s.current);
    end
    else
    begin
        pop := -1;
    end;
end;

procedure empty(var s : myStack);
begin
    s.current := 0;
end;

end.
