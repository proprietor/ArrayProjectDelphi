program ArraysProject;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TArray = array [1..100] of integer;

var
  firstArray: TArray;
  secondArray: TArray;
  thirdArray: TArray;
  arrayWithRepetitions: TArray;
  number: integer;
  n, m, k: integer;


procedure PrintArray(Arr: TArray; size: integer);
var
  i: integer;
begin
	for i:=1 to size do
	begin
		Write(Arr[i], ' ');
	end;
  WriteLn;
end;

procedure InputArray(var Arr: TArray; size: integer);
var
  i: integer;
begin
	for i:=1 to size do
	begin
		Read(Arr[i]);
	end;
end;

procedure BubbleSort(var Vetor: TArray; size: integer);
var
  i, temp: Integer;
  changed: Boolean;
begin
  changed := True;
  while changed do
  begin
    	changed := False;
    	for i := 1 to size - 1 do
    	begin
      	if (Vetor[i] > Vetor[i+1]) then
       	begin
          temp := Vetor[i+1];
          Vetor[i+1] := Vetor[i];
          Vetor[i] := temp;
          changed := True;
       	end;
    	end;
  end;
end;

function GetRepetitions(Arr: TArray; Chislo: integer) : integer;
var
  i : integer;
  counter: integer;
begin
  counter := 0;
  for i := 1 to Length(Arr) do
  begin
    if (Arr[i] = Chislo) then
    begin
      counter := counter + 1;
    end;
  end;
  result := counter;
end;

function GetArrayWithRepetitions(Chislo: integer) : TArray;
begin
  result[1] := GetRepetitions(firstArray, Chislo);
  result[2] := GetRepetitions(secondArray, Chislo);
  result[3] := GetRepetitions(thirdArray, Chislo);
  BubbleSort(result, 3);
end;

procedure SortArrays();
begin
  BubbleSort(firstArray, m);
  BubbleSort(secondArray, n);
  BubbleSort(thirdArray, k);
end;

procedure PrintArrays();
begin
  WriteLn('OutPut:');
	PrintArray(firstArray, m);
  PrintArray(secondArray, n);
  PrintArray(thirdArray, k);
  Writeln;
end;

procedure InputArrays();
begin
  Writeln('Please input number of elements in first array');
  Read(m);
  Writeln('Please input first array');
  InputArray(firstArray, m);

  Writeln('Please input number of elements in second array');
  Read(n);
  Writeln('Please input second array');
  InputArray(secondArray, n);

  Writeln('Please input number of elements in third array');
  Read(k);
  Writeln('Please input third array');
  InputArray(thirdArray, k);
end;

begin
  InputArrays();
  SortArrays();
  PrintArrays();

  Write('Please input number:');
  Read(number);
  Writeln;

  Writeln('Array with results');
  PrintArray(GetArrayWithRepetitions(number), 3);
	ReadLn;  ReadLn;
end.
