// Недоделано((
{The initial values}
const
  n = 10;
  Precision = 10;

type
  ta = array[1..n + 1] of boolean;

type
  tStr = string;

var
  i, k, r1, r2, r3,F,r4,r5,r6,r7,r8,r9,r10: integer;
  xn, yn, zn: ta;
  x1, y1, z1,t1: real;
  aStr,l1: string;
  x, y, z, x2, y2, z2, x3, y3, z3,e1,e2: tStr;

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

procedure CalculatingX(var xn: ta);
var
  i: integer;
  y: real;
begin
  x := '';
  y := 0;
  for i := 2 to (n + 1) do
    if xn[i] = True then y := y + 1 * power(2, n - i);
  
  if xn[1] = True then x := FloatToStr(round(2 * y)) else 
  begin
    x := FloatToStr(round(2 * y));
    Insert('-', x, 1);
  end;
  
end;

procedure Otricanie(var aStr: tStr);
var
  i: integer;
begin
  for i := 1 to length(aStr) do
    if aStr[i] = '1' then aStr[i] := '0';
  if aStr[i] = '0' then aStr[i] := '1';
end;


procedure Cicl(Cnt: integer; var aStr: tStr);
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
  
  CalculatingX(xn);
  x1 := StrToFloat(DecToBin(x, 10));
  r1 := round(x1); 
  
  CalculatingX(yn);
  y1 := StrToFloat(DecToBin(x, 10));
  r2 := round(y1);
  
  CalculatingX(zn);
  z1 := StrToFloat(DecToBin(x, 10));
  r3 := round(z1);
  
  //x+y02
  e1:=FloatToStr(y1);
  Cicl(2,e1);
  l1:=e1;
  t1:=StrToFloat(l1);
  r4:=round(t1);
  r4:=r1 xor r4;
  
  //1x+z01
  Otricanie
  
end.
