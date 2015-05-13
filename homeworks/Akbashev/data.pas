unit data;

const
  B = 25;
  lengthofname = 5;

type
interval = 0..B-1;
nametype = array [1..lengthofname] of char;
  celltype = record
    element: nametype;
    next: ^celltype
  end;
  DICTIONARY = array[0..B - 1] of ^celltype;
end.