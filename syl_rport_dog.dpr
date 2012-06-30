program syl_rport_dog;

uses
  Forms,
  fm_dog_main in 'fm_dog_main.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
