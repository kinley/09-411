var i,x,c,p,q,j,m:integer;
  begin
  readln(x); 
  c:=0;
  if (x>2) and (x mod  2=0) then
  for i:=(x div 2) to x do 
    begin
      for j:=1 to i do
      if (i mod j=0) then c:=c+1;
      if c=2 then 
        begin
          p:=i;
          q:=x-p;
          for m:=1 to q do 
          if (q mod m=0) then c:=c+1;
          if (c=4)  or (x-p=1) then
            begin
              writeln(p);
              writeln(q);
            end;
        end;
      c:=0;
    end;
  end.
