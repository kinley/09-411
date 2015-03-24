Program Task13;
uses crt;


Const x0 = -5.1;
Const n = 15;


Type sequence = array[1..n] of real;


var
  i,r:integer;
  arraySeq: sequence;
 

function getSequenceDigit(x: real):real;
begin
getSequenceDigit:= (1.2 + abs(x))/(1.8 + abs(x - 1))*cos(x*x + x + 1);
end;


procedure initialSequence(var mas: sequence);
var i:integer;
begin
for i:=1 to n do
  begin
  if i=1 then
    mas[i]:=getSequenceDigit(x0)
   else
    mas[i]:=getSequenceDigit(mas[i-1]);
   end;
 end;
 

 procedure sortXtoY(var mas: sequence);
 var i,j:integer;
     tmp:real;
 begin
 for i:=1 to n - 1 do
  for j:=1 to n - i do
    if mas[j]*mas[j] > mas[j+1]*mas[j+1] then begin
                                              tmp:=mas[j];
                                              mas[j]:=mas[j+1];
                                              mas[j+1]:=tmp;
                                              end;
end;


function findByA(mas: sequence): integer;
var i:integer;
     flag:boolean;
begin
flag:=false;
for i:=1 to n do
  if (mas[i] < 0) and (flag = false)  then begin
                                            findByA:=i;
                                            flag:=true;
                                            end;
if (flag = false)then
  findByA:=0;
end;


 begin
 clrscr;
 initialSequence(arraySeq);
 writeln('Sequence X: = ');
 for i:=1 to n do
  write(arraySeq[i],' ');
 sortXtoY(arraySeq);
 writeln();
 writeln('Sequence Y: = ');
 for i:=1 to n do
  write(arraySeq[i],' ');
 writeln();
 writeln('R by A: = ');
 r:=findByA(arraySeq);
 if r <> 0 then
  writeln(arraySeq[r])
 else 
  writeln(r);
 end.