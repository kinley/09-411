uses
  List;

var
  list1: Tlist; // polynomial multiplier from f1.txt
  list2: Tlist; // polynomial multiplier from f2.txt
  list3: Tlist; // result
  f1, f2: text;

procedure fileToList(var f: text; var list: Tlist);
var
  data: Tdata;
  p: PPOINTER;
begin
  data.exp := 0;
  while not eof(f) do 
  begin
    read(f, data.coeff);                        
    if data.coeff <> 0 then begin
      p := initElement(data);
      append(list, p);
      inc(data.exp);
    end
    else begin
      inc(data.exp);
    end;
  end;
end;

procedure multiplication(list1, list2: Tlist; var list3: Tlist);
var
  data1: Tdata;
  data2: Tdata;
  data3: Tdata;
  P: PPOINTER;
begin
  resetList(list1);
  resetList(list2);
  while not eofList(list2) do 
  begin
    read_from_list(list2, data2);
    resetList(list1);
    while not eofList(list1) do 
    begin
      read_from_list(list1, data1);
      data3.coeff := data1.coeff * data2.coeff;
      data3.exp := data1.exp + data2.exp;
      P := initElement(data3);
      append(list3, P);
    end;
    
  end;
end;

begin
  initList(list1);
  initList(list2);
  initList(list3);
  assign(f1, 'f1.txt'); // text file 1
  assign(f2, 'f2.txt'); // text file 2
  reset(f1); 
  reset(f2);
  
  fileToList(f1, list1);
  fileToList(f2, list2);
  multiplication(list1, list2, list3);
  print(list1);
  writeln;
  print(list2);
  writeln;
  print(list3);
  close(f1);close(f2);
end.
