unit fm_edit_unit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxContainer, cxEdit, StdCtrls,
    cxTextEdit, cxListBox, cxButtons, cxPC, ExtCtrls, cxCheckBox, NativeXml,
    cxMaskEdit, cxButtonEdit, activex, cxMemo, cxRichEdit, cxDropDownEdit,
    Buttons, cxGroupBox, ComCtrls, dxtree;

type
    Tfrm_edit = class(TForm)
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
        cxTabSheet3: TcxTabSheet;
        cxComboBox1: TcxComboBox;
        Label4: TLabel;
        cxRichEdit1: TcxRichEdit;
        Panel1: TPanel;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        dlgSave1: TSaveDialog;
        cxTabSheet4: TcxTabSheet;
        dxTreeView1: TdxTreeView;
        cxGroupBox1: TcxGroupBox;
        cxButton5: TcxButton;
        cxButton6: TcxButton;
        cxButton7: TcxButton;
        procedure cxButton2Click(Sender: TObject);
        procedure cxButton1Click(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure cxButton3Click(Sender: TObject);
        procedure cxButton4Click(Sender: TObject);
        procedure cxComboBox1PropertiesEditValueChanged(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure cxButton5Click(Sender: TObject);
        procedure cxButton6Click(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure cxButton7Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        showtype: integer;
        id: string;
    end;

var
    frm_edit: Tfrm_edit;

implementation

uses fm_main, fm_main_unit;

{$R *.dfm}

procedure Tfrm_edit.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure Tfrm_edit.cxButton1Click(Sender: TObject);
var
    node, item: TXmlNode;
    j, i: integer;
begin
    if cxTextEdit2.Text = '' then
        begin
            Application.MessageBox('请输入票据格式名称！', '系统提示', MB_OK);
            cxTextEdit2.SetFocus;
            exit;
        end;
    if cxComboBox1.ItemIndex < 0 then
        begin
            Application.MessageBox('请选择票据格式类型！', '系统提示', MB_OK); cxComboBox1.SetFocus;
            exit;
        end;
    if showtype = 0 then
        begin
            node := frm_main.xml.Root.NodeByName('item').NodeNew(id);
            node.AttributeAdd('name', cxTextEdit2.Text);
            if cxButtonEdit1.Text = '' then
                begin
                    cxButtonEdit1.Text := StringReplace(id, '-', '', [rfReplaceAll]);
                    cxButtonEdit1.Text := StringReplace(cxButtonEdit1.Text, '{', '', [rfReplaceAll]);
                    cxButtonEdit1.Text := StringReplace(cxButtonEdit1.Text, '}', '', [rfReplaceAll]);
                end;
            if cxComboBox1.ItemIndex = 0 then
                begin
                    cxButtonEdit1.Text := cxButtonEdit1.Text + '.rtf';
                    cxRichEdit1.Lines.SaveToFile(cxButtonEdit1.Text);
                end
            else
                begin
                    cxButtonEdit1.Text := cxButtonEdit1.Text + '.rmf';
                end;
            node.AttributeAdd('reporttype', cxComboBox1.ItemIndex);
            node.AttributeAdd('reportfile', cxButtonEdit1.Text);
            node.ValueAsString := cxRichEdit1.Text;
            for i := 0 to cxListBox1.Items.Count - 1 do
                begin
                    item := node.NodeNew('reportitem');
                    item.AttributeAdd('text', cxListBox1.Items.Strings[i]);
                end;

        end
    else
        begin
            for i := 0 to frm_main.xml.Root.NodeByName('item').NodeCount - 1 do
                begin
                    if id = frm_main.xml.Root.NodeByName('item').Nodes[i].AttributeByName['id'] then
                        begin
                            node := frm_main.xml.Root.NodeByName('item').Nodes[i];
                        end
                end;

            node.AttributeAdd('name', cxTextEdit2.Text);
            node.AttributeAdd('reportfile', cxButtonEdit1.Text);
            node.NodesClear;
            for i := 0 to cxListBox1.Items.Count - 1 do
                begin
                    item := node.NodeNew('reportitem');
                    item.AttributeAdd('text', cxListBox1.Items.Strings[i]);
                end;
            if cxComboBox1.ItemIndex = 0 then
                begin

                    cxRichEdit1.Lines.SaveToFile(cxButtonEdit1.Text);
                end
        end;
    frm_main.xml.SaveToFile('config.xml');
    dxTreeView1.SaveToFile('tree.ini');
    close;
end;

procedure Tfrm_edit.FormShow(Sender: TObject);
var
    guid: TGUID;
    i, j: integer;
    node: TXmlNode;
    treenode: TTreeNode;
begin
    cxPageControl1.ActivePageIndex := 0;
    if showtype = 0 then
        begin
            CoCreateGuid(Guid);
            id := GUIDToString(guid);
        end
    else
        begin
            i := frm_main.cxListBox1.ItemIndex;
            cxTextEdit2.Text := frm_main.xml.Root.NodeByName('item').Nodes[i].AttributeByName['name'];
            cxButtonEdit1.Text := frm_main.xml.Root.NodeByName('item').Nodes[i].AttributeByName['reportfile'];

            cxComboBox1.ItemIndex := StrToInt(frm_main.xml.Root.NodeByName('item').Nodes[i].AttributeByName['reporttype']);
            cxRichEdit1.Lines.LoadFromFile(cxButtonEdit1.Text);
            cxListBox1.Items.Clear;
            for j := 0 to frm_main.xml.Root.NodeByName('item').Nodes[i].NodeCount - 1 do
                begin
                    cxListBox1.Items.Add(frm_main.xml.Root.NodeByName('item').Nodes[i].Nodes[j].AttributeByName['text']);
                end;


        end;

    node := frm_main.xml.Root.NodeFindOrCreate('data_list');


    for i := 0 to node.NodeCount - 1 do
        begin
            treenode := dxTreeView1.Items.AddChild(nil, node.Nodes[i].Name);
            with node.Nodes[i] do
                for j := 0 to NodeCount - 1 do
                    begin
                        dxTreeView1.Items.AddChild(treenode, Nodes[j].Name)
                    end;

        end;

end;

procedure Tfrm_edit.cxButton3Click(Sender: TObject);
begin
    cxListBox1.Items.Add(cxTextEdit1.Text);
    cxTextEdit1.Text := '';
end;

procedure Tfrm_edit.cxButton4Click(Sender: TObject);
begin
    cxListBox1.Items.Delete(cxListBox1.ItemIndex);
end;

procedure Tfrm_edit.cxComboBox1PropertiesEditValueChanged(Sender: TObject);
begin
    if cxComboBox1.ItemIndex = 0 then
        begin
            cxTabSheet3.TabVisible := true;
            cxTabSheet2.TabVisible := false;
        end
    else
        begin
            cxTabSheet3.TabVisible := false;
            cxTabSheet2.TabVisible := true;
        end;
end;

procedure Tfrm_edit.SpeedButton1Click(Sender: TObject);
begin
    cxRichEdit1.SelAttributes.Size := 20;
end;

procedure Tfrm_edit.SpeedButton2Click(Sender: TObject);
begin
    cxRichEdit1.SelAttributes.Size := 30;
end;

procedure Tfrm_edit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
begin
    if cxComboBox1.ItemIndex = 0 then
        begin
            dlgSave1.Filter := 'Rtf File(*.rtf)|*.rtf' + '|' + 'ALL File(*.*)|*.*';
            if dlgSave1.Execute then
                begin
                    cxButtonEdit1.Text := dlgSave1.FileName;
                    if FileExists(dlgSave1.FileName) then
                        cxRichEdit1.Lines.LoadFromFile(dlgSave1.FileName);
                end;
        end
    else
        begin
            dlgSave1.Filter := 'Report File(*.rmf)|*.rmf';
            if dlgSave1.Execute then
                begin
                    cxButtonEdit1.Text := dlgSave1.FileName;
                end;
        end;

end;

procedure Tfrm_edit.cxButton5Click(Sender: TObject);
var
    name: string;
begin
    if dxTreeView1.Selected <> nil then
        begin
            name := InputBox('输入', '输入类型名称', '');
            dxTreeView1.Items.AddChild(nil, name);
        end;
end;

procedure Tfrm_edit.cxButton6Click(Sender: TObject);
var
    name: string;
begin
    if dxTreeView1.Selected <> nil then
        begin
            name := InputBox('输入', '输入类型名称', '');
            if (dxTreeView1.Selected.Parent = nil) then
                dxTreeView1.Items.AddChild(dxTreeView1.Selected, name)
            else
                Application.MessageBox('不能为子节点添加节点!', '系统提示', mb_ok);
        end;
end;

procedure Tfrm_edit.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i, j: integer;
    node: TXmlNode;
begin
    node := frm_main.xml.Root.NodeFindOrCreate('data_list');

    node.NodesClear;
    for i := 0 to dxTreeView1.Items.Count - 1 do
        begin
            if dxtreeview1.Items.Item[i].Parent = nil then
                with node.NodeNew(dxTreeView1.Items.Item[i].Text) do
                    for j := 0 to dxtreeview1.Items.Item[i].Count - 1 do
                        begin
                            NodeNew(dxtreeview1.Items.Item[i].Item[j].Text)
                        end;

        end;
    frm_main.xml.SaveToFile('config.xml');
end;

procedure Tfrm_edit.cxButton7Click(Sender: TObject);
begin
    dxTreeView1.Items.Delete(dxTreeView1.Selected);
end;

end.
