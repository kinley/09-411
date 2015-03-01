program zad1;

var
  m, n, k, i, prov: integer;

begin
  read(m, n);
  if (m = 0) then begin write(0, ' ', 0); prov := 1; end;
  if prov <> 1 then
    if (n = 0) then begin write('Error'); prov := 1; end;
  if prov <> 1 then
    if ((m > 0) and (n > 0) and (m > n)) then
    begin
      while m >= 0 do
      begin
        m := m - n;
        i := i + 1;
      end;
      write(i - 1, ' ', m + n);
      prov := 1;
    end;
  if prov <> 1 then
    if ((m < 0) and (n > 0) and (m > n)) then
    begin
      m := -m;
      while m >= 0 do
      begin
        m := m - n;
        i := i + 1;
      end;
      write(i - 1, ' ', -(m + n));
      prov := 1;
    end;
  if prov <> 1 then
    if ((m > 0) and (n < 0) and (m > n)) then
    begin
      m := -m;
      while m >= 0 do
      begin
        m := m - n;
        i := i + 1;
      end;
      write(i - 1, ' ', -(m + n));
      prov := 1;
    end;
  if prov <> 1 then
    if m < n then
    begin
      write(m, ' ', 0);
    end;
end.
