unit BinaryTree;

interface

const
  nMax = 100;

type
  tData = char;
  tRooad = array[1..nMax] of boolean;
  tAllData = array[0..nMax] of tData;
  pTree = ^tTree;
  tTree = record
    Data: tData;
    Left, Right: pTree;
  end;

procedure CreateTree(var Root: pTree);
procedure pushright(var p: pTree; x: tData);
procedure pushleft(var p: pTree; x: tData);
procedure GoRound(Root: pTree; var leaves: tAllData);
procedure RoundTree(p: pTree);
procedure RoundTreeToFile(p: pTree;f:text);

implementation

procedure CreateTree(var Root: pTree);
begin
  new(Root);
  Root^.Left := nil;
  Root^.Right := nil;
end;

procedure pushright(var p: pTree; x: tData);
var
  p1: pTree;
begin
  new(p1);
  p1^.Data := x;
  p1^.Left := nil;
  p1^.Right := nil;
  
  p^.Right := p1;
end;

procedure pushleft(var p: pTree; x: tData);
var
  p1: pTree;
begin
  new(p1);
  p1^.Data := x;
  p1^.Left := nil;
  p1^.Right := nil;
  p^.Left := p1;
end;

function Roundd(p: pTree; var leaves: tAllData; i: integer): integer;
var
  k: integer;
begin
  if p <> nil then
  begin
    k := Roundd(p^.left, leaves, i + 1);
    leaves[k] := p^.Data;
    k := Roundd(p^.left, leaves, k + 1);
    result := k + 1;
  end
  else result := i;
end;

procedure GoRound(Root: pTree; var leaves: tAllData);
var
  k: integer;
begin
  k := 1;
  k := Roundd(Root^.left, leaves, k);
  leaves[k] := Root^.Data;
  Roundd(Root^.right, leaves, k + 1);
end;

procedure RoundTree(p: pTree);
begin
  if p <> nil then
  begin
    RoundTree(p^.left);
    write(p^.Data);
    RoundTree(p^.left);
  end
end;
procedure RoundTreeToFile(p: pTree;f:text);
begin
  if p <> nil then
  begin
    RoundTree(p^.Left);
    write(f,p^.Data);
    RoundTree(p^.Right);
  end
end;
end.