program umnosenie;

var
  m, n, k, i: integer;

begin
  write('Vvedite umnogaemie chisla');
  read(n, k);
  if (n = 0) or (k = 0) then write(0) else
  if ((n < 0) and (k > 0)) then
  begin
    n := -n;
    for i := 1 to n do
      m := m + k;
    write(-m);
  end else
  if ((n > 0) and (k < 0)) then
  begin
    n := -n;
    for i := 1 to n do
      m := m + k;
    write(-m);
  end else
  if ((n > 0) and (k > 0)) then
  begin
    for i := 1 to n do
      m := m + k;
    write(m);
  end else
  if ((n < 0) and (k < 0)) then
  begin
    k := -k;
    n := -n;
    for i := 1 to n do
      m := m + k;
    write(m);
  end;
end.
