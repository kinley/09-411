var
  pp: Pointer;
  p: ^Char;
  q: ^Integer;
BEGIN
  New(p);
  p^ := 'a';
  pp := p;
  q := pp;
  write(q^);
END.