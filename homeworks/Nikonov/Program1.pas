uses List;

const n = 100; // допустим, максимальная степень - 100

var f: text;
    data: tData;
    p: tPointer;
    m1: array [1..n] of tList;
    m2: array [1..n] of integer;
    i, sum: integer;
begin
     assign(f, 'f.txt');
     reset(f);
     
     for i:=1 to n do initList(m1[i]);
     
     while not eof(f) do begin
                         read(f, data.coef);
                         read(f, data.exp);
                         
                         if (data.coef <> 0) then begin
                                                  p:=initElement(data);
                                                  appendElement(m1[data.exp], p);                                                 
                                                  end;
                                                  PrintList(m1[data.exp]);
                         end;
     
     for i:=1 to n do begin
                                               while not(eofList(m1[i])) do begin
                                                                           resetList(m1[i]);
                                                                           readFromList(m1[i], data);
                                                                           sum:= sum + data.coef;
                                                                           m1[i].pCurrent := m1[i].pCurrent^.next;
                                                                           end;
                                               m2[data.exp]:=sum;
                                               sum:=0;
                                               end;     
     
     for i:=1 to n do if (m2[i]>0) then write(m2[i],'(x^',i ,') + ');     
     close(f);
end.
