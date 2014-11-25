var
   a:array[1..50] of integer;
   n,i,j,l,b:integer;
begin
write('n = ');
readln(n);
randomize;
write('Massiv: ');
for i:=1 to n do
 begin
   a[i]:=random(10);
   write(a[i],' ');
 end;
writeln;
i:=1;
b:=0;
while i<=n do // poka ne konec massiva
  begin
    for j:=n downto i+1 do // proveryaem s konca do etogo indexa+1
    if a[j]=a[i] then // esli chislo takoe je
       begin
         for l:=j to n-1 do // sdvigaem k nemu konec massiva
         a[l]:=a[l+1];
         n:=n-1;  
       end;
    b:=b+1; // inc
    i:=i+1;
  end;
writeln('Raznih chisel= ',b)
end.