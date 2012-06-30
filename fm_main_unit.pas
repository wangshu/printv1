unit fm_main_unit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
   cxContainer, cxListBox, StdCtrls, cxButtons, ExtCtrls,
    cxStyles, cxEdit, cxInplaceContainer, cxVGrid, Grids, ValEdit, cxGroupBox,
    RM_System, RM_Common, RM_Class, RM_Designer, NativeXml, cxTextEdit,
    cxMaskEdit, cxDropDownEdit, ImgList,  
  dxStatusBar, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter;

type
    Tfrm_main = class(TForm)
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
        cxButton6: TcxButton;
        il1: TImageList;
        cxButton7: TcxButton;
    dxStatusBar1: TdxStatusBar;
        procedure FormShow(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure cxButton4Click(Sender: TObject);
        procedure cxButton5Click(Sender: TObject);
        procedure cxListBox1Click(Sender: TObject);
        procedure cxButton1Click(Sender: TObject);
        procedure cxButton2Click(Sender: TObject);
        procedure cxButton3Click(Sender: TObject);
        procedure cxButton6Click(Sender: TObject);
        procedure cxButton7Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        id, sysdata, stopdata: string;
        xml: TNativeXml;
        procedure showitem;
        function loadAbout(str:string):string;
        procedure SetAbout(str:string;memo:string);
    end;

var
    frm_main: Tfrm_main;

implementation

uses syun_unit, des, fm_edit_unit, fm_about_unit, frm_portprt_Unit,
    frm_calcprint_Unit;
{$R *.dfm}
      function Tfrm_main.loadAbout(str:string):string;
      begin
        with xml.Root.NodeFindOrCreate(str) do
        begin
          if ValueAsString<>'' then
        Result:=des.DeCrypt(ValueAsString)
        else
          Result:=''
        end;
      end;
        procedure Tfrm_main.SetAbout(str:string;memo:string);
        begin
              with xml.Root.NodeFindOrCreate(str) do
        begin

        ValueAsString:=des.EnCrypt(memo)

        end;

           xml.SaveToFile('config.xml');
        end;
procedure Tfrm_main.showitem;
var
    i: integer;
begin
    self.cxListBox1.Items.Clear;
    for i := 0 to xml.Root.NodeByName('item').NodeCount - 1 do
        begin
            cxlistbox1.Items.Add(xml.Root.NodeByName('item').Nodes[i].AttributeByName['name']);
        end;
        cxlistbox1.ItemIndex:=0;
        self.dxStatusBar1.Panels[0].Text:=loadAbout('main');
end;

procedure Tfrm_main.FormShow(Sender: TObject);
var
d:TDateTime ;
    dogid: string;   format: TFormatSettings;
begin
    dogid := syun_unit.ReadId;
    xml := TNativeXml.Create;
    xml.LoadFromFile('config.xml');
    if true then
        begin
            if dogid = 'E3A1A356D211015C' then
                begin
                    cxButton1.Enabled := true;
                    cxButton2.Enabled := true;
                    cxButton5.Enabled := true;
                    cxButton4.Enabled := true;
                    cxButton6.Enabled := true;
                    cxButton3.Caption := '关于';
                    cxButton7.Visible := False;
                end
            else
            if dogid = 'BA95172978A2E2BF' then
                begin
                    id := Trim(ReadString(0, 5));
                    sysdata := Trim(ReadString(10, 10));
                    stopdata := Trim(ReadString(20, 10));
                     format.ShortDateFormat := 'yyyy-MM-dd';
                     format.DateSeparator := '-';
                    if (TryStrToDate(sysdata, d,format) and TryStrToDate(stopdata, d,format)) then
                        if ((id <> '') and (sysdata <> '') and (stopdata <> '')) then
                            begin
                                if sysdata > FormatDateTime('yyyy-MM-dd', now) then
                                    begin
                                        application.MessageBox('当前系统日期不正确请检查后从新运行本程序！', '系统提示', MB_OK);
                                        Application.Terminate;
                                    end;

                                WriteString(10, FormatDateTime('yyyy-MM-dd', now));
                                if FormatDateTime('yyyy-MM-dd', now) < stopdata then
                                    begin
                                        cxButton1.Enabled := true;
                                        cxButton2.Enabled := true;
                                        cxButton5.Enabled := true;
                                        cxButton4.Enabled := true;
                                        cxButton6.Enabled := true;
                                        cxButton7.Visible := False;

                                    end
                                else
                                    begin
                                        application.MessageBox('您的使用授权已经到期，请重新输入注册码激活！', '系统提示', MB_OK);
                                        cxButton3.Click;
                                    end;
                            end;
                end;
        end else
        begin
            cxButton1.Enabled := true;
            cxButton2.Enabled := true;
            cxButton5.Enabled := true;
            cxButton4.Enabled := true;
            cxButton6.Enabled := true;
            cxButton3.Caption := '关于';
        end;
    showitem;
end;

procedure Tfrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    xml.SaveToFile('config.xml');
    freeandnil(xml);
end;

procedure Tfrm_main.cxButton4Click(Sender: TObject);
begin
    frm_edit := Tfrm_edit.Create(nil);
    frm_edit.showtype := 0;
    frm_edit.ShowModal;
    showitem;
end;

procedure Tfrm_main.cxButton5Click(Sender: TObject);
begin
    frm_edit := Tfrm_edit.Create(nil);
    frm_edit.showtype := 1;
    frm_edit.id := xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['id'];
    frm_edit.ShowModal;
    showitem;
end;

procedure Tfrm_main.cxListBox1Click(Sender: TObject);
var
    j: integer;
begin
    ValueListEditor1.Strings.Clear;
    if frm_main.xml.Root.NodeByName('item').Nodes[cxlistbox1.itemindex].AttributeByName['reporttype'] = '0' then
        begin
            cxButton2.Visible := False;
        end
    else
        cxButton2.Visible := true;
    for j := 0 to frm_main.xml.Root.NodeByName('item').Nodes[cxlistbox1.itemindex].NodeCount - 1 do
        begin
            self.ValueListEditor1.InsertRow(frm_main.xml.Root.NodeByName('item').Nodes[cxlistbox1.itemindex].Nodes[j].AttributeByName['text'], '', true);
        end;
end;

procedure Tfrm_main.cxButton1Click(Sender: TObject);
var
    i: integer;
begin
    if (xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['reporttype'] = '0') then
        begin
            frm_calcprint := Tfrm_calcprint.Create(nil);
            frm_calcprint.cxRichEdit1.Lines.LoadFromFile(xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['reportfile']);
            frm_calcprint.filename := xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['reportfile'];
            frm_calcprint.Panel1.Caption := xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['name'];
            frm_calcprint.ShowModal;
        end
    else
        begin
            RMReport1.LoadFromFile(xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['reportfile']);
            RMReport1.Dictionary.Clear;
            RMReport1.Dictionary.Variables[' 自定义变量'] := '';
            for i := 0 to ValueListEditor1.Strings.Count - 1 do
                begin
                    RMReport1.Dictionary.Variables.AsString[ValueListEditor1.Keys[i]] := ValueListEditor1.Values[ValueListEditor1.Keys[i]];
                end;
            RMReport1.ShowReport;
        end;
end;

procedure Tfrm_main.cxButton2Click(Sender: TObject);
var
    i: integer;
begin
    RMReport1.LoadFromFile(xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['reportfile']);
    RMReport1.Dictionary.Clear;
    RMReport1.Dictionary.Variables[' 自定义变量'] := '';
    for i := 0 to ValueListEditor1.Strings.Count - 1 do
        begin
            RMReport1.Dictionary.Variables.AsString[ValueListEditor1.Keys[i]] := ValueListEditor1.Values[ValueListEditor1.Keys[i]];
        end;
    RMReport1.FileName := xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].AttributeByName['reportfile'];
    RMDesigner1.SaveDir := ExtractFilePath(Application.ExeName);
    RMReport1.DesignReport;

end;

procedure Tfrm_main.cxButton3Click(Sender: TObject);
begin
    frm_about := Tfrm_about.Create(self);
    frm_about.ShowModal;
end;

procedure Tfrm_main.cxButton6Click(Sender: TObject);
begin
    xml.Root.NodeByName('item').Nodes[cxListBox1.itemindex].Delete;
    xml.SaveToFile('config.xml');
    showitem;
    cxListBox1.itemindex := 0;
end;

procedure Tfrm_main.cxButton7Click(Sender: TObject);
begin

  frm_calcprint := Tfrm_calcprint.Create(nil);
  frm_calcprint.SpeedButton1.Enabled:=False;
  frm_calcprint.SpeedButton2.Enabled:=False;
  frm_calcprint.cxRichEdit1.Lines.Add('1234567890');
  frm_calcprint.cxRichEdit1.Lines.Add('abcdefghijk');
  frm_calcprint.cxRichEdit1.Lines.Add('ABCDEFGHIJK');
  frm_calcprint.cxRichEdit1.Lines.Add('广东江苏河北');
  frm_calcprint.cxRichEdit1.Lines.Add('[单价],[数量]');
  frm_calcprint.cxRichEdit1.Lines.Add('[金额],[日期]');
  frm_calcprint.cxRichEdit1.Lines.Add('[时间],[工号]');
  frm_calcprint.cxRichEdit1.Lines.Add('[数据],[大金]');
  frm_calcprint.cxRichEdit1.Lines.Add(' ');
  frm_calcprint.Panel1.Caption:='打印测试'  ;
  frm_calcprint.cxrichedit1.ReadOnly:=true;
  frm_calcprint.ShowModal;
end;

end.

