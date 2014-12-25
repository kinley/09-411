var 
 x,y:real;
 begin
  read(x);
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

  
