program prime;

var
  i, f, n: integer;

begin
  writeln('Vvedite chislo');
  readln(n);
  for i := 2 to trunc(sqrt(n)) do //trunc
    if n mod i = 0 then f := 1;
  if f = 0 then write('Prime')
  else 
    writeln('Not prime');
end.