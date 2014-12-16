const
  N = 10;
var
  i, S, T: Integer;

BEGIN
  i := 1;
  S := 0;
  T := 0;

  while i <= N do
  begin
    T := T + i;
    S := S + i * i * i;

    write('i:', i: 2, '; ');
    write('T(n)^2 =', T * T: 5, '; ');
    write('S(n) =', S: 5, '; ');
    writeln(T * T = S);

    i := i + 1;
  end;


END.