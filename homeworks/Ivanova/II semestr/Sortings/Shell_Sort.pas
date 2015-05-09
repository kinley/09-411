Program Shell_Sort;
uses crt;
Const n = 1000;
type mas = array[1..n] of integer;
var i,j,d,count: integer;
    a: mas;
    f: text;
    
Procedure Shell(a: mas);
var i: integer;
begin
d:=n;
d:=d div 2;
while (d>0) do
            begin
for i:=1 to n-d do
                begin
                j:=i;
while ((j>0) and (a[j]>a[j+d])) do
                                begin
                                count:=a[j];
                                a[j]:=a[j+d];
                                a[j+d]:=count;
                                j:=j-1;
                                end;
                end;
            d:=d div 2;
            end;
for i:=1 to n do 
              write(a[i], ' ');
end;

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
writeln('The sorted array: ');
Shell(a);
Readln;
end.