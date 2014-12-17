const
  N = 10;
var
  a: array [1..N] of Char;
  i: Integer;

BEGIN
  for i := 1 to N do
  begin
    read(a[i]);
  end;

  write('Array: ');
  for i := 1 to N do
  begin
    write(a[i],', ');
  end;
END.