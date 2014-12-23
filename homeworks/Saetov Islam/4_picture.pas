
  
  
var 
  dictionrefile:textfile;
  y:System.string;
  count:integer;
  words:System.Collections.Generic.List<string>;


 
 function ismatched (str:string):boolean;
 var 
 tmp:string;
  begin
   if str.Count<>count
    then
      begin
        result:=false;
        exit;
      
      end;
  tmp:=y;
    result:=true;
    for i:integer:=1 to str.Length do
         if  tmp.Contains(str[i])
         then
          begin
            var t:integer;
            t:=tmp.IndexOf(str[i]);
            tmp:=tmp.Remove(t,1);
          end
         else
         begin
          result:=false;
          break;
         end 
  end;
 
 begin
    Writeln('Введите набор букв');
    Readln(y);
    Writeln('Количество букв в слове ');
    Readln(count);
    y:=y.ToLower;
    words:=new System.Collections.Generic.List<string>;
   
    assignfile(dictionrefile,'zdf-win.txt');
    reset (dictionrefile);
    while not Eof(dictionrefile) do
    begin
        var str:string;
        readln (dictionrefile,str);
        if ismatched(str)
        then
          words.Add(str);
    end;
    words.Select(x->x).println;
 end.