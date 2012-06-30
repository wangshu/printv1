unit frm_calcprint_Unit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
    cxControls, cxContainer, cxEdit, Grids, ValEdit, Buttons, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, StdCtrls, cxButtons, ExtCtrls, cxStyles, cxCurrencyEdit,
    cxVGrid, cxInplaceContainer, RxRichEd, cxSpinEdit, cxCheckListBox, NativeXml,
    cxGroupBox, cxCalendar,PosEscUnit, cxCheckBox, dxSkinsCore,
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
    Tfrm_calcprint = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        Label1: TLabel;
        cxComboBox1: TcxComboBox;
        pnl1: TPanel;
        btn1: TSpeedButton;
        btn2: TSpeedButton;
        cxVerticalGrid1: TcxVerticalGrid;
        cxVerticalGrid1EditorRow1: TcxEditorRow;
        cxVerticalGrid1EditorRow2: TcxEditorRow;
        cxVerticalGrid1EditorRow3: TcxEditorRow;
        cxVerticalGrid1EditorRow4: TcxEditorRow;
        Label2: TLabel;
        cxVerticalGrid1EditorRow5: TcxEditorRow;
        cxVerticalGrid1EditorRow6: TcxEditorRow;
        cxVerticalGrid1EditorRow7: TcxEditorRow;
        cxVerticalGrid1EditorRow8: TcxEditorRow;
        cxVerticalGrid1EditorRow9: TcxEditorRow;
        cxGroupBox1: TcxGroupBox;
        cxGroupBox2: TcxGroupBox;
        cxCheckListBox1: TcxCheckListBox;
        cxComboBox2: TcxComboBox;
        cxComboBox3: TcxComboBox;
        Label3: TLabel;
        cxVerticalGrid1EditorRow11: TcxEditorRow;
        PopupMenu1: TPopupMenu;
        N1: TMenuItem;
        N2: TMenuItem;
        N3: TMenuItem;
        cxVerticalGrid1EditorRow10: TcxEditorRow;
        cxVerticalGrid1EditorRow12: TcxEditorRow;
        cxVerticalGrid1EditorRow13: TcxEditorRow;
    cxVerticalGrid1EditorRow14: TcxEditorRow;
    Panel3: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxCheckBox1: TcxCheckBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    cxSpinEdit1: TcxSpinEdit;
    Label4: TLabel;
    cxVerticalGrid1EditorRow15: TcxEditorRow;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure cxButton2Click(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure cxComboBox2PropertiesChange(Sender: TObject);
        procedure cxButton1Click(Sender: TObject);
        procedure N1Click(Sender: TObject);
        procedure N2Click(Sender: TObject);
        procedure N3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        cxrichedit1: TRxRichEdit;
        filename: string;
        procedure gettreep;
        procedure gettreeC;
        procedure doprint(Rtime: string; Rdate: string; Rcode: string; Rcaption: string; Rsl: string; Rdj: string; Rje: string;Rcd:string;posesc: TPOSEsc);
    end;

var
    frm_calcprint: Tfrm_calcprint;

implementation

uses fm_main_unit, Math;

{$R *.dfm}


function RandomData(cxCheckListBox: TcxCheckListBox): string;
var
    item: TcxCheckListBoxItem;
begin

    repeat
        item := cxCheckListBox.Items[Random(cxCheckListBox.Count)];
        if item.Checked then
            Result := item.Text;
    until (item.Checked)
end;

function RandomDate(date1: string; date2: string; formatstr: string): string;
var
    bDate, eDate: TDate;
    format: TFormatSettings;
    i:Integer;
begin
    format.ShortDateFormat := 'yyyy-MM-dd';
    format.DateSeparator := '-';
    bDate := StrToDate(date1, format);
    eDate := StrToDate(date2, format); ;
    i:= round( eDate - bDate);
    i:=  Random(i);
    if formatstr='' then
      Result := FormatDateTime('yyyy-MM-dd', bDate +i)
    else
    Result := FormatDateTime(formatstr, bDate +i);
    //ShowMessage(Result);
end;


function RandomTime(formatstr: string): string;
var
    vStartTime, vEndTime: TTime;
    T: Real;
    R: Real;
begin
    Randomize;
    vStartTime := StrToTime('00:00:00 ');
    vEndTime := StrToTime('23:59:57 ');
    T := vEndTime - vStartTime;
    R := Random;
    while R > T do R := R - T;
    Result := FormatDateTime(formatstr, vStartTime + R);

end;

function RandomInt(int1: integer; int2: integer; formatstr: string): string;
begin
    Result := FormatFloat(formatstr, int1 + random(round(int2 - int1)));
end;


procedure Tfrm_calcprint.gettreep;
var
    i: integer;
    xmlnode: TXmlNode;
begin
    cxComboBox2.Properties.Items.Clear;
    xmlnode := frm_main.xml.Root.NodeFindOrCreate('data_list');
    for i := 0 to xmlnode.NodeCount - 1 do
        begin
            cxComboBox2.Properties.Items.Add(xmlnode.Nodes[i].Name)
        end;
    cxComboBox2.ItemIndex := 0;
end;

procedure Tfrm_calcprint.gettreeC;
var
    i: integer;
    xmlnode: TXmlNode;
    item: TcxCheckListBoxItem;
begin
    cxCheckListBox1.Items.Clear;
    xmlnode := frm_main.xml.Root.NodeFindOrCreate('data_list').Nodes[cxComboBox2.ItemIndex];
    for i := 0 to xmlnode.NodeCount - 1 do
        begin
            item := cxCheckListBox1.Items.Add;
            item.Text := xmlnode.Nodes[i].Name;
        end;
end;

procedure Tfrm_calcprint.FormCreate(Sender: TObject);
begin
    cxrichedit1 := TRxRichEdit.Create(self);
    cxrichedit1.Parent := self;
    cxrichedit1.Align := alClient;
    cxrichedit1.Font.Size := 20;

end;

procedure Tfrm_calcprint.FormClose(Sender: TObject;
    var Action: TCloseAction);
var i: Integer;
    node, param: TXmlNode;
begin
    node := frm_main.xml.Root.NodeFindOrCreate('param');
    with node do
        begin
            param := NodeFindOrCreate(cxVerticalGrid1EditorRow1.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow1.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow2.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow2.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow3.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow3.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow4.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow4.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow5.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow5.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow6.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow6.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow7.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow7.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow8.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow8.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow9.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow9.Properties.Value;



            param := NodeFindOrCreate(cxVerticalGrid1EditorRow11.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow11.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow12.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow12.Properties.Value;

            param := NodeFindOrCreate(cxVerticalGrid1EditorRow13.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow13.Properties.Value;

              param := NodeFindOrCreate(cxVerticalGrid1EditorRow14.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow14.Properties.Value;

                 param := NodeFindOrCreate(cxVerticalGrid1EditorRow15.Properties.Caption);
            param.ValueAsString := cxVerticalGrid1EditorRow15.Properties.Value;

        end;
    frm_main.xml.SaveToFile('config.xml');
    freeandnil(cxrichedit1);
    action := cafree;
end;

procedure Tfrm_calcprint.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure Tfrm_calcprint.FormShow(Sender: TObject);
var
    node, param: TXmlNode;
begin
    node := frm_main.xml.Root.NodeFindOrCreate('param');
    if node.NodeCount > 0 then
        with node do
            begin


                param := NodeFindOrCreate(cxVerticalGrid1EditorRow2.Properties.Caption);
                cxVerticalGrid1EditorRow2.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow3.Properties.Caption);
                cxVerticalGrid1EditorRow3.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow4.Properties.Caption);
                cxVerticalGrid1EditorRow4.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow5.Properties.Caption);
                cxVerticalGrid1EditorRow5.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow6.Properties.Caption);
                cxVerticalGrid1EditorRow6.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow7.Properties.Caption);
                cxVerticalGrid1EditorRow7.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow11.Properties.Caption);
                cxVerticalGrid1EditorRow11.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow12.Properties.Caption);
                cxVerticalGrid1EditorRow12.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow13.Properties.Caption);
                cxVerticalGrid1EditorRow13.Properties.Value := param.ValueAsString;
                 param := NodeFindOrCreate(cxVerticalGrid1EditorRow14.Properties.Caption);
                cxVerticalGrid1EditorRow14.Properties.Value := param.ValueAsString;

                param := NodeFindOrCreate(cxVerticalGrid1EditorRow15.Properties.Caption);
                cxVerticalGrid1EditorRow15.Properties.Value := param.ValueAsString;
            end;
    gettreep;
    cxVerticalGrid1EditorRow9.Properties.Value := FormatDateTime('yyyy-MM-dd', Now);
    cxVerticalGrid1EditorRow8.Properties.Value := FormatDateTime('yyyy-MM-dd', now - 30);
       if frm_main.xml.Root.AttributeByName['defaultport']<>'' then
    cxComboBox1.ItemIndex := StrToInt(frm_main.xml.Root.AttributeByName['defaultport']);
       if frm_main.xml.Root.AttributeByName['defaultprint']<>'' then
    cxComboBox3.ItemIndex := StrToInt(frm_main.xml.Root.AttributeByName['defaultprint']);
end;

procedure Tfrm_calcprint.cxComboBox2PropertiesChange(Sender: TObject);
begin
    gettreeC;
    N1Click(Self);
end;
 procedure Delay(MSecs: Longint);
//延时函数，MSecs单位为毫秒(千分之1秒)
var
  FirstTickCount, Now: Longint;
begin
  FirstTickCount := GetTickCount();
  repeat
    Application.ProcessMessages;
    Now := GetTickCount();
  until (Now - FirstTickCount >= MSecs)  ;
end;


procedure Tfrm_calcprint.cxButton1Click(Sender: TObject);
var
    i: integer;
    Rtime, Rdate, Rcode, Rcaption, Rsl, Rdj, Rje,Rcd: string;
    codeformat: string;
    posesc: TPOSEsc;
begin
    for i := 0 to cxVerticalGrid1EditorRow5.Properties.Value - 1 do
        codeformat := codeformat + '0';
   posesc := TPOSEsc.Create;
    if Pos('LPT', cxComboBox1.Text) > 0 then
        posesc.PortType := LPT
    else
    begin
     if Pos('DEBUG', cxComboBox1.Text) > 0 then
           posesc.PortType := DEBUG
     ELSE

        posesc.PortType := COM;
        end;
    posesc.Port := cxComboBox1.Text;
    if cxComboBox3.Text = 'Star' then
        posesc.PrintType := Star
    else
        posesc.PrintType := Epson;
     try
        cxButton1.Enabled:=False;
    posesc.Open;
    try
    for i := 0 to cxVerticalGrid1EditorRow1.Properties.Value - 1 do
        begin
            Rtime := RandomTime(cxVerticalGrid1EditorRow11.Properties.Value);
            Rcaption := RandomData(self.cxCheckListBox1);
            rdj := FormatFloat(cxVerticalGrid1EditorRow12.Properties.Value, cxVerticalGrid1EditorRow2.Properties.Value);
            rsl := cxVerticalGrid1EditorRow4.Properties.Value + Random(integer(cxVerticalGrid1EditorRow4.Properties.Value - cxVerticalGrid1EditorRow3.Properties.Value));
            rje := FormatFloat((cxVerticalGrid1EditorRow13.Properties.Value), cxVerticalGrid1EditorRow2.Properties.Value * strtofloat(rsl));
            rcode := RandomInt(cxVerticalGrid1EditorRow7.Properties.Value, cxVerticalGrid1EditorRow6.Properties.Value, codeformat);
            Rdate := RandomDate(cxVerticalGrid1EditorRow8.Properties.Value, cxVerticalGrid1EditorRow9.Properties.Value, cxVerticalGrid1EditorRow15.Properties.Value);
            Rcd := RandomInt(0, 14, '0');
            doprint(Rtime, Rdate, Rcode, Rcaption, Rsl, Rdj, Rje,Rcd,posesc);
            Delay(self.cxSpinEdit1.Value*1000);
        end;
    posesc.Close;
    FreeAndNil(posesc);
     except
       on  e:Exception  do

       Application.MessageBox(PChar('打印过程出现错误！'+e.Message),'系统提示',MB_OK);

     end;


     finally
             cxButton1.Enabled:=true;
    end;
     if frm_main.xml.Root.AttributeCount = 0 then
        frm_main.xml.Root.AttributeAdd('defaultport', cxComboBox1.ItemIndex)
    else
        frm_main.xml.Root.AttributeByName['defaultport'] := inttostr(cxComboBox1.ItemIndex);
           if frm_main.xml.Root.AttributeCount = 1 then
        frm_main.xml.Root.AttributeAdd('defaultprint', cxComboBox3.ItemIndex)
    else
        frm_main.xml.Root.AttributeByName['defaultprint'] := inttostr(cxComboBox3.ItemIndex);
    if cxCheckBox1.Checked then
     cxrichedit1.Lines.SaveToFile(filename);
end;

procedure Tfrm_calcprint.doprint(Rtime: string; Rdate: string; Rcode: string; Rcaption: string; Rsl: string; Rdj: string; Rje: string;Rcd:string;posesc: TPOSEsc);
var
    i: integer;
    row: Integer;

begin

       row := 0;
    i := 0;
    if Length(cxRichEdit1.text) > 0 then
        repeat

            cxrichedit1.SelStart := i;
            cxrichedit1.SelLength := 1;
            if row <> cxrichedit1.LineFromChar(cxrichedit1.SelStart) then
                begin
                    posesc.ChangeLine;
                    row := cxrichedit1.LineFromChar(cxrichedit1.SelStart);
                end;
            if cxRichEdit1.SelAttributes.Size = 20 then
                begin
                    posesc.FontSizeDefault;
                end
            else
                begin
                    posesc.FontSizeWidth;
                end;
            if cxrichedit1.SelText = '[' then
                begin
                    cxrichedit1.SelLength := 4;
                    if (cxrichedit1.SelText = '[时间]') then
                        begin
                            posesc.writeStr(Rtime);
                        end
                    else
                        if (cxrichedit1.SelText = '[日期]') then
                            begin
                                posesc.writeStr(Rdate);
                            end
                        else
                            if (cxrichedit1.SelText = '[工号]') then
                                begin
                                    posesc.writeStr(Rcode);
                                end
                            else
                                if (cxrichedit1.SelText = '[单价]') then
                                    begin
                                        posesc.writeStr(Rdj);
                                    end
                                else
                                    if (cxrichedit1.SelText = '[数量]') then
                                        begin
                                            posesc.writeStr(Rsl);
                                        end
                                    else
                                        if (cxrichedit1.SelText = '[金额]') then
                                            begin
                                                posesc.writeStr(Rje);
                                            end
                                        else if (cxrichedit1.SelText = '[数据]') then
                                            begin
                                                posesc.writeStr(Rcaption);
                                            end else if (cxrichedit1.SelText = '[大金]') then
                                            begin
                                                posesc.writeStr(posescunit.lasts(Rje));
                                            end else if (cxrichedit1.SelText = '[车道]') then
                                            begin
                                                posesc.writeStr(Rcd);
                                            end;
                    i := i + 4;

                end
            else
                begin
                    i := i + 1;
                    posesc.writeStr(cxrichedit1.SelText);
                end;

        until (i >= Length(cxRichEdit1.text) );

///


end;

procedure Tfrm_calcprint.N1Click(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to cxCheckListBox1.Count - 1 do
        cxCheckListBox1.Items[i].Checked := True;

end;

procedure Tfrm_calcprint.N2Click(Sender: TObject);

var
    i: Integer;
begin
    for i := 0 to cxCheckListBox1.Count - 1 do
        cxCheckListBox1.Items[i].Checked := False;
end;

procedure Tfrm_calcprint.N3Click(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to cxCheckListBox1.Count - 1 do
        cxCheckListBox1.Items[i].Checked := not cxCheckListBox1.Items[i].Checked;
end;

procedure Tfrm_calcprint.btn1Click(Sender: TObject);
begin
 cxRichEdit1.SelAttributes.Size := 20;
end;

procedure Tfrm_calcprint.btn2Click(Sender: TObject);
begin
cxRichEdit1.SelAttributes.Size := 30;
end;

procedure Tfrm_calcprint.SpeedButton1Click(Sender: TObject);
begin
  If  SaveDialog1.Execute then
     cxrichedit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure Tfrm_calcprint.SpeedButton2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
      cxrichedit1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

end.

