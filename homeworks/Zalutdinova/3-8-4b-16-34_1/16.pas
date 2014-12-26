program p16;

var
  f, g: text;
  a, b, min, imin: real;
  i: integer;

begin
  assign(f, 'input.txt');
  reset(f);
  
  assign(g, 'summa.txt');
  rewrite(g);
  
  b := 0;
  
  while not eof(f) do
  begin
    read(f, a);
    b := b + a;
  end;
  
  close(f);
  write(g, b);
  close(g);
end.