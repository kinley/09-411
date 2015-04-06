UNIT QUEUE;
Interface
USES LIST,DATA;
TYPE
  Tqueue = Tlist;

procedure create(var q : Tqueue);
procedure destroy(var q : Tqueue);
procedure inqueue(var q : Tqueue; data : Tdata);
procedure dequeue(var q : Tqueue; var data : Tdata);

function size(q: Tqueue) : cardinal;
function empty(q: Tqueue) : Boolean;

Implementation

procedure create(var q : Tqueue);
BEGIN
  create_list(q);
END;
procedure destroy(var q : Tqueue);
BEGIN
  destroy_list(q);
END;
procedure inqueue(var q : Tqueue; data : Tdata);
BEGIN
  append(q,data);
END;
procedure dequeue(var q : Tqueue; var data : Tdata);
BEGIN
  reset(q);
  data := get(q);
END;
function size(q: Tqueue) : cardinal;
BEGIN
  result := size_of_list(q);
END;
function empty(q: Tqueue) : Boolean;
BEGIN
  result := is_list_Empty(q);
END;

END.