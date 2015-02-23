{задача: вывести три простых числа меньших 15, сумма которых простое число}
const
  n = 3;

type
  stack = record
    k: 0..n;
    data: array [0..n] of integer;
  end;

var
  s: stack;
  i, m, sum: integer;
  b, z: boolean;

procedure push(var s: stack; a: integer);
begin
  if s.k < n then begin
    s.k := s.k + 1;
    s.data[s.k] := a
  end else writeln('perepolnen');
end;

procedure pop(var s: stack);
begin
  if s.k > 0 then s.k := s.k - 1 else writeln('pystoi');
end;

function prostoe(t: integer): boolean;
var
  i, s: integer;
begin
  s := 0;
  for i := 2 to t - 1  do 
    if t mod i = 0 then s := s + 1;
  if s = 0 then prostoe := true else prostoe := false;
end;

begin
  s.k := 0;m := 2;
  sum := 0;
  z := false;
  repeat
    b := prostoe(m);
    if b = true then begin
      push(s, m);
      sum := sum + m;
    end;m := m + 1;
    if s.k = 3 then 
      if prostoe(sum) = false then begin
        sum := sum - s.data[s.k];
        m := s.data[s.k] + 1;
        pop(s);
      end else z := true;
    if (m > 15) then begin
      sum := sum - s.data[s.k];
      m := s.data[s.k] + 1;
      pop(s);
    end;
    
  until ((s.k = n) and (z = true));
  for i := 1 to n do write(s.data[i], ' ');
  writeln(sum);
end.
