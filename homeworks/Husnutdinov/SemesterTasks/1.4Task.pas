{The initial values}
const
  N = 100;
  R = 10;
  x_0 = 0.025;
  x_1 = 0.211;
  x_2 = 0.714;
  Precision = 10;

type
  ta = array[1..100] of real;

{Translation from decimal to binary}
function DecToBin(aStr: String; Precision: Byte): String;
const
  baseIn = 10;
  baseOut = 2;
var
  i, PosDot: Integer;
  StrRes, vStr, StrSign, StrDot: String;
  Num, TmpNum, Weight: real;
begin
  DecToBin := '';
  
  //Insert sign
  if aStr[1] = '-' then 
  begin
    StrSign := '-';
    vStr := copy(aStr, 2, length(aStr) - 1);
  end else begin
    strSign := '';
    vStr := aStr;
  end;
  
  //Determining the position of the point
  posDot := length(vStr) + 1;
  for i := 1 to length(vStr) do 
  begin
    if vStr[i] in ['.'] then 
    begin
      posDot := i;
      strDot := vStr[i];
      break;
    end;
  end;
  
  num := 0;
  
  //Transfer before the point
  weight := 1;
  for i := posDot - 1 downto 1 do 
  begin
    case vStr[i] of
      '0': num := num + 0 * Weight; 
      '1': num := num + 1 * Weight;
      '2': num := num + 2 * Weight;
      '3': num := num + 3 * Weight;
      '4': num := num + 4 * Weight;
      '5': num := num + 5 * Weight;
      '6': num := num + 6 * Weight;
      '7': num := num + 7 * Weight;
      '8': num := num + 8 * Weight;
      '9': num := num + 9 * Weight;
    end;
    weight := weight * baseIn;
  end;
  
  //Transfer after the point
  weight := 1 / baseIn;
  for i := (posDot + 1) to length(vStr) do 
  begin
    case vStr[i] of
      '0': num := num + 0 * weight; 
      '1': num := num + 1 * weight;
      '2': num := num + 2 * weight;
      '3': num := num + 3 * weight;
      '4': num := num + 4 * weight;
      '5': num := num + 5 * weight;
      '6': num := num + 6 * weight;
      '7': num := num + 7 * weight;
      '8': num := num + 8 * weight;
      '9': num := num + 9 * weight;
    end;
    
    weight := weight / baseIn;
  end;
  
  strRes := '';
  
  tmpNum := int(num);
  repeat
    
    case Round( tmpNum - int(tmpNum / baseOut) * baseOut ) of
      0:  strRes := '0' + strRes;
      1:  strRes := '1' + strRes;
    end;
    
    tmpNum := int(tmpNum / baseOut);
  until tmpNum = 0;
  
  i := 0;
  tmpNum := frac(num);
  while (tmpNum <> 0) and (Precision > i) do 
  begin
    if i = 0 then strRes := strRes + strDot;
    tmpNum := tmpNum * baseOut;
    case round(int(tmpNum)) of
      0:  strRes := strRes + '0';
      1:  strRes := strRes + '1';
    end;
    tmpNum := frac(tmpNum);
    inc(i);
  end;
  
  DecToBin := strSign + strRes;
end;

{Translation from binary to decimal}
function BinToDec(bin: string): real;
var
  i, b, a: integer;
  d, k: double;
  f, e: boolean;
  c: char;
begin
  b := 2;
  f := false;
  k := 1;
  for i := 1 to length(bin) do 
  begin
    if f then k := k / b;
    c := upcase(bin[i]);
    a := -1;
    case c of
      '0'..'9': a := Ord(c) - 48;
      '.': if f then e := true else f := true;
    else f := true
    end;
    e := e or (a >= b);
    if e then break;
    if a >= 0 then d := d * b + a
  end;
  binToDec := d * k;
end;

{Fucntion T}
function PreoDecToBin(DecToBin1: string): string;
var
  i, l: integer;
begin
  
  for i := 1 to length(DecToBin1) do
    if DecToBin1[i] = '.' then begin l := i + 1; break; end;
  
  for i := l to length(DecToBin1) do 
  begin
    insert(DecToBin1[i], DecToBin1, l);
    delete(DecToBin1, i + 1, 1);
  end;
  
  PreoDecToBin := DecToBin1;
end;

{The function calculates the value of F (x,y,z,a) with the formal parameter x,y,z,a}
function F_x(x, y, z, a: real): real;
begin
  F_x := BinToDec(PreoDecToBin(DecToBin(FloatToStr(((abs(cos(x + a))) / (2 + sin(y + z)))), Precision)));
end;

{Determination of the interval}
procedure Interval(R, z: real; var E: ta);
var
  k: real;
  i: integer;
begin
  for i := 1 to (10 - 1 ) do
  begin
    k := i;
    if ((k / R) <= z) and (z < (k + 1) / R) then E[i] := E[i] + 1;
  end;
end;

var
  k, Me, De: real;
  i: integer;
  xAr, E1: ta;

begin
  
  writeln('For a = 1');
  
  xAr[1] := F_x(x_0, x_1, x_2, 1);
  xAr[2] := F_x(xAr[1], x_0, x_1, 1);
  xAr[3] := F_x(xAr[2], xAr[1], x_0, 1);
  xAr[4] := F_x(xAr[3], xAr[2], xAr[1], 1);
  
  for i := 5 to N do
    xAr[i] := F_x(xAr[i - 1], xAr[i - 2], xAr[i - 3], 1);
  Me := 0;
  De := 0;
  
  for i := 1 to N do
    interval(10, xAr[i], e1);
  
  {The calculation of the expectation and variance}
  
  for i := 1 to (10 ) do
  begin
    k := i;
    Me := Me + (2 * k + 1) / (2 * r) * (E1[I] / N);
    De := De + (2 * k + 1 - Me) * (2 * k + 1 - Me) / (2 * r) * (E1[I] / N);
  end;
  
  for i := 1 to r do
    write(e1[i], ' ');
  
  writeln;
  writeln('Me = ', Me:3:2, ' ', 'De = ', De:3:2);
  
  writeln('For a = 0');
  
  xAr[1] := F_x(x_0, x_1, x_2, 0);
  xAr[2] := F_x(xAr[1], x_0, x_1, 0);
  xAr[3] := F_x(xAr[2], xAr[1], x_0, 0);
  xAr[4] := F_x(xAr[3], xAr[2], xAr[1], 0);
  
  for i := 5 to N do
    xAr[i] := F_x(xAr[i - 1], xAr[i - 2], xAr[i - 3], 0);
  Me := 0;
  De := 0;
  
  for i := 1 to N do
    interval(10, xAr[i], e1);
  
  {The calculation of the expectation and variance}
  
  for i := 1 to (10 ) do
  begin
    k := i;
    Me := Me + (2 * k + 1) / (2 * r) * (E1[I] / N);
    De := De + (2 * k + 1 - Me) * (2 * k + 1 - Me) / (2 * r) * (E1[I] / N);
  end;
  
  for i := 1 to r do
    write(e1[i], ' ');
  
  writeln;
  writeln('Me = ', Me:3:2, ' ', 'De = ', De:3:2);
end.
