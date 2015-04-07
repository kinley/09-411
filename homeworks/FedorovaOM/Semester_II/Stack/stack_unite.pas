uses
  Stack;

begin
  writeln(s.current);
  push(s, 10);
  for i := 0 to 10 do
  begin
    push(s, i);
  end;
  writeln(isEmpty(s));
  writeln(pop(s));
  empty(s);
  writeln(isEmpty(s));
  readln;
end.
