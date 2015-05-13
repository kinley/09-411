unit tree;

interface

type
  U = ^tTree;
  tTree = Record
    Inf: real;
    L, R: U
  End;
  UD = ^TreeD;
  TreeD = Record
    Inf: real;
    Level: integer; 
    L, R: U
  End;
  Poin = ^s;
  s = Record
    Data: real;
    Next: Poin;
  end;

procedure InsIteration(var T: U; X: real);
procedure InsDer(var T: U);
{Procedure tie(Var v,r : U);}
{Procedure CreateD(var D:UD);}
procedure PrintTree(T: U);
{Procedure findeep();}
implementation

procedure InsIteration(var T: U; X: real);
var
  vsp, A: U;
begin
  New(A);
  A^.Inf := X;
  A^.L := nil; 
  A^.R := nil;
  if T = nil Then T := A
  Else
  begin
    vsp := T;
    while vsp <> nil Do
      if A^.Inf < vsp^.Inf Then
        if vsp^.L = nil Then 
        begin
          vsp^.L := A;
          vsp := A^.L
        end 
        Else 
          vsp := vsp^.L
      Else 
      if vsp^.R = nil Then
      begin
        vsp^.R := A;
        vsp := A^.R
      end
      Else vsp := vsp^.R;
  end
end;

procedure InsDer(var T: U);
var
  i, n: integer;
  x: real;
begin
  Randomize;
  Write('kol-vo el-tov v dereve: ');
  readln(n);
  for i := 1 to n do
  begin
    write('elem.: '); readln(x);
    {x:=-10+Random(21); write(x:5:3,' '); }
    InsIteration(T, x);
  end;
end;

procedure PrintTree(T: U);
begin
  if T <> nil then
  begin
    PrintTree(T^.L);
    Writeln(' ', T^.inf:5:3);
    PrintTree(T^.R);
  end;
end;

{procedure tie(var v, r: U);
begin
  if r^.Inf < v^.Inf Then
    if v^.L = nil Then 
    begin
      v^.L := r;
      v := r^.L
    end 
    Else 
      v := v^.L
  Else 
  if v^.R = nil Then
  begin
    v^.R := r;
    v := r^.R
  end
  Else v := v^.R;
end;

procedure CreateD(var D: UD);
var
  v: U; a: integer;
begin
  New(D);
  a := 0;
  while v <> nil do
  begin
    D^.inf := v^.inf;
    D^.Level := a;
    D^.L := v^.L;
    D^.R := v^.R;
    inc(a);
  end
end;}

{procedure findeep();
var
  s1, s2, p: poin; D: UD;
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