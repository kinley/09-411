program eightD;
var x,y:real;
begin
  assign(input,'input.txt');
  reset(input);
  assign(output,'output.txt');
  rewrite(output);
  read(x);
  y:=x+(-1)*x*x/(3+(-1)*x*x/(5+(-1)*x*x/(7+(-1)*x*x/9)));
  write('tg(x) = ',y:0:3);
end.