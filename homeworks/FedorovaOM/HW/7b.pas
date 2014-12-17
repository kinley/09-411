var
x,y:integer;
begin
<<<<<<< Updated upstream
writeln ('enter �=');
read (x);
y:=(1+(x+1));
y:=y*(1+(x+2));
y:=y*(1+(x+3));
y:=y*(x+4);
writeln ('�=', y);
=======
writeln ('введите х=');
read (x);
y:=(x+4)*(1+(x+3)*(1+(x+2)*(1+(x+1))));
writeln ('у=', y);
>>>>>>> Stashed changes
end.
