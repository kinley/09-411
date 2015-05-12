const
  n = 10;

type
  tbool = array[0..n] of boolean;

{Translation from binary to decimal}
function bin_dec(var a: longint): longint;
const
  digits: array [0..1] of char = ('0', '1');
var
  res, ves: longint; 
  i, j: byte;
  x: string;
begin
  if a > 0 then
  begin
    x := FloatToStr(a);
    res := 0; ves := 1;
    for i := length(x) downto 1 do 
    begin
      j := 0;
      while (digits[j] <> x[i]) do inc(j);
      res := res + ves * j;
      ves := ves * 2;
    end;
    bin_dec := res;
  end else
  
  begin
    a := abs(a);
    begin
      x := FloatToStr(a);
      res := 0; ves := 1;
      for i := length(x) downto 1 do 
      begin
        j := 0;
        while (digits[j] <> x[i]) do inc(j);
        res := res + ves * j;
        ves := ves * 2;
      end;
      bin_dec := -res;
    end;
  end;
end;

{Translation from decimal to binary}
procedure dec_bin(var x: longint);
var
  s: string;
begin
  s := '';
  while x > 0 do
  begin
    s := chr(ord('0') + x mod 2) + s;
    x := x div 2;
  end;
  x := round(StrToFloat(s));
end;


procedure BoolMassive(var x: tbool);//Формирование булевского массива
var
  i, a: integer;
begin
  for i := 0 to n do
  begin
    a := random(0, 1);
    if a = 0 then x[i] := false else x[i] := true;
  end;
end;

procedure CalculatingX(x: tbool; var a: longint);//Перевод булевского массива в двоичное число
var
  i, y: integer;
begin
  a := 0;
  y := 1;
  for i := n downto 1 do 
  begin
    if x[i] = true then
      a := a + y;
    y := y * 10;
  end;
  if x[0] = false then a := -a;
end;

function Otricanie(var a: longint): longint;
var
  aStr: string;
  i: integer;
begin
  aStr := FloatToStr(a);
  if aStr[1] = '-' then 
    for i := 2 to length(aStr) do
    begin
      if aStr[i] = '1' then aStr[i] := '0' 
      else
      if aStr[i] = '0' then aStr[i] := '1';
    end
  else
    for i := 1 to length(aStr) do
    begin
      if aStr[i] = '1' then aStr[i] := '0' 
      else
      if aStr[i] = '0' then aStr[i] := '1';
    end;
  Otricanie := round(StrToFloat(aStr));
end;


function Cicl(Cnt: integer; var a: longint): longint;
var
  aStr: string;
  c: char;
  i, j: integer;
begin
  aStr := FloatToStr(a);
  if aStr[1] = '-' then
  begin
    delete(aStr, 1, 1);
    for j := 1 to Cnt do 
    begin
      c := aStr[length(aStr)];
      for i := (length(aStr)) downto 2 do aStr[i] := aStr[i - 1];
      aStr[1] := c;
    end;
    insert('-', aStr, 1);    
    Cicl := round(StrToFloat(aStr));
  end
  
  else
  begin
    for j := 1 to Cnt do 
    begin
      c := aStr[length(aStr)];
      for i := length(aStr) downto 2 do aStr[i] := aStr[i - 1];
      aStr[1] := c;
    end;
    Cicl := round(StrToFloat(aStr));
  end;
end;

function Slogenie(x, y, n2: longint): longint;
begin
  result := (x + y) mod n2;
end;

var
  a, b, c: tbool;
  x, y, z, r: longint;
  u, i, n2: longint;

begin
  
  BoolMassive(a);
  BoolMassive(b);
  BoolMassive(c);
  
  CalculatingX(a, x);
  CalculatingX(b, y);
  CalculatingX(c, z);
  
  n2 := 1;
  
  for i := 1 to n do
    n2 := n2 * 2;
    
  u := Slogenie(x, Cicl(2, y), n2);
  
  i := Slogenie(Otricanie(x), Cicl(1, z), n2);
  
  i := Cicl(3, i);
  
  u := Slogenie(u, i, n2);
  
  u := Cicl(2, u);
  
  r := 2;
  
  i := Slogenie(y, Cicl(2, r), n2);
  
  i := Otricanie(i);
  
  i := Cicl(5, i);
  
  u := Slogenie(u, i, n2);
  
  write(u);

end.
