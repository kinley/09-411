unit myList;
interface
  type
    tValue = string[20];
    pPointer = ^tElement;
    tElement = record
                value: tValue;
                next: pPointer;
               end;
    tList = record
              pFirst, pLast, pCurr: pPointer;
            end;
  
  procedure createList(var list: tList);
  function initElem(val: tValue): pPointer;
  
  procedure addFirst(var list: tList; elem: pPointer);
  procedure addAfterCurr(var list: tList; elem: pPointer);
  procedure addLast(var list: tList; elem: pPointer);
  
  procedure reset(var list: tList);
  function getCurr(list: tList): tValue;
  function eol(list: tList): boolean;
  procedure prev(var list: tList);
  procedure next(var list: tList);
  function emptyList(list: tList): boolean;
  procedure printList(list: tList);

implementation
  procedure createList;
    var
      p: pPointer;
    
  Begin
    new(p);
    p^.value := ' ';
    p^.next := nil;
    list.pFirst := p;
    list.pLast := p;
  End;
  
  function initElem: pPointer;
    var
      p: pPointer;
    
  Begin
    new(p);
    p^.value := val;
    p^.next := nil;
    result := p;
  End;
  
  procedure addFirst;
  Begin
    elem^.next := list.pFirst^.next;
    list.pFirst^.next := elem;
  End;
  
  procedure addAfterCurr;
  Begin
    elem^.next := list.pCurr^.next;
    list.pCurr^.next := elem;
  End;
  
  procedure addLast;
  Begin
    list.pLast^.next := elem;
    list.pLast := elem;
  End;
  
  function getCurr: tValue;
  Begin
    result := list.pCurr^.value;
  End;
  
  procedure reset;
  Begin
    list.pCurr := list.pFirst^.next;
  End;
  
  function eol: boolean;
  Begin
    result := list.pCurr = nil;
  End;
  
  procedure prev;
    var
      p: pPointer;
  Begin
    p := list.pCurr;
    list.pCurr := list.pFirst;
    while list.pCurr^.next <> p do next(list);
  End;
  
  procedure next;
  Begin
    list.pCurr := list.pCurr^.next;
  End;
  
  function emptyList: boolean;
  Begin
    result := list.pFirst^.next = nil;
  End;
  
  procedure printList;
  Begin
    reset(list);
    while not eol(list) do
      begin
        write(getCurr(list), ' ');
        next(list);
      end;
  End;

END.