var
  f: longint;
  n, i: integer;

begin
  write('n=');
  readln(n);
  f := 1;
  for i := 2 to n do
    fact := fact * i;
  writeln('n!=', f);
end.
