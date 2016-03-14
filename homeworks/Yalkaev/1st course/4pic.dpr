program four_pictures_one_word; // Chestno skaju, Ranis ob'yasnil kak delat' i pokazal na primere svoego coda. 

{$APPTYPE CONSOLE}

var
  num, i: Integer;
  word: string;
  lets: array of char;
  elements, tempElements: array[0..255] of Integer;
  //tempElements : array[0..255] of Integer;
  flag, isPresent: boolean;

begin
  assign(input, 'dictionary.txt');
  reset(input);
  assign(output, 'out.txt');
  rewrite(output);

  num := 5;
  setlength(lets, 5);
  lets[0] := 'а';
  lets[1] := 'о';
  lets[2] := 'к';
  lets[3] := 'т';
  lets[4] := 'н';
  
  for i := 0 to length(lets) - 1 do
  begin
    inc(elements[ord(lets[i])]);
  end;
  flag := true;
  isPresent := false;
  
  
  while not eof do
  begin
    readln(word);
    
    if (length(word) = num) then
    begin
      tempElements := elements;
      flag := true;
      for i := 1 to length(word) do
      
      begin
        if tempElements[ord(word[i])] > 0 then
        begin
          dec(tempElements[ord(word[i])]);
        end
        else
        begin
          flag := false;
          break;
        end;
      end;
      
      if flag = true then
      begin
        isPresent := true;
        writeln(word);
      end;
    end;

  end;

  if isPresent = false then
  begin
    writeln('нету');
  end;

end.
