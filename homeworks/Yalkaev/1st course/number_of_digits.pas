program number_of_digits;

var
  a, i: integer;

begin
  write('Vvedite chislo ');
  readln(a);
  i := 0;
  while a >= 1 do 
  begin
    a := a div 10;
    i := i + 1; //kolichestvo cifr v chisle
  end;
  writeln('V vashem chisle kolichesvto cifr = ', i)
end.