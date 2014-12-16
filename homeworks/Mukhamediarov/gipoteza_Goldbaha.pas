var
  count, chet, k, i, t, g, a:word;

begin
  readln(chet);
  if chet = 2 then
    write('1+1');
  if chet mod 2 <> 0 then
    write('Error');
  else
    begin
      for i:=(chet-1) downto (chet div 2) do
        begin
          count:=0;
          for k:=1 to i do
            begin
              if i mod k = 0 then
                Inc(count);
            end;
          if count = 2 then
            begin
              a:=0;
              t:=chet-i;
              if t = 1 then
                writeln(i, '+', t);
              else
                begin
                  for g:=t downto 1 do
                    begin
                      if t mod g = 0 then
                        Inc(a);
                    end;
                  if a= 2 then
                    writeln(i, '+', t);
                end;
            end;
        end;
        end;
    readln;
    readln;
end.
