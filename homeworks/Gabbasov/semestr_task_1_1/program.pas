PROGRAM die_Multiplikation;
USES QUEUE,DATA;
VAR
  polynom1 : Tqueue;
  polynom2 : Tqueue;
  product : Tqueue;
  f1,f2 : text;  

procedure from_file_to_queue(var f : text; var q : Tqueue);
VAR
data : Tdata;
BEGIN  
  data.exp := 0;
  while not eof(f) do begin
                        read(f,data.coeff);                        
                        if data.coeff <> 0 then begin
                                                  inqueue(q,data);
                                                  //write(q.ptail^.data.coeff); 
                                                  inc(data.exp);
                                                end
                        else begin
                               inc(data.exp);
                             end;
                      end;
END;  
procedure polynom_mp(data1,data2 : Tdata; var data3 : Tdata);
BEGIN
  data3.coeff := data1.coeff * data2.coeff;
  data3.exp := data1.exp + data2.exp;
END;
procedure multiplication(var q1,q2 : Tqueue; var q3 : Tqueue);
VAR 
  data1,data2,data3 : Tdata; 
  i,j : cardinal;
BEGIN   
  for i := 1 to size(q1) do begin
                              dequeue(q1,data1); inqueue(q1,data1);
                              for j := 1 to size(q2) do begin
                                                           dequeue(q2,data2); inqueue(q2,data2);
                                                           //writeln(data1.coeff);
                                                           polynom_mp(data1,data2,data3);
                                                           inqueue(q3,data3);
                                                         end;
                            end;
END;
procedure print_polynom(q : Tqueue);
VAR
  i : cardinal;
  d : Tdata;
BEGIN
  for i := 1 to size(q) do begin
                             dequeue(q,d); inqueue(q,d);
                             if (d.coeff <> 0) AND (d.exp <>0) then begin
                                                                      if d.coeff <> 1 then write(d.coeff);
                                                                      if d.exp = 1 then write('X') else write('X^',d.exp);                             
                                                                    end
                                                               else begin                                                                    
                                                                      if d.exp = 0 then write(d.coeff);
                                                                    end;
                             if i <> size(q) then write(' + ');                                      
                           end;
END;
BEGIN
  create(polynom1);create(polynom2);create(product);  
  assign(f1,'f1.txt');assign(f2,'f2.txt');
  reset(f1); reset(f2);   
  from_file_to_queue(f1,polynom1);
  from_file_to_queue(f2,polynom2);
  multiplication(polynom1,polynom2,product);  
  print_polynom(polynom1);
  writeln;
  print_polynom(polynom2);
  writeln;
  print_polynom(product);
  close(f1);close(f2);
  destroy(polynom1);destroy(polynom2);destroy(product);  
END.