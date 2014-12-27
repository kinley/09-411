program thirtyA;

const
    E = 0.0001;
    
var
  a, b, Xo, pastX, currentX, ksi, p: real;
  i: integer;
  
function f(c: real): real;
begin
  result := c * c * c * c * c - c - 0.02;
end;

function f_pr1(c: real) : real;
begin
  result := 5 * c * c * c * c - 1;
end;

function f_pr2(c: real): real;
begin
  result := 20 * sqr(c) * c;
end;

function search_Xo(c: real): real;
begin
  result := f(c) * f_pr2(c);
end;

function search_answer(c: real): real;
begin
  result := c - f(c) / f_pr1(c);
end;

function answer_cindition_isOK(c, d: real): boolean;
begin
  if ((abs(c - d) <= E) and (f(c) < 0.0001)) then
    answer_cindition_isOK := true
  else
    answer_cindition_isOK := false;
end;

BEGIN
  read(a, b);
  if search_Xo(a) > 0 then
    Xo := a
  else
  if search_Xo(b) > 0 then
    Xo := b;
  currentX := search_answer(Xo);
  pastX := Xo;
  i := 1;
  writeln('Xo = ', Xo);
  if answer_cindition_isOK(currentX, pastX) then
    ksi := currentX
  else
    repeat
      p := pastX;
      pastX := currentX;
      currentX := search_answer(p);
      inc(i)
    until answer_cindition_isOK(currentX, pastX);
  ksi := currentX;
  writeln('Ksi = ', ksi:0:4);
  write('i = ', i);
END.