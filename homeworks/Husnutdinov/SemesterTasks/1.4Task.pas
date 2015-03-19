//Сильно не доделано

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

{Перевод из десятичной в двоичную}
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
  
  (*Перевод десятичной записи в число.*)
  
  (*Определяем знак и десятичную запись числа без знака.*)
  if aStr[1] = '-' then begin
    StrSign := '-';
    vStr := Copy(aStr, 2, Length(aStr) - 1);
  end else begin
    StrSign := '';
    vStr := aStr;
  end;
  
  (*Ищем дробную точку.*)
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
  
  (*Переводим в число запись целой части.*)
  (*Движемся от младших разрядов - к старшим.*)
  (*Вес младшего разряда в целой части.*)
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
      Writeln( 'Ошибка! Незарегистрированная цифра.');
    end;
    (*Вес следующего разряда.*)
    Weight := Weight * BaseIn;
  end;
  
  (*Переводим в число запись дробной части.*)
  (*Движемся от старших разрядов - к младшим.*)
  (*Вес старшего разряда в дробной части.*)
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
      Writeln( 'Ошибка! Незарегистрированная цифра.');
    end;
    (*Вес следующего разряда.*)
    Weight := Weight / BaseIn;
  end;
  
  (*Переводим число в двоичную запись.*)
  
  StrRes := '';
  
  (*Перевод целой части.*)
  TmpNum := Int(Num);
  repeat
    (*Определяем очередную двоичную цифру.*)
    (*Аналог (TmpNum mod BaseOut) для случая вещественных операндов.*)
    case Round( TmpNum - Int(TmpNum / BaseOut) * BaseOut ) of
      0:  StrRes := '0' + StrRes;
      1:  StrRes := '1' + StrRes;
    end;
    (*Удаляем из числа текущий разряд.*)
    TmpNum := Int(TmpNum / BaseOut);
  until TmpNum = 0;
  
  (*Перевод дробной части с точностью до aPrecision знаков после запятой.*)
  i := 0;
  TmpNum := Frac(Num);
  while (TmpNum <> 0) and (Precision > i) do 
  begin
    if i = 0 then StrRes := StrRes + StrDot;
    (*Определяем очередную двоичную цифру.*)
    TmpNum := TmpNum * BaseOut;
    case Round(Int(TmpNum)) of
      0:  StrRes := StrRes + '0';
      1:  StrRes := StrRes + '1';
    end;
    (*Удаляем из числа текущий старший разряд.*)
    TmpNum := Frac(TmpNum);
    Inc(i);
  end;
  
  DecToBin := StrSign + StrRes;
end;

{Перевод из двоичной в десятичную}
function BinToDec(bin: string): real;
var
  a, i, st, m, p, w: integer;
  sum, k, d: real;
begin
  repeat
    for i := 1 to length(bin) do
      val(bin[i], d, w);
  until (d < 2) and (w = 0);
  a := pos('.', bin);
  if a = 0 then st := length(bin) else st := a - 2;
  k := 1;
  for i := 1 to st do
    k := 2 * k;
  for i := 1 to length(bin) do
  begin
    val(bin[i], m, p);
    if p = 0 then
      sum := sum + m * k;
    k := k / 2;
  end;
  BinToDec := sum;
end;

{Преобразование T}
function PreoDecToBin(DecToBin1: string): String;
var
  i: integer;
begin
  
  for i := 1 to length(DecToBin1) do 
  begin
    insert(DecToBin1[i], DecToBin1, 1);
    delete(DecToBin1, i + 1, 1);
  end;
  PreoDecToBin := DecToBin1;
end;

{The function calculates the value of F (x,y,z,a) with the formal parameter x,y,z,a}
function F_x(x, y, z, a: real): real;
begin
  F_x := BinToDec(PreoDecToBin(DecToBin(FloatToStr(((abs(cos(x + a))) / (2 + sin(y + z)))), Precision)));
  // F_x := BinToDec(F_x);
end;

{Процедура определения интервала}
procedure Interval(R, z: real; var E: ta);
var
  k: real;
  i: integer;
begin
  for i := 1 to (10 - 1) do
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
  
  {Вычисление математического ожидания и дисперсии}
  
  for i := 1 to (10 ) do
  begin
    k := i;
    Me := Me + (2 * k + 1) / (2 * r) * (E1[I] / N);
    De := De + (2 * k + 1 - Me) * (2 * k + 1 - Me) / (2 * r) * (E1[I] / N);
  end;
  
  for i := 1 to r do
    write(e1[i], ' ');
  
  writeln;
  writeln(Me, ' ', De);
  
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
  
  {Вычисление математического ожидания и дисперсии}
  
  for i := 1 to (10 ) do
  begin
    k := i;
    Me := Me + (2 * k + 1) / (2 * r) * (E1[I] / N);
    De := De + (2 * k + 1 - Me) * (2 * k + 1 - Me) / (2 * r) * (E1[I] / N);
  end;
  
  for i := 1 to r do
    write(e1[i], ' ');
  
  writeln;
  write(Me, ' ', De);
end.
