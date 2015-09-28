unit myList;

interface

type pPointer = ^tComponent;
     
     tInfo = integer;
     
     tComponent = record
                  info: tInfo;
                  next: pPointer;
                  end;
          tList = record
                  pHead: pPointer;
                  pCurrent: pPointer;
                  end;
                  
procedure AddElement(var list: tList; element: tInfo);
procedure FindElement(var list: tList; element: tInfo);
procedure DeleteElement(var list: tList; pElement: pPointer);
procedure CleanList(var list: tList);
procedure ShowList(list: tList);

implementation

procedure AddElement(var list: tList; element: tInfo);
var pElement: pPointer;
begin
new(pElement);
pElement^.info:= element;
pElement^.next:= nil;

if list.pHead <> nil then begin
                     list.pCurrent:= list.pHead;
                     while list.pCurrent^.next <> nil do list.pCurrent:= list.pCurrent^.next;                     
                     list.pCurrent^.next := pElement;
                     end
                     else list.pHead:= pElement;

list.pCurrent:= pElement;
end;

procedure FindElement(var list: tList; element: tInfo);
var flag: boolean;
begin
flag:= false;
list.pCurrent:= list.pHead;

while (list.pCurrent <> nil) and (not flag) do begin
                                               if list.pCurrent^.info = element then flag:=true else list.pCurrent:= list.pCurrent^.next;
                                               end;
end;

procedure PreviousElement(var list: tList);
var pElement: pPointer;
begin
pElement:= list.pCurrent;
list.pCurrent:= list.pHead;
while list.pCurrent^.next <> pElement do list.pCurrent:= list.pCurrent^.next;
end;

procedure DeleteElement(var list: tList; pElement: pPointer);
begin
if pElement = list.pHead then begin
                              list.pHead:= pElement^.next;
                              pElement^.next:= nil;
                              dispose(pElement);
                              exit;
                              end

else if pElement^.next = nil then begin
                             list.pCurrent:= list.pHead;
                             while (list.pCurrent^.next <> pElement) do list.pCurrent:= list.pCurrent^.next;
                             list.pCurrent^.next:= nil;
                             dispose(pElement);                             
                             exit;
                             end else begin
                                      list.pCurrent:= list.pHead;
                                      while (list.pCurrent^.next <> pElement) do list.pCurrent:= list.pCurrent^.next;
                                      list.pCurrent^.next:= pElement^.next;
                                      dispose(pElement);
                                      end;
end;

procedure CleanList(var list: tList);
var pElement: pPointer;
begin
if list.pHead <> nil then begin
                          list.pCurrent:= list.pHead;
                     
                          while list.pCurrent <> nil do begin
                                                        pElement:= list.pCurrent;
                                                        list.pCurrent:= list.pCurrent^.next;
                                                        dispose(pElement);
                                                        end;
                     
                          list.pHead:= nil;
                          end;
end;

procedure ShowList(list: tList);
begin
if list.pHead = nil then writeln('Список пуст.') else begin
                                                      list.pCurrent:= list.pHead;
                                                      while list.pCurrent <> nil do begin
                                                                                    writeln(list.pCurrent^.info);
                                                                                    list.pCurrent:= list.pCurrent^.next;                                                                          
                                                                                    end;
                                                      end;
end;

end.
