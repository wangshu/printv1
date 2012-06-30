unit fm_about_unit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
    cxContainer, cxEdit,StdCtrls, cxTextEdit, cxButtons, ExtCtrls, des, cxMemo;

type
    Tfrm_about = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        cxButton1: TcxButton;
        cxTextEdit1: TcxTextEdit;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        cxMemo1: TcxMemo;
        lbl1: TLabel;
        procedure FormShow(Sender: TObject);
        procedure cxButton1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frm_about: Tfrm_about;

implementation

uses fm_main_unit, syun_unit, fm_OEM_Unit;

{$R *.dfm}

procedure Tfrm_about.FormShow(Sender: TObject);
begin
    if ReadId = 'E3A1A356D211015C' then
        begin
            Label2.Visible := false;
            lbl1.Caption := '截止日期  永久使用！  ';

        end
    else
        begin
            Label3.Caption := frm_main.id;
            lbl1.Caption := '截止日期    ' + frm_main.stopdata;
        end;
          cxMemo1.Lines.Add('程序版本:'+GetVersionString(Application.ExeName))  ;
        cxMemo1.Lines.Add(frm_main.loadAbout('about'))  ;
  //  cxMemo1.Lines.Insert(1, 'QQ:7113321');
  //  cxMemo1.Lines.Insert(1, 'kill_net');
end;

procedure Tfrm_about.cxButton1Click(Sender: TObject);
var
    idate: TDateTime;
begin
    if cxTextEdit1.Text <> '' then
        begin
            try
                frm_main.stopdata := des.DeCrypt(cxTextEdit1.Text, Label3.Caption);
                if TryStrToDate(frm_main.stopdata, idate) then
                    begin
                        WriteString(20, frm_main.stopdata, );
                        Application.MessageBox('加密信息写入成功，请重新运行！', '系统提示', MB_OK);
                    end;
            except
            end;
            close;
        end
        else
        close;            
end;

procedure Tfrm_about.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if ( (Key=vk_f3) and  (ssCtrl  in Shift) ) then
 begin
   fm_oem:=Tfm_oem.Create(self);
   fm_oem.ShowModal;
 end;
end;

end.
