Unit UTM;

Interface

Uses UDLL;

const
  CN = 20;
  
type
  tAlphabet = char;
  tMove = (L, R, N);
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

{procedure initTM(TM: tDoubleList);}
function state(a: tAlphabet; m: tMove; q: tIndex): tState;
procedure startTM(var TM: tTM);

Implementation

{procedure initTM(TM: tDoubleList);
begin
  initList(TM);
  pushBack(TM, '_');
  dec(TM.size);
end;}

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
  case m of
    L: prev(list);
    R: next(list);
    N: 
  else
    write('Incorrect movement.');
  end;
end;

procedure startTM(var TM: tTM);
var
  temp: tData;
begin
  TM.current.q := 1;
  reset(TM.list);
  while (TM.current.q <> 0) and ((TM.list.current^.data = '0') or (TM.list.current^.data = '1') or
                                (TM.list.current^.data = '!') or (TM.list.current^.data = 'o') or
                                (TM.list.current^.data = '_')) do
  begin
    temp := TM.list.current^.data;
    TM.list.current^.data := TM.tr[TM.current.q, TM.list.current^.data].a;
    move(TM.list, TM.tr[TM.current.q, temp].m);
    TM.current.q := TM.tr[TM.current.q, temp].q;
  end;
  if ((TM.list.current^.data <> '0') and (TM.list.current^.data <> '1') and
     (TM.list.current^.data <> '!') and (TM.list.current^.data <> 'o') and
     (TM.list.current^.data <> '_')) then
    write('Write correct symdol. 1/0/!/o/_');
end;

end.