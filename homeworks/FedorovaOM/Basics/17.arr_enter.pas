var
  a, b: array[1..100] of integer;
  na, nb, i, j, k, p, t: integer;

begin
  randomize;
  write('sum of array A=');
  readln(na);
  writeln('enter ', na, ' elements of arary:');
  for i := 1 to na do
  begin
    write('a[', i, ']=');
    readln(a[i]);
  end;
  write('sum of array B=');
  readln(nb);
  writeln('enter ', nb, ' elements of arary:');
  for i := 1 to nb do
  begin
    write('b[', i, ']=');
    readln(b[i]);
  end;
  writeln('array A:');
  for i := 1 to na do
    write(a[i], ' ');
  writeln;
  writeln;
  writeln('array B:');
  for i := 1 to nb do
    write(b[i], ' ');
  writeln;
  writeln;
  i := 1;
  while i <= na do
  begin
    j := i;t := 0;
    while j <= nb do
      if a[i] = b[j] then
      begin
        t := 1;
        for k := i to na - 1 do
          a[k] := a[k + 1];
        na := na - 1;
        for p := j to nb - 1 do
          b[p] := b[p + 1];
        nb := nb - 1;
        break;
      end
      else j := j + 1;
    if t = 0 then i := i + 1;
  end;
  if (na = 0) and (nb <> 0) then write('array A in array B')
  else if(nb = 0) and (na <> 0) then write('array B in array A')
  else if(nb = 0) and (na = 0) then write('array B=array A')
  else writeln('arrays not enter in each other');
  readln
end.
