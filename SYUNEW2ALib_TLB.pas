unit SYUNEW2ALib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2006-06-02 ÏÂÎç 02:03:44 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\WINDOWS\system32\Syunew2A.dll (1)
// LIBID: {D4C9AFA3-78B9-11D8-832C-00055D724431}
// LCID: 0
// Helpfile: 
// HelpString: Syunew2A 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SYUNEW2ALibMajorVersion = 1;
  SYUNEW2ALibMinorVersion = 0;

  LIBID_SYUNEW2ALib: TGUID = '{D4C9AFA3-78B9-11D8-832C-00055D724431}';

  IID_Is_simnew: TGUID = '{D4C9AFAF-78B9-11D8-832C-00055D724431}';
  CLASS_s_simnew: TGUID = '{D4C9AFB0-78B9-11D8-832C-00055D724431}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Is_simnew = interface;
  Is_simnewDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  s_simnew = Is_simnew;


// *********************************************************************//
// Interface: Is_simnew
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D4C9AFAF-78B9-11D8-832C-00055D724431}
// *********************************************************************//
  Is_simnew = interface(IDispatch)
    ['{D4C9AFAF-78B9-11D8-832C-00055D724431}']
    function sWrite(InData: Integer; const Path: WideString): Smallint; safecall;
    function sRead(const Path: WideString): Integer; safecall;
    function Get_LastError: Smallint; safecall;
    function FindPort(start: Smallint): WideString; safecall;
    function FindPort_2(start: Smallint; in_data: Integer; verf_data: Integer): WideString; safecall;
    function YWrite(InData: Smallint; Address: Smallint; const InPath: WideString): Smallint; safecall;
    function Get_IsF: Integer; safecall;
    function YRead(Address: Smallint; const InPath: WideString): Smallint; safecall;
    function GetID_1(const InPath: WideString): Integer; safecall;
    function GetID_2(const InPath: WideString): Integer; safecall;
    function GetVersion(const InPath: WideString): Smallint; safecall;
    function sWrite_2(InData: Integer; const Path: WideString): Smallint; safecall;
    property LastError: Smallint read Get_LastError;
    property IsF: Integer read Get_IsF;
  end;

// *********************************************************************//
// DispIntf:  Is_simnewDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D4C9AFAF-78B9-11D8-832C-00055D724431}
// *********************************************************************//
  Is_simnewDisp = dispinterface
    ['{D4C9AFAF-78B9-11D8-832C-00055D724431}']
    function sWrite(InData: Integer; const Path: WideString): Smallint; dispid 2;
    function sRead(const Path: WideString): Integer; dispid 3;
    property LastError: Smallint readonly dispid 4;
    function FindPort(start: Smallint): WideString; dispid 5;
    function FindPort_2(start: Smallint; in_data: Integer; verf_data: Integer): WideString; dispid 6;
    function YWrite(InData: Smallint; Address: Smallint; const InPath: WideString): Smallint; dispid 7;
    property IsF: Integer readonly dispid 8;
    function YRead(Address: Smallint; const InPath: WideString): Smallint; dispid 9;
    function GetID_1(const InPath: WideString): Integer; dispid 10;
    function GetID_2(const InPath: WideString): Integer; dispid 11;
    function GetVersion(const InPath: WideString): Smallint; dispid 12;
    function sWrite_2(InData: Integer; const Path: WideString): Smallint; dispid 13;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : Ts_simnew
// Help String      : s_simnew Class
// Default Interface: Is_simnew
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  Ts_simnew = class(TOleControl)
  private
    FIntf: Is_simnew;
    function  GetControlInterface: Is_simnew;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function sWrite(InData: Integer; const Path: WideString): Smallint;
    function sRead(const Path: WideString): Integer;
    function FindPort(start: Smallint): WideString;
    function FindPort_2(start: Smallint; in_data: Integer; verf_data: Integer): WideString;
    function YWrite(InData: Smallint; Address: Smallint; const InPath: WideString): Smallint;
    function YRead(Address: Smallint; const InPath: WideString): Smallint;
    function GetID_1(const InPath: WideString): Integer;
    function GetID_2(const InPath: WideString): Integer;
    function GetVersion(const InPath: WideString): Smallint;
    function sWrite_2(InData: Integer; const Path: WideString): Smallint;
    property  ControlInterface: Is_simnew read GetControlInterface;
    property  DefaultInterface: Is_simnew read GetControlInterface;
    property LastError: Smallint index 4 read GetSmallintProp;
    property IsF: Integer index 8 read GetIntegerProp;
  published
    property Anchors;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure Ts_simnew.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{D4C9AFB0-78B9-11D8-832C-00055D724431}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure Ts_simnew.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as Is_simnew;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function Ts_simnew.GetControlInterface: Is_simnew;
begin
  CreateControl;
  Result := FIntf;
end;

function Ts_simnew.sWrite(InData: Integer; const Path: WideString): Smallint;
begin
  Result := DefaultInterface.sWrite(InData, Path);
end;

function Ts_simnew.sRead(const Path: WideString): Integer;
begin
  Result := DefaultInterface.sRead(Path);
end;

function Ts_simnew.FindPort(start: Smallint): WideString;
begin
  Result := DefaultInterface.FindPort(start);
end;

function Ts_simnew.FindPort_2(start: Smallint; in_data: Integer; verf_data: Integer): WideString;
begin
  Result := DefaultInterface.FindPort_2(start, in_data, verf_data);
end;

function Ts_simnew.YWrite(InData: Smallint; Address: Smallint; const InPath: WideString): Smallint;
begin
  Result := DefaultInterface.YWrite(InData, Address, InPath);
end;

function Ts_simnew.YRead(Address: Smallint; const InPath: WideString): Smallint;
begin
  Result := DefaultInterface.YRead(Address, InPath);
end;

function Ts_simnew.GetID_1(const InPath: WideString): Integer;
begin
  Result := DefaultInterface.GetID_1(InPath);
end;

function Ts_simnew.GetID_2(const InPath: WideString): Integer;
begin
  Result := DefaultInterface.GetID_2(InPath);
end;

function Ts_simnew.GetVersion(const InPath: WideString): Smallint;
begin
  Result := DefaultInterface.GetVersion(InPath);
end;

function Ts_simnew.sWrite_2(InData: Integer; const Path: WideString): Smallint;
begin
  Result := DefaultInterface.sWrite_2(InData, Path);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [Ts_simnew]);
end;

end.
