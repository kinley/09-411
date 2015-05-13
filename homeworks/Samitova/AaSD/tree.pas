{Этот модуль ни связывает, ни осуществляет поиска в глубину. Извините, я не смогла его закончить. И никогда не смогу, если быть честной}
Unit tree;
interface
Type 
U = ^tTree; 
tTree = Record
Inf : real;
L, R : U
End;
UD = ^TreeD;
TreeD = Record
Inf : real;
Level : integer; 
L, R : U
End;
Poin = ^s;
s = Record
Data : real;
Next : Poin;
end;

Procedure InsIteration(Var T : U; X : real);
PROCEDURE InsDer(var T:U);
{Procedure tie(Var v,r : U);}
{Procedure CreateD(var D:UD);}
PROCEDURE PrintTree(T:U);
{Procedure findeep();}
implementation
Procedure InsIteration(Var T : U; X : real);
Var vsp, A : U;
Begin
New(A);
A^.Inf := X;
A^.L:=Nil; 
A^.R := Nil;
  If T=Nil Then T:=A
  Else
    Begin vsp := T;
      While vsp <> Nil Do
        If A^.Inf < vsp^.Inf Then
          If vsp^.L=Nil Then 
            Begin 
              vsp^.L:=A;
              vsp:=A^.L 
            End 
          Else 
            vsp:=vsp^.L
        Else 
          If vsp^.R = Nil Then
            Begin 
              vsp^.R := A;
              vsp:=A^.R
            End
          Else vsp := vsp^.R;
    End
End;
PROCEDURE InsDer(var T:U);
var i,n:integer;
    x:real;
Begin
  Randomize;
  Write('kol-vo el-tov v dereve: ');
  readln(n);
  for i:=1 to n do
  begin
     write('elem.: '); readln(x);
    {x:=-10+Random(21); write(x:5:3,'   '); }
    InsIteration(T,x);
  end;
END;
PROCEDURE PrintTree(T:U);
Begin
 if T <> nil then
             begin
              PrintTree(T^.L);
              Writeln('  ', T^.inf:5:3);
              PrintTree(T^.R);
             end;
END;

{Procedure tie(Var v,r : U);
Begin
  If r^.Inf < v^.Inf Then
    If v^.L=Nil Then 
      Begin  
        v^.L:=r;
        v:=r^.L 
      End 
    Else 
     v:=v^.L
   Else 
     If v^.R = Nil Then
        Begin 
          v^.R := r;
          v:=r^.R
        End
    Else v := v^.R;
End;
Procedure CreateD(var D:UD);
Var v:U; a:integer;
Begin
New(D);
a := 0;
While v <> nil do
  begin
    D^.inf := v^.inf;
    D^.Level := a;
    D^.L := v^.L;
    D^.R := v^.R;
    inc(a);
  end
End;}
{Procedure findeep();
var s1,s2,p : poin; D:UD;
begin
  New(s1);
  s1^.Data := D^.Inf;
  s1^.next := nil;
  if (D^.l) or (D^.r) <> nil then
    begin
      s2^.Data := D^.l;
      s2^.next := nil;
      s2^.Data := D^.r;
    end;
end;}
end.
