label fin,start;
type mas=array[1..99431] of string;
var i,j,n,l,error:integer;
	b:boolean;
	dict:mas;
	dictionary:text;
	inp,answer,worda,wordd:string;
	
procedure deleteword(var dict:mas;var n,wrdnum:integer);
var i:integer;
begin
	for i:=wrdnum to n do dict[i]:=dict[i+1];
	n:=n-1
end;

function chrs(s,t:string):integer;
var i:integer;
begin
	chrs:=0;
	for i:=1 to length(s)-length(t)+1 do
	begin
		if t=copy(s,i,length(t)) then inc(chrs);
	end
end;

function hyp(w:string):integer;
var i:integer;
begin
	hyp:=0;
	for i:=1 to length(w) do
	if w[i]='-' then hyp:=hyp+1;
end;

begin
	writeln('Доброго Вам времени суток, Пользователь.');
	writeln('Добро пожаловать в решалку "4 фото 1 слово".');
	writeln;
	writeln('Прошу обратить внимание, что не стоит полностью');
	writeln('полагаться на программу, т.к. в стоковом словаре имеются');
	writeln('далеко не все слова русского языка.');
	writeln('Программа рассчитана для кодировки UTF-8.');
	writeln;
	writeln('Следуйте указаниям программы, чтобы отгадать слово.');
	writeln;
	writeln('Для выхода наберите "Выход" в любое время.');
	writeln;
	start:
	n:=0;
	error:=0;
	assign(dictionary, 'REVERSE.TXT');
	repeat
		repeat
			write('	Количество символов: ');
			readln(inp);
			if (inp='выход')or(inp='Выход') then
				goto fin
			else val(inp,l,error);
			if error<>0 then writeln('		Ошибка. Повторите попытку.');
		until error=0;
		if (l>12)or(l<=0) then writeln('		Символов больше 0 и не больше 12-и! Повторите попытку');
	until (l<=12)and(l>0);
	reset(dictionary);
	while not eof(dictionary) do
	begin
		readln(dictionary,wordd);
		if length(wordd)+chrs(wordd,'-')=2*l then //тут мы поступаем так, т.к. русские буквы в юникоде паскаль определяет, как 2 символа
		begin
			n:=n+1;
			dict[n]:=wordd;
		end;
	end;
	close(dictionary);
	for i:=1 to n do
		for j:=1 to length(dict[i])+3 do
			if dict[i,j]='-' then
			begin
				delete(dict[i],j,1);
				insert('00',dict[i],j)
			end;
	repeat
		writeln('		Для отмены введите "Отмена" в поле "Доступные символы"');
		write('	Доступные символы (строчными буквами): ');
		readln(worda);
		if (worda='выход')or(worda='Выход') then goto fin;
		if (worda='отмена')or(worda='Отмена') then goto start;
		for i:=1 to length(worda)+3 do
			if worda[i]='-' then
			begin
				delete(worda,i,1);
				insert('00',worda,i)
			end;
		if length(worda)<>24 then writeln('		Символов должно быть 12! Повторите попытку.')
	until length(worda)=24;
	i:=1;
	while i<=n do
	begin
		j:=1;
		b:=true;
		while (j<=length(dict[i]))and(b) do
		begin
			if chrs(dict[i],dict[i,j]+dict[i,j+1])>chrs(worda,dict[i,j]+dict[i,j+1]) then
			begin
				deleteword(dict,n,i);
				b:=false;
			end;
			j:=j+2
		end;
		if b then inc(i);
	end;
	for i:=1 to n do
		for j:=1 to length(dict[i])-1 do
			if dict[i,j]+dict[i,j+1]='00' then
			begin
				delete(dict[i],j,2);
				insert('-',dict[i],j)
			end;
	if n>0 then
	begin
		writeln('		Возможные варианты:');
		for i:=1 to n do writeln('			',dict[i]);
	end else
		writeln('	Нет вариантов решения. Проверьте правильность введеных данных.');
	repeat
		write('Введите "Далее", чтобы продолжить: ');
		readln(answer);
		if (answer<>'Далее')and(answer<>'далее')and(answer<>'Выход')and(answer<>'выход') then writeln('Неизвестная команда. Повторите попытку.')
	until (answer='Далее')or(answer='далее')or(answer='Выход')or(answer='выход');
	if (answer='Далее')or(answer='далее') then
	begin
		writeln('------------------------------------------------------------------------------');
		goto start
	end;
	fin:
	writeln;
	writeln('Всего доброго!');
end.
