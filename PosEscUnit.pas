unit PosEscUnit;

interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
    cxContainer, cxEdit,  cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, Menus,
    cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons, RxRichEd, Buttons, SPComm, MSCommLib_TLB, shellapi,
    CPort;
type

    TPrintType = (Star = 0, Epson = 1);
    TPortType = (LPT = 0, COM = 1,DEBUG=2);
    TPOSEsc = class(Tobject)
    private
        _printtype: TPrintType;
        _port: string; _porttype: TPortType;
        _ComPort: TComPort;
        _lptfile: TextFile;
        procedure _PrintStr(str: string);
    public
        constructor Create;
        procedure ChangeLine;
        procedure FontSizeDefault;
        procedure FontSizeWidth;
        procedure FontSizeHeigh;
        procedure FontSizeBig;
        procedure ChineseMode;
        procedure PrintInit;
        procedure writeStr(str: string);
        procedure Open;
        procedure Close;
        property PrintType: TPrintType read _printtype write _printtype;
        property Port: string read _port write _port;
        property PortType: TPortType read _PortType write _PortType;
    end;
 function lasts(pd:string):string;
implementation

uses fm_debug_Unit;
function kinds(const pa:string):string;
//返回大写数字
var
  pb:string;
  pi:integer;
begin
 if pa='.' then
  pb:=''
  else
  begin
   pi:=strtoint(pa);
   case pi of
    0: pb:='零';
    1: pb:='壹';
    2: pb:='贰';
    3: pb:='叁';
    4: pb:='肆';
    5: pb:='伍';
    6: pb:='陆';
    7: pb:='柒';
    8: pb:='捌';
    9: pb:='玖';
   end;
  end;
   kinds:=pb;
end;

function alters(pc:integer):string;
//返回单位
begin
  case pc of
  1:alters:='分';
  2:alters:='角';
  3:alters:='';
  4:alters:='拾';
  5:alters:='佰';
  6:alters:='仟';
  7:alters:='万';
  8:alters:='拾';
  9:alters:='佰';
  10:alters:='仟';
  11:alters:='亿';
  12:alters:='拾';
  13:alters:='佰';
  14:alters:='仟';
  15:alters:='万亿';
  16:alters:='拾';
  17:alters:='佰';
  18:alters:='仟';
  19:alters:='亿亿';
  20:alters:='拾';
  21:alters:='佰';
  22:alters:='仟';
  23:alters:='万亿亿';
  24:alters:='拾';
  25:alters:='佰';
  26:alters:='仟';
  27:alters:='亿亿亿';
  28:alters:='拾';
  29:alters:='佰';
  30:alters:='仟';
  end;
end;

function lasts(pd:string):string;
//返回转换好的大写字符串
var
 pt,strchuli:string;
 m,i:integer;
 had0:boolean;     //是否有“零”
 isfirst:boolean;  //是第一次输出大单位
begin
  result:='';
  strchuli:=pd;
  m:=length(strchuli);
  //检查输入的字符都为数字或.
  for i:=1 to m do
  begin
    If not((ord(strchuli[i])=46)or(ord(strchuli[i])>47)and(ord(strchuli[i])<58)) Then
    begin
      showmessage(inttostr(ord(strchuli[i])));
      Showmessage( '读取错误，应为数字');
      Exit;
    end;
  end;
  //将输入的数转化为一个长整字符串，最小单位为分
  if m<10 then
  begin
    //可以直接转换为整数，则转为整数*100后再转回去
    strchuli:=inttostr(trunc(strtofloatdef(strchuli,0)*100));
  end
  else
  begin
    //去掉字符串前面的0
    for i:=1 to m do
    begin
      if copy(strchuli,i,1)<>'0' then break;
    end;
    if i>1 then
      strchuli:=copy(strchuli,i,m-i+1);
    //去掉字符串中的.
    for i:=1 to m do
    begin
      if copy(strchuli,i,1)='.' then break;
    end;
    if i=1 then
       strchuli:=copy(strchuli,2,2)
    else if i=m-1 then
       strchuli:=copy(strchuli,1,m-2)+copy(strchuli,m,1)+'0'
    else if i=m then
       strchuli:=copy(strchuli,1,m-1)+'00'
    else if i>m then
       strchuli:=strchuli+'00'
    else
       strchuli:=copy(strchuli,1,i-1)+copy(strchuli,i+1,2);
  end;
  m:=length(strchuli);
  pt:='';
  isfirst:=true;     //是第一次
  had0:=false;       //无零
  for i:=1 to m do
  begin
    if copy(strchuli,i,1)<>'0' then
    begin
      if had0 then
      begin
        pt:=pt+'零'+kinds(copy(strchuli,i,1))+alters(m-i+1);
      end
      else
      begin
        pt:=pt+kinds(copy(strchuli,i,1))+alters(m-i+1)
      end;
      //有数字输出就要恢复为无0
      had0:=false;
      //刚好在大单位输出就不是第一次了，否则要处于第一次
      if (m-i+1>4)and(((m-i+2) mod 4)=0) then
        isfirst:=false
      else
        isfirst:=true;
    end
    else
    begin
      had0:=true;  //有0
      if (m-i+1>4)and(((m-i+2) mod 4)=0)and(isfirst) then
      begin    //有多个0连续，只取第一个大单位
        pt:=pt+alters(m-i+1);
        had0:=false;    //又成了无0
        isfirst:=false;  //已经不是第一次了
      end;
    end;
    //倒数第三位加个元字
    if (m-i+1)=3 then
    begin
      pt:=pt+'元';
      had0:=false;
    end;
  end;
  //没有小数则加个整字
  if copy(strchuli,m-1,2)='00' then
     pt:=pt+'整';
  result:=pt;
end;


constructor TPOSEsc.Create;
begin

end;

procedure TPOSEsc.Open;
begin
    case _porttype of
        LPT: begin
                AssignFile(_lptfile, Port);
                rewrite(_lptfile);
            end;
        COM: begin
                _ComPort := TComPort.Create(nil);
                _ComPort.port := Port;
                _ComPort.BaudRate := br9600;
                _ComPort.open;
            end;
            DEBUG:
            begin
                 AssignFile (_lptfile, 'debug.bin');
                rewrite(_lptfile);
            end;
    end;
    PrintInit;
end;

procedure TPOSEsc.Close;
begin
    case _porttype of
        LPT: begin
                closefile(_lptfile);
            end;
        COM: begin
                _ComPort.Close;
                FreeAndNil(_ComPort);
            end;
             DEBUG: begin
                closefile(_lptfile);
                frm_debug:=Tfrm_debug.Create(nil);
                frm_debug.MPHexEditor1.LoadFromFile('debug.bin');
                frm_debug.ShowModal;
            end;
    end;
end;

procedure TPOSEsc.ChangeLine;
begin
    case _printtype of
        Star: _PrintStr(chr($0D) + chr($0A));
        Epson: _PrintStr(chr($0D));
    end;

end;

procedure TPOSEsc.PrintInit;
begin
    case _printtype of
        Star: begin
                _PrintStr(chr($18) + chr($1b) + chr($4D) + chr($14));
            end;
        Epson: begin
                _PrintStr(chr($1B) + chr($40));
                _PrintStr(chr($1B) + chr($33)+ chr($01));
               // _PrintStr(chr($1C) + chr($26));
            end;
    end;
end;

procedure TPOSEsc.FontSizeDefault;
begin
    case _printtype of
        Star: _PrintStr(chr($14));
        Epson: _PrintStr('');
    end;
end;

procedure TPOSEsc.FontSizeWidth;
begin
    case _printtype of
        Star: _PrintStr(chr($0E));
        Epson: _PrintStr('');
    end;
end;

procedure TPOSEsc.FontSizeHeigh;
begin
    case _printtype of
        Star: _PrintStr('');
        Epson: _PrintStr('');
    end;
end;

procedure TPOSEsc.FontSizeBig;
begin
    case _printtype of
        Star: _PrintStr('');
        Epson: _PrintStr('');
    end;
end;

procedure TPOSEsc.ChineseMode;
begin
    case _printtype of
        Star: _PrintStr('');
        Epson: _PrintStr('');
    end;
end;

procedure TPOSEsc.writeStr(str: string);
begin
    _PrintStr(str);
end;

procedure TPOSEsc._PrintStr(str: string);
begin
    case _porttype of
        LPT: Write(_lptfile, str);
        COM: _ComPort.WriteStr(str);
        DEBUG: Write(_lptfile, str);
    end;
end;
end.

