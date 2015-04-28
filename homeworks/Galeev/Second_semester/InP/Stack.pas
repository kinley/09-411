unit Stack;

  INTERFACE

  const
    CN = 100;
  
  type
    T = integer;
    index = 0..CN;
  
    tStack = record
      data: array[1..CN] of T;
      current: index;
    end;

  procedure push(var s: tStack; el: T);
  procedure empty(var s: tStack);
  function pop(s: tStack): T;

  IMPLEMENTATION  

  procedure push(var s: tStack; el: T);
  begin
    if (s.current < CN) then
    begin
      inc(s.current);
      s.data[s.current] := el;
    end;
  end;

  function isEmpty(s: tStack): boolean;
  begin
    result := not(s.current > 0);
  end;

  function pop(s: tStack): T;
  begin
    if not isEmpty(s) then
    begin
      result := s.data[s.current];
      dec(s.current);
    end
    else
      result := -1;
  end;

  procedure empty(var s: tStack);
  begin
    s.current := 0;
  end;
end.