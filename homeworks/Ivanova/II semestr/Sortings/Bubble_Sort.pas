Program Bubble_Sort;
uses crt;
const m = 1000;
var a: array[1..m] of integer;
    i, j, k: integer;
    f: text;
begin
assign(f,'ints.txt');
reset(f);
i:=0;
while not eof(f) do
                  begin
                  inc(i);
                  read(f,a[i]);
                  end;
close(f);
for i:=1 to m-1 do
for j:=1 to m-i do
if a[j]>a[j+1] then 
                begin
                k:=a[j];
                a[j]:=a[j+1];
                a[j+1]:=k;
                end;
writeln('The sorted array: ');
for i:=1 to m do
              write(a[i]:4, ' '); 
readln;
end.