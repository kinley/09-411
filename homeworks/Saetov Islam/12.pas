begin
  if E1 then
    begin
      S1;
      if E3 then S5;
    end;
  else 
    begin
      if E2 then S2 
      else S3;
      S4;
    end;
end.