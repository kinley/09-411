var
right,left,y,count,i:integer;
begin
  for i:=1 to 999999 do 
  begin
    y:=i; 
    right:=y mod 10;
    y:=y div 10;
    right:=right+y mod 10;
    y:=y div 10;
    right:=right+y mod 10;
    y:=y div 10;
    left:=y mod 10;
    y:=y div 10;
    left:=left+y mod 10;
    y:=y div 10;
    left:=left+y;
    if right=left then inc(count)
  end;
  writeln(count);
end.