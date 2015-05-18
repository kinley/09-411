unit list_worker;

{$mode objfpc}{$H+}

interface

type
  TProgramming = class
    type
      PList = ^TList;
      TValue = String[20];

      TList = record
        next:PList;
        value:TValue;
      end;

    private
      head:PList;
      procedure FillFromFile(file_name:String);
      procedure InstertIntoList(item:TValue);
      procedure DeleteSameWords();

    public
      constructor create(input_file:String);
      procedure Print();
  end;

implementation
  constructor TProgramming.create(input_file:String);
  begin
    New(head);
    head^.next:= nil;
    head^.value:= '';
    FillFromFile(input_file);
    DeleteSameWords();
  end;

  procedure TProgramming.FillFromFile(file_name:String);
  var
    T:Text;
    temp:TValue;
  begin
    Assign(T, file_name);
    Reset(T);

    while not(eof(T)) do
    begin
      ReadLn(T, temp);
      InstertIntoList(temp);
    end;

    Close(T);
  end;

  procedure TProgramming.InstertIntoList(item:TValue);
  var
    temp:PList;
  begin
    temp:=head;
    while (temp^.next <> nil) do
      temp:=temp^.next;

    if (item[1] = 'z') then
    begin
      New(temp^.next);
      temp^.next^.next:= nil;
      temp^.next^.value:= '; ';
      temp:= temp^.next;
    end;

    New(temp^.next);
    temp^.next^.next:= nil;
    temp^.next^.value:= item;
  end;

  procedure TProgramming.DeleteSameWords();
  var
    temp:PList;
    fordsFinded:Boolean;
  begin
    fordsFinded:= True;

    if (head^.next <> nil) then
      while(fordsFinded) do
      begin
        temp:= head^.next;
        fordsFinded:=False;

        while (temp^.next <> nil) do
        begin
          if (temp^.value = temp^.next^.value) then
          begin
            fordsFinded:= True;

            temp^.next:= temp^.next^.next;
          end;
          if (temp^.next <> nil) then
            temp:= temp^.next;
        end;
      end;
  end;

  procedure TProgramming.Print();
  var
    temp:PList;
  begin
    temp:=head^.next;
    while(temp<>nil) do
    begin
      WriteLn(temp^.value);
      temp:=temp^.next;
    end;
  end;

end.

