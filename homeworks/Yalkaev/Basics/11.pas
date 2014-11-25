uses crt;
var m,r:integer;
    s:string;
begin
readln(m);
while (m>0) do
begin
 r:=m mod 2;
 m:=m div 2;
 s:=IntToStr(r)+s; // integer->string
end;
writeln(s);
end.