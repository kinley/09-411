Program DianaWork;

uses crt;

var digit : integer;

function SimpleCheck(digit : integer) : boolean;     {проверка на то, простое ли это число}
         var i:integer;
             check: boolean;
         begin
         i:= 2;
         check:= True;
         if (digit<>1) and (digit<>2) then   {1 или 2 точно простые, для остальных проверяем}
                        begin
                             while (check) and (i <= digit-1) do
                                   begin
                                   if digit mod i = 0 then     {если оно делится на какое то кроме себя и 1, то сразу выходим}
                                                         check:=False;
                                   inc(i);
                                   end;
                        end;
         SimpleCheck:= check;
         end;

function GoldBah(digit : integer) : boolean;    {главное функция проверки}
         var i : integer;
             check : boolean;
         begin
         check:= False;
         i:= 1;
         if (digit > 2) and (digit mod 2 = 0) then  {если оно меньше двух или нечетное, то проверять его нет нужды}
            while (check = False) and (i <= digit div 2) do     {проверяем половинки числа}
               begin
                      if (SimpleCheck(i)) and (SimpleCheck(digit - i)) then   {если числа с обоих половинок подходят, то это число соотв.}
                                                                            begin
                                                                            writeln('Digits : ',i,' ',digit - i);
                                                                            check:=True;
                                                                            end;
                      inc(i);
               end;
         GoldBah:= check;
         end;

begin
clrscr;
writeln('Enter your digit');
readln(digit);
writeln('Answer : ',GoldBah(digit));
end.