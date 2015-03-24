//Недоделано

{The initial values}
const
  n = 10;
  Precision = 10;

type
  ta = array[1..n + 1] of boolean;


var
  i, k: integer;
  xn, yn, zn: ta;
  x1,y1,z1,F: real;
  aStr: string;

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

procedure CalculatingX(var xn: ta; x:real);
var
  i: integer;
begin
  for i := 2 to (n + 1) do
    if xn[i] = True then x := x + 1 * power(2, n - i) else x := x;
  
  if xn[1] = True then x := x else x := -x;
  
  x := round(x);
  
end;

procedure Otricanie(var aStr: string);
var
  i: integer;
begin
  for i := 1 to length(aStr) do
    if aStr[i] = '1' then aStr[i] := '0';
  if aStr[i] = '0' then aStr[i] := '1';
end;


procedure Cicl(Cnt: integer; var aStr: string);
var
  c: char;
  i, j: integer;
begin
  for j := 1 to Cnt do 
  begin
    c := aStr[length(aStr)];
    for i := length(aStr) downto 2 do aStr[i] := aStr[i - 1];
    aStr[1] := c;
  end;
end;


begin
  
  for i := 1 to (n + 1) do
  begin
    k := random(2);
    xn[i] := k = 1;
    k := random(2);
    yn[i] := k = 1;
    k := random(2);
    zn[i] := k = 1;
  end;
  
  CalculatingX(xn,x1);
  CalculatingX(yn,y1);
  CalculatingX(zn,z1);
  
  DecToBin(FloatToStr(x1),10);
  DecToBin(FloatToStr(y1),10);
  DecToBin(FloatToStr(z1),10);
  
  F:=Cicl(2,(( x1 xor FloatToStr(Cicl(2,y1)))xor(FloatToStr(Otricanie(x1)) xor FloatToStr(Cicl(1,z1)))));
 
end.
