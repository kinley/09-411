program Diana;

uses
  crt;

var
  y: real;
  i, j, sum: integer;

begin
  y := 1;
  for i := 2 to 5 do
  begin
    j := 1;
    sum := 0;
    while j < i do
    begin
      sum := sum + j * 2;
      inc(j);
    end;
    if i = 5 then
      sum := sum + 25;
    y := y * sum;
  end;
  writeln(y:5:3);
  readln();
end.