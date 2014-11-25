program p7;
var
    fact: longint;
    n, i: integer;
begin
    write('n='); 
    readln(n);
    fact:= 1;
    for i:=2 to n do
    fact:= fact * i;
    writeln('n!=', fact);
end.