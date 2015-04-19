Unit UTM;

Interface

Uses UDLL;

const
  CN = 10;
  
type
  tAlphabet = 0..1;
  tMove = char;
  tIndex = 0..CN;
  
  tState = record
    a: tAlphabet;
    m: tMove;
    q: tIndex;
  end;
    
  tTransitions = array[tIndex, tAlphabet] of tState;
  
  tTM = record
    a: tAlphabet;
    m: tMove;
    tr: tTransitions;
    current: tState;
    list: tDoubleList;
  end;

function state(a: tAlphabet; m: tMove; q: tIndex): tState;
procedure startTM(var TM: tTM);

Implementation

function state(a: tAlphabet; m: tMove; q: tIndex): tState;
var
  state: tState;
begin
  state.a := a;
  state.m := m;
  state.q := q;
  result := state;
end;
  
procedure move(var list: tDoubleList; m: tMove);
begin
  if m = 'L' then
    prev(list)
  else
  if m = 'R' then
    next(list);
end;

procedure startTM(var TM: tTM);
var
  temp: tData;
begin
  TM.current.q := 1;
  reset(TM.list);
  while TM.current.q <> 0 do
  begin
    pushBack(TM.list, TM.tr[TM.current.q, TM.list.current^.data].a);
    temp := TM.list.current^.data;
    move(TM.list, TM.tr[TM.current.q, TM.list.current^.data].m);
    TM.current.q := TM.tr[TM.current.q, temp].q;
  end;
end;

end.