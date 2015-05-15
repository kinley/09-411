unit Data;//All Datas

const
  LenOfName = 3;

type
  
  nametype = array[1..LenOfName+1] of char;
  tData = char;
  
  Cell = record
    //Data: tData;
    next: array['a'..'z'] of ^Cell;
    parent:^Cell
  end;
  
  DICTIONARY = record  
    head, current: ^cell;
  end;
  
  pCell = ^Cell;


end.