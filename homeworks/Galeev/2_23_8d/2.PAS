program zadacha2;
var t,m,n,cel,ost:integer;
begin
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');
rewrite(output);
readln(m);
read(n);
cel:=0;
ost:=0;
t:=0;
  if n<>0  then
    begin
      repeat
        t:=t+abs(n);
        cel:=cel+1;
      until abs(n)>abs(m)-t;
      ost:=abs(m)-t;
      if (m<0) xor (n<0) then
        begin
          cel:=cel*(-1);
          ost:=ost*(-1);
        end;
      if m=0 then
        write('0')
      else
        begin
          writeln(cel);
          write(ost);
        end;
    end
  else if m=0 then
    write('Neopredelennost')
  else
    write('Beskonechnost');
close(input);
close(output);
end.