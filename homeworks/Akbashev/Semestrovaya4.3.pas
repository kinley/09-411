
uses
  MyList;
var
  f1, f2: text;
  List: tList;
  n: integer;

procedure derivative(var List:tList);
begin
List.current:=List.head;
  while (List.current <> nil) do 
  begin
    if(List.current^.data1<>0) then
    write('-',List.current^.data1*List.current^.data3,'sin(',list.current^.data3,'x)');
    if(List.current^.data2<>0) then
    write('+',List.current^.data2*List.current^.data3,'cos(',list.current^.data3,'x)');
    List.current:=List.current^.next;
  end;
end;

procedure reading(n: integer;var List: tList);
var 
  a, b, i, a0: integer;
begin
  read(f1, a0);
  for i := 1 to n do 
  begin
    read(f1, a, b);
   pushFront(list, a, b, i);
  end;
end;

begin
  assign(f1, 'input.txt');
  assign(f2, 'output.txt');
  reset(f1);
  rewrite(f2);
  
  read(f1, n);
  initList(List);
  reading(n,List);
  derivative(List);
  
  close(f1);
  close(f2);
end.