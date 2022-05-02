

Program project1(input, output);
uses
    Sysutils;

var 
    out        : TextFile;
	fin        : TextFile;
    resistor   : String;
    tableTitle : String;
    i          : Integer;
    Len        : Integer;
    Arr        : array of Char;
    value      : longint;
    lower      : longint;
    upper      : longint;
    stringVal  : String;

function getValue(val:Char):integer;
begin
    if (val = 'k') then 
        begin
            getValue := 0;
        end
    else if (val = 'n') then
        begin
            getValue := 1;
        end
    else if (val = 'r') then
        begin
            getValue := 2;
        end
    else if (val = 'o') then
        begin
            getValue := 3;
        end
    else if (val = 'w') then
        begin
            getValue := 4;
        end
    else if (val = 'g') then
        begin
            getValue := 5;
        end
    else if (val = 'b') then
        begin
            getValue := 6;
        end
    else if (val = 'v') then
        begin
            getValue := 7;
        end
    else if (val = 'y') then
        begin
            getValue := 8;
        end
    else //if (val = 'e') then
        begin
            getValue := 9;
        end
end;

function getMultiplier(val:Char):Double;
begin
    if (val = 'k') then 
        begin
            getMultiplier := 1.0;
        end
    else if (val = 'n') then
        begin
            getMultiplier := 10.0;
        end
    else if (val = 'r') then
        begin
            getMultiplier := 100.0;
        end
    else if (val = 'o') then
        begin
            getMultiplier := 1000.0;
        end
    else if (val = 'w') then
        begin
            getMultiplier := 10000.0;
        end
    else if (val = 'g') then
        begin
            getMultiplier := 100000.0;
        end
    else if (val = 'b') then
        begin
            getMultiplier := 1000000.0;
        end
    else if (val = 'v') then
        begin
            getMultiplier := 10000000.0;
        end
    else if (val = 'y') then
        begin
            getMultiplier := 100000000.0;
        end
    else if (val = 'e') then
        begin
            getMultiplier := 1000000000.0;
        end
    else if (val = 'd') then
        begin
            getMultiplier := 0.1;
        end
    else //if (val = 's') then
        begin
            getMultiplier := 0.01;
        end
end;

function getTolerance(val:Char):Double;
begin
    if (val = 'k') then 
        begin
            getTolerance := 0;
        end
    else if (val = 'n') then
        begin
            getTolerance := 0.01;
        end
    else if (val = 'r') then
        begin
            getTolerance := 0.02;
        end
    else if (val = 'o') then
        begin
            getTolerance := 0;
        end
    else if (val = 'w') then
        begin
            getTolerance := 0.05;
        end
    else if (val = 'g') then
        begin
            getTolerance := 0.005;
        end
    else if (val = 'b') then
        begin
            getTolerance := 0.0025;
        end
    else if (val = 'v') then
        begin
            getTolerance := 0.001;
        end
    else if (val = 'y') then
        begin
            getTolerance := 0.0005;
        end
    else if (val = 'e') then
        begin
            getTolerance := 0;
        end
    else if (val = 'd') then
        begin
            getTolerance := 0.05;
        end
    else //if (val = 's') then
        begin
            getTolerance := 0.1;
        end
end;

begin
    if ( paramCount() <> 2 ) then
    	begin
		    writeln( 'Usage: test-main <input> <output>' );
        end
    else
    begin {begin for main else branch}
        Assign( out, paramStr(2) );
		Assign( fin, paramStr(1) );
		Reset(fin);
		Rewrite(out);
        { while there are more strings}
        tableTitle := 'Bands   Value   Lower   Upper';
        writeln(out, tableTitle);
        while not EOF(fin) do
        begin
            Readln( fin, resistor);
            Len := Length(resistor);
            SetLength(arr, Len);
            for i := 1 to Len do
                Arr[i - 1] := resistor[i];
                    
            if (Len = 3) then
                begin
                    stringVal := IntToStr(getValue(Arr[0]));
                    stringVal := stringVal + IntToStr(getValue(Arr[1]));
                    value := Trunc(StrToInt(stringVal) * getMultiplier(Arr[2]));
                    lower := Trunc(value - value*0.2);
                    upper := Trunc(value + value*0.2);
                    resistor := resistor + '   ' + IntToStr(value) + '   ' + IntToStr(lower) + '   ' + IntToStr(upper);
                end
            else if (Len = 4) then
                begin
                    stringVal := IntToStr(getValue(Arr[0]));
                    stringVal := stringVal + IntToStr(getValue(Arr[1]));
                    value := Trunc(StrToInt(stringVal) * getMultiplier(Arr[2]));
                    lower := Trunc(value - value*getTolerance(Arr[3]));
                    upper := Trunc(value + value*getTolerance(Arr[3]));
                    resistor := resistor + '   ' + IntToStr(value) + '   ' + IntToStr(lower) + '   ' + IntToStr(upper);
                end
            else
                begin
                    stringVal := IntToStr(getValue(Arr[0]));
                    stringVal := stringVal + IntToStr(getValue(Arr[1]));
                    stringVal := stringVal + IntToStr(getValue(Arr[2]));
                    value := Trunc(StrToInt(stringVal) * getMultiplier(Arr[3]));
                    lower := Trunc(value - value*getTolerance(Arr[4]));
                    upper := Trunc(value + value*getTolerance(Arr[4]));
                    resistor := resistor + '   ' + IntToStr(value) + '   ' + IntToStr(lower) + '   ' + IntToStr(upper);
                end;
        
            writeln(out, resistor);
        {readln(fin, resistor);}
        end;
        Close(fin);
        Close(out);
    end
end.