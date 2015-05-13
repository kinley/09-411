unit Convert;//input and output

interface

uses
  Data;

procedure readline(var legislator: nametype);

implementation

procedure readline(var legislator: nametype);
var
  i: integer;
begin
  i := 1;
  while i < LenOfName do 
  begin
    read(legislator[i]);
    if legislator[i]<>' ' then inc(i);
  end;
  readln(legislator[LenOfName]);
  
end;

end.