unit Convert;//input and output

interface

uses
  Data;

procedure readline(var legislator: nametype);
procedure writeline(legislator: nametype; b:boolean);
procedure writenope(legislator: nametype);
implementation

procedure readline(var legislator: nametype);
var
  i: integer;
begin
  i := 1;
  while i < LenOfName do 
  begin
    read(legislator[i]);
    if legislator[i] <> ' ' then inc(i);
  end;
  readln(legislator[LenOfName]);
  
end;

procedure writeline(legislator: nametype; b:boolean);
var
  i: integer;
begin
  i := 1;
  while i <= LenOfName do 
  begin
    write(legislator[i]);
    inc(i);
  end;
  if b then writeln(' - это друг')
  else writeln(' - это враг');
end;

procedure writenope(legislator: nametype);
var
  i: integer;
begin
  i := 1;
   write('Нет данных о ');
  while i <= LenOfName do 
  begin
    write(legislator[i]);
    inc(i);
  end;
  writeln();
end;
end.