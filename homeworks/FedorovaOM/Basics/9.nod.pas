 var a,b:longint;

function NOD(x,y:longint):longint;
 begin
  if x<>0 then NOD:= NOD(y mod x,x) else NOD:= y;
 end;

Begin
 Writeln('enter a, b: ');
 Write('a = '); Readln(a);
 Write('b = '); Readln(b);
 Writeln('мнд ',a,' Х ',b,' = ', NOD(a,b));
End.
