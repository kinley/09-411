var
  x: longint;
  k: integer;

begin
  k := 0;
  write('vvedite chislo x= ');
  readln(x);
  
  while x > 0 do 
  begin
    x := x div 10;
    k := k + 1;
  end;
  
  writeln('kol-vo cifr v etom chisle= ', k);
end.
