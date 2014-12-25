var
  n, r: integer;
  s: string;
begin
  read(n);
  while (m > 0) do
  begin
    r := n mod 2;
    n := n div 2;
    s := IntToStr(r) + s;
  end;
  write(s);
end.
