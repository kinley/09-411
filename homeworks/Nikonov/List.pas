unit List;

interface

const tdata_empty_value1 = 0;
      tdata_empty_value2 = 0;

type tPointer = ^tElement;
                tData = record
                coef: integer;
                exp: cardinal;
                end;
     
     tElement = record    
                data: tData;
                next: tPointer;
                end;
                
     tList = record
             pHead: tPointer;
             pTail: tPointer;
             pCurrent: tPointer;   
             size: cardinal;
             end;

function initElement(data: tData): tPointer;
procedure initList(var list: tList);
function isEmpty(list: tList): boolean;
function eofList(list: tList): boolean;
procedure appendElement(var list: tList; pNewElement: tPointer);
procedure resetList(var list: tList);
procedure readFromList(var list: tList; var data: tData);
procedure printList(var list: tList);
procedure deleteElement(var list : Tlist);

implementation 

procedure deleteElement(var list: tList);
var p : tPointer;
begin
  p := list.pCurrent;
  list.pCurrent := list.pHead;
  while (list.pCurrent^.next <> p) do list.pCurrent := list.pCurrent^.next;
  list.pCurrent^.next := p^.next;
  dispose(p);  
  dec(list.size);
end;

function initElement(data: tData): tPointer;
var p: tPointer;
begin
     new(p);
     p^.data.coef := data.coef;
     p^.data.exp := data.exp;
     p^.next := nil;
     initElement := p;
end;

procedure initList(var list: tList);
var p: tPointer;
    data: tData;
begin
     data.coef := tdata_empty_value1;
     data.exp := tdata_empty_value2;
     p := initElement(data);
     list.pHead := p;
     list.pTail := p;
     list.size := 0;
end;

function isEmpty(list: tList): Boolean;
begin
     isEmpty := (list.size) = 0
end;

function eofList(list: tList): Boolean;
begin
     eofList := (list.pCurrent = nil);
end;

procedure appendElement(var list: tList; pNewElement: tPointer);
begin
     list.pTail^.next := pNewElement;
     list.pTail := pNewElement;
     inc(list.size);
end;

procedure resetList(var list: tList);
begin
     list.pCurrent := list.pHead^.next;
end;

procedure readFromList(var list: tList; var data: tData);
begin
     data := list.pCurrent^.data;  
     list.pCurrent := list.pCurrent^.next;
end;

procedure printList(var list: tList);
var pTempCurrent: tPointer;
begin
     pTempCurrent := list.pCurrent;
     resetList(list);
     while not eoflist(list) do begin
                                write(list.pCurrent^.data.coef, '( x^', list.pCurrent^.data.exp, ' )');
                                if not(eofList(list)) then write(' + ');
                                list.pCurrent := list.pCurrent^.next;
                                
                                end;
     list.pCurrent := pTempCurrent;
end;
end.
