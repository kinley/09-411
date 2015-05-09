Program Merge_Sort;
uses crt;
Const n = 1000;
type massive = array[1..n] of integer;
var i: integer;
    a: massive;
    f: text;

Procedure Merge(var a: massive; first, last: integer);
var middle, start, final, j: integer;
mas: massive;
begin
middle:=(first+last) div 2;
start:=first;
final:=middle+1;
for j:=first to last do
if (start<=middle) and ((final>last) or (a[start]<a[final])) then
                                                             begin
                                                             mas[j]:=a[start];
                                                             inc(start);
                                                             end
                                                             else
                                                             begin
                                                             mas[j]:=a[final];
                                                             inc(final);
                                                             end;
for j:=first to last do a[j]:=mas[j];
end;

Procedure MergeSort(var a: massive; first, last: integer);
begin
if first<last then
              begin
              MergeSort(a, first, (first+last) div 2);
              MergeSort(a, (first+last) div 2+1, last);
              Merge(a, first, last);
              end;
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
MergeSort(A, 1, n);
writeln('The sorted array: ');
for i:=1 to n do 
              write(a[i], ' ');
Readln;
end.