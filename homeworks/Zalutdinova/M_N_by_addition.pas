program M_N_by_addtition;
var
  m, n, k, i : integer;

begin
  readln(n, k);
  m := 0;
  if (n > 0) then
  begin

    for i := 1 to n do
    begin
      m := m + k;
    end;

  end
  else if (k > 0) then
  begin

    for i := 1 to k do
    begin
      m := m + n;
    end;

  end
  else if (k < 0) then
  begin

    for i := -1 downto k do
    begin
      m := m - n;
    end;

  end;

  writeln(m);
end.
