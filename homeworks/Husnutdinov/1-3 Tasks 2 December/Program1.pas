program zad3b;

var
  u, v, w, x, y: real;

begin
read(x);
u := x*x;
v := x*x*x;
w := x*x*x*x*x;

y := (w + 5.7 * v);
y := y / (u - 7.5);
y := y + 4.2 * w - 8.9 * u;
write(y:3:2);
end.
