unit 
  OneLinkList;

interface

type
  inf = integer;
  u = ^element;
  element = record
    data: inf;
    next: u;
  end;
  list_1 = record
    head, current, last: u;
    size: integer;
  end;

procedure create(var l: list_1; a: inf);
procedure in_list(var l: list_1; a: inf);
procedure print(l: list_1);
procedure next(var l: list_1);
procedure del_next(var l: list_1);

implementation

procedure next(var l: list_1);
begin
  if l.current^.next <> nil then l.current := l.current^.next
  else writeln('last');
end;

procedure print(l: list_1);
begin
  l.current := l.head^.next;
  if l.current = l.last then writeln('pystoi') else
    while l.current <> l.last do
    begin
      write(l.current^.data, ' ');
      next(l);
    end;
  writeln();
end;

procedure create(var l: list_1; a: inf);
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

procedure del_next(var l: list_1);
begin
  l.current^.next := l.current^.next^.next;
  l.size := l.size - 1;
end;

procedure in_list(var l: list_1; a: integer);
begin
  new(l.current^.next);
  l.current^.next^.data := a; 
  l.current^.next^.next := l.last;
  l.current := l.current^.next;
  l.size := l.size + 1;
end;

begin
end.
