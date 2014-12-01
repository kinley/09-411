var a,b,n,i,c:integer;
  begin
    readln(n);
    a:=0;
    b:=1;
    for i:=2 to n do 
      begin
        c:=a;
        a:=b;
        b:=b+c;
      end;
    writeln(b);
  end.
