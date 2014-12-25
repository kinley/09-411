function proverka(chislo:integer):boolean;
var j:integer;
flag:boolean;
begin
flag:=true;
for j:=2 to (chislo-1) do
if (chislo mod j)=0 then
flag:=false;
result:=flag;
end;
var N,i,N1,N2:integer;
fl:boolean;
begin
read(N);
fl:=false;
for i:=1 to (N div 2) do
if (proverka(i) and proverka(N-i)) then
begin
fl:=true;
N1:=i;
N2:=N-i;
end;
if fl then write(N1,'+',N2,'=',N)
else writeln('no');
readln;
end.
