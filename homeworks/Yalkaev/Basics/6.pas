program p4;

var
  q, r, a, d: integer;//r=chastnoe; a=delimoe; d=delitel.

begin
  repeat
    write('Vvedite naturalnoe celoe neotricatelnoe chislo a=');
    readln(a);
  until a >= 0;
  repeat
    write('Celoe polojitelnoe chislo d=');
    readln(d);
  until d > 0;
  r := 0;
  while a >= d do
  begin
    a := a - d;
    r := r + 1;
  end;
  writeln('Chastnoe=', r);
  writeln('Ostatok=', a);
  readln
end.