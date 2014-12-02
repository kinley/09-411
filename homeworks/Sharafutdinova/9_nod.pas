var x,y,c,i:integer;
  begin
    readln(x);
    readln(y);
    c:=1;
    if x>y then for i:=1 to y do
      if (x mod i=0) and (y mod i=0) then c:=i
    else else for i:=1 to x do
      if (x mod i=0) and (y mod i=0) then c:=i;
    writeln(c);
  end.
