program mDivN;
{$APPTYPE CONSOLE}
var
  i, m, n : integer;
begin
  readln(m, n);

  if n = 0 then
  begin
    writeln('error');
    exit
  end;

  i := 0;

  if (m > 0) and (n > 0) then
  begin

    while (m >= n) do
    begin
      m := m - n;
      inc(i);
    end;

  end
  else if (m < 0) and (n < 0) then
  begin

    while (m <= n) do
    begin
      m := m - n;
      inc(i);
    end;

  end
  else if (m > 0) and (n < 0) then
  begin

    while (m >= n * (-1)) do
    begin
      m := m + n;
      dec(i);
    end;

  end
  else if (m < 0) and (n > 0) then
  begin

    while(m * (-1) >= n) do
    begin
      m := m + n;
      dec(i);
    end;

  end;

  writeln(i, '  ', m);
end.
