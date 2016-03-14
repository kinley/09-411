unit LIST;

interface

const
  tdata_empty_data_coeff_value = 0;
  tdata_empty_data_exp_value = 0;

type
  PPOINTER = ^Telement;
  Tdata = record
    coeff: integer;
    exp: cardinal;
  end;
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

function initElement(data: Tdata): PPOINTER;
procedure initList(var list: Tlist);
function isEmpty(list: Tlist): boolean;
function eofList(list: Tlist): boolean;
procedure append(var list: Tlist; Pnew_element: PPOINTER);
procedure resetList(var list: Tlist);
procedure read_from_list(var list: Tlist; var data: Tdata);
procedure print(var list: Tlist);

implementation 

function initElement(data: Tdata): PPOINTER;
var
  P: PPOINTER;
begin
  new(P);
  P^.data.coeff := data.coeff;
  P^.data.exp := data.exp;
  P^.next := nil;
  result := P;
end;

procedure initList(var list: Tlist);
var
  P: PPOINTER;
  data: Tdata;
begin
  data.coeff := tdata_empty_data_coeff_value;
  data.exp := tdata_empty_data_exp_value;
  P := initElement(data);
  list.phead := P;
  list.ptail := P;
  list.size := 0;  
end;

function isEmpty(list: Tlist): Boolean;
begin
  result := list.size = 0
end;

function eofList(list: Tlist): Boolean;
begin
  result := list.pcurrent = nil;
end;

procedure append(var list: Tlist; Pnew_element: PPOINTER);
begin
  list.ptail^.next := Pnew_element;
  list.ptail := Pnew_element;
  inc(list.size);
end;

procedure resetList(var list: Tlist);
begin
  list.pcurrent := list.phead^.next;
end;

procedure read_from_list(var list: Tlist; var data: Tdata);
begin
  data := list.pcurrent^.data;  
  list.pcurrent := list.pcurrent^.next;
end;

procedure print(var list: Tlist);
var
  pcurrent: PPOINTER;
begin
  pcurrent := list.pcurrent;
  resetList(list);
  while not eoflist(list) do 
  begin
    write(list.pcurrent^.data.coeff, '(x^', list.pcurrent^.data.exp, ')');
    list.pcurrent := list.pcurrent^.next;
    if not eoflist(list) then write(' + ')
  end;  
  list.pcurrent := pcurrent;
end;
end.
