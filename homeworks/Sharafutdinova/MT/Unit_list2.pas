unit list2;

interface

type
  u = ^element;
  element = record
    data: char;
    next, pred: u;
  end;
  list = record
    head, current, last: u;
    size: integer;
  end;

procedure first(var l: list; a: char);
procedure in_end(var l: list; a: char);
procedure in_begin(var l: list; a: char);
procedure print(l: list);
procedure next(var l: list);
procedure pred(var l: list);

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

procedure print(l: list);
begin
  l.current := l.head^.next;
  while l.current <> l.last do
  begin
    write(l.current^.data, ' ');
    next(l);
  end;
  writeln();
end;

procedure first(var l: list; a: char);
begin
  new(l.current);
  new(l.last);
  new(l.head);
  l.last^.data := 'n';
  l.head^.data := 'n';
  l.current^.data := a;
  l.current^.next := l.last;
  l.current^.pred := l.head;
  l.head^.next := l.current;
  l.last^.pred := l.current;
  l.size := 1;
end;

procedure in_end(var l: list; a: char);
begin
  l.current := l.last^.pred;
  new(l.current^.next);
  l.current^.next^.data := a;           
  l.current^.next^.pred := l.current;   
  l.current^.next^.next := l.last; 
  l.last^.pred := l.current^.next;
  l.size := l.size + 1;
end;

procedure in_begin(var l: list; a: char);
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
