program pr;

const
  n = 15;

type
  tArray = Array[0..n] of real;

var
  X, Y: tArray; i: integer; c, r: real;

function Fx(X: real): real;
var
  Funct: real;
begin
  
  Funct := (1.2 + abs(X)) / (1.8 + abs(X - 1));
  Funct := Funct * cos(X * X + X + 1); 
  Fx := Funct;
  
end;



procedure sort(var A: tArray; var c: real );{При сравнении квадрата чисел 
                                                             результат не отличается 
                                                              от сравнения их же в первой степени,
                                                              включая дроби, кроме отрицательных чисел,
                                                              сл-но сортировка по модулю даст такое же
                                                              упорядочивание}
var
  m, i: integer;
begin
  for i := 1 to n do
    for m := 1 to n - 1  do 
    begin
      repeat  
        c := A[m];
        A[m] := A[n - (n - m) + 1];
        A[n - (n - m) + 1] := c;
      until
      abs(A[m]) < abs(A[n - (n - m) + 1])
    end;
end;


begin
  Write('Введите x');
  Read(X[0]);
  for i := 1 to n do
  
  begin
    X[i] := Fx(X[i - 1]);
    
    Write('X[i]', X[i], ' ');
  end;
  Writeln();
  Sort(X, c);
  for i := 1 to n do
  begin
    Y[i] := X[i];
    Write('y[i]', Y[i], ' ');
  end;
  for i := 1 to n do
  begin
    if Y[i] < 0 then 
      r := i;
  end;
  Write('r:=', r);
end.
