program prime;

var
  i, x, n: integer;

begin
  writeln('enter digit=');
  readln(n);
  for i := 2 to trunc(sqrt(n)) do
    if n mod i = 0 then x:= 1;
  if f = 0 then write('Prime')
  else
    writeln('Not prime');
end.
