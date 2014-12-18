program four_pictures_one_word; // With Ranis's help
var
  expectedNum, i : Integer;
  word : string;
  expectedLets : array of char;
  elements, tempElements : array[0..255] of Integer;
  //tempElements : array[0..255] of Integer;
  flag, isPresent : Boolean;

begin
  Assign(Input, 'dictionary.txt');
  Reset(Input);
  Assign(Output, 'out.txt');
  Rewrite(Output);

  expectedNum := 5;
  SetLength(expectedLets, 7);
  expectedLets[0] := 'а';
  expectedLets[1] := 'о';
  expectedLets[2] := 'к';
  expectedLets[3] := 'т';
  expectedLets[4] := 'н';
  expectedLets[5] := 'и';
  expectedLets[6] := 'е';

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
