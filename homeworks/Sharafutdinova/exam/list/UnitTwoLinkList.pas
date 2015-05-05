unit TwoLinkList;

interface

type
  inf = record
    x, y: real;
  end;
  u = ^element;
  element = record
    data: inf;
    next, pred: u;
  end;
  list = record
    head, current, last: u;
    size: integer;
  end;

procedure create(var l: list; a: inf);
procedure in_end(var l: list; a: inf);
procedure in_begin(var l: list; a: inf);
procedure print(l: list);
procedure next(var l: list);
procedure pred(var l: list);
procedure insert_between(var l: list; x: inf);
procedure del_cur(var l: list);

implementation

procedure next(var l: list);
begin
  if l.current^.next <> nil then l.current := l.current^.next
  else writeln('last');
end;

procedure pred(var l: list);
begin
  if l.current^.pred <> nil then l.current := l.current^.pred
  else writeln('first');
end;

procedure insert_between(var l: list; x: inf);
var
  y: u;
begin
  if l.current^.next = nil then in_end(l, x) else
  if l.current^.pred = nil then in_begin(l, x) else
  begin
    new(y);
    y^.data := x;
    y^.next := l.current;
    y^.pred := l.current^.pred;
    l.current^.pred^.next := y;
    l.current^.pred := y; 
  end;
end;

procedure print(l: list);
begin
  l.current := l.head^.next;
  if l.current = l.last then writeln('pystoi') else
    while l.current <> l.last do
    begin
      write(l.current^.data.x, ' ',l.current^.data.y,'   ');
      next(l);
    end;
  writeln();
end;

procedure create(var l: list; a: inf);
begin
  new(l.current);
  new(l.head);
  new(l.last);
  l.last^.next := nil;
  l.head^.pred := nil;
  l.current^.next := l.last;
  l.current^.pred := l.head;
  l.current^.data := a;
  l.head^.next := l.current;
  l.last^.pred := l.current;
  l.size := 1;
end;

procedure del_cur(var l: list);
begin
  l.current := l.current^.next;
  l.current^.pred := l.current^.pred^.pred;
  l.current^.pred^.next := l.current;
end;

procedure in_end(var l: list; a: inf);
begin
  l.current := l.last^.pred;
  new(l.current^.next);
  l.current^.next^.data := a;           
  l.current^.next^.pred := l.current;   
  l.current^.next^.next := l.last; 
  l.last^.pred := l.current^.next;
  l.size := l.size + 1;
end;

procedure in_begin(var l: list; a: inf);
begin
  l.current := l.head^.next;
  new(l.current^.pred);
  l.current^.pred^.data := a;
  l.current^.pred^.next := l.current;
  l.current^.pred^.pred := l.head;
  l.head^.next := l.current^.pred;
  l.size := l.size + 1;
end;

begin
end. 
