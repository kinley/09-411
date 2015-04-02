program insertionBeforeZ;
  uses
    myList;
  
  var
    list: tList;
  
  procedure textToList(var l: tList);
    var
      f: text;
      s: string[20];
    
  Begin
    createList(l);
    assign(f, 'words.txt');
    reset(f);
    while not eof(f) do
      begin
        readln(f, s);
        addLast(l, initElem(s));
      end;
    close(f);
  End;
  
  procedure insertion(var l: tList);
    var
      w: string[1];
    
  Begin
    reset(l);
    while not eol(l) do
      begin
        w := getCurr(l);
        if w = 'z' then
          begin
            prev(l);
            addAfterCurr(l, initElem('; '));
            next(l);
            next(l);
          end;
        next(l);
      end;
  End;

BEGIN
  textToList(list);
  insertion(list);
  printList(list);
END.
 {should i use a doubly linked list? this program uses my singly linked
 UPD: i didn't know that you've wrote the unit on a last lesson.
 actually, it still uses my unit, because it's almost like yours}