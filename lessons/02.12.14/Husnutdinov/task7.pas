program zad1;
var a,b,c,d,e,min,max:integer;
begin

read(a,b,c,d,e);
min:=a;
if b<min then min:=b;
if c<min then min:=c;
if d<min then min:=d;

max:=a;

if b>max then max:=b;
if c>max then max:=c;
if d>max then max:=d;
if e>max then max:=e;

writeln(min);
write(max);
end.
