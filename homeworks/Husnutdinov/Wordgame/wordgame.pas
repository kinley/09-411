program wordgame;
var n,s,i,l,k,f:integer;
mas:array[1..33] of char;
st,sim:string;
f1,f2,f3:text;
begin

writeln('Vvedite bukvi');
read(sim);

writeln('Vvedite dlinu slova');
read(n);

{Определяем число букв}
s:=(length(sim) div 2)+1;

mas[1]:=sim[1];
f:=1;

{Заполнение массива буквами из исходной строки}
for i:=2 to s do
begin
f:=f+2;
mas[i]:=sim[f];
end;

assign   (f1, 'file1.txt'); 
assign   (f2, 'file2.txt');
assign   (f3, 'file3.txt'); 
rewrite(f2);
rewrite(f3);

{Находим слова нужной длины}
reset (f1); { открыть файл для чтения }
while not eof (f1) do { пока не конец файла  f1}
begin
readln (f1, st);    {читаем строку из файла f1 }
if length(st)=n then
begin
writeln(f2,st);
i:=i+1;
end;
end;

close (f1); { закрыть файл  для чтения}
close (f2); { закрыть файл  для чтения}

{First part}

reset (f2); { открыть файл6 для чтения }


while not eof (f2) do { пока не конец файла  f2}
begin
readln (f2, st);    {читаем строку из файла f2 }

{Совершаем сортировку выбранных слов}
for i:=1 to length(st) do
for l:=1 to s do
if st[i]=mas[l] then 
begin
 k:=k+1;
 break;
end;

if k=length(st) then 
begin
writeln (f3, st);
k:=0;
end;

k:=0;

end;
close (f2); { закрыть файл  для чтения}
close (f3);
end.
