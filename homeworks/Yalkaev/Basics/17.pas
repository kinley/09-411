program p17;
var a,b:array[1..100] of integer;
    na,nb,i,j,k,p,t:integer;
begin
randomize;
write('Razmer massiva A=');
readln(na);
writeln('Vvedite ',na,' elementov massiva:');
for i:=1 to na do
 begin
  write('a[',i,']=');
  readln(a[i]);
 end;
write('Razmer massiva B=');
readln(nb);
writeln('Vvedite ',nb,' elementov massiva:');
for i:=1 to nb do
 begin
  write('b[',i,']=');
  readln(b[i]);
 end;
writeln('Massiv A:');
for i:=1 to na do
write(a[i],' ');
writeln;
writeln;
writeln('Massive B:');
for i:=1 to nb do
write(b[i],' ');
writeln;
writeln;
i:=1;
while i<=na do
 begin
  j:=i;t:=0;
  while j<=nb do
  if a[i]=b[j] then // esli est' obschiy element
   begin
    t:=1;
    for k:=i to na-1 do // udalyaem ego iz pervogo massiva
    a[k]:=a[k+1];
    na:=na-1;
    for p:=j to nb-1 do // udalyaem iz vtorogo
    b[p]:=b[p+1];
    nb:=nb-1;
    break;
   end
  else j:=j+1; // ne para, dalshe po j
  if t=0 then i:=i+1; //net ni odnoi pari etomu elementu, dalshe
 end;
if (na=0)and(nb<>0) then write('Massiv A vhodit v massiv B')
else if(nb=0)and(na<>0) then write('Massiv B vhodit v massiv A')
else if(nb=0)and(na=0) then write('Massiv B=Massivu A')
else writeln('Massivi ne vhodyat v drug druga');
readln
end.