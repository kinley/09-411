var m,i:integer;
  begin
    readln(m);
    i:=1;
    if m>=10 then repeat
    m:=m div 10;
    i:=i+1;
    until m<10;
    writeln(i);
  end.
