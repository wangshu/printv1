unit syun_unit;

interface

uses  SYUNEW2ALib_TLB,Windows, ActiveX, Classes, SysUtils,
Graphics, OleCtrls, OleServer, StdVCL, Variants,Forms;


function ReadId:string;
function ReadString(index:integer;count:integer):string;
procedure WriteString(index:integer;str:string);
implementation
function char_16_int(hex_char: char):integer;
begin
if (hex_char>='0')and(hex_char<='9') then result:=ord(hex_char)-ord('0');
if (hex_char>='a')and(hex_char<='f') then result:=10+ord(hex_char)-ord('a');
if (hex_char>='A')and(hex_char<='F') then result:=10+ord(hex_char)-ord('A');
end;



function ReadId:string;
var
  ID1, ID2: LongWord;
  s_simnew1: Ts_simnew;
  DevicePath: string;
begin
  try

   s_simnew1 := Ts_simnew.Create(nil);
   except
      Application.MessageBox('系统提示','请安装加密锁驱动后再运行本程序！',MB_OK);
      Application.Terminate;
   end;
    DevicePath := s_simnew1.FindPort(0);
    if s_simnew1.LastError = 0 then
    begin
      ID1 := s_simnew1.GetID_1(DevicePath);
      ID2 := s_simnew1.GetID_2(DevicePath);
      Result:=IntToHex(ID1, 0) + IntToHex(ID2, 0);
    end;

end;
function ReadString(index:integer;count:integer):string;
var
 ID1, ID2: LongWord;
  s_simnew1: Ts_simnew;
  DevicePath: string;
  j,i:integer;
begin
  Result := '';
  try
    s_simnew1 := Ts_simnew.Create(nil);
    DevicePath := s_simnew1.FindPort(0);
    if s_simnew1.LastError = 0 then
    begin
        for j := 0 to count-1 do
        begin
         i := s_simnew1.YRead(index+j, DevicePath);
         Result := Result + chr(i);
        end;
    end;
  finally

  end;

   ;
end;
procedure WriteString(index:integer;str:string);
var
 ID1, ID2: LongWord;
  s_simnew1: Ts_simnew;
  DevicePath: string;
  j,i:integer;
begin

  try
    s_simnew1 := Ts_simnew.Create(nil);
    DevicePath := s_simnew1.FindPort(0);
    if s_simnew1.LastError = 0 then
    begin
      for i := 0 to length(str) - 1 do
      begin
       j:=ord(str[i+1]) ;
           s_simnew1.YWrite(j,index+i,DevicePath ) ;
      end;

    end;
  finally

  end;
   ;
end;

end.
