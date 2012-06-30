unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,CPort, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cport:TComPort;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
cport:=TComPort.Create(nil);
cport.Port:='com1';
cport.BaudRate:=br9600;
cport.Open;
cport.WriteStr(chr($18)+chr($18)+chr($40)) ;


cport.Close;
end;

end.
