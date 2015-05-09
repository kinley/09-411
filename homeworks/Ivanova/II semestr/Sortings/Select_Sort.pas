Program Select_Sort;
uses crt;
const n = 1000;
var a: array[1..n] of integer;
    max, id_max, i, j: integer;
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
j:= n;
while j>1 do begin
             max:=a[1];
             id_max:=1;
for i := 2 to j do
                if a[i]>max then 
                              begin
                              max := a[i];
                              id_max := i
                              end;
             a[id_max] := a[j];
             a[j] := max;
             j := j - 1
             end;
writeln('The sorted array: ');             
for i:=1 to n do
              write(a[i], ' ');
readln;
end.