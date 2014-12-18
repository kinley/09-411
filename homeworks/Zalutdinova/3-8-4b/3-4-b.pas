program poweredthing;
var
	u, v, w: int64;
begin
	readln(v, w); u:=1;
	u:=u*v;
	v:=v*v; u:=u*v;
	v:=v*v; u:=u*v;
	v:=v*v*v*v*v*v*v*v; v:=v*v; u:=u*v;
	u:=u*w;
	w:=w*w; u:=u*w;
	w:=w*w; u:=u*w;
	w:=w*w*w*w*w*w*w*w; u:=u*w;
	w:=w*w; u:=u*w;
	writeln(u)
end.