program programm1;

uses ListModule;

var a:TProgramming;
begin
  a:= TProgramming.create('input.txt');
  a.PrintThisShit();
  a.Destroy;
end.

