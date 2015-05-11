program Program1;

uses
  BinaryTree;

var
  f1, f2: text;
  str: string;
  Root: pTree;

procedure findOp(var Tree: pTree; var str: string); forward;

procedure ToFile(p: pTree;f:text);
begin
  if p <> nil then
  begin
    write(f,p^.Data);
    //write(p^.Data);
    ToFile(p^.Left,f);
    ToFile(p^.Right,f);
  end;
end;

procedure Bisect(var Tree: pTree; i: integer; var str: string);
var
  str1, str2: string;
  p: pTree;
begin
  Tree^.Data := str[i];
  str1 := Copy(str, 2, i - 3);
  str2 := Copy(str, i + 2, Length(str) - i - 2);
  Delete(str, 1, Length(str));
  
  if(Length (str1) = 1) then
    pushleft(Tree, str1[1])
  else
  begin
    new(p);
    findOp(p, str1);
    Tree^.Left := p;
  end;
  
  if(Length (str2) = 1) then
    pushright(Tree, str2[1])
  else
  begin
    new(p);
    findOp(p, str2);
    Tree^.Right := p;
  end;
end;

procedure findOp(var Tree: pTree; var str: string);
var
  i, bkt: integer;
begin
  bkt := 0;
  for i := 1 to Length(str) do
    case str[i] of
      '(': inc(bkt);
      ')': dec(bkt);
      '+', '-', '/', '*':
        if bkt = 0 then begin
          Bisect(Tree, i, str);
          exit;
        end;
    end;
  
end;

begin
  assign(f1, 'input.txt');
  assign(f2, 'output.txt');
  reset(f1);
  rewrite(f2);
  read(f1, str);
  CreateTree(Root);
  findOp(Root, str);
  ToFile(Root, f2);
  close(f1);
  close(f2);
end.