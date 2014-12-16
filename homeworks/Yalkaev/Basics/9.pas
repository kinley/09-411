var
  k, l, n: integer;

function nod(var a, b: integer): integer;
begin
  repeat
    if a > b then
      a := a mod b
    else
      b := b mod a;
  until (a = 0) or (b = 0);
  nod := a + b;
end;

begin
  writeln('Vvedite dva chisla: ');
  readln(k, l); 
  n := nod(k, l);
  writeln('NOD=', n);
end.