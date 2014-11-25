function prime(x1:integer):boolean;
var i:integer;
begin
prime:=true;
for i:=2 to x1-1 do if (x1 mod i)=0 then prime:=false; 
end;
 
var m,q,p:integer;
l:boolean;
begin
repeat
write('Vvedite naturalnoe chislo:');
read(m);
if (m<2) or (odd(m)=true)then writeln('Chislo doljno byt chetnim i bolshe 2');
until (m>2) and (odd(m)=false);
for p:=1 to m do begin
for q:=1 to m div 2 do begin
if (prime(p)=true) and (prime(q)=true) and (q+p=m) then writeln('Chislo ',m,' yavlyaetsya summoi prostih chisel ',p,' è ',q);
end;
end;
end.