program Sortings;
  
  uses
    utils;
  
  const
    n = 1000;
  
  type
    tIndex = 1..n;
    tNum = integer;
    tArray = array [tIndex] of tNum;
  
  var
    arr, x: tArray;
    time: integer;
    
  procedure readArr(var a: tArray);
    var
      f: text;
      i: tIndex;
    
  Begin
    assign(f, '1Kints.txt');
    reset(f);
    for i := 1 to n do
      begin
        read(f, a[i]);
        readln(f);
      end;
    close(f);
  End;
  
  procedure swap(var num1, num2: tNum);
    var
      s: tNum;
    
  Begin
    s := num1;
    num1 := num2;
    num2 := s;
  End;
  
  function check(x: tArray): boolean;
    var
      i: tIndex;
      b: boolean;
    
  Begin
    b := true;
    i := 1;
    while (i<=n-1) and b do
      begin
        b := x[i]<x[i+1];
        inc(i);
      end;
    check := b;
  End;
  
  procedure InsertionSort(var a: tArray);
    var
      i, j: tIndex;
      x: tNum;
    
  Begin
    for i := 2 to n do
      begin
        x := a[i];
        j := i;
        while (j>1) and (x<a[j-1]) do
          begin
            a[j] := a[j-1];
            dec(j);
          end;
        a[j] := x;
      end;
  End;
  
  procedure SelectionSort(var a: tArray);
    var
      i, j, min: tIndex;
    
  Begin
    for i := 1 to n-1 do
      begin
        min := i;
        for j := i+1 to n do
          if a[j]<a[min] then min := j;
        swap(a[i], a[min]);
      end;
  End;
  
  procedure BubbleSort(var a: tArray);
    var
      i, j: tIndex;
    
  Begin
    for i := 1 to n do
      for j := 1 to n-i do
        if a[j]>a[j+1] then swap(a[j], a[j+1]);
  End;
  
  procedure ShellSort(var a: tArray);
    var
      i, j, d, am: tIndex; //d - interval, am - number of intervals
    
  Begin
    d := 1;
    am := trunc(ln(n)/ln(3)); 
    for i := 2 to am do //finding the maximum interval
      d := 3*d+1;
    while d>=1 do
      begin
        for i := d+1 to n do
          begin
            j := i;
            while (j>d) and (a[j]<a[j-d]) do //swapping the necessary elements
              begin
                swap(a[j], a[j-d]);
                j := j-d;
              end;
          end;
        d := (d-1) div 3; //narrowing of the interval
      end;
  End;
  
  procedure QuickSort(var a:tArray);
    procedure partition(var pA: tArray; L, R: tIndex); //dividing array into subarrays
      var
        i, j: tIndex;
        mid: tNum;
      
    Begin
      i := L;
      j := R;
      mid := pA[(L+R) div 2]; //reference point - the element, located in the middle of the array
      repeat
        begin
          while pA[i]<mid do
            inc(i);
          while mid<pA[j] do
            dec(j);
          if i<=j then
            begin
              swap(pA[i], pA[j]);
              inc(i);
              dec(j);
            end;
        end
      until i>j;
      if L<j then partition(pA, L, j); //continue dividing into subarrays until its length would 1
      if i<R then partition(pA, i, R);
    End;
    
  Begin
    partition(a, 1, n);
  End;
  
BEGIN
  readArr(arr);
  
  x := arr;
  time := Milliseconds;
    InsertionSort(x);
  time := Milliseconds - time;
  writeln(check(x), ' ', time);
  
  x := arr;
  time := Milliseconds;
    SelectionSort(x);
  time := Milliseconds - time;
  writeln(check(x), ' ', time);
    
  x := arr;
  time := Milliseconds;
    BubbleSort(x);
  time := Milliseconds - time;
  writeln(check(x), ' ', time);
    
  x := arr;
  time := Milliseconds;
    ShellSort(x);
  time := Milliseconds - time;
  writeln(check(x), ' ', time);
  
  x := arr;
  time := Milliseconds;
    QuickSort(x);
  time := Milliseconds - time;
  writeln(check(x), ' ', time);
END.