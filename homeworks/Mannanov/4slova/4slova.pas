Const c=20;
var 
slovar:text;
a,s,s1,slovo:string;
k,p,i,m:integer;
begin
    assign(slovar,'text1.txt');
    reset(slovar);
    readln(m);
    for i:=1 to c do begin 
      read(a);
      s1:=s1+a
      end;
    repeat 
      readln(slovar,slovo);
      if length(slovo)=m then 
      begin
        k:=1;s:=s1;i:=1;
        while (k>0) and (i<=m) do 
        begin 
         
            
            p:=pos(copy(slovo,i,1),s);
            if p>0 then s:=copy(s,1,p-1)+copy(s,p+1,length(s));
            
            K:=K*p;
            i:=i+1;
        end;
         if K>0 then writeln(slovo)
      end;
      slovo:='';
    until EOF(slovar)=true;
    end.
                           
                              