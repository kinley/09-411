var
  f1: text;
  st, st1: string;
  n, m, i, s, p: integer;
  a: array[1..20] of string;

begin
  assign(f1, 'text.txt');
  reset(f1);
  readln(m);
  s := 0;
  for i := 1 to m do
  begin
    writeln('vvedite bykvy');
    readln(a[i]);
  end;
  p := 0;s := 0;
  while not eof(f1) do
  begin
    readln(f1, st);
    n := length(st);
    if n = m then  begin
      st1 := st;
      for i := 1 to n do 
      begin
        p := pos(a[i], st);
        if p = 0 then break;
        s := s + 1;
        delete(st, p, 1); end;
      if s = m then writeln(st1);
    end;
    s := 0;p := 0;
  end;
  close(f1);
end.
