unit graph;

interface

uses
  onelinklist;

const
  n = 15;//количество узлов графа

type
  arr = array [1..n] of list;//массив списков смежностей

procedure input_gr1(var gr: arr);//представление графа списками смежности
procedure input_gr2(var gr: arr);//вводим граф построеный поиском в глубину
procedure input_gr3(var gr: arr);


implementation

procedure input_gr1(var gr: arr);
//graph[i] - список со смежными узлами узла i 
begin
  create(gr[1], 2);
  in_list(gr[1], 3);
  create(gr[2], 1);
  in_list(gr[2], 3);
  in_list(gr[2], 4);
  create(gr[3], 1);
  in_list(gr[3], 2);
  in_list(gr[3], 4);
  create(gr[4], 2);
  in_list(gr[4], 3);
  create(gr[5], 0);//обозначение конца нулем
end;

procedure input_gr2(var gr: arr);
begin
  create(gr[1], 2);
  in_list(gr[1], 3);
  in_list(gr[1], 4);
  create(gr[2], 1);
  in_list(gr[2], 4);
  create(gr[3], 1);
  in_list(gr[3], 4);
  create(gr[4], 1);
  in_list(gr[4], 2);
  in_list(gr[4], 3);
  in_list(gr[4], 5);
  in_list(gr[4], 6);
  create(gr[5], 4);
  in_list(gr[5], 6);
  create(gr[6], 4);
  in_list(gr[6], 5); 
  create(gr[7], 0);
end;

procedure input_gr3(var gr: arr);
begin
  create(gr[1], 2);
  in_list(gr[1], 3);
  create(gr[2], 1);
  in_list(gr[2], 3);
  in_list(gr[2], 4);
  in_list(gr[2], 5);
  create(gr[3], 1);
  in_list(gr[3], 2);
  create(gr[4], 2);
  in_list(gr[4], 5);
  in_list(gr[4], 6);
  create(gr[5], 2);
  in_list(gr[5], 4);
  create(gr[6], 4);
  in_list(gr[6], 7);
  in_list(gr[6], 8);
  in_list(gr[6], 9);
  create(gr[7], 6);
  in_list(gr[7], 8);
  create(gr[8], 6);
  in_list(gr[8], 7);
  in_list(gr[8], 9);
  create(gr[9], 6);
  in_list(gr[9], 8);
  create(gr[10], 0);
end;

begin
end. 
