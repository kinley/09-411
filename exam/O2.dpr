program O2;
const
  CN = 100;
type
  T = 1..CN;
  arrT = array[T] of integer;
{$APPTYPE CONSOLE}
var
  n, i : Integer;
  arr : arrT;

procedure swap(var a : integer; var b : integer);
var
  temp : integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

function sortFindMax(arr : arrT; n : T) : arrT;
var
  i, j, el, max : integer;
begin
  for i := 1 to n do
  begin
    max := arr[1];
    el := 1;
    for j := 1 to n do
    begin
      if(arr[j] > max) then
      begin
        max := arr[j];
        el := j;
      end;
    end;
    swap(arr[el], arr[n]);
    Dec(n);
  end;
  sortFindMax := arr;
end;

begin
  Assign(Input, 'input.txt');
  Reset(Input);
  Assign(Output, 'output.txt');
  Rewrite(Output);

  readln(n);

  for i := 1 to n do
  begin
    read(arr[i]);
  end;

  arr := sortFindMax(arr, n);

  for i := 1 to n do
  begin
    writeln(arr[i]);
  end;
end.
