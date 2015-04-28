program mirror;

uses UTM, UDLL;

var
  TM: tTM;
  
BEGIN

  initList(TM.list);
  pushBack(TM.list, '0');
  pushBack(TM.list, '0');
  pushBack(TM.list, '0');
  pushBack(TM.list, '0');
  pushBack(TM.list, '1');
  pushBack(TM.list, '0');
  pushBack(TM.list, '_');
  
  TM.tr[1, '0'] := state('0', R, 1);// q1
  TM.tr[1, '1'] := state('1', R, 1);// ¬ этом состо€нии машина доходит до конца ленты,
  TM.tr[1, '_'] := state('_', L, 2);// не мен€€ значений эдементов
  
  TM.tr[2, '0'] := state('0', L, 4);// q2
  TM.tr[2, '1'] := state('1', L, 3);// ћашина в этом состо€нии копирует непомеченный симовол с конца ленты
  TM.tr[2, 'o'] := state('o', L, 11);// o - помеченный 0
  TM.tr[2, '!'] := state('!', L, 11);// ! - помеченна€ 1
  
  TM.tr[3, '0'] := state('0', L, 3);// q3
  TM.tr[3, '1'] := state('1', L, 3);// ¬ состо€ни€х q3 и q4 машина идет в начало ленты
  TM.tr[3, 'o'] := state('o', R, 5);// или до первого помеченного символа
  TM.tr[3, '!'] := state('!', R, 5);// в состо€нии q3 в пам€ти машины - 1
  TM.tr[3, '_'] := state('_', R, 5);// в состо€нии q4 - 0
  
  TM.tr[4, '0'] := state('0', L, 4);// q4
  TM.tr[4, '1'] := state('1', L, 4);
  TM.tr[4, 'o'] := state('o', R, 6);
  TM.tr[4, '!'] := state('!', R, 6);
  TM.tr[4, '_'] := state('_', R, 6);
  
  TM.tr[5, '0'] := state('!', R, 8);// q5
  TM.tr[5, '1'] := state('!', R, 7);// ¬ состо€них q5 и q6 машина записывает в €чейку скопированное значение
  TM.tr[5, '!'] := state('!', N, 11);// и копирует симвов из текущей €чейки
  
  TM.tr[6, '0'] := state('o', R, 8);// q6
  TM.tr[6, '1'] := state('o', R, 7);
  TM.tr[6, 'o'] := state('o', N, 11);
  
  TM.tr[7, '0'] := state('0', R, 7);// q7
  TM.tr[7, '1'] := state('1', R, 7);// —осто€ние q7 и q8 аналогичны состо€ни€м q3 и q4
  TM.tr[7, 'o'] := state('o', L, 9);// но машина двигаетс€ в другую сторону
  TM.tr[7, '!'] := state('!', L, 9);
  TM.tr[7, '_'] := state('_', L, 9);
  
  TM.tr[8, '0'] := state('0', R, 8);// q8
  TM.tr[8, '1'] := state('1', R, 8);
  TM.tr[8, 'o'] := state('o', L, 10);
  TM.tr[8, '!'] := state('!', L, 10);
  TM.tr[8, '_'] := state('_', L, 10);
  
  TM.tr[9, '0'] := state('!', L, 2);// q9
  TM.tr[9, '1'] := state('!', L, 2);// —осто€ни€ q9 и q10 аналогичны q5 и q6,
  TM.tr[9, '!'] := state('!', N, 11);// в q9 и q10 машина может перейти в состо€ние q2, чтобы начать цикл заново
  
  TM.tr[10, '0'] := state('o', L, 2);// q10
  TM.tr[10, '1'] := state('o', L, 2);
  TM.tr[10, 'o'] := state('o', N, 11);
  
  TM.tr[11, 'o'] := state('o', L, 11);// q11
  TM.tr[11, '!'] := state('!', L, 11);// √оловка возвращаетс€ в начало ленты
  TM.tr[11, '_'] := state('_', R, 12);
  
  TM.tr[12, 'o'] := state('0', R, 12);// q12
  TM.tr[12, '!'] := state('1', R, 12);// —н€тие меток
  TM.tr[12, '_'] := state('_', N, 0);
  
  startTM(TM);
  delete(TM.list, TM.list.size);
  
  print(TM.list);
  
END.