unit MT;

interface

uses
  list2;

const
  lambda = ' ';
  n = 10;
  m = 2;

type
  alphabet = array [0..2] of char;
  state = record
    q_curr: integer;
    a_curr: char;
    q_next: integer;
    move: char;
    a_new: char;
  end;
  s = array [1..n, 0..m] of state;

procedure q(var l: list; var i, j: integer; mt: s; abc: alphabet);
procedure vvod_mt(var mt: s; abc: alphabet);
procedure moving(var l: list; m: char);
procedure mt_1(var mt: s; abc: alphabet);
procedure mt_2(var mt: s; abc: alphabet);
procedure mt_3(var mt: s; abc: alphabet);
procedure vvod_alph(var abc: alphabet);
function f(ch: char; abc: alphabet): integer;

implementation

procedure vvod_alph(var abc: alphabet);
begin
  abc[0] := '0';
  abc[1] := '1';
  abc[2] := lambda;
end;

procedure mt_1(var mt: s; abc: alphabet);
//копирование в конец последнего элемента 
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 0 to m do 
    begin
      mt[i, j].q_curr := i;
      mt[i, j].a_curr := abc[j];
    end;
  mt[1, 0].a_new := '0';
  mt[1, 0].move := 'r';
  mt[1, 0].q_next := 1;
  mt[1, 1].a_new := '1';
  mt[1, 1].move := 'r';
  mt[1, 1].q_next := 1;
  mt[1, 2].a_new := lambda;
  mt[1, 2].move := 'l';
  mt[1, 2].q_next := 2;  
  mt[2, 0].a_new := '0';
  mt[2, 0].move := 'r';
  mt[2, 0].q_next := 3; 
  mt[2, 1].a_new := '1';
  mt[2, 1].move := 'r';
  mt[2, 1].q_next := 4;
  mt[3, 2].a_new := lambda;
  mt[3, 2].move := 'r';
  mt[3, 2].q_next := 5;
  mt[4, 2].a_new := ' ';
  mt[4, 2].move := 'r';
  mt[4, 2].q_next := 6;  
  mt[5, 2].a_new := '0';
  mt[5, 2].move := 's';
  mt[5, 2].q_next := 0;  
  mt[6, 2].a_new := '1';
  mt[6, 2].move := 's';
  mt[6, 2].q_next := 0;
end;

procedure mt_2(var mt: s; abc: alphabet);
//замена 0 на 1, 1 на 0
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 0 to m do 
    begin
      mt[i, j].q_curr := i;
      mt[i, j].a_curr := abc[j];
    end;
  mt[1, 0].a_new := '1';
  mt[1, 0].move := 'r';
  mt[1, 0].q_next := 1;
  mt[1, 1].a_new := '0';
  mt[1, 1].move := 'r';
  mt[1, 1].q_next := 1;
  mt[1, 2].a_new := ' ';
  mt[1, 2].move := 's';
  mt[1, 2].q_next := 0; 
end;

procedure mt_3(var mt: s; abc: alphabet);
//копирование 
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 0 to m do 
    begin
      mt[i, j].q_curr := i;
      mt[i, j].a_curr := abc[j];
    end;
  mt[1, 0].a_new := ' ';
  mt[1, 0].move := 'r';
  mt[1, 0].q_next := 2;
  mt[1, 1].a_new := ' ';
  mt[1, 1].move := 'r';
  mt[1, 1].q_next := 3;
  mt[1, 2].a_new := lambda;
  mt[1, 2].move := 's';
  mt[1, 2].q_next := 0;  
  mt[2, 0].a_new := '0';
  mt[2, 0].move := 'r';
  mt[2, 0].q_next := 2; 
  mt[2, 1].a_new := '1';
  mt[2, 1].move := 'r';
  mt[2, 1].q_next := 2;
  mt[2, 2].a_new := lambda;
  mt[2, 2].move := 'r';
  mt[2, 2].q_next := 4; 
  mt[3, 0].a_new := '0';
  mt[3, 0].move := 'r';
  mt[3, 0].q_next := 3; 
  mt[3, 1].a_new := '1';
  mt[3, 1].move := 'r';
  mt[3, 1].q_next := 3;
  mt[3, 2].a_new := lambda;
  mt[3, 2].move := 'r';
  mt[3, 2].q_next := 5;  
  mt[4, 0].a_new := '0';
  mt[4, 0].move := 'r';
  mt[4, 0].q_next := 4; 
  mt[4, 1].a_new := '1';
  mt[4, 1].move := 'r';
  mt[4, 1].q_next := 4;
  mt[4, 2].a_new := '0';
  mt[4, 2].move := 'l';
  mt[4, 2].q_next := 6;
  mt[5, 0].a_new := '0';
  mt[5, 0].move := 'r';
  mt[5, 0].q_next := 5;
  mt[5, 1].a_new := '1';
  mt[5, 1].move := 'r';
  mt[5, 1].q_next := 5;
  mt[5, 2].a_new := '1';
  mt[5, 2].move := 'l';
  mt[5, 2].q_next := 7;
  mt[6, 0].a_new := '0';
  mt[6, 0].move := 'l';
  mt[6, 0].q_next := 6;
  mt[6, 1].a_new := '1';
  mt[6, 1].move := 'l';
  mt[6, 1].q_next := 6;
  mt[6, 2].a_new := lambda;
  mt[6, 2].move := 'l';
  mt[6, 2].q_next := 8;
  mt[7, 0].a_new := '0';
  mt[7, 0].move := 'l';
  mt[7, 0].q_next := 7;
  mt[7, 1].a_new := '1';
  mt[7, 1].move := 'l';
  mt[7, 1].q_next := 7;
  mt[7, 2].a_new := lambda;
  mt[7, 2].move := 'l';
  mt[7, 2].q_next := 9; 
  mt[8, 0].a_new := '0';
  mt[8, 0].move := 'l';
  mt[8, 0].q_next := 8;
  mt[8, 1].a_new := '1';
  mt[8, 1].move := 'l';
  mt[8, 1].q_next := 8;
  mt[8, 2].a_new := '0';
  mt[8, 2].move := 'r';
  mt[8, 2].q_next := 1;  
  mt[9, 0].a_new := '0';
  mt[9, 0].move := 'l';
  mt[9, 0].q_next := 9;
  mt[9, 1].a_new := '1';
  mt[9, 1].move := 'l';
  mt[9, 1].q_next := 9;
  mt[9, 2].a_new := '1';
  mt[9, 2].move := 'r';
  mt[9, 2].q_next := 1;  
end;

procedure vvod_mt(var mt: s; abc: alphabet );
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 0 to m do 
    begin
      mt[i, j].q_curr := i;
      writeln('q[next]=');
      readln(mt[i, j].q_next);
      writeln('move = ');
      readln(mt[i, j].move);
      mt[i, j].a_curr := abc[j];
      writeln(mt[i, j].a_curr);
      writeln('mt[i,j].a_new =');
      readln(mt[i, j].a_new); end;
  end;
end;

procedure moving(var l: list; m: char);
begin
  if (m = 'l') then pred(l);
  if (m = 'r') then next(l); 
end;

function f(ch: char; abc: alphabet): integer;
//индекс символа в алфавите
var
  j: integer;
begin
  for j := 0 to m do
    if abc[j] = ch then result := j;
end;

procedure q(var l: list; var i, j: integer; mt: s; abc: alphabet);
var
  k: integer;
  y: u;
begin
  y := l.current;
  if l.current^.next^.data = 'n' then in_end(l, lambda);
  l.current := y;
  l.current^.data := mt[i, j].a_new;
  moving(l, mt[i, j].move);
  k := f(l.current^.data, abc);
  i := mt[i, j].q_next; 
  j := k;
  if (i > 0) then
    q(l, i, j, mt, abc) else writeln('final state');
end;

begin
end. 
