var
  p,q: ^Integer;
  x: Integer;
BEGIN
  x := 10;
  // New(p);
  p := @x;
  New(q);
  q^ := 20;
  x := 15;
  writeln(p^);
  p := q;
  writeln(p^);
END.