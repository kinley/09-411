var
  a: longint;
  n,b, i: integer;

begin
  write('a,n=');
  read(a,n);
  if n=0 then a:=1;
  b:=a;
  for i:=2 to n do
  a:=a*b;
    writeln('a^n=', a);
end.
