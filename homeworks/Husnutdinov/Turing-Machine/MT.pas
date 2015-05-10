unit MT;

interface

uses
  UDouble;

const
  lambda = ' ';
  n = 3;
  m = 10;

type
  alphabet = array [0..m] of char;
  state = record
    q_curr: integer;
    a_curr: char;
    q_next: integer;
    move: char;
    a_new: char;
  end;
  s = array [0..n, 0..m] of state;

procedure print_mt(mt: s);
procedure q(var l: tDoubleList; var i, j: integer; mt: s; abc: alphabet);
procedure moving(var l: tDoubleList; m: char);
procedure multiplication(var mt: s; abc: alphabet);
procedure inputAlphabet(var abc: alphabet);
function number_ch(ch: char): integer;
procedure check(var l: tDoubleList);

implementation

procedure inputAlphabet(var abc: alphabet);
var
  i: integer;
  st: string;
begin
  for i := 0 to m - 1 do 
  begin
    st := intToStr(i);
    abc[i] := st[1];
  end;
  abc[10] := lambda;
end;

//Процедура умножения на 2
procedure multiplication(var mt: s; abc: alphabet); 
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 0 to m do 
    begin
      mt[i, j].q_curr := i;
      mt[i, j].a_curr := abc[j];
    end;
  
  //Перемещаем каратку в конец числа.
  mt[1, 0].a_new := '0';
  mt[1, 0].move := 'r';
  mt[1, 0].q_next := 1;
  
  mt[1, 1].a_new := '1';
  mt[1, 1].move := 'r';
  mt[1, 1].q_next := 1;
  
  mt[1, 2].a_new := '2';
  mt[1, 2].move := 'r';
  mt[1, 2].q_next := 1;  
  
  mt[1, 3].a_new := '3';
  mt[1, 3].move := 'r';
  mt[1, 3].q_next := 1; 
  
  mt[1, 4].a_new := '4';
  mt[1, 4].move := 'r';
  mt[1, 4].q_next := 1;
  
  mt[1, 5].a_new := '5';
  mt[1, 5].move := 'r';
  mt[1, 5].q_next := 1;
  
  mt[1, 6].a_new := '6';
  mt[1, 6].move := 'r';
  mt[1, 6].q_next := 1;  
  
  mt[1, 7].a_new := '7';
  mt[1, 7].move := 'r';
  mt[1, 7].q_next := 1;  
  
  mt[1, 8].a_new := '8';
  mt[1, 8].move := 'r';
  mt[1, 8].q_next := 1;
  
  mt[1, 9].a_new := '9';
  mt[1, 9].move := 'r';
  mt[1, 9].q_next := 1;
  
  mt[1, 10].a_new := lambda;
  mt[1, 10].move := 'l';
  mt[1, 10].q_next := 2;
  
  //Цифры от 0 до 4 умножаем без запоминания 1.
  mt[2, 0].a_new := '0';
  mt[2, 0].move := 'l';
  mt[2, 0].q_next := 2;
  
  mt[2, 1].a_new := '2';
  mt[2, 1].move := 'l';
  mt[2, 1].q_next := 2;
  
  mt[2, 2].a_new := '4';
  mt[2, 2].move := 'l';
  mt[2, 2].q_next := 2;
  
  mt[2, 3].a_new := '6';
  mt[2, 3].move := 'l';
  mt[2, 3].q_next := 2;
  
  mt[2, 4].a_new := '8';
  mt[2, 4].move := 'l';
  mt[2, 4].q_next := 2;
  
  //Цифры от 5 до 9 - запоминаем 1 и прибавляем на следующем шаге.
  mt[2, 5].a_new := '0';
  mt[2, 5].move := 'l';
  mt[2, 5].q_next := 3;
  
  mt[2, 6].a_new := '2';
  mt[2, 6].move := 'l';
  mt[2, 6].q_next := 3;  
  
  mt[2, 7].a_new := '4';
  mt[2, 7].move := 'l';
  mt[2, 7].q_next := 3;  
  
  mt[2, 8].a_new := '6';
  mt[2, 8].move := 'l';
  mt[2, 8].q_next := 3;
  
  mt[2, 9].a_new := '8';
  mt[2, 9].move := 'l';
  mt[2, 9].q_next := 3;
  
  //Заканчиваем программу,когда встречаем пустой символ.
  mt[2, 10].a_new := lambda;
  mt[2, 10].move := 's';
  mt[2, 10].q_next := 0;
  
  //Цифры от 0 до 4 - после избавления от 1 ничего не запоминаем.
  mt[3, 0].a_new := '1';
  mt[3, 0].move := 'l';
  mt[3, 0].q_next := 2;
  
  mt[3, 1].a_new := '3';
  mt[3, 1].move := 'l';
  mt[3, 1].q_next := 2;
  
  mt[3, 2].a_new := '5';
  mt[3, 2].move := 'l';
  mt[3, 2].q_next := 2;
  
  mt[3, 3].a_new := '7';
  mt[3, 3].move := 'l';
  mt[3, 3].q_next := 2;
  
  mt[3, 4].a_new := '9';
  mt[3, 4].move := 'l';
  mt[3, 4].q_next := 2;
   
  //Цифры от 5 до 9 - после избавления от 1,запоминаем эту 1.
  mt[3, 5].a_new := '1';
  mt[3, 5].move := 'l';
  mt[3, 5].q_next := 3;
  
  mt[3, 6].a_new := '3';
  mt[3, 6].move := 'l';
  mt[3, 6].q_next := 3;
  
  mt[3, 7].a_new := '5';
  mt[3, 7].move := 'l';
  mt[3, 7].q_next := 3;
  
  mt[3, 8].a_new := '7';
  mt[3, 8].move := 'l';
  mt[3, 8].q_next := 3;
  
  mt[3, 9].a_new := '9';
  mt[3, 9].move := 'l';
  mt[3, 9].q_next := 3;
  
  //Заканчиваем программу,когда встречаем пустой символ.
  mt[3, 10].a_new := '1';
  mt[3, 10].move := 's';
  mt[3, 10].q_next := 0;
end;


function number_ch(ch: char): integer; // номер символа в алфавите
begin
  if ch = lambda then result := 10 else
    result := ord(ch) - 48;
end;

procedure moving(var l: tDoubleList; m: char);
begin
  if (m = 'l') then prev(l);
  if (m = 'r') then next(l); 
end;

procedure check(var l: tDoubleList); // добавление пустого символ за конечным элементом
var
  y: pElement;
begin
  y := l.current;
  if l.current^.next^.data = 'n' then to_end(l, lambda);
  if l.current^.prev^.data = 'n' then to_begin(l, lambda);
  l.current := y;
end;

procedure q(var l: tDoubleList; var i, j: integer; mt: s; abc: alphabet);
var
  k: integer;
begin
  check(l);
  l.current^.data := mt[i, j].a_new;
  moving(l, mt[i, j].move);
  k := number_ch(l.current^.data);
  i := mt[i, j].q_next; 
  j := k;
  if (i <> 0) then
    q(l, i, j, mt, abc) else writeln('Rezult');
end;

procedure print_MT(mt: s);
var
  i, j: integer;
begin
  writeln;
  writeln('State table');
  write('   ');
  for i := 0 to m do write(mt[1, i].a_curr, '       ');
  writeln();
  for i := 1 to n do
  begin
    write(mt[i, j].q_curr, '  ');
    for j := 0 to m do 
      write(mt[i, j].a_new, ' ', mt[i, j].move, ' ', mt[i, j].q_next, '   ');
    writeln();
  end;
end;

begin
end. 
