var
  s, t, r: Set of 1..255;
  p: Boolean;

BEGIN
  s := [1..10];
  t := [5..15];

  writeln(1 in s);

  r := s + t;
  r := s * t;
  r := s - t;

  p := s = t;
  p := s <> t;
  p := s <= t;
  p := s >= t;
  p := 1 in s;
END.