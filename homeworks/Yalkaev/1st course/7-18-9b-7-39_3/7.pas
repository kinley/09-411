program findN;

const
  pi = 3.1415926;
  e = 0.0001;

var
  r, p: real;
  n, i: longint;

begin
  n := 1;
  r := 1;
  
  while abs(r - pi / 2) > e do 
  
  begin
    p := 4 * n * n / (4 * n * n - 1);
    r := r * p;
    inc(n);
  end;
  
  writeln(n);
end.
