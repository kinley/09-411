//Не доделано сильно  очень

{The initial values}
const
  M = 250;
  m1 = 2;
  t_1 = 3;
  t_2 = 3.5;
  Precision = 10;

type
  ta = array[1..m1 + 1] of real;
  ta1 = array[1..M + 1] of real;

var
  l, i: integer;
  integral: ta;
  fi, x, t: ta1;


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
      Writeln('Error');
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
      Writeln('Error');
    end;
    
    Weight := Weight / BaseIn;
  end;
  
  StrRes := '';
  
  TmpNum := Int(Num);
  repeat
    
    case Round(TmpNum - Int(TmpNum / BaseOut) * BaseOut ) of
      0: StrRes := '0' + StrRes;
      1: StrRes := '1' + StrRes;
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
      0: StrRes := StrRes + '0';
      1: StrRes := StrRes + '1';
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
  i1, l1: integer;
begin
  
  for i1 := 1 to length(DecToBin1) do
    if DecToBin1[i1] = '.' then begin l1 := i1 + 1;break; end;
  
  for i1 := l1 to length(DecToBin1) do 
  begin
    insert(DecToBin1[i1], DecToBin1, l1);
    delete(DecToBin1, i1 + 1, 1);
  end;
  
  PreoDecToBin := DecToBin1;
end;

{The function calculates the value of g (x) with the formal parameter x}
function g_x(x: real): real;
begin
  g_x := x * sqrt(x) - 0.5;
end;

procedure RandomProcedure;
begin
  fi[i + 1] := BinToDec(PreoDecToBin(DecToBin(FloatToStr(((abs(sin(fi[i]))))), Precision)));
  x[i] := 1 + (t[l] - 1) * fi[i + 1];
end;

begin
  t[1] := t_1;
  t[2] := t_2;
  
  fi[1] := 1;
  
  for l := 1 to m1 do
  begin
    for i := 1 to M do
    begin
      RandomProcedure;
      integral[l] := integral[l] + g_x(x[i]);
    end;
  end;
  
  writeln('Значения в точках: ');
  for i := 1 to m1 do
    writeln('t=',t[i],'  ',integral[i]:3:2, '  ');
end.
