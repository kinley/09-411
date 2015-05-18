{��� - ���������, ����� ����� ����������� ���������� ������ ��� �������� � ��������� � �������}
type
  OurArray = array [1..100] of real;

{���� ���������� ���������� - ���� ��������� � ������ ������}
var
  x : real;
  n : integer;
  l : integer;

{������ X ����������� �� ������� X[i] = F(X[i-1])}
  X_array : OurArray;
{������ Y ����������� �� � �� ������� ��������������}
  Y_array : OurArray;

{�������� �������
  function ���_�������(���������� ���������) : ���_������������� ��������
  � ������ ������ ��� ������� ��������� �� ���� ������������ �����
  � ���������� ���������� ������ �� 1+|����� �����|
}
function getSqrtAndMod(y_i : real) : real;
begin
  getSqrtAndMod:=sqrt(1+abs(y_i));
end;

{�������� ��������� - ��� �� ���������� ��������, �� � ������ ������ ��������
�������� ������� - � ������ y �� ������ ����� �������� � ��� ���������
����� ����� ���, ��� ���� ������� ���������
����� �� ����� ������ x, �� ��� ��������� �� �������� ����� ������ ���������}
procedure BubbleSort(x : OurArray; var y : OurArray; size : integer);
{���������� ��������� ������� ���������}
var
  i : integer;
  j : integer;
  temp : real;
begin
  for i:=size downto 1 do
  begin
    for j:=1 to i do
    begin
      if (getSqrtAndMod(x[j]) < getSqrtAndMod(x[j+1])) then 
      begin
        temp := x[j];
        x[j] := x[j+1];
        x[j+1]:= temp;   
       end;
    end;
  end;
  for i:=1 to n do
  begin
  y[i] := x[i];
  end;
end;

function F(x : real) :real;
{���� �������}
begin
  F:=((2*x*x - 1)/(x*x + 6.8))*sin(x + 1.2);
end;

function getR(y : OurArray; n : integer) : integer;
var
  i : integer;
{���������� ����� ����� 1, ���� ����� ������������� �������}
  flagPlus : integer;
begin
  flagPlus := 0;
  for i:=1 to n do
  begin 
    if (y[i] >= 0) then
    begin
      flagPlus:=1;
      getR:=i;
    end;
  end;

  if (flagPlus = 0) then
  begin
    getR:= n + 1;
  end;
end;

{���� �������� ���������}
begin
{��������� � ���������� �������� ���� �����}
  read(x,n);

  X_array[1] := F(x);

  for l:=2 to n do
  begin
   X_array[l] := F(X_array[l-1]);
  end;

  writeln('Array X');
  for l:=1 to n do
  begin
    writeln('X[',l, ']=',X_array[l]);
  end;
  
  BubbleSort(X_array, Y_array, n);

  writeln('Array Y');
  for l:=1 to n do
  begin
    writeln('Y[',l, ']=',Y_array[l]);
  end;
  
  writeln('R=', getR(Y_array, n));
end.

                                                           