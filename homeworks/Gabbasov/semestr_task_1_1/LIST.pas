UNIT LIST;
Interface
USES DATA;
TYPE
  PPOINTER = ^Telement;  
  Telement = record    
    data: Tdata;
    next: PPOINTER;
  end;
  Tlist = record
    phead: PPOINTER;
    ptail: PPOINTER;
    pcurrent: PPOINTER;   
    size: cardinal;
  end;

procedure create_element(data: Tdata; var P: PPOINTER);
procedure delete(var list : Tlist);
procedure create_list(var list: Tlist);
procedure erase_list(var list: Tlist);
procedure destroy_list(var list: Tlist);
function is_list_Empty(list: Tlist) : Boolean;
function eofList(list: Tlist): Boolean;
function size_of_list(list: Tlist) : cardinal;
procedure append(var list : Tlist; data : Tdata);
procedure add_as_first(var list : Tlist; data : Tdata);
function get(var list : Tlist) : Tdata;
procedure reset(var list: Tlist);
procedure next(var list: Tlist);
procedure print_list(var list: Tlist);

Implementation
procedure create_element(data: Tdata; var P: PPOINTER);
BEGIN
  new(P);
  P^.data := data;  
  P^.next := nil;  
END;
procedure delete(var list : Tlist);
VAR
  p : PPOINTER;
BEGIN  
  p := list.pcurrent;
  list.pcurrent := list.phead;
  while list.pcurrent^.next <> p do begin
                                      next(list);
                                    end;
  list.pcurrent^.next := p^.next;
  dispose(p);  
  dec(list.size);
END;
procedure create_list(var list: Tlist);
var
  P: PPOINTER;
  data: Tdata;
BEGIN
  data.coeff := Tdata_empty_value1;
  data.exp := Tdata_empty_value2;
  create_element(data,P);
  list.phead := P;
  list.ptail := P;
  list.size := 0;  
END;
procedure erase_list(var list: Tlist);
BEGIN
  reset(list); //write(list.phead,' ',list.phead^.next,' '); writeln(list.pcurrent,' ');
  while not eofList(list) do begin
                               delete(list); //write(list.pcurrent,' ');
                               next(list); //writeln(list.pcurrent,' ');
                             end;
  list.ptail := list.phead; 
  list.pcurrent := list.phead;
  list.size := 0;
END;
procedure destroy_list(var list: Tlist);
BEGIN  
  erase_list(list);  
  dispose(list.phead);  
END;
function is_list_Empty(list: Tlist) : Boolean;
BEGIN
  result := list.size = 0
END;
function eofList(list: Tlist): Boolean;
BEGIN
  result := list.pcurrent = nil;
END;
function size_of_list(list: Tlist) : cardinal;
BEGIN
  result := list.size;
END;
procedure append(var list : Tlist; data : Tdata);
VAR
  p : PPOINTER;
BEGIN
  create_element(data,p);
  list.ptail^.next := p;
  list.ptail := p;
  inc(list.size);
END;
procedure add_as_first(var list : Tlist; data : Tdata);
VAR
  p : PPOINTER;
BEGIN
  create_element(data,p);
  p^.next := list.phead^.next;
  list.phead^.next := p;
  inc(list.size);
END;
function get(var list : Tlist) : Tdata;
VAR
  d : Tdata;
BEGIN
  d := list.pcurrent^.data;
  delete(list);
  result := d;
END;
procedure reset(var list: Tlist);
BEGIN
  list.pcurrent := list.phead^.next;
END;
procedure next(var list: Tlist);
BEGIN
  list.pcurrent := list.pcurrent^.next;
END;
procedure print_list(var list: Tlist);
VAR
  p : PPOINTER;
BEGIN
  p := list.pcurrent;
  reset(list);
  while not eofList(list) do begin
                               write(list.pcurrent^.data,' ');
                               next(list);
                             end;
  list.pcurrent := p;
END;
END.