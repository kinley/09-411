program tuna ( input, output );// Task
{ База данных законодателей (legislator) }
uses
  Tool, Convert, Data;

var
  command: char; 
  legislator: nametype;
  goodguys, badguys: DICTIONARY;

procedure favor(friend: nametype );{ заносит имя friend (друг) в список goodguys и вычеркивает из списка badguys } 
begin
  INSERT(friend, goodguys); 
  DELETE(friend, badguys);
end;{ favor } 

procedure unfavor(foe: nametype);{ заносит имя fое (враг) в список badguys вычеркивает из списка gиodguys}
begin
  INSERT(foe, badguys); 
  DELETE(foe, goodguys); 
end;{ unfavor } 

procedure report(subject: nametype );{печать имени subject с соответспзуюшегг характеристикой} 
begin
  if MEMBER(subject, goodguys) then 
    writeln(subject, ' — это друг') 
  else 
  if MEMBER(subject, badguys) then 
    writeln(subject, ' — это враг ')
  else 
    writeln('Нет данных о ', subject)
end;{ report }

begin{ main program }
  MAKENULL(goodguys);
  MAKENULL(badguys);
  read(command);
  while command <> 'E' do 
  begin
    readline(legislator); 
    if command = 'F' then favor(legislator) 
    else 
    if command = 'U' then unfavor(legislator) 
    else 
    if command = '?' then report(legislator) 
    else writeln('Неизвестная команда');
    read(command)
  end
end.