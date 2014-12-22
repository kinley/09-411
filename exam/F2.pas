const
  fName = 'File.txt';

var
  F: Text;
  N, S: Integer;

begin
  Assign(F, fName);
  Reset(F);
  S := 0;
  while not EOF(F) do
  begin
    Read(F, N);
    S += N; // Сложение с присваиванием
  end;
  Close(F);
  WriteLn(S);
end.
