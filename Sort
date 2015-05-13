program s;

const
  n = 10000;

type
  massiv = array [1..n] of integer;

var
  q, a, c, d,e: massiv; i, u, x: integer;

function check(b: massiv): boolean;
var
  j: integer;
begin
  for j := 1 to n - 1 do 
  begin
    if (b[j] < b[j + 1]) then check := true else begin check := false;break; end;
  end;
end;

procedure ObSort(var b: massiv);
var
  h, k, j: integer;
begin
  for h := 1 to n do 
  begin
    for j := h + 1 to n  do 
    begin
      if b[h] > b[j] then begin
        k := b[h];
        b[h] := b[j];
        b[j] := k;
      end;
    end; 
  end;
end;

procedure PuzSort(var b: massiv);
var
  h, j, l, k, max: integer;

begin
  j := n;
  for h := 1 to n - 1 do 
  begin
    l := 1;
    k := 1;
    max := a[1];
    for l := 1 to j do 
    begin
      if(a [l] > max) then begin max := a[l]; k := l end;
    end;
    a[k] := a[j];
    a[j] := max;
    j := j - 1;
  end;
end;

procedure InsertSort(var b:massiv);
var
  u, j, key: integer;
begin
  for u := 2 to n do
  begin
    key := b[i];
    j := u - 1;
    while (j >= 1) and (b[j] > key) do
    begin
      b[j + 1] := b[j];
      j := j - 1;
    end;
    b[j + 1] := key;
  end;
end;

procedure Shell(b: massiv; nn: integer); 
var t,y,j,count:integer;
begin
t:=nn;
t:=t div 2;
while (t>0) do
begin
for y:=1 to nn-t do
begin
j:=y;
while ((j>0) and (b[j]>b[j+t])) do
begin
count:=b[j];
b[j]:=b[j+t];
b[j+t]:=count;
j:=j-1;
end;
end;
t:=t div 2;
end;
end;

begin
  randomize();
  writeln('1-обмен,2-пузырьки,3-вставками,4-Шелла');
  for u := 1 to n do 
  begin
    q[u] := random(100);
  end;
  for i := 1 to n do
    a[i] := q[i];
    writeln('Нажмите 1');
    read(x);
    if x=1 then begin
  if check(a) = false then ObSort(a);
  Writeln('Обмен: ');
  for i := 1 to n do
    write(a[i], ' ');
    end;
  for i := 1 to n do
    c[i] := q[i];
  writeln();
  writeln('Нажмите 2');
    read(x);
    if x=2 then begin
  if check(c) = false then ObSort(c);
  writeln('Пузырьки: ');
  for i := 1 to n do
    write(c[i], ' ');
    end;
    for i := 1 to n do
    d[i] := q[i];
  writeln();
  writeln('Нажмите 3');
    read(x);
    if x=3 then begin
  if check(d) = false then Insertsort(d);
  writeln('Вставками: ');
  for i := 1 to n do
    write(d[i], ' ');
    end;
    writeln();
    for i := 1 to n do
    e[i] := q[i];
  writeln('Нажмите 4');
    read(x);
    if x=4 then begin
  if check(e) = false then shell(e,n);
  writeln('Шелла: ');
  for i := 1 to n do
    write(e[i], ' ');
    end;
    readln();
    readln();
end.
