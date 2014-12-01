var m,n,i,div1,mod1:integer;
begin
  readln(m);
  readln(n);
  div1:=0;
  mod1:=m;
  while m-n>=0 do 
    begin
      div1:=div1+1;
      m:=m-n;
    end;
  m:=mod1;
  if div1>0 then 
    for i:=1 to div1 do mod1:=mod1+n;
  mod1:=m-mod1;
  writeln(mod1);
  writeln(div1);
end.
