program syl_report;

uses
  Forms,
  fm_main_unit in 'fm_main_unit.pas' {frm_main},
  fm_edit_unit in 'fm_edit_unit.pas' {frm_edit},
  fm_about_unit in 'fm_about_unit.pas' {frm_about},
  frm_portprt_Unit in 'frm_portprt_Unit.pas' {frm_portprt},
  frm_calcprint_Unit in 'frm_calcprint_Unit.pas' {frm_calcprint},
  PosEscUnit in 'PosEscUnit.pas',
  fm_OEM_Unit in 'fm_OEM_Unit.pas' {fm_oem},
  fm_debug_Unit in 'fm_debug_Unit.pas' {frm_debug};

{$R *.res}

begin
    Application.Initialize;
    Application.CreateForm(Tfrm_main, frm_main);
 
  Application.Run;
end.

