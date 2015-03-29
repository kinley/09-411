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

function init_element(data: Tdata): PPOINTER;
procedure init_list(var list: Tlist);
function isEmpty(list: Tlist): boolean;
function eofList(list: Tlist): boolean;
procedure append(var list: Tlist; Pnew_element: PPOINTER);
procedure reset_list(var list: Tlist);
procedure read_from_list(var list: Tlist; var data: Tdata);
procedure print(var list: Tlist);

implementation 

function init_element(data: Tdata): PPOINTER;
var
  P: PPOINTER;
begin
  new(P);
  P^.data.coeff := data.coeff;
  P^.data.exp := data.exp;
  P^.next := nil;
  result := P;
end;
procedure init_list(var list: Tlist);
var
  P: PPOINTER;
  data: Tdata;
begin
  data.coeff := tdata_empty_data_coeff_value;
  data.exp := tdata_empty_data_exp_value;
  P := init_element(data);
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
procedure reset_list(var list: Tlist);
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
  reset_list(list);
  while not eoflist(list) do 
  begin
    write(list.pcurrent^.data.coeff);
    if list.pcurrent^.data.exp <> 0 then begin
                                           write('X^', list.pcurrent^.data.exp);
                                         end;
    list.pcurrent := list.pcurrent^.next;
    if not eoflist(list) then
                           begin
                             if list.pcurrent^.data.coeff > 0 then write('+')                                                              
                           end
  end;  
  list.pcurrent := pcurrent;
end;
end.
