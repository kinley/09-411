unit Mine;
 interface
 Type
  Pointer = ^l;
  l = Record
       Degree : integer;
       Coeff1 : integer;
       Coeff2 : integer;
       Next : Pointer ;
  End;
Procedure Init(Var List : Pointer);
procedure addition(var summ : real; list:pointer);
procedure Subtra(var minus:real; summ,c,d,x:real );
Procedure Changefile();
implementation
Procedure Changefile();
var
  r, t: text;
  f: char;
  digit, err: integer;

begin
  assign(t, 'input.txt');
  assign(r, 'output.txt');
  reset(t);
  rewrite(r); 
  while not eof(t) do
  begin
    read(t, f);
    if f <> ',' then
    begin
      val(f, digit, err);    
      Write(r, digit);
    end;
    if f = ',' then 
    Writeln(r);
    if f = '.' then
      break; 
  
  end;
  close(t);
  close(r);
end;
Procedure Init(Var List : Pointer); 
Var
  t : text;
  a,i,x : integer;
  l : Pointer;
Begin
  x := 0;
  i := 0;
  assign(t,'output.txt');
  reset(t);
  List := Nil; {Список пуст}
  Readln(t,a);
  if a <> 0 
    then {Формируем и вставляем первый элемент списка}
      Begin
        New(l); 
        l^.Next := Nil;
        l^.Coeff1 := a;
        l^.Coeff2 := x;
        l^.Degree := i;
        List := l; 
        Writeln('коэффициент =', l^.Coeff1,' х= ',l^.Coeff2,' степень ', l^.Degree);
        inc(i);
        inc(x);
        Readln(t,a);
        while a <> 0 do
          Begin
            New(l^.Next); {Формируем и вставляем элемент в конец списка}
            l := l^.Next;
            l^.Next := Nil;
            l^.Coeff1 := a;
            l^.Coeff2 := x;
            l^.Degree := i;
            Writeln('коэффициент = ', l^.Coeff1,' х= ',l^.Coeff2,' степень ', l^.Degree);
            inc(i);
            inc(x);
            Readln(t,a);
          End;
      End;
      writeln;
End;
  procedure addition(var summ : real; list:pointer);
    Begin
    if list<>nil then 
    begin
      summ := summ + list^.Coeff1 * (power(list^.Coeff2,list^.Degree));
      addition(summ,list^.Next);
    end;
    End;
   procedure Subtra(var minus:real; summ,c,d,x:real );
  
   Begin
     minus := summ / (c + d*x);
   End;
End.
