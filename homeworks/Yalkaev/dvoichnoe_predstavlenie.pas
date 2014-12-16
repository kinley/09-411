program dvoichpred;

var
  x, a, b: integer;

begin
  read(x);
  a := x div 10;
  b := x mod 10;
  writeln('Dvoichnim predstavleniem chisla ', x, ' yavlyayutsya chisla ', a, ' i ', b)
end.