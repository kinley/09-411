program mirror;

uses UTM, UDLL;

var
  TM: tTM;
  
BEGIN

  initList(TM.list);
  pushBack(TM.list, '_');
  pushBack(TM.list, 'a');
  pushBack(TM.list, 'b');
  pushBack(TM.list, 'b');
  pushBack(TM.list, 'a');
  pushBack(TM.list, 'a');
  pushBack(TM.list, 'b');
  pushBack(TM.list, 'b');
  pushBack(TM.list, 'b');
  pushBack(TM.list, 'a');
  pushBack(TM.list, 'a');
  pushBack(TM.list, '_');
  
  TM.tr[0, 'a'] := state('a', R, 0);// q0
  TM.tr[0, 'b'] := state('b', R, 0);// In this state machine reaches the end of the tape,
  TM.tr[0, '_'] := state('=', L, 0);// without changing the values of the elements
  TM.tr[0, '='] := state('=', L, 1);// It marks the end of the sign '='
  
  TM.tr[1, 'a'] := state('a', L, 1);// q1
  TM.tr[1, 'b'] := state('b', L, 1);// return, marks the beginning of an asterisk '*'
  TM.tr[1, '_'] := state('*', R, 2);// 
  
  TM.tr[2, 'a'] := state('_', R, 3);// q2
  TM.tr[2, 'b'] := state('b', R, 2);// erase the mark and to start sorting
  TM.tr[2, '='] := state('_', L, 12);// goto end
  TM.tr[2, '_'] := state('_', R, 2);// transfer to =
  
  TM.tr[3, 'a'] := state('a', R, 3);// q3
  TM.tr[3, 'b'] := state('b', R, 3);// record all 'a' after '='
  TM.tr[3, '='] := state('=', R, 4);// goto q4
  TM.tr[3, '_'] := state('_', R, 3);// 
  
  TM.tr[4, 'a'] := state('a', R, 4);// q4 record 'a' after '='
  TM.tr[4, '_'] := state('a', L, 5);// and after 'a'
  
  TM.tr[5, 'a'] := state('a', L, 5);// q5
  TM.tr[5, 'b'] := state('b', L, 5);// return left for finding signs
  TM.tr[5, '='] := state('=', L, 6);// 
  TM.tr[5, '_'] := state('_', R, 2);// 
  
  TM.tr[6, 'a'] := state('_', R, 3);// q6 record the nearest 'a'
  TM.tr[6, 'b'] := state('b', L, 6);//
  TM.tr[6, '='] := state('=', L, 6);
  TM.tr[6, '_'] := state('_', L, 6);// 
  TM.tr[6, '*'] := state('*', R, 7);// while current <> '*'
  
  TM.tr[7, 'b'] := state('_', R, 8);// q7
  TM.tr[7, '_'] := state('_', R, 7);// begin finding 'b'
  
  TM.tr[8, 'b'] := state('b', R, 8);// q8
  TM.tr[8, '='] := state('=', R, 9);// delete 'b' for writing after '=' and 'a'
  TM.tr[8, '_'] := state('_', R, 8);
  
  TM.tr[9, 'a'] := state('a', R, 9);// q9
  TM.tr[9, 'b'] := state('b', R, 9);// write 'b' after '=' and 'a'
  TM.tr[9, '_'] := state('b', L, 10);// 
  
  TM.tr[10, 'a'] := state('a', L, 10);// q10
  TM.tr[10, 'b'] := state('b', L, 10);// goto '='
  TM.tr[10, '='] := state('=', L, 11);
  TM.tr[10, '_'] := state('_', L, 10);
  
  TM.tr[11, 'b'] := state('_', R, 8);// q11
  TM.tr[11, '='] := state('_', L, 2);// recording 'b' after all
  TM.tr[11, '_'] := state('_', L, 11);
  TM.tr[11, '*'] := state('_', R, 2);
  
  TM.tr[12, '*'] := state('_', N, 12);// q12 delete '*', eof
  
  startTM(TM);
  delete(TM.list, TM.list.size);
  
  print(TM.list);
  
END.