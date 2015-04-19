program pr;
uses mine;
Var

c,d,x,summa, minus :real;
list:pointer;
Begin
  Changefile();
  summa := 0;
  init(List);
  addition(summa, list);
  Writeln('множество ',summa);
  Writeln('введите c, d, x');
  Read(c,d,x); 
  Subtra(minus,summa,c,d,x);
  Writeln('деление ',minus);
end.

