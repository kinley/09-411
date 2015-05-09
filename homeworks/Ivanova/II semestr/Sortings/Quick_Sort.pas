Program Quick_Sort;
uses crt;
Const c = 1000;
type arr = array [1..c] of integer;
var x: arr;
    i,n: integer;
    f: text;
  
Procedure Sort(l,r: integer);
var i,j,x1,y1,m: integer;
begin
i:=l;
j:=r;
m:=Round((l+r)/2);
x1:=x[m];
repeat
while x[i]<x1 do 
              inc(i);
while x[j]>x1 do 
              dec(j);
if i<=j then 
        begin
        y1:=x[i];
        x[i]:=x[j];
        x[j]:=y1;
        inc(i);
        dec(j);
        end;
until i>j;
if l<j then sort(l,j);
if i<r then sort(i,r);
end;
 
begin
assign(f,'ints.txt');
reset(f);
i:=0;
while not eof(f) do
                 begin
                 inc(i);
                 read(f,x[i]);
                 end;
close(f);
Sort(1,c);
writeln('The sorted array: ');
for i:=1 to c do
write(x[i],' ');
readln;
end.