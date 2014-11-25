program mDivN;
var
        i, m, n : integer;
        //m, n : real;
begin
        readln(m, n);
        if n = 0 then
        begin
            writeln('error');
            exit
        end;
        if (m > 0) and (n > 0) then
        begin
                while (m >= n) do
                begin
                        m := m - n;
                        inc(i);
                end;
        end
	    else if (m < 0) and (n < 0) then
        begin
                while (m <= n) do
                begin
                        m := m - n;
                        inc(i);
                end;

        end
        else if (m > 0) and (n < 0) then
        begin
                while (m >= n * (-1)) do
                begin
                        m := m + n;
                        inc(i);
                end;
                i := i * (-1);
        end
        else if (m < 0) and (n > 0) then
        begin
                while(m * (-1) >= n) do
                begin
                        m := m + n;
                        inc(i);
                end;
                i := i *(-1);
        end;

        writeln(i, '  ', m);
        readln;
end.
