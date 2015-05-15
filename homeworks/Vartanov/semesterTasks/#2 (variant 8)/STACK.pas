UNIT STACK;
Interface
TYPE
  Tdata = char;
  P = ^Telement;
  Telement = record    
    data: char;
    next: P;
  end;
  Tstack = record
    PHead : P;
    Size : cardinal;
  end;
  
procedure create(var s : Tstack);
procedure destroy(var s : Tstack);
procedure push(var s : Tstack; data : Tdata);
procedure pop(var s : Tstack; var data : Tdata);
function size(s: Tstack) : cardinal;
function empty(s: Tstack) : Boolean;

Implementation
procedure create(var s : Tstack);
VAR
  FANTOM : P;
BEGIN
  new(FANTOM);
  s.PHead := FANTOM;  
  s.Size := 0;
END;
procedure destroy(var s : Tstack);
VAR
  DEL : P;
BEGIN
  while s.PHead <> nil do begin
                            DEL := s.PHead;
                            s.PHead := s.PHead^.next;
                            dispose(DEL);
                          end;
END;
procedure push(var s : Tstack; data : Tdata);
VAR 
  NewComp : P;
BEGIN
  new(NewComp);
  NewComp^.data := data;  
  NewComp^.next := s.PHead^.next;
  s.PHead^.next := NewComp;
END;
procedure pop(var s : Tstack; var data : Tdata);
VAR
  DEL : P;
BEGIN
  data := s.PHead^.next^.data;
  DEL := s.PHead^.next;
  s.PHead^.next := s.PHead^.next^.next;
  dispose(DEL);
END;
function size(s: Tstack) : cardinal;
BEGIN
  result := s.size;
END;
function empty(s: Tstack) : Boolean;
BEGIN
  result := size(s) = 0;
END;
END.