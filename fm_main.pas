unit fm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxContainer, cxListBox, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxEdit, cxInplaceContainer, cxVGrid, Grids, ValEdit, cxGroupBox,
  RM_System, RM_Common, RM_Class, RM_Designer,NativeXml;

type
  TForm2 = class(TForm)
    Panel4: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxListBox1: TcxListBox;
    ValueListEditor1: TValueListEditor;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    RMDesigner1: TRMDesigner;
    RMReport1: TRMReport;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    xml:TNativeXml;
    procedure showitem;
  end;

var
  Form2: TForm2;

implementation

uses syun_unit,des;
{$R *.dfm}
procedure TForm2.showitem;
var

i:integer;
begin

self.cxListBox1.Items.Clear;

for i:=0 to xml.Root.NodeByName('item').NodeCount-1 do
begin
    cxlistbox1.Items.Add(xml.Root.NodeByName('item').Nodes[i].AttributeByName['name']) ;
end;


end;
procedure TForm2.FormShow(Sender: TObject);

begin
xml:=TNativeXml.Create;
xml.LoadFromFile('config.xml');
 if true then
begin
  cxButton1.Enabled:=true;
  cxButton2.Enabled:=true;
  cxButton5.Enabled:=true;
  cxButton4.Enabled:=true;

end
else
begin

end;
showitem;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
xml.SaveToFile('config.xml');
freeandnil(xml);
end;

end.
