unit functionT;

interface
	procedure Magic(var u: real);
	function pow(x: real; p: integer): real;
implementation
	procedure Magic(var u :real);
	var
		i: integer;
		num: array[1..10] of integer;
	begin
		
		for i:=1 to 10 do
		begin
			u:=u*2;
			num[i]:=trunc(u);
			u:=frac(u);
		end;
		
		for i:=1 to 9 do
			num[i]:=(num[i]+num[i+1]) mod 2;
		
		u:=0;
		for i:=1 to 10 do
			u:=u+num[i]*pow(2, -i)
	end;
	
	function pow(x:real; p:integer):real;
	var
		i: integer;
	begin
		pow:=1;
		for i:=1 to abs(p) do
			pow:=pow*x;
		if p<0 then pow:=1/pow
	end;
end.
