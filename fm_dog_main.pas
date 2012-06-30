unit fm_dog_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit;

type
  TForm4 = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxButton4: TcxButton;
    cxMaskEdit1: TcxMaskEdit;
    cxMaskEdit2: TcxMaskEdit;
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses syun_unit,des;

{$R *.dfm}

procedure TForm4.cxButton1Click(Sender: TObject);
begin
 WriteString(0,cxTextEdit1.Text);
end;

procedure TForm4.cxButton2Click(Sender: TObject);
var
  format: TFormatSettings;d:TDateTime ;
begin
   format.ShortDateFormat := 'yyyy-MM-dd';
   format.DateSeparator := '-';
    if (TryStrToDate(cxMaskEdit1.Text, d,format) and TryStrToDate(cxMaskEdit2.Text, d,format)) then
   begin
 WriteString(10,cxMaskEdit1.Text);
 WriteString(20,cxMaskEdit2.Text);
 end
 else
 Application.MessageBox('日期格式不正确，正确的格式应该为：2011-01-01','系统提示',MB_OK)

end;

procedure TForm4.cxButton3Click(Sender: TObject);
begin
cxTextEdit2.Text:=des.EnCrypt(cxMaskEdit2.Text,cxTextEdit1.Text) ;
end;

procedure TForm4.cxButton4Click(Sender: TObject);
begin
cxTextEdit1.Text:=ReadString(0,5);
cxMaskEdit1.Text:=ReadString(10,10);
cxMaskEdit2.Text:=ReadString(20,10);
end;

procedure TForm4.FormShow(Sender: TObject);
begin
cxMaskEdit1.Text:=FormatDateTime('yyyy-MM-dd',now);
cxMaskEdit2.Text:=FormatDateTime('yyyy-MM-dd',now);
end;

end.
