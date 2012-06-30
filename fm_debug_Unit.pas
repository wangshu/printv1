unit fm_debug_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxGraphics, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxGroupBox, Grids, MPHexEditor, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  Tfrm_debug = class(TForm)
    MPHexEditor1: TMPHexEditor;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxComboBox1: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_debug: Tfrm_debug;

implementation

{$R *.dfm}

procedure Tfrm_debug.cxButton1Click(Sender: TObject);
var
   f: TextFile;
   i:integer;
begin
             AssignFile(f, cxComboBox1.Text);
                rewrite(f);
             for     i:=0 to self.MPHexEditor1.DataSize do
             begin
               write(f,self.MPHexEditor1.data[i])
             end;
             closefile(f);


               
end;

end.
