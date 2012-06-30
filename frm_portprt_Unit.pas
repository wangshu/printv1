unit frm_portprt_Unit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
    cxContainer, cxEdit,cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, Menus,
    cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons, RxRichEd, Buttons, SPComm, MSCommLib_TLB, shellapi,
    CPort, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
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
    Tfrm_portprt = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        cxButton1: TcxButton;
        Label1: TLabel;
        cxComboBox1: TcxComboBox;
        cxButton2: TcxButton;
        pnl1: TPanel;
        btn1: TSpeedButton;
        btn2: TSpeedButton;

        procedure cxButton1Click(Sender: TObject);
        procedure cxButton2Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btn1Click(Sender: TObject);
        procedure btn2Click(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
    { Public declarations }
        cxrichedit1: TRxRichEdit;
        filename: string;
        function commPrint: Boolean;

    end;

var
    frm_portprt: Tfrm_portprt;

implementation

uses fm_main_unit;

{$R *.dfm}

function Tfrm_portprt.commPrint: Boolean;
var
    i: integer;
    ComPort1: TComPort;
    isbig: Boolean;
    row: Integer;
begin
    ComPort1 := TComPort.Create(nil);
    try
        ComPort1.port := cxComboBox1.text;
        ComPort1.BaudRate := br9600;
        ComPort1.open;
        ComPort1.WriteStr(chr($18) + chr($18) + chr($4D) + chr($14));
        isbig := false;
        row := 0;
        for i := 0 to Length(cxRichEdit1.text) - 1 do
            begin
                cxrichedit1.SelStart := i;
                cxrichedit1.SelLength := 1;
                if row <> cxrichedit1.LineFromChar(cxrichedit1.SelStart) then
                    begin

                        ComPort1.WriteStr(chr($0D) + chr($0A));
                        row := cxrichedit1.LineFromChar(cxrichedit1.SelStart);
                    end;
                if cxRichEdit1.SelAttributes.Size = 20 then
                    begin

                        ComPort1.WriteStr(chr($14));
                    end
                else
                    begin
                        ComPort1.WriteStr(chr($0E));
                    end;
                ComPort1.WriteStr(cxrichedit1.SelText);
            end;

        ComPort1.WriteStr(chr($1B) + chr($43) + chr($01));
    finally
        ComPort1.Close;

        freeandnil(ComPort1);

    end;
end;

procedure Tfrm_portprt.cxButton1Click(Sender: TObject);
var
    i, j: integer;
    printstr, tempstr: pchar;
    printsting: string;
    f: TextFile;
    isbig: Boolean;
    indexs: TStrings;
    row: Integer;
    beginindex, endindex: Integer;
    data_buf: array[1..12] of BYTE;
    flag: Boolean;
begin
    printstr := '';
    flag := True;
    indexs := TStringList.Create;
 //Self.cxRichEdit1.Lines.SaveToFile(filename);
    try
        if Pos('LPT', cxComboBox1.Text) > 0 then
   //if True then
            begin
     //并口打印
                AssignFile(f, cxComboBox1.Text);
                rewrite(f);
                Write(f, chr($18));
                Write(f, chr($18) + chr($4D));
                Write(f, chr($14));
                isbig := false;
                row := 0;
                for i := 0 to Length(cxRichEdit1.text) - 1 do
                    begin
                        cxrichedit1.SelStart := i;
                        cxrichedit1.SelLength := 1;
                        if row <> cxrichedit1.LineFromChar(cxrichedit1.SelStart) then
                            begin
                                Write(f, chr($0D) + chr($0A));
                                row := cxrichedit1.LineFromChar(cxrichedit1.SelStart);
                            end;
                        if cxRichEdit1.SelAttributes.Size = 20 then
                            begin
                                Write(f, chr($14));
                            end
                        else
                            begin
                                Write(f, chr($0E));
                            end;
                        printstr := PChar(cxrichedit1.SelText);
                        Write(f, printstr);
                    end;
                Write(f, chr($1B) + chr($43) + chr($01));
                Write(f, #12);
                closefile(f);
            end
        else
            begin
                commPrint;
            end;
    except
        Application.MessageBox('端口打印失败请重新选择端口打印！', '系统提示', MB_OK);
        exit;

    end;
    if frm_main.xml.Root.AttributeCount = 0 then
        frm_main.xml.Root.AttributeAdd('defaultport', cxComboBox1.ItemIndex)
    else
        frm_main.xml.Root.AttributeByName['defaultport'] := inttostr(cxComboBox1.ItemIndex);

end;

procedure Tfrm_portprt.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure Tfrm_portprt.FormCreate(Sender: TObject);
begin
    cxrichedit1 := TRxRichEdit.Create(self);
    cxrichedit1.Parent := self;
    cxrichedit1.Align := alClient;

end;

procedure Tfrm_portprt.FormShow(Sender: TObject);
begin
    cxComboBox1.ItemIndex := StrToInt(frm_main.xml.Root.AttributeByName['defaultport']);
end;

procedure Tfrm_portprt.btn1Click(Sender: TObject);
begin
    cxRichEdit1.SelAttributes.Size := 20;
end;

procedure Tfrm_portprt.btn2Click(Sender: TObject);
begin
    cxRichEdit1.SelAttributes.Size := 30;
end;

procedure Tfrm_portprt.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FreeAndNil(cxrichedit1);
    Action := caFree;
end;

end.
