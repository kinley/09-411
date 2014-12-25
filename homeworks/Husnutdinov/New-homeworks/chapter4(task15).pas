program chapter4(task15);

var
  k, n, l, count1, param, count2, m: integer;

begin
  writeln('Enter the numbers in sequence');
  read(l, k, n);
  
  count1:=0;
  count2:=0;
  
  {Read the number and at the same time determine the status of the interval}
  for m := 1 to n do
  begin
    read(param);
    if (param > l) and (param <= k) then count1 := count1 + 1;
    if (param mod k = 1) or (param mod k = 2) or (param mod k = 3) and (param mod l = 0) then count2 := count2 + 1;
    param := 0;
  end;
  writeln('First condition ', count1);
  write('Second condition ', count2);
end.
