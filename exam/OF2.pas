read(f1, el1);
read(f2, el2);

while not eof(f1) OR not eof(f1) do begin
  if (el1 < el2) then begin
    write(f3, el1);
    read(f1, el1);
  end;
  if (el1 > el2) then begin
    write(f3, el2);
    read(f2, el2);
  end;
  if (el1 = el2) then begin
    write(f3, el1);
    read(f1, el1);
    read(f2, el2);
  end
end

if eof(f1) then begin
  write(f3, el1);
  while not eof(f2) do begin
    write(f3, el2);
    read(f2, el2);
  end
end else begin
  write(f3, el2);
  while not eof(f1) do begin
    write(f3, el1);
    read(f1, el1);
  end
end;
