program Pr1;

uses
  crt;

var
  k, n, m, tmp: integer; {Пока m>=n мы проверяем, делится ли m без остатка на n, и если делится, 
  то присваиваем K временной переменной tmp, которая запоминает количество итераций нашего цикла.
  m = m/n (тут тонкость! m - целое число, поэтому можно использовать какое нибудь real = нашему m. tmp увеличивает итерацию. выводим}
  md: real;

begin
  clrscr;
  tmp := 1;
  writeln('VVedite m and n');
  readln(m, n);
  md := m;
  while md >= n do 
  begin
    if m mod n = 0 then k := tmp;
    md := md / n;
    inc(tmp);
  end;
  writeln(k);
  readln();
end.