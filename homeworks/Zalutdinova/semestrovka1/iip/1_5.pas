var 
fi_i : real;
x_i : real;
i: integer;
j : integer;
M : integer;
m_ : integer;
sum: real; 
res : array [1..10] of real;
t_ : array [1..10] of real;
x_ : array [1..300] of real;
function g(x: real) : real;
begin
g:= x*x -1;
end;

function h(z : real) : real;
begin
  h:= (sin(z) + sin(z)*sin(z))/2.0;
end;

function T(h : real): real;
var
  // двоичное представление числа h
  dv : array[1..10] of integer;
  i : integer;
  buf : integer;
  s2 : real;
  res : real;
begin
  for i := 1 to 10 do
  begin
    h := h*2;
    dv[i] := trunc(h);
    h :=frac(h);
  end;  
  
  buf := dv[10];
  for i:=10 downto 2 do
  begin
    dv[i] := dv[i-1];
  end;
  
  dv[1] := buf;
  s2 := 2.0;
  for i:= 1 to 10 do
  begin
    res := res + (dv[i])*1.0/s2;
    s2:= s2 * 2.0;
  end;
  T:= res; 
end;

function F(fi_i : real) : real;
begin
  F:= T(h(fi_i));
end;

procedure p(t : real);
begin
fi_i:=F(fi_i);
x_i := 1.0 + (t-1)*fi_i;
end;

begin
  read(M, m_);
  sum:=0;
  fi_i := 1.0;
  for i :=1 to m_ do
    read(t_[i]);
    
  for i := 1 to m_ do
  begin  
    // генерируем массив случайных чисел в промежутке от 1 до t_[i]
    for j := 1 to M do
      begin
      p(t_[i]);
      x_[j] := x_i;
      end;
    
    for j :=1 to M do
      begin
        sum := sum + g(x_[j]);
      end;
      sum := sum * ((t_[i] -1)/M);
      res[i] := sum;
      sum := 0;
      fi_i:=1.0
  end;
  
  for i:= 1 to m_ do
    writeln(res[i]);
  
end.