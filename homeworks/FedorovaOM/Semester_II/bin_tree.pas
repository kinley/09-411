type tree=^t;
     t=record
       left,right,p:tree;
       data:longint;
     end;
var treeBegin:tree;
    n,i,ch:longint;
    yz:tree;
procedure obhod(yzel:tree);
begin
if yzel=nil then exit();
write(yzel^.data,' ');
obhod(yzel^.left);
obhod(yzel^.right);
end;
function poisk(yzel:tree;p:longint):tree;
begin
while (yzel<>nil) and (yzel^.data<>p) do
  if p<yzel^.data then yzel:=yzel^.left
  else yzel:=yzel^.right;
exit(yzel);
end;
function p_min(yzel:tree):tree;
begin
while yzel^.left<>nil do
  yzel:=yzel^.left;
exit(yzel);
end;
function p_max(yzel:tree):tree;
begin
while yzel^.right<>nil do
  yzel:=yzel^.right;
exit(yzel);
end;
function tree_go(yzel:tree):tree;
var y:tree;
begin
if yzel^.right=nil then exit(p_min(yzel^.right));
y:=yzel^.p;
while(y<>nil) and (yzel=y^.right) do
  begin
    yzel:=y;
    y:=y^.p;
  end;
exit(y);
end;
procedure insert(yzel:tree);
var x,y:tree;
begin
y:=nil;
x:=treeBegin;
while x<>nil do
  begin
    y:=x;
    if yzel^.data<x^.data then x:=x^.left
    else x:=x^.right;
  end;
    yzel^.p:=y;
  if y=nil then treeBegin:=yzel
    else if yzel^.data<y^.data then y^.left:=yzel
      else y^.right:=yzel;
end;
procedure erase(yzel:tree);
var z,y,x,prom:tree;
begin
z:=yzel;
if (z^.left=nil) or (z^.right=nil) then y:=z
else y:=tree_go(z);
if (y^.left<>nil) then x:=y^.left
  else x:=y^.right;
if x<>nil then x^.p:=y^.p;
if y^.p=nil then treeBegin:=x
else
  begin
    prom:=y^.p;
    if y=prom^.left then prom^.left:=x
    else prom^.right:=x;
    y^.p:=prom;
  end;
if y<>z then z^.data:=y^.data;
dispose(y);
end;
begin
readln(n);
for i:=1 to n do
  begin
    readln(ch);
    new(yz);
    yz^.data:=ch;
    yz^.right:=nil;
    yz^.left:=nil;
    insert(yz);
  end;
yz:=p_min(treeBegin);
writeln('MIN=',yz^.data);
yz:=p_max(treeBegin);
writeln('MAX=',yz^.data);
obhod(treeBegin);
end.


