var
        u,z,x,y:Real;
begin
        writeln('Vvedi, plz: x, y, z');
        readln(x,y,z);
        u:=(((2.3 - x)/y * z + 3.15) / x - y) * z + x;
        write(u:3:2);
        readln;
end.