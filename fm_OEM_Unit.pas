unit fm_OEM_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxMemo, cxTextEdit, cxButtons,
  cxGroupBox,des, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  Tfm_oem = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxMemo1: TcxMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_oem: Tfm_oem;
 function GetVersionString(FileName: string): string;
implementation

uses fm_main_unit;

{$R *.dfm}

 function GetVersionString(FileName: string): string;
    var
     VerInfoSize: DWORD;
     VerInfo: Pointer;
     VerValueSize: DWORD;
     Dummy: DWORD;
     VerValue: PVSFixedFileInfo;
    begin
     Result := '';
     VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
     if VerInfoSize = 0 then Exit;
     GetMem(VerInfo, VerInfoSize);
     GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, VerInfo);
     VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
     Result := IntToStr(VerValue^.dwFileVersionMS shr 16) + '.' +
     IntToStr(VerValue^.dwFileVersionMS and $FFFF) + '.' +
     IntToStr(VerValue^.dwFileVersionLS shr 16) + '.' +
     IntToStr(VerValue^.dwFileVersionLS and $FFFF);
     FreeMem(VerInfo);
    end;

 procedure Tfm_oem.cxButton1Click(Sender: TObject);
 var
   str:string;
 begin
str:=UpperCase( Des.EnCrypt(GetVersionString(Application.ExeName)));
if cxTextEdit1.Text=str then
begin
frm_main.SetAbout('main',cxTextEdit2.text);
frm_main.SetAbout('about',cxMemo1.Text);
Close;
end
else
close;
end;
end.
