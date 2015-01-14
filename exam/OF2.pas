uses sysutils;
type
  T = integer;
  fT = text;
var
  f1, f2, f3 : fT;
  el1, el2: Integer;
  s: String;

BEGIN
// SetCurrentDir(GetCurrentDir + '/git/09-411/exam');
// writeln(GetCurrentDir);
// writeln(fileexists('of1.txt'));

Assign(f1, 'of1.txt');
Reset(f1);
Assign(f2, 'of2.txt');
Reset(f2);
Assign(f3, 'of3.txt');
Rewrite(f3);

read(f1, el1);
read(f2, el2);

while not eof(f1) OR not eof(f1) do begin
  if (el1 < el2) then begin
    writeln(f3, el1);
    read(f1, el1);
  end;
  if (el1 > el2) then begin
    writeln(f3, el2);
    read(f2, el2);
  end;
  if (el1 = el2) then begin
    writeln(f3, el1);
    read(f1, el1);
    read(f2, el2);
  end
end;

if eof(f1) then begin
  writeln(f3, el1);
  while not eof(f2) do begin
    writeln(f3, el2);
    read(f2, el2);
  end;
  writeln(f3, el2);
end else begin
  writeln(f3, el2);
  while not eof(f1) do begin
    writeln(f3, el1);
    read(f1, el1);
  end;
  writeln(f3, el1);
end;

Close(f1);
Close(f2);
Close(f3);

END.