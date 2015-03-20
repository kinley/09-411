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
  BaseIn = 10;
  BaseOut = 2;
var
  i, PosDot: Integer;
  StrRes, vStr, StrSign, StrDot: String;
  Num, TmpNum, Weight: real;
begin
  DecToBin := '';
  if aStr = '' then Exit;
  
  if aStr[1] = '-' then begin
    StrSign := '-';
    vStr := Copy(aStr, 2, Length(aStr) - 1);
  end else begin
    StrSign := '';
    vStr := aStr;
  end;
  
  PosDot := Length(vStr) + 1;
  for i := 1 to Length(vStr) do 
  begin
    if vStr[i] in ['.', ','] then begin
      PosDot := i;
      StrDot := vStr[i];
      Break;
    end;
  end;
  
  Num := 0;
  
  Weight := 1;
  for i := PosDot - 1 downto 1 do 
  begin
    case vStr[i] of
      '0': Num := Num + 0 * Weight; 
      '1': Num := Num + 1 * Weight;
      '2': Num := Num + 2 * Weight;
      '3': Num := Num + 3 * Weight;
      '4': Num := Num + 4 * Weight;
      '5': Num := Num + 5 * Weight;
      '6': Num := Num + 6 * Weight;
      '7': Num := Num + 7 * Weight;
      '8': Num := Num + 8 * Weight;
      '9': Num := Num + 9 * Weight;
    else
      Writeln( 'Error');
    end;
    Weight := Weight * BaseIn;
  end;
  
  Weight := 1 / BaseIn;
  for i := PosDot + 1 to Length(vStr) do 
  begin
    case vStr[i] of
      '0': Num := Num + 0 * Weight; 
      '1': Num := Num + 1 * Weight;
      '2': Num := Num + 2 * Weight;
      '3': Num := Num + 3 * Weight;
      '4': Num := Num + 4 * Weight;
      '5': Num := Num + 5 * Weight;
      '6': Num := Num + 6 * Weight;
      '7': Num := Num + 7 * Weight;
      '8': Num := Num + 8 * Weight;
      '9': Num := Num + 9 * Weight;
    else
      Writeln( 'Error');
    end;
    
    Weight := Weight / BaseIn;
  end;
  
  StrRes := '';
  
  TmpNum := Int(Num);
  repeat
    
    case Round( TmpNum - Int(TmpNum / BaseOut) * BaseOut ) of
      0:  StrRes := '0' + StrRes;
      1:  StrRes := '1' + StrRes;
    end;
    
    TmpNum := Int(TmpNum / BaseOut);
  until TmpNum = 0;
  
  i := 0;
  TmpNum := Frac(Num);
  while (TmpNum <> 0) and (Precision > i) do 
  begin
    if i = 0 then StrRes := StrRes + StrDot;
    TmpNum := TmpNum * BaseOut;
    case Round(Int(TmpNum)) of
      0:  StrRes := StrRes + '0';
      1:  StrRes := StrRes + '1';
    end;
    TmpNum := Frac(TmpNum);
    Inc(i);
  end;
  
  DecToBin := StrSign + StrRes;
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
  for i := 1 to Length(bin) do 
  begin
    if f then k := k / b;
    c := UpCase(bin[i]);
    a := -1;
    case c of
      '0'..'9': a := Ord(c) - 48;
      'A'..'Z': a := Ord(c) - 55;
      '.', ',': if f then e := true else f := true;
    else f := true
    end;
    e := e or (a >= b);
    if e then break;
    if a >= 0 then d := d * b + a
  end;
  BinToDec := d * k;
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
