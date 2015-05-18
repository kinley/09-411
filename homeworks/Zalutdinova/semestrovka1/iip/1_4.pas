type
  OurArray = array[1..300] of real;
var
IKS_0, IKS_1, IKS_2 : real;
N :integer;
//POSL_1 : OurArray;
POSL_2 : OurArray;
KSI_K :OurArray;
l : integer;
R : integer;
M: real;
D: real;

function get_M(KSI : OurArray; N :integer; R : integer) : real;
var
x : real;
k : integer;
begin
x := 0;
for k:= 0 to R-1 do 
begin 
x:= x+ ((2*k+1)/R) * (KSI[K+1]/N);
end;
get_M:=x;
end;

function get_D(M : real; N: integer; KSI:OurArray; R : integer) : real;
var
y : real;
k : integer;
begin
  y:=0;
  for k := 0 to R-1 do
  begin
  y:= y + (((2*k+1)/(2*R) - M )*((2*k+1)/(2*R) - M ))* ( KSI[K+1]/ N);
  end;
  get_D:=y;
end;

procedure get_KSI(IKS : OurArray; var KSI : OurArray; R_ : integer; IKS_SIZE : integer);
var
 
a, b : real;
k_ : integer;
count : integer;
i_ : integer;
begin
  for k_:=0 to R_ -1 do
  begin
    a := (k_/R_);
    b := (k_+1)/R;
    for i_ := 1 to IKS_SIZE do
    begin
      if ( (a <= IKS[i_]) and (b > IKS[i_])) then count := count + 1;
    end;
    KSI[k_+1] := count;
    count := 0;
  end;
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

function F(x,y,z : real; a: integer): real;
begin
  F:=T(exp(-(x-2*y+3*z+10*a)*(x-2*y+3*z+10*a)));
end;

procedure Posl(x0, x_1, x_2 : real; var X : OurArray; a, N : integer);
var
  xi_1, xi_2, xi_3 : real;
  i : integer;
begin
  xi_1 := x0;
  xi_2 := x_1;
  xi_3 := x_2;

  X[1]:=F(xi_1, xi_2, xi_3, a);

  xi_1 := X[1];
  xi_2 := x_1;
  xi_3 := x_2;

  X[2] := F(xi_1, xi_2, xi_3, a);

  xi_1 := X[2];
  xi_2 := X[1];
  xi_3 := x_1;

  X[3] := F(xi_1, xi_2, xi_3, a);

// xi_1 := X[3];
// xi_2 := X[2];
// xi_3 := X[1];
//
  for i:=4 to N do
  begin 
    X[i] := F(X[i-1], X[i-2], X[i-3], a);
  end;
end;

begin
  read(IKS_0, IKS_1, IKS_2, N, R);

 // Posl(IKS_0, IKS_1, IKS_2, POSL_1, 1, N);
  Posl(IKS_0, IKS_1, IKS_2, POSL_2, 0, N);
  get_KSI(POSL_2, KSI_K, R, N);
  
  writeln('For a=0');
  for l:=1 to N do
  begin
    writeln(POSL_2[l]);
  end;
  
  writeln('KSI');
  for l:=1 to R do
  begin
    writeln('KSI[',l,']= ',KSI_K[l]);
  end;  
  
  writeln('MAT OZHID');
  M := get_M(KSI_K, N, R);
  writeln(M);
  
  writeln('DISP');
  D := get_D(M, N, KSI_K, R);
  writeln(D);
  
end.