program swp;

{$APPTYPE CONSOLE}
type
    T = integer;
var
    a, b : T;

procedure swap(var a : T; var b : T);
var
    temp : T;
begin
    temp := b;
    b := a;
    a := temp;
end;
begin
    read(a, b);
    writeln(a, ' ', b);
    swap(a, b);
    Writeln(a, ' ', b);
end.
