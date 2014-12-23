var
  count,p,i:integer;
  begin
    readln(p);
    count:=0;
    for i:=1 to p do 
    begin
      if p mod i=0 then inc(count)
    end;
    writeln(count=2);
  end.    