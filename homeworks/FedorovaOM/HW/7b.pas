var
x,y:integer;
begin
writeln ('enter õ=');
read (x);
y:=(1+(x+1));
y:=y*(1+(x+2));
y:=y*(1+(x+3));
y:=y*(x+4);
writeln ('ó=', y);
end.
