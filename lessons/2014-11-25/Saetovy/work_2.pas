var
        x,y,z,u:Real;
begin
        writeln('Vvedite xyz');
        readln(x,y,z);
        u:=(x + y + 2.1);
        u:=u/(x - z - 5.6);
        u:=u * z;
        u:= u + y;
        u:=u * y;
        u:=u + ((z + 1) / (z - 1));
        write(u);
        readln;
end.