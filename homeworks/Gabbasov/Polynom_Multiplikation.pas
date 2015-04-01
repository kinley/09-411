PROGRAM die_Multiplikation; //semestrovaya "Spiski" No. 1.1
USES LIST;
VAR
  list1 : Tlist; //first polynom
  list2 : Tlist; //second polynom
  list3 : Tlist; //result
  f1,f2 : text;  

procedure from_file_to_list(var f : text; var list : Tlist);
VAR
data : Tdata;
p : PPOINTER;
BEGIN  
  data.exp := 0;
  while not eof(f) do begin
                        read(f,data.coeff);                        
                        if data.coeff <> 0 then begin                                                  
                                                  p := init_element(data);
                                                  append(list,p);
                                                  inc(data.exp);
                                                end
                        else begin
                               inc(data.exp);
                             end;
                      end;
END;  
procedure multiplication(list1,list2 : Tlist; var list3 : Tlist);
VAR 
  data1 : Tdata;
  data2 : Tdata;
  data3 : Tdata;
  P : PPOINTER;
BEGIN  
  reset_list(list1);
  reset_list(list2);
  while not eoflist(list2) do begin 
                           read_from_list(list2,data2);
                           reset_list(list1);
                           while not eoflist(list1) do begin                                                      
                                                      read_from_list(list1,data1);
                                                      data3.coeff := data1.coeff * data2.coeff;
                                                      data3.exp := data1.exp + data2.exp;
                                                      P := init_element(data3);
                                                      append(list3,P);
                                                    end;
                                           
                              end;
END;

BEGIN
  init_list(list1);
  init_list(list2);
  init_list(list3);
  assign(f1,'f1.txt');assign(f2,'f2.txt');
  reset(f1); reset(f2);
  
  from_file_to_list(f1,list1);
  from_file_to_list(f2,list2);
  multiplication(list1,list2,list3);
  
  print(list1);
  writeln;
  print(list2);
  writeln;
  print(list3);
  close(f1);close(f2);
END.
