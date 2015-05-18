type
dv_array = array [1..100] of integer;

var
x : dv_array;
y : dv_array;
z : dv_array;
res :dv_array;
res10 : integer;
n : integer;
i : integer;

function convert(n :integer; a : dv_array) : integer;
var 
sum : integer;
t : integer;
i : integer;
begin 
t := 1;
sum := 0;
for i:= n downto 1 do
begin
  sum := sum + a[i]*t;
  t := t*2;
end;
convert := sum;
end;

procedure pow(n : integer; a :dv_array; pow_num : integer; var c :dv_array);
var
i :integer;
k :integer;
begin
for i := n downto n-pow_num do
begin
  c[i] := 0;
end;
k := n;
for i := n-pow_num downto 1 do
begin
  c[i] := a[k];
  k := k-1;
end;
end;

procedure sum(n : integer; a : dv_array; b : dv_array; var c :dv_array);
var
i :integer;
sum_cur : integer;
buf : integer;
begin
  buf := 0; 
  for i := n downto 1 do
  begin
    sum_cur := a[i] +b[i] + buf;
    if (sum_cur = 0) then 
    begin
      c[i] := 0;
      buf := 0;
    end
    else if (sum_cur = 1) then
    begin
      c[i] := 1;
      buf := 0;
    end
    else if (sum_cur = 2) then
    begin
      c[i] := 0;
      buf := 1;
    end
    else if (sum_cur = 3) then
    begin
      c[i] := 1;
      buf := 1;
    end
  end;
end;

procedure main(x :dv_array; y : dv_array; z :dv_array; var res :dv_array);
var
buf1 : dv_array;
buf2 : dv_array;
buf3 : dv_array;
buf4 : dv_array;
buf5 : dv_array;
buf6 : dv_array;
begin
pow(n,x, 3, buf1);
pow(n,y, 2, buf2);
pow(n,z, 1, buf3);
sum(n, buf1, buf2, buf4);
sum(n, buf3, x, buf5);
pow(n, buf5, 2, buf6);
sum(n, buf4, buf6, res);
end;

begin
writeln('¬ведите длину чисел');
read(n);

writeln('¬ведите число x');
for i:= 1 to n do
begin
  read(x[i]);
end;

writeln('¬ведите число y');
for i:= 1 to n do
begin
  read(y[i]);
end;

writeln('¬ведите число z');
for i:= 1 to n do
begin
  read(z[i]);
end;

main(x, y, z, res);

writeln('–езультат в двоичном виде');
for i:= 1 to n do
begin
  write(res[i]);
end;
writeln();
writeln('–езультат в дес€тичном виде');
res10 := convert(n, res);
writeln(res10);
end.