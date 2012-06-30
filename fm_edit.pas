unit fm_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Menus, cxContainer, cxEdit, StdCtrls,
  cxTextEdit, cxListBox, cxButtons, cxPC, ExtCtrls, cxCheckBox,NativeXml,
  cxMaskEdit, cxButtonEdit,activex;

type
  TForm3 = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxListBox1: TcxListBox;
    cxTextEdit1: TcxTextEdit;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxCheckBox1: TcxCheckBox;
    Panel2: TPanel;
    cxTextEdit2: TcxTextEdit;
    cxButtonEdit1: TcxButtonEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    showtype:integer;
    id:string;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.cxButton2Click(Sender: TObject);
begin
close;
end;

procedure TForm3.cxButton1Click(Sender: TObject);

begin

  if showtype=0 then
  begin

  end
  else
  begin



  end;

end;

procedure TForm3.FormShow(Sender: TObject);
var
guid:TGUID;
begin
if showtype=0 then
begin
 CoCreateGuid(Guid);
 id:=GUIDToString(guid) ;
end
else
begin

end;
end;

end.
