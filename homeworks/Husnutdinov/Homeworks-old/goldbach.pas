function isPrime(ch:integer):boolean;
var j:integer;
f:boolean;
begin
f:=true;
for j:=2 to (ch-1) do
if ((ch mod j)=0) then f:=false;
result:=f;
end;

var m,i,p,q:integer;
fl:boolean;
begin

read(m);

fl:=false;

for i:=1 to (m div 2) do
if (isPrime(i) and isPrime(m-i)) then 
begin
fl:=true;
p:=i;
q:=m-i;
end;

if fl then writeln(p,' ',q) else writeln ('False');
end.
