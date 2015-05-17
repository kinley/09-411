unit queue;
interface
  uses myList;
  
  type
    tQueue = tList;
  
  procedure createQueue(var queue: tQueue);
  procedure destroyQueue(var queue: tQueue);
  
  procedure enqueue(var queue: tQueue; val: tValue);
  procedure dequeue(var queue: tQueue; var val: tValue);
  
implementation
  procedure createQueue;
  Begin
    createList(queue);
  End;
  
  procedure destroyQueue;
  Begin
    destroyList(queue);
  End;
  
  procedure enqueue;
    var
      elem: pPointer;
  Begin
    elem := initElem(val);
    addLast(queue, elem);
  End;
  
  procedure dequeue;
  Begin
    reset(queue);
    deleteCurr(queue);
  End;
END.