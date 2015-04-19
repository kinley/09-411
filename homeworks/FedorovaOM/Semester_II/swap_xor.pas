var
   a,b:integer;
begin
 read (a,b);
 a:= a xor b;
 b:= a xor b;
 a:= a xor b;
 writeln(a,' ',b);
end.
