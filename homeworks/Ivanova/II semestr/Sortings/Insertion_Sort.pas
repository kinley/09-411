Program Insertion_Sort;
uses crt;
const n = 1000;
type a = array[1..n] of integer;
var mas: a;
    i, temp, nom: integer;
    f: text;
    
Procedure InsertionSort(mas: a);
var i, j: integer;
begin
for i:=1 to n-1 do
                begin
                nom:=i+1;
                temp:=mas[nom];
for j:=i+1 downto 2 do
                    begin
if (temp<mas[j-1]) then
                   begin
                   mas[j]:=mas[j-1];
                   nom:=j-1;
                   end;
                    end;
                mas[nom]:=temp;
                end;
writeln('The sorted array: ');
for i:=1 to 1000 do 
                 write(mas[i], ' ');
end;

begin
assign(f,'ints.txt');
reset(f);
i:=0;
while not eof(f) do
                 begin
                 inc(i);
                 read(f,mas[i]);
                 end;
close(f);      
InsertionSort(mas);
readln;
end.