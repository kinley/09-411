var
 a:array[1..100,1..100] of real;
 maxS,minS:array[1..100] of real;
 maxC,minC:array[1..100] of real;
 i,j,n,m:integer;
  
begin
readln(m,n);
for i:=1 to n do
  for j:=1 to m do
  begin
    readln(a[i,j]);
    if i = 1 then begin minS[j]:=a[i,j]; maxS[j]:=a[i,j]; end;
    if j = 1 then begin minC[i]:=a[i,j]; maxC[i]:=a[i,j]; end;
    if a[i,j]<minC[i] then minC[i]:=a[i,j];
    if a[i,j]>maxC[i] then maxC[i]:=a[i,j];
    if a[i,j]<minS[j] then minS[j]:=a[i,j];
    if a[i,j]>maxS[j] then maxS[j]:=a[i,j];
  end;
for i:=1 to n do 
 for j:=1 to n do
   if ((a[i,j]=minC[i]) and (a[i,j]=maxS[j]) or (a[i,j]=maxC[i]) and (a[i,j] = minS[j]))
   then writeln(a[i,j]);
end.
