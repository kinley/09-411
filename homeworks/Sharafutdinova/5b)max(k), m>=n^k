var m,k:integer;
    n,a:real;
  begin
    readln(m);
    readln(n);
    k:=0;
    a:=n;
    if m=n then k:=1;
    if m>n then
    while m>=n do 
      begin
        k:=k+1;
        n:=n*a;
      end;
    if a>m then 
    if m>1 then k:=0 
    else 
      begin 
        repeat n:=n/a;
               k:=k+1;
        until m>=n;
        k:=-k;
       end;
    writeln(k);
  end.
