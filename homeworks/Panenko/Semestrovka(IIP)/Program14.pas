Program Program14;
uses crt;

Const N=100;
Const R=10;

Type sequence = array[1..N] of real;
Type frequence = array[1..R] of real;

var
  i:integer;
  seqArray:sequence;


function getVDigit(inputString:string):integer;
var digit1,digit2,tmp:integer;
begin
val(inputString[1],digit1,tmp);
val(inputString[2],digit2,tmp);
if digit1 + digit2 >= 10 then
  getVDigit:= (digit1 + digit2) mod 10
else 
  getVDigit:= digit1 + digit2;
end;


function getUDigit(inputString:string):integer;
var digit,tmp:integer;
begin
val(inputString,digit,tmp);
getUDigit:=digit;
end;


function getFuncDigit(u:real):real;
var
    i:integer;
    answer,pow:real;
    tmp,tmp2:string;
begin


tmp:=FloatToStr(u);
pow:=2;

for i:=1 to 5 do
answer:= answer + getVDigit(tmp[i+2] + tmp[13-i]) * power(pow,-i);

for i:=6 to 10 do
answer:= answer + getUDigit(tmp[i+2]) * power(pow,-i);

getFuncDigit:= answer;
end;


function getfDigit(x,y,z, a:real):real;
begin
getfDigit:=Ln(1 + abs(x + y*y + z*z*a))/(1 + abs(x + y*y + z*z*a));
end;


procedure initializeSequence(var mas:sequence; a:real);
var i:integer;
begin
mas[1]:=0.025;
mas[2]:=0.714;
mas[3]:=0.211;
for i:=4 to N do
mas[i]:=getFuncDigit(getfDigit(mas[i - 1],mas[i - 2],mas[i - 3],a));
end;

begin
clrscr;
initializeSequence(seqArray,1);
for i:=1 to N do
writeln(i,' Digit = ', seqArray[i]);
end.