type
  u = ^element;
  element = record
    data: char;
    next: u;
  end;
  Tlist = record
    head, current, last: u;
  end;
  znaki = '*'..'/';
  abc = 'a'..'z';
  skobki = '('..')';

var
  a: set of abc;
  b: set of znaki;
  c: set of skobki;
  ysl: boolean;
  list: Tlist;
  list1: Tlist;
  st: string;

procedure first_el(var list: Tlist);
begin
  new(list.head);
  list.head^.data := '0';
  list.last := nil;
  list.head^.next := list.last;
  list.current := list.head;
end;


procedure in_list(var list: Tlist; a: char);
begin
  new(list.current^.next);
  list.current^.next^.data := a; 
  list.current^.next^.next := list.last;
  list.current := list.current^.next;
end;

procedure print(list: Tlist);
begin
  list.current := list.head^.next;
  while list.current <> list.last do 
  begin
    write(list.current^.data, ' ');
    list.current := list.current^.next;
  end;
end;

function inhere
  (ch: char; a: set of abc; b: set of znaki; c: set of skobki): boolean;
begin
  if (ch in a) or (ch in b) or (ch in c) 
    then result := true else result := false;
end;

procedure st_in_list(var st: string; var list: Tlist; var ysl: boolean);
var
  ch: char;
begin
  ysl := true;
  while (length(st) > 0) and (ysl = true) do 
  begin
    ch := st[1];
    delete(st, 1, 1);
    in_list(list, ch);
    ysl := inhere(ch, a, b, c);
  end;
  if ysl = false then writeln('error');
end;

procedure new_list(var list1: Tlist; list: Tlist; a: set of abc; b: set of znaki);
begin
  list.current := list.head;
  while list.current <> list.last do 
  begin
    if list.current^.data = '(' then in_list(list1, '0')
    else if list.current^.data = ')' then in_list(list1, '1')
    else if list.current^.data in b then in_list(list1, '2')
    else if list.current^.data in a then in_list(list1, '3');
    list.current := list.current^.next;
  end;
end;

begin
  a := ['a'..'z'];
  b := ['*', '+', '-', '/'];
  c := ['(', ')'];
  first_el(list);
  first_el(list1);
  readln(st);
  st_in_list(st, list, ysl);
  if ysl = true then begin
    new_list(list1, list, a, b);
    print(list); 
    print(list1)
  end;
end.
