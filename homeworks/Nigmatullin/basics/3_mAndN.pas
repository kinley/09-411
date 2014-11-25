program mn;
var
        m, m1, n, k, i : integer;
begin
        readln(m, n, k);
        if(n > 0) and ((k > 0) or (k < 0)) then
        begin
                for i := 1 to n do
                        m1 := m1 + k;
        end
        else if (n < 0) and (k > 0) then
        begin
                for i := 1 to k do
                        m1 := m1 + n;
        end
        else if(n < 0) and (k < 0) then
        begin
                for i := 1 to n *(-1) do
                begin
                        m1 := m1 - k;
                end;
        end;
        writeln(m1);
        readln;
end.
