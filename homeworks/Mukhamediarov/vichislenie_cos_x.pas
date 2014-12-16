var
x,y:real;
label c1,c2;
begin
read(x);
if (x>=0) and (x<=pi) then goto c1 else goto c2 ;
c1:begin
y:=1-(x*x)/2;
y:=y+power(x,4)/(2*3*4);
y:=y-power(x,6)/(2*3*4*5*6);
y:=y+power(x,8)/(2*3*4*5*6*7*8);
end;
writeln(y);
writeln(cos(x));
c2:
end.


ISPRAVLENIE CODA

begin
 var 
 x,y:real;
  readln(x);
  if (x<=0) or (x>=pi) then write('SYSTEM FATAL SUPER PUPER ERROR')
  else 
     begin
      y:=1-(x*x)/2;
      y:=y+(x*x*x*x)/(2*3*4);
      y:=y-(x*x*x*x*x*x)/(2*3*4*5*6);
      y:=y+(x*x*x*x*x*x*x*x)/(2*3*4*5*6*7*8);
        writeln('PRIMERNOE ZNACHENIE COSINUSA= ',y);
        writeln('ZNACHENIE COSINUSA= ',cos(x));
     end;  
end.
