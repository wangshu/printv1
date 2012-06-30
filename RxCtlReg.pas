{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{                                                       }
{         Copyright (c) 1995, 1996 AO ROSNO             }
{         Copyright (c) 1997, 1998 Master-Bank          }
{                                                       }
{*******************************************************}

{ Note:
  - in Delphi 4.0 you must add DCLSTD40 and DCLSMP40 to the requires
    page of the package you install this components into.
  - in Delphi 3.0 you must add DCLSTD30 and DCLSMP30 to the requires
    page of the package you install this components into.
  - in C++Builder 3.0 you must add DCLSTD35 to the requires page of the
    package you install this components into. }

unit RxCtlReg;

{$I RX.INC}
{$D-,L-,S-}

interface

{ Register custom useful controls }

procedure Register;

implementation

{$IFDEF WIN32}
{$R *.D32}
{$ELSE}
{$R *.D16}
{$ENDIF}

uses{$IFDEF WIN32}Windows, {$ELSE}WinTypes, {$ENDIF}Classes, SysUtils,
   RTLConsts, DesignIntf, DesignEditors, VCLEditors, TypInfo, Controls, Graphics, ExtCtrls, Tabs, Dialogs, Forms,
{$IFDEF RX_D3}DsnConst, ExtDlgs, {$ELSE}LibConst, {$ENDIF}
{$IFDEF DCS}
{$IFDEF RX_D4}ImgEdit, {$ENDIF}{$IFDEF WIN32}ImgList, {$ENDIF}
{$ENDIF DCS}
{$IFDEF WIN32}RxRichEd, {$ENDIF}Menus, FiltEdit, StdCtrls, Buttons;

{$IFDEF RX_D3}
resourcestring
   srSamples = 'Samples';
{$ENDIF}

procedure Register;
const

{$IFDEF RX_D3}
   BaseClass: TClass = TPersistent;
{$ELSE}
   BaseClass: TClass = TComponent;
{$ENDIF}
begin
   RegisterComponents(LoadStr(61300),
      [TRxRichEdit]);

{$IFDEF RX_D3}
   RegisterNonActiveX([TRxRichEdit], axrComponentOnly);
{$ENDIF RX_D3}
end;

end.

