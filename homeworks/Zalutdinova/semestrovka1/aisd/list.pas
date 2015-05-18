program list;

uses list_worker;

var a:TProgramming;
begin
  a:= TProgramming.create('input.txt');
  a.Print();
  ReadLn();
end.

