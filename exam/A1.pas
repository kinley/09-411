program plus;

type
  myint = '0'..'9';

var
  a, b: array [1..100] of myint;
  c: array [1..100] of integer;
  i,k,s: integer;
  g: char;

function cif(var z: myint): integer;
begin
  result := ord(z) - ord('0');
end;

function cha(var z: integer): myint;
begin
  result := chr(z + ord('0'));
end;

BEGIN
  for s := 1 to 100 do 
  begin
    a[s] := '0';
    b[s] := '0';
  end;
  for i := 1 to 100 do 
  begin
    read(g);
    if g in ['0'.. '9'] then a[i] := g
    else break;
  end;
  for k := 1 to 100 do 
  begin
    read(g);
    if g in ['0'.. '9'] then b[k] := g
    else break;
  end;
  dec(i);dec(k);
  
for s := i downto 1 do
    begin
      a[100 - (i - s)] := a[s];
      a[s] := '0';
    end;
  
  for s := k downto 1 do
    begin
      b[100 - (k - s)] := b[s];
      b[s] := '0';
    end;
  for s := 1 to 100 do
    c[s] := cif(a[s]) + cif(b[s]);
  
  for s := 100 downto 1 do 
    if c[s] > 9 then 
    begin 
      c[s - 1] :=c[s-1]+ (c[s] div 10); 
      c[s] := c[s] mod 10; 
    end;
  s:=1;
  while c[s]=0 do inc (s);
  for i := s to 100 do 
    write(c[i]);
END.