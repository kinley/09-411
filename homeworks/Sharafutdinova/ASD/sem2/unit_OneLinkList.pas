unit OneLinkList;

interface

type
  inf = integer;
  u = ^element;
  element = record
    data: inf;
    next: u;
  end;
  list = record
    head, current, last: u;
    size: integer;
  end;

procedure create(var l: list; a: inf);
procedure in_list(var l: list; a: inf);
procedure print(l: list);
procedure next(var l: list);
procedure del_next(var l: list);

implementation

procedure next(var l: list);
begin
  if l.current^.next <> nil then l.current := l.current^.next
  else writeln('last');
end;

procedure print(l: list);
begin
  l.current := l.head^.next;
  if l.current = l.last then writeln('empty') else
    while l.current <> l.last do
    begin
      write(l.current^.data, ' ');
      next(l);
    end;
end;

procedure create(var l: list; a: inf);
begin
  new(l.current);
  new(l.head);
  new(l.last);
  l.last^.next := nil;
  l.current^.next := l.last;
  l.current^.data := a;
  l.head^.next := l.current;
  l.size := 1;
end;

procedure del_next(var l: list);
begin
  l.current^.next := l.current^.next^.next;
  l.size := l.size - 1;
end;

procedure in_list(var l: list; a: integer);
begin
  new(l.current^.next);
  l.current^.next^.data := a; 
  l.current^.next^.next := l.last;
  l.current := l.current^.next;
  l.size := l.size + 1;
end;

begin
end. 
