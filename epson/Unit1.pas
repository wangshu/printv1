unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxCheckBox, StdCtrls, cxMemo,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons;

type
  TForm1 = class(TForm)
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    cxMemo1: TcxMemo;
    Label1: TLabel;
    cxCheckBox1: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxButton1Click(Sender: TObject);
 var
 printstr:pchar;
 f:TextFile;
begin
       AssignFile(f,cxComboBox1.Text);

   rewrite(f);
   Write(f, chr($1b)+chr($40));
//esc p 10cpi
  printstr:='10cpi 打印字体 ';
     Write(f, chr($1b)+'a');
     printstr:='10cpi 打印字体 ';
     Write(f,printstr);
     Write(f, chr($1b)+'0');
     printstr:='10cpi 打印字体 ';


      //  Write(f, chr($1c)+chr($2e));  //esc dc2 without zoom





   closefile(f);

end;

end.
