const
  N = 10;
var
  i: Integer;
  m: Longint;

BEGIN
  m := 1;
  for i := 1 to N do
  begin
    m := m * i;
    writeln(i, '! = ', m);
  end;
END.