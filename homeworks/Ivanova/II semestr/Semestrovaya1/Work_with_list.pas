Program Work_with_list;
uses
  crt;
type
  Tinf=string[20];
  List=^TList;
  TList=record
    data:TInf;
    next:List;
  end;

var
  spis:List;
  znach: Tinf;
  name: string;
  f: text;
  end_scan: boolean;
  
 
Procedure AddElem(var spis1:List;znach1:TInf); {Procedure, which will add new elements to the list.}
var
  tmp:List;
begin
  if spis1=nil then
  begin
    New(spis1);
    tmp:=spis1;
  end
  else
  begin
    tmp:=spis1;
    while tmp^.next<>nil do
      tmp:=tmp^.next;
    New(tmp^.next);
    tmp:=tmp^.next;
  end;
  tmp^.next:=nil;
  tmp^.data:=znach1;
end;


Procedure Print(spis1:List); {Procedure, which will print the list.}
begin
  if spis1=nil then
  begin
    writeln('The list is empty.');
    exit;
  end;
  while spis1<>nil do
  begin
    Write(spis1^.data,' ');
    spis1:=spis1^.next
  end;
end;


Procedure FreeStek(spis1:List); {Procedure, which will delete the list.}
var
  tmp:List;
begin
  while spis1<>nil do
  begin
    tmp:=spis1;            
    spis1:=spis1^.next;    
    Dispose(tmp);          
  end;
end;


Function SearchElemZnach(spis1:List;znach1:TInf):List; {Function, which will search for the needed element in the list.}
begin
  if spis1<>nil then    
    while (Spis1<>nil) and (znach1<>copy(spis1^.data,1,1)) do 
      spis1:=spis1^.next;  
  SearchElemZnach:=spis1;   
end;                        


Procedure DelElem(var spis1:List;tmp:List); {Procedure, which will delete the needed element in the list.}
var
  tmpi:List;
begin
  if (spis1=nil) or (tmp=nil) then 
    exit;
  if tmp=spis1 then    
  begin
    spis1:=tmp^.next;   
    Dispose(tmp);       
  end
  else                    
  begin
    tmpi:=spis1;                   
    while tmpi^.next<>tmp do      
      tmpi:=tmpi^.next;
    tmpi^.next:=tmp^.next;        
    Dispose(tmp);                 
  end;
end;


Procedure DelElemZnach(var Spis1:List;znach1:TInf); {Procedure, which will delete the needed element, according to its value.}
var
  tmp:List;
begin
  if Spis1=nil then
  begin
    Writeln('The list is empty.');
    exit;
  end;

  tmp:=SearchElemZnach(spis1,znach1);
  if tmp=nil then  
  begin
    end_scan:=true;  
    exit;            
  end;
  DelElem(spis1,tmp);   
end;


begin {The beginning of the program.}

   name:='words.txt';
   spis:=nil;      
   end_scan:=false;   
   clrscr;           
  Writeln('The input data:');
  Writeln;
  Assign(f,name); 
  Reset(f);           
     while not SeekEof(f) do  
      begin
         Readln(f, znach);    
         Write(znach, ' ');      
         AddElem(spis,znach);
      end;
  Close(f);
  

   znach:='z';
   while not end_scan do DelElemZnach(spis,znach);
   Writeln;
   Writeln;
   Writeln('The filtered data:');
   Writeln;
   Print(Spis);
   Writeln;
   
   FreeStek(Spis);
end.
