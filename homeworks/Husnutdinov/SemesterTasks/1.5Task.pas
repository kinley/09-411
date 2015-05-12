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
    writeln('t=', t[i], '  ', integral[i]:3:2, '  ');
end.
