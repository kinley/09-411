program gameHelper;
var
  expectedNum, i : Integer;
  word : string;
  expectedLets : array of char;
  elements, tempElements : array[0..255] of Integer;
  flag, isPresent : Boolean;

begin
  Assign(Input, 'dictionary.txt');
  Reset(Input);
  Assign(Output, 'out.txt');
  Rewrite(Output);

  expectedNum := 6;
  SetLength(expectedLets, 6);
  expectedLets[0] := 'о';
  expectedLets[1] := 'г';
  expectedLets[2] := 'о';
  expectedLets[3] := 'р';
  expectedLets[4] := 'о';
  expectedLets[5] := 'д';
  //expectedLets[6] := 'л';

  for i := 0 to Length(expectedLets) - 1 do
  begin
    Inc(elements[Ord(expectedLets[i])]);
  end;
  flag := True;
  isPresent := False;


  while not Eof do
  begin
    Readln(word);

    if (Length(word) = expectedNum) then
    begin
      tempElements := elements;
      flag := true;
      for i := 1 to Length(word) do
      begin
        if tempElements[ord(word[i])] > 0 then
        begin
          Dec(tempElements[ord(word[i])]);
        end
        else
        begin
          flag := False;
          break;
        end;
      end;
      if flag = True then
      begin
        isPresent := true;
        Writeln(word);
      end;
    end;

  end;

  if isPresent = False then
  begin
    Writeln('нету');
  end;

end.
