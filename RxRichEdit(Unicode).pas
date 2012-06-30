{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{                                                       }
{         Copyright (c) 1998 Master-Bank                }
{                                                       }
{*******************************************************}
{                                                       }
{         UNICODE Version                               }
{                                                       }
{         Copyright (c) 2001 Wang Junjiao               }
{         www.wjjsoft.com  junjiao@iname.com            }
{                                                       }
{*******************************************************}
//
//Please READ:
//Unicode supported now, but not tested entirely!!!
//Use at you own entire risk.
//Source redistributions MUST retain this entire copyright notice;
//
//Notes:
//I disable some original macro definations for simplification.
//The modifications might be compiled normally only with D4/CB5
//since i have no other versions below the D4/CB5 installed to test it.
//Don't call 'FindText' method, as I have not worked on it at all.
//Plus, Don't access any TWideStrings::**** member functions
//except for LoadFrom.../SaveTo...
//In addition, RxRichEdit::Ansi****/Wide**** member functions have been
//tested by/for myself and work well .
//
//      Wang Junjiao [www.wjjsoft.com]
//      2001.2.18
//      Any comments, pls let me know at junjiao@iname.com
//
{*******************************************************}


unit RxRichEdit;
{$IFNDEF _DEBUG_}
  {$D-}
{$ENDIF}

//{$I RX.INC}
{$DEFINE RX_D3}
{$DEFINE RX_D4}

{$IFDEF VER130} {Borland Delphi 5.0 }
{$DEFINE RX_D5}
{$ENDIF}

{$DEFINE UNICODE} {added by Junjiao.wang 2001.2.15}

//{.$DEFINE RICHEDIT_VER_10}
{$UNDEF RICHEDIT_VER_10}

{$R-}

interface

uses Windows, {$IFDEF RX_D3} ActiveX, ComObj ,{$ELSE} Ole2, OleAuto, {$ENDIF}
  CommCtrl, Messages, SysUtils, Classes, Controls, Forms, Graphics, StdCtrls,
  Dialogs, ComCtrls, ExtCtrls,Menus, RichEdit;

type
  TRichEditVersion = 1..3;

type
  TRxCustomRichEdit = class;

//-----------------------------------------------------------------------------
{ TRxTextAttributes }

  TRxAttributeType = (atDefaultText, atSelected, atWord);

  TSubscriptStyle = (ssNone, ssSubscript, ssSuperscript);

  TUnderlineType = (utNone, utSolid, utWord, utDouble, utDotted, utWave);

  TAnimationType = (aniNone, aniLasVegas, aniBlink, aniSparkle, aniBlackAnts,
                    aniRedAnts, aniShimmer);

  TRxConsistentAttribute = (caBold, caColor, caFace, caItalic, caSize,
    caStrikeOut, caUnderline, caProtected, caOffset, caHidden, caLink,
    caBackColor, caDisabled, caWeight, caSubscript, caRevAuthor
    , caLanguage, caIndexKind, caSpacing, caKerning, caULType
    , caAnimation, caSmallCaps, caAllCaps, caOutline
    , caShadow, caEmboss, caImprint, caURL );

  TRxConsistentAttributes = set of TRxConsistentAttribute;

  TRxTextAttributes = class(TPersistent)
  private
    RichEdit: TRxCustomRichEdit;
    FType: TRxAttributeType;
    procedure AssignFont(Font: TFont);
    procedure GetAttributes(var Format: TCharFormat2W);
{$IFNDEF VER90}
    function GetCharset: TFontCharset;
    procedure SetCharset(Value: TFontCharset);
{$ENDIF}
    function GetSubscriptStyle: TSubscriptStyle;
    procedure SetSubscriptStyle(Value: TSubscriptStyle);
    function GetBackColor: TColor;
    function GetColor: TColor;
    function GetConsistentAttributes: TRxConsistentAttributes;
    function GetHeight: Integer;
    function GetHidden: Boolean;
    function GetDisabled: Boolean;
    function GetLink: Boolean;
    function GetName: TFontName;
    function GetOffset: Integer;
    function GetPitch: TFontPitch;
    function GetProtected: Boolean;
    function GetRevAuthorIndex: Byte;
    function GetSize: Integer;
    function GetStyle: TFontStyles;
    function GetUnderlineType: TUnderlineType;

    procedure SetAttributes(var Format: TCharFormat2W);
    procedure SetBackColor(Value: TColor);
    procedure SetColor(Value: TColor);
    procedure SetDisabled(Value: Boolean);
    procedure SetHeight(Value: Integer);
    procedure SetHidden(Value: Boolean);
    procedure SetLink(Value: Boolean);
    procedure SetName(Value: TFontName);
    procedure SetOffset(Value: Integer);
    procedure SetPitch(Value: TFontPitch);
    procedure SetProtected(Value: Boolean);
    procedure SetRevAuthorIndex(Value: Byte);
    procedure SetSize(Value: Integer);
    procedure SetStyle(Value: TFontStyles);
    procedure SetUnderlineType(Value: TUnderlineType);

    function GetWeight: Word;
    procedure SetWeight(Value: Word);
    function GetSpacing: Double;
    procedure SetSpacing(Value: Double);
    function GetKerning: Double;
    procedure SetKerning(Value: Double);
    function GetAnimation: TAnimationType;
    procedure SetAnimation(Value: TAnimationType);
    function GetSmallCaps: Boolean;
    procedure SetSmallCaps(Value: Boolean);
    function GetAllCaps: Boolean;
    procedure SetAllCaps(Value: Boolean);
    function GetOutline: Boolean;
    procedure SetOutline(Value: Boolean);
    function GetShadow: Boolean;
    procedure SetShadow(Value: Boolean);
    function GetEmboss: Boolean;
    procedure SetEmboss(Value: Boolean);
    function GetImprint: Boolean;
    procedure SetImprint(Value: Boolean);
    function GetIsURL: Boolean;
    procedure SetIsURL(Value: Boolean);

  protected
    procedure InitFormat(var Format: TCharFormat2W);
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(AOwner: TRxCustomRichEdit; AttributeType: TRxAttributeType);
    procedure Assign(Source: TPersistent); override;
{$IFNDEF VER90}
    property Charset: TFontCharset read GetCharset write SetCharset;
{$ENDIF}
    property BackColor: TColor read GetBackColor write SetBackColor;
    property Color: TColor read GetColor write SetColor;
    property ConsistentAttributes: TRxConsistentAttributes read GetConsistentAttributes;
    property Disabled: Boolean read GetDisabled write SetDisabled;
    property Hidden: Boolean read GetHidden write SetHidden;
    property Link: Boolean read GetLink write SetLink;
    property Name: TFontName read GetName write SetName;
    property Offset: Integer read GetOffset write SetOffset;
    property Pitch: TFontPitch read GetPitch write SetPitch;
    property Protected: Boolean read GetProtected write SetProtected;
    property RevAuthorIndex: Byte read GetRevAuthorIndex write SetRevAuthorIndex;
    property SubscriptStyle: TSubscriptStyle read GetSubscriptStyle write SetSubscriptStyle;
    property Size: Integer read GetSize write SetSize;
    property Style: TFontStyles read GetStyle write SetStyle;
    property Height: Integer read GetHeight write SetHeight;
    property UnderlineType: TUnderlineType read GetUnderlineType write SetUnderlineType;

    property Weight: Word read GetWeight write SetWeight;
    property Spacing: Double read GetSpacing write SetSpacing;
    property Kerning: Double read GetKerning write SetKerning;
    property Animation: TAnimationType read GetAnimation write SetAnimation;
    property SmallCaps: Boolean read GetSmallCaps write SetSmallCaps;
    property AllCaps: Boolean read GetAllCaps write SetAllCaps;
    property Outline: Boolean read GetOutline write SetOutline;
    property Shadow: Boolean read GetShadow write SetShadow;
    property Emboss: Boolean read GetEmboss write SetEmboss;
    property Imprint: Boolean read GetImprint write SetImprint;
    property IsURL: Boolean read GetIsURL write SetIsURL;

  end;

//-----------------------------------------------------------------------------
{ TRxParaAttributes }

  TRxNumbering = (nsNone, nsBullet, nsArabicNumbers, nsLoCaseLetter,nsUpCaseLetter, nsLoCaseRoman, nsUpCaseRoman , nsSequence);

  TRxNumberingStyle = (nsParenthesis, nsPeriod, nsEnclosed, nsSimple);

  TParaAlignment = (paLeftJustify, paRightJustify, paCenter, paJustify);

  TLineSpacingRule = (lsSingle, lsOneAndHalf, lsDouble, lsSpecifiedOrMore,lsSpecified, lsMultiple);
  //Richedit98 difinations:
  //TLineSpacingRule = (lsrOrdinary, lsr15, lsrDouble, lsrAtLeast, lsrExactly,lsrMultiple);

  THeadingStyle = 0..9;

  TParaTableStyle = (tsNone, tsTableRow, tsTableCellEnd, tsTableCell);

  TRxParaAttributes = class(TPersistent)
  private
    RichEdit: TRxCustomRichEdit;
    procedure GetAttributes(var Paragraph: TParaFormat2);
    function GetAlignment: TParaAlignment;
    function GetHeadingStyle: THeadingStyle;

    //function GetFirstIndent: Longint;
    //function GetLeftIndent: Longint;
    //function GetRightIndent: Longint;
    //procedure SetFirstIndent(Value: Longint);
    //procedure SetLeftIndent(Value: Longint);
    //procedure SetRightIndent(Value: Longint);
    function GetFirstIndent: Double;
    procedure SetFirstIndent(Value: Double);
    function GetLeftIndent: Double;
    procedure SetLeftIndent(Value: Double);
    function GetRightIndent: Double;
    procedure SetRightIndent(Value: Double);

    //function GetLineSpacing: Longint;
    //function GetLineSpacingRule: TLineSpacingRule;
    function GetLineSpacing: Double;
    function GetLineSpacingRule: TLineSpacingRule;

    function GetNumbering: TRxNumbering;
    function GetNumberingStyle: TRxNumberingStyle;
    function GetNumberingTab: Word;

    function GetNumberingStart: Word;
    procedure SetNumberingStart(Value: Word);

    function GetTab(Index: Byte): Longint;
    function GetTabCount: Integer;
    function GetTableStyle: TParaTableStyle;
    procedure SetAlignment(Value: TParaAlignment);
    procedure SetAttributes(var Paragraph: TParaFormat2);
    procedure SetHeadingStyle(Value: THeadingStyle);

    //function GetSpaceAfter: Longint;
    //function GetSpaceBefore: Longint;
    //procedure SetSpaceAfter(Value: Longint);
    //procedure SetSpaceBefore(Value: Longint);
    function GetSpaceBefore: Double;
    procedure SetSpaceBefore(Value: Double);
    function GetSpaceAfter: Double;
    procedure SetSpaceAfter(Value: Double);

    //procedure SetLineSpacing(Value: Longint);
    //procedure SetLineSpacingRule(Value: TLineSpacingRule);
    procedure SetNumbering(Value: TRxNumbering);
    procedure SetNumberingStyle(Value: TRxNumberingStyle);
    procedure SetNumberingTab(Value: Word);
    procedure SetTab(Index: Byte; Value: Longint);
    procedure SetTabCount(Value: Integer);
    procedure SetTableStyle(Value: TParaTableStyle);
  protected
    procedure InitPara(var Paragraph: TParaFormat2);
    //procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(AOwner: TRxCustomRichEdit);
    //procedure Assign(Source: TPersistent); override;
    property Alignment: TParaAlignment read GetAlignment write SetAlignment;
    property HeadingStyle: THeadingStyle read GetHeadingStyle write SetHeadingStyle;

    //property FirstIndent: Longint read GetFirstIndent write SetFirstIndent;
    //property LeftIndent: Longint read GetLeftIndent write SetLeftIndent;
    //property RightIndent: Longint read GetRightIndent write SetRightIndent;
    property FirstIndent: Double read GetFirstIndent write SetFirstIndent;
    property LeftIndent: Double read GetLeftIndent write SetLeftIndent;
    property RightIndent: Double read GetRightIndent write SetRightIndent;

    //property LineSpacing: Longint read GetLineSpacing write SetLineSpacing;
    //property LineSpacingRule: TLineSpacingRule read GetLineSpacingRule write SetLineSpacingRule;
    property LineSpacing: Double read GetLineSpacing;
    property LineSpacingRule: TLineSpacingRule read GetLineSpacingRule;
    procedure SetLineSpacing(Rule: TLineSpacingRule; Value: Double);

    property Numbering: TRxNumbering read GetNumbering write SetNumbering;
    property NumberingStyle: TRxNumberingStyle read GetNumberingStyle write SetNumberingStyle;
    property NumberingTab: Word read GetNumberingTab write SetNumberingTab;
    property NumberingStart: Word read GetNumberingStart write SetNumberingStart;

    //property SpaceAfter: Longint read GetSpaceAfter write SetSpaceAfter;
    //property SpaceBefore: Longint read GetSpaceBefore write SetSpaceBefore;
    property SpaceBefore: Double read GetSpaceBefore write SetSpaceBefore;
    property SpaceAfter: Double read GetSpaceAfter write SetSpaceAfter;

    property Tab[Index: Byte]: Longint read GetTab write SetTab;
    property TabCount: Integer read GetTabCount write SetTabCount;
    property TableStyle: TParaTableStyle read GetTableStyle write SetTableStyle;
  end;

//-----------------------------------------------------------------------------
{ TOEMConversion }

  TOEMConversion = class(TConversion)
  public
    function ConvertReadStream(Stream: TStream; Buffer: PChar; BufSize: Integer): Integer; override;
    function ConvertWriteStream(Stream: TStream; Buffer: PChar; BufSize: Integer): Integer; override;
  end;

//-----------------------------------------------------------------------------
{ TWideStrings class } {Added by junjiao.wang 2001.2.15}

  TWideStrings = class(TPersistent)
  private
    FUpdateCount: Integer;
  protected
    /// procedure DefineProperties(Filer: TFiler); override;
    procedure Error(const Msg: string; Data: Integer); overload;
    procedure Error(Msg: PResStringRec; Data: Integer); overload;
    procedure SetUpdateState(Updating: Boolean); virtual;

    function GetCount: Integer; virtual; abstract;
    function GetCapacity: Integer; virtual;
    procedure SetCapacity(NewCapacity: Integer); virtual;

    procedure Put(Index: Integer; const S: string); virtual;
    procedure WidePut(Index: Integer; const S: WideString); virtual;
    
    procedure PutObject(Index: Integer; AObject: TObject); virtual;
    function GetObject(Index: Integer): TObject; virtual;

    function Get(Index: Integer): string; virtual;
    function WideGet(Index: Integer): WideString; virtual; abstract;

    function GetText: string; virtual;
    function WideGetText: WideString; virtual;

    procedure SetText(const Value: string); virtual;
    procedure WideSetText(const Value: WideString); virtual;

    //procedure ReadData(Reader: TReader);
    //procedure WriteData(Writer: TWriter);
    function GetCodePage: Word; virtual;
    property __cp : Word read GetCodePage;

  public
    destructor Destroy; override;
    procedure Clear; virtual; abstract;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Delete(Index: Integer); virtual; abstract;
    procedure Exchange(Index1, Index2: Integer); virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure Assign(Source: TPersistent); override;

    function Add(const S: string): Integer; virtual;
    function WideAdd(const S: WideString): Integer; virtual;

    function AddObject(const S: WideString; AObject: TObject): Integer; virtual;

    procedure AddStrings(Strings: TWideStrings); virtual;
    function Equals(Strings: TWideStrings): Boolean;

    function IndexOf(const S: string): Integer; virtual;
    function WideIndexOf(const S: WideString): Integer; virtual;
    function IndexOfObject(AObject: TObject): Integer;

    procedure Insert(Index: Integer; const S: string); virtual;
    procedure WideInsert(Index: Integer; const S: WideString); virtual; abstract;

    procedure InsertObject(Index: Integer; const S: string; AObject: TObject);
    procedure WideInsertObject(Index: Integer; const S: WideString; AObject: TObject);

    procedure LoadFromFile(const FileName: string); virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure SaveToFile(const FileName: string); virtual;
    procedure SaveToStream(Stream: TStream); virtual;

    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property Strings[Index: Integer]: string read Get write Put;
    property WideStrings[Index: Integer]: WideString read WideGet write WidePut; default;

    property Text: string read GetText write SetText;
    property WideText: WideString read WideGetText write WideSetText;
    
  end;


//-----------------------------------------------------------------------------
{ TRxCustomRichEdit }

  TUndoName = (unUnknown, unTyping, unDelete, unDragDrop, unCut, unPaste);
  TRichSearchType = (stWholeWord, stMatchCase, stBackward, stSetSelection);
  TRichSearchTypes = set of TRichSearchType;
  TRichSelection = (stText, stObject, stMultiChar, stMultiObject);
  TRichSelectionType = set of TRichSelection;
  TRichLangOption = (rlAutoKeyboard, rlAutoFont, rlImeCancelComplete,
    rlImeAlwaysSendNotify);
  TRichLangOptions = set of TRichLangOption;
  TRichStreamFormat = (sfDefault, sfRichText, sfPlainText);
  TRichStreamMode = (smSelection, smPlainRtf, smNoObjects, smUnicode);
  TRichStreamModes = set of TRichStreamMode;
  TRichEditURLClickEvent = procedure(Sender: TObject; const URLText: string;
    Button: TMouseButton) of object;
  TRichEditProtectChangeEx = procedure(Sender: TObject; const Message: TMessage;
    StartPos, EndPos: Integer; var AllowChange: Boolean) of object;
  TRichEditFindErrorEvent = procedure(Sender: TObject; const FindText: string) of object;
{$IFDEF RX_D3}
  TRichEditFindCloseEvent = procedure(Sender: TObject; Dialog: TFindDialog) of object;
{$ENDIF}

  PRichConversionFormat = ^TRichConversionFormat;
  TRichConversionFormat = record
    ConversionClass: TConversionClass;
    Extension: string;
    PlainText: Boolean;
    Next: PRichConversionFormat;
  end;

  TRxCustomRichEdit = class(TCustomMemo)
  private
    FHideScrollBars: Boolean;
    FSelectionBar: Boolean;
    FAutoURLDetect: Boolean;
    FWordSelection: Boolean;
    FPlainText: Boolean;
    FSelAttributes: TRxTextAttributes;
    FDefAttributes: TRxTextAttributes;
    FWordAttributes: TRxTextAttributes;
    FParagraph: TRxParaAttributes;
    FOldParaAlignment: TParaAlignment;
    FScreenLogPixels: Integer;
    FUndoLimit: Integer;
    FRichEditStrings: TWideStrings;
    FMemStream: TMemoryStream;
    FHideSelection: Boolean;
    FLangOptions: TRichLangOptions;
    FModified: Boolean;
    FLinesUpdating: Boolean;
    FPageRect: TRect;
    FClickRange: TCharRange;
    FClickBtn: TMouseButton;
    FFindDialog: TFindDialog;
    FReplaceDialog: TReplaceDialog;
    FLastFind: TFindDialog;
    FAllowObjects: Boolean;
    FCallback: TObject;
    FRichEditOle: IUnknown;
    FPopupVerbMenu: TPopupMenu;
    FTitle: string;
    FAutoVerbMenu: Boolean;
{$IFDEF RX_D3}
    FAllowInPlace: Boolean;
{$ENDIF}
    FDefaultConverter: TConversionClass;
    FOnSelChange: TNotifyEvent;
    FOnResizeRequest: TRichEditResizeEvent;
    FOnProtectChange: TRichEditProtectChange;
    FOnProtectChangeEx: TRichEditProtectChangeEx;
    FOnSaveClipboard: TRichEditSaveClipboard;
    FOnURLClick: TRichEditURLClickEvent;
    FOnTextNotFound: TRichEditFindErrorEvent;
{$IFDEF RX_D3}
    FOnCloseFindDialog: TRichEditFindCloseEvent;
{$ENDIF}
    //FDefWndProcW: TFNWndProc;
    __Wide: Boolean; {added by junjiao.wang}
    __FCP: Word;
    __DefWndProcW: TFNWndProc;
    __DefWndProcA: TFNWndProc;

    function GetAutoURLDetect: Boolean;
    function GetWordSelection: Boolean;
    function GetLangOptions: TRichLangOptions;
    function GetCanRedo: Boolean;
    function GetCanPaste: Boolean;
{$IFNDEF RX_V110}
    function GetCanUndo: Boolean;
{$ENDIF}
    function GetRedoName: TUndoName;
    function GetUndoName: TUndoName;
    function GetStreamFormat: TRichStreamFormat;
    function GetStreamMode: TRichStreamModes;
    function GetSelectionType: TRichSelectionType;
    procedure PopupVerbClick(Sender: TObject);
    procedure ObjectPropsClick(Sender: TObject);
    procedure CloseObjects;
    procedure UpdateHostNames;
    procedure SetAllowObjects(Value: Boolean);
    procedure SetStreamFormat(Value: TRichStreamFormat);
    procedure SetStreamMode(Value: TRichStreamModes);
    procedure SetAutoURLDetect(Value: Boolean);
    procedure SetWordSelection(Value: Boolean);
    procedure SetHideScrollBars(Value: Boolean);
    procedure SetHideSelection(Value: Boolean);
    procedure SetTitle(const Value: string);
    procedure SetLangOptions(Value: TRichLangOptions);
    procedure SetRichEditStrings(Value: TWideStrings);
    procedure SetDefAttributes(Value: TRxTextAttributes);
    procedure SetSelAttributes(Value: TRxTextAttributes);
    procedure SetWordAttributes(Value: TRxTextAttributes);
    procedure SetSelectionBar(Value: Boolean);
    procedure SetUndoLimit(Value: Integer);
    procedure UpdateTextModes(Plain: Boolean);
    procedure AdjustFindDialogPosition(Dialog: TFindDialog);
    procedure SetupFindDialog(Dialog: TFindDialog; const SearchStr,
      ReplaceStr: string);
    function FindEditText(Dialog: TFindDialog; AdjustPos, Events: Boolean): Boolean;
    function GetCanFindNext: Boolean;
    procedure FindDialogFind(Sender: TObject);
    procedure ReplaceDialogReplace(Sender: TObject);
{$IFDEF RX_D3}
    procedure FindDialogClose(Sender: TObject);
    procedure SetUIActive(Active: Boolean);
    procedure CMDocWindowActivate(var Message: TMessage); message CM_DOCWINDOWACTIVATE;
    procedure CMUIDeactivate(var Message: TMessage); message CM_UIDEACTIVATE;
{$ENDIF}
{$IFDEF RX_D4}
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
{$ENDIF}
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure EMReplaceSel(var Message: TMessage); message EM_REPLACESEL;
    procedure EMGetSelText(var Message: TMessage); message EM_GETSELTEXT;
    procedure EMGetTextRange(var Message: TMessage); message EM_GETTEXTRANGE;
    procedure WMDestroy(var Msg: TWMDestroy); message WM_DESTROY;
    procedure WMMouseMove(var Message: TMessage); message WM_MOUSEMOVE;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFont(var Message: TWMSetFont); message WM_SETFONT;
    procedure WMSetText(var Message: TMessage); message WM_SETTEXT;
{$IFDEF RX_D5}
    procedure WMRButtonUp(var Message: TMessage); message WM_RBUTTONUP;
{$ENDIF}
    //procedure EMStreamIn(var Message: TMessage); message EM_STREAMIN;
    //procedure EMStreamOut(var Message: TMessage); message EM_STREAMOUT;

    function PerformReally(Msg: Cardinal; WParam, LParam: Longint): Longint;
    procedure LoadRTFProperty(Reader:TStream);
    procedure SaveRTFProperty(Writer:TStream);
  protected
//    procedure DefineProperties(Filer:TFiler); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function GetPopupMenu: TPopupMenu; override;
    procedure TextNotFound(Dialog: TFindDialog); virtual;
    procedure RequestSize(const Rect: TRect); virtual;
    procedure SelectionChange; dynamic;
    function ProtectChange(const Message: TMessage; StartPos,
      EndPos: Integer): Boolean; dynamic;
    function SaveClipboard(NumObj, NumChars: Integer): Boolean; dynamic;
    procedure URLClick(const URLText: string; Button: TMouseButton); dynamic;
    procedure SetPlainText(Value: Boolean); virtual;
{$IFDEF RX_D3}
    procedure CloseFindDialog(Dialog: TFindDialog); virtual;
    procedure DoSetMaxLength(Value: Integer); override;
    function GetSelLength: Integer; override;

    procedure WideSetText(Value: WideString);
    function WideGetText: WideString;

    procedure AnsiSetText(Value: string);
    function AnsiGetText: string;

    procedure SetRTFSelText(Value: String);
    function GetRTFSelText: String;

    procedure InsertFromFile(const FileName: String);

    function GetSelStart: Integer; override;
    //function GetSelText: string; override;{this is used to SelText}
    {As non-virtual member in the base class, SetSelText can't be overrided }
    {So I bet Assigning something to SelText might cause trouble.}
    {comments by wang junjiao 2001.2}
    //procedure SetSelText(const Value: string); override;

    function WideGetSelText: WideString;
    procedure WideSetSelText(Value: WideString);

    function AnsiGetSelText: string;
    procedure AnsiSetSelText(Value: string);

    procedure SetSelLength(Value: Integer); override;
    procedure SetSelStart(Value: Integer); override;
    property AllowInPlace: Boolean read FAllowInPlace write FAllowInPlace default True;
{$ENDIF}
    property AllowObjects: Boolean read FAllowObjects write SetAllowObjects default True;
    property AutoURLDetect: Boolean read GetAutoURLDetect write SetAutoURLDetect default True;
    property AutoVerbMenu: Boolean read FAutoVerbMenu write FAutoVerbMenu default True;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property HideScrollBars: Boolean read FHideScrollBars
      write SetHideScrollBars default True;
    property Title: string read FTitle write SetTitle;
    property LangOptions: TRichLangOptions read GetLangOptions write SetLangOptions default [rlAutoFont];
    property SelectionBar: Boolean read FSelectionBar write SetSelectionBar default True;
    property StreamFormat: TRichStreamFormat read GetStreamFormat write SetStreamFormat default sfDefault;
    property StreamMode: TRichStreamModes read GetStreamMode write SetStreamMode default [];
    property UndoLimit: Integer read FUndoLimit write SetUndoLimit default 100;
    property WordSelection: Boolean read GetWordSelection write SetWordSelection default True;
    property ScrollBars default ssBoth;
    property TabStop default True;
    property OnSaveClipboard: TRichEditSaveClipboard read FOnSaveClipboard
      write FOnSaveClipboard;
    property OnSelectionChange: TNotifyEvent read FOnSelChange write FOnSelChange;
    property OnProtectChange: TRichEditProtectChange read FOnProtectChange
      write FOnProtectChange; { obsolete }
    property OnProtectChangeEx: TRichEditProtectChangeEx read FOnProtectChangeEx
      write FOnProtectChangeEx;
    property OnResizeRequest: TRichEditResizeEvent read FOnResizeRequest
      write FOnResizeRequest;
    property OnURLClick: TRichEditURLClickEvent read FOnURLClick write FOnURLClick;
    property OnTextNotFound: TRichEditFindErrorEvent read FOnTextNotFound write FOnTextNotFound;
{$IFDEF RX_D3}
    property OnCloseFindDialog: TRichEditFindCloseEvent read FOnCloseFindDialog
      write FOnCloseFindDialog;
{$ENDIF}
  public
    procedure ShowEditor;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; {$IFDEF RX_D3} override; {$ENDIF}
    procedure SetSelection(StartPos, EndPos: Longint; ScrollCaret: Boolean);
    function GetSelection: TCharRange;
    function GetTextRange(StartPos, EndPos: Longint): WideString;
    function LineFromChar(CharIndex: Integer): Integer;
    function GetLineIndex(LineNo: Integer): Integer;
    function GetLineLength(CharIndex: Integer): Integer;
    function WordAtCursor: string;
    function _WordAtCursor: WideString;
    function FindText(const SearchStr: string;
      StartPos, Length: Integer; Options: TRichSearchTypes): Integer;
    //function WideGetSelTextBuf(Buffer: PWideChar; BufSize: Integer): Integer;
    function GetCaretPos: TPoint; override;
    function GetCharPos(CharIndex: Integer): TPoint;
    function InsertObjectDialog: Boolean;
    function ObjectPropertiesDialog: Boolean;
    function PasteSpecialDialog: Boolean;
    function FindDialog(const SearchStr: string): TFindDialog;
    function ReplaceDialog(const SearchStr, ReplaceStr: string): TReplaceDialog;
    function FindNext: Boolean;
    procedure Print(const Caption: string); virtual;
    class procedure RegisterConversionFormat(const AExtension: string;
      APlainText: Boolean; AConversionClass: TConversionClass);
    procedure ClearUndo;
    procedure Redo;
    procedure StopGroupTyping;
    property CanFindNext: Boolean read GetCanFindNext;
    property CanRedo: Boolean read GetCanRedo;
    property CanPaste: Boolean read GetCanPaste;
{$IFNDEF RX_V110}
    procedure Undo;
    property CanUndo: Boolean read GetCanUndo;
    property CaretPos: TPoint read GetCaretPos;
{$ENDIF}
    property RedoName: TUndoName read GetRedoName;
    property UndoName: TUndoName read GetUndoName;
    property DefaultConverter: TConversionClass read FDefaultConverter
      write FDefaultConverter;
    property DefAttributes: TRxTextAttributes read FDefAttributes write SetDefAttributes;
    property SelAttributes: TRxTextAttributes read FSelAttributes write SetSelAttributes;
    property WordAttributes: TRxTextAttributes read FWordAttributes write SetWordAttributes;
    property PageRect: TRect read FPageRect write FPageRect;
    property Paragraph: TRxParaAttributes read FParagraph;
    property SelectionType: TRichSelectionType read GetSelectionType;

    //property SelText: string read GetSelText write SetSelText;
    //Since we can not override SetSelText, EMReplaceSel & EMGetSelText are hooked.
    //So i'd guess SelText might work , but i'm not very sure this.
    //comments by wang junjiao 2001.2

    property WideSelText: WideString read WideGetSelText write WideSetSelText;
    property WideText: WideString read WideGetText write WideSetText;

    property AnsiSelText: string read AnsiGetSelText write AnsiSetSelText;
    property AnsiText: string read AnsiGetText write AnsiSetText;
    property RTFSelText: String read GetRTFSelText write SetRTFSelText;
  published
    property Lines: TWideStrings read FRichEditStrings write SetRichEditStrings stored True;
    property PlainText: Boolean read FPlainText write SetPlainText default False;
  end;

//-----------------------------------------------------------------------------
{TRxRichEdit}

  TRxRichEdit = class(TRxCustomRichEdit)
  public
  published
    property Align;
    property Alignment;
    property AutoURLDetect;
    property AutoVerbMenu;
    property AllowObjects;
{$IFDEF RX_D3}
    property AllowInPlace;
{$ENDIF}
{$IFDEF RX_D4}
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property DragKind;
{$ENDIF}
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property HideScrollBars;
    property Title;
{$IFNDEF VER90}
    property ImeMode;
    property ImeName;
{$ENDIF}
{$IFDEF RX_D4}
    property Constraints;
    property Lines;
    property ParentBiDiMode;
{$ENDIF}
    property LangOptions;
    //property Lines;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PlainText;
    property PopupMenu;
    property ReadOnly;
    property ScrollBars;
    property SelectionBar;
    property ShowHint;
    property StreamFormat;
    property StreamMode;
    property TabOrder;
    property TabStop;
    property UndoLimit;
    property Visible;
    property WantTabs;
    property WantReturns;
    property WordSelection;
    property WordWrap;
    property OnChange;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
{$IFDEF RX_D5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF RX_D4}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF RX_D4}
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
{$ENDIF}
    property OnProtectChange; { obsolete }
    property OnProtectChangeEx;
    property OnResizeRequest;
    property OnSaveClipboard;
    property OnSelectionChange;
    property OnStartDrag;
    property OnTextNotFound;
{$IFDEF RX_D3}
    property OnCloseFindDialog;
{$ENDIF}
    property OnURLClick;
  end;


var
  RichEditVersion: TRichEditVersion;

  procedure Register;

implementation

uses RTFProperty,dsgnintf,Printers, ComStrs,OleConst, OleDlg {$IFDEF RX_D3}, OleCtnrs {$ENDIF}
  {,MaxMin};

var
  IsWinNT: Boolean;

//-----------------------------------------------------------------------------
{ unicode tools } {added by junjiao.wang, They come form TRichEdit98}

function CharToWide(const S: String; CodePage: Word): WideString;
var
  L: Integer;
begin
  if S='' then
    Result:= ''
  else
    begin
      L:= MultiByteToWideChar(CodePage, 0, PChar(@S[1]), -1, nil, 0);
      SetLength(Result, L-1);
      MultiByteToWideChar(CodePage, 0, PChar(@S[1]), -1, PWideChar(@Result[1]), L-1);
   end;
end;

function WideToChar(const WS: WideString; CodePage: Word): String;
var
  L: Integer;
begin
  if WS='' then
    Result:= ''
  else
    begin
      L:= WideCharToMultiByte(CodePage, 0, @WS[1], -1, nil, 0, nil, nil);
      SetLength(Result, L-1);
      WideCharToMultiByte(CodePage, 0, @WS[1], -1, @Result[1], L-1, nil, nil);
    end;
end;

//-----------------------------------------------------------------------------
{ TWideStrings }

destructor TWideStrings.Destroy;
begin
  //StringsAdapter := nil;
  inherited Destroy;
end;

function TWideStrings.Add(const S: string): Integer;
begin
  Result := WideAdd(CharToWide(S, __cp));
end;

function TWideStrings.WideAdd(const S: WideString): Integer;
begin
  Result := GetCount;
  WideInsert(Result, S);
end;

function TWideStrings.AddObject(const S: WideString; AObject: TObject): Integer;
begin
  Result := Add(S);
  PutObject(Result, AObject);
end;

procedure TWideStrings.AddStrings(Strings: TWideStrings);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Strings.Count - 1 do
      AddObject(Strings[I], Strings.Objects[I]);
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.Assign(Source: TPersistent);
begin
  if Source is TWideStrings then
  begin
    BeginUpdate;
    try
      Clear;
      AddStrings(TWideStrings(Source));
    finally
      EndUpdate;
    end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TWideStrings.BeginUpdate;
begin
  if FUpdateCount = 0 then SetUpdateState(True);
  Inc(FUpdateCount);
end;

//Disable property editor, due to no need.
(*
procedure TWideStrings.DefineProperties(Filer: TFiler);

  function DoWrite: Boolean;
  begin
    if Filer.Ancestor <> nil then
    begin
      Result := True;
      if Filer.Ancestor is TWideStrings then
        Result := not Equals(TWideStrings(Filer.Ancestor))
    end
    else Result := Count > 0;
  end;

begin
  Filer.DefineProperty('WideStrings', ReadData, WriteData, DoWrite);
end;
*)

procedure TWideStrings.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then SetUpdateState(False);
end;

function TWideStrings.Equals(Strings: TWideStrings): Boolean;
var
  I, Count: Integer;
begin
  Result := False;
  Count := GetCount;
  if Count <> Strings.GetCount then Exit;
  for I := 0 to Count - 1 do if Get(I) <> Strings.Get(I) then Exit;
  Result := True;
end;

procedure TWideStrings.Error(const Msg: string; Data: Integer);

  function ReturnAddr: Pointer;
  asm
          MOV     EAX,[EBP+4]
  end;

begin
  raise EStringListError.CreateFmt(Msg, [Data]) at ReturnAddr;
end;

procedure TWideStrings.Error(Msg: PResStringRec; Data: Integer);
begin
  Error(LoadResString(Msg), Data);
end;

procedure TWideStrings.Exchange(Index1, Index2: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  BeginUpdate;
  try
    TempString := Strings[Index1];
    TempObject := Objects[Index1];
    Strings[Index1] := Strings[Index2];
    Objects[Index1] := Objects[Index2];
    Strings[Index2] := TempString;
    Objects[Index2] := TempObject;
  finally
    EndUpdate;
  end;
end;

function TWideStrings.Get(Index: Integer): string;
begin
  Result := WideCharToString(PWideChar(WideGet(Index)));
end;

function TWideStrings.GetCapacity: Integer;
begin  // descendants may optionally override/replace this default implementation
  Result := Count;
end;

function TWideStrings.GetObject(Index: Integer): TObject;
begin
  Result := nil;
end;

function TWideStrings.GetText: string;
begin
        Result := WideCharToString(PWideChar(WideGetText));
end;

function TWideStrings.WideGetText: WideString;
var
  I, L, Size, Count: Integer;
  P: PWideChar;
  S: WideString;
begin
  Count := GetCount;
  Size := 0;
  for I := 0 to Count - 1 do Inc(Size, Length(Get(I)) + 2);
  SetString(Result, nil, Size);
  P := Pointer(Result);
  for I := 0 to Count - 1 do
  begin
    S := Get(I);
    L := Length(S);
    if L <> 0 then
    begin
      System.Move(Pointer(S)^, P^, L*2);
      Inc(P, L);
    end;
    P^ := #13;
    Inc(P);
    P^ := #10;
    Inc(P);
  end;
end;

(*
function TWideStrings.WideGetText: WideString;
var
  I, {L, Size,} Count: Integer;
  //P: PWideChar;
  S: WideString;
begin
  Count := GetCount;
  //Size := 0;
  S := WideString('');
  for I := 0 to Count - 1 do
  begin
    if I > 0 then begin S := S + WideString('#13#10'); end; 
    S := S + WideGet(I); //this line maybe cause bad performance.
  end;
end;
*)

function TWideStrings.IndexOf(const S: string): Integer;
begin
  Result := WideIndexOf(WideString(PChar(S)));
end;

function TWideStrings.WideIndexOf(const S: WideString): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if WideGet(Result) = S then Exit;
    //if AnsiCompareText(Get(Result), S) = 0 then Exit;
  Result := -1;
end;

function TWideStrings.IndexOfObject(AObject: TObject): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if GetObject(Result) = AObject then Exit;
  Result := -1;
end;

procedure TWideStrings.Insert(Index: Integer; const S: string);
begin
  WideInsert(Index,WideString(PChar(S)));
end;

procedure TWideStrings.InsertObject(Index: Integer; const S: string; AObject: TObject);
begin
  WideInsertObject(Index,WideString(PChar(S)),AObject);
end;

procedure TWideStrings.WideInsertObject(Index: Integer; const S: WideString; AObject: TObject);
begin
  WideInsert(Index, S);
  PutObject(Index, AObject);
end;

procedure TWideStrings.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TWideStrings.LoadFromStream(Stream: TStream);
var
  Size: Integer;
  tmp: string;
  //S: WideString;
begin
  BeginUpdate;
  try
    Size := Stream.Size - Stream.Position;
    //S.SetLength(Size);
    //SetString(S, nil, Size);
    SetString(tmp, nil, Size+1);
    Stream.Read(Pointer(tmp)^, Size);
    //Stream.Read(Pointer(S)^, Size);
    SetText(tmp);
    //SetText(S);
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.Move(CurIndex, NewIndex: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  if CurIndex <> NewIndex then
  begin
    BeginUpdate;
    try
      TempString := Get(CurIndex);
      TempObject := GetObject(CurIndex);
      Delete(CurIndex);
      InsertObject(NewIndex, TempString, TempObject);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TWideStrings.Put(Index: Integer; const S: string);
begin
  WidePut(Index,WideString(PChar(S)));
end;

procedure TWideStrings.WidePut(Index: Integer; const S: WideString);
var
  TempObject: TObject;
begin
  TempObject := GetObject(Index);
  Delete(Index);
  InsertObject(Index, S, TempObject);
end;

procedure TWideStrings.PutObject(Index: Integer; AObject: TObject);
begin
end;

(*
procedure TWideStrings.ReadData(Reader: TReader);
var
  S: String;
  W: WideString;
  I: Integer;
  Z: Integer;
  N: Word;
begin
  BeginUpdate;
  try
    Clear;
    S:= Reader.ReadString;
    SetLength(W, Length(S) div 4);
    for I:= 1 to Length(S) div 4 do
      begin
        Val('$'+S[I*4-3]+S[I*4-2]+S[I*4-1]+S[I*2], N, Z);
        W[I]:= WideChar(N);
      end;
    Text:= W;
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.WriteData(Writer: TWriter);
var
  I: Integer;
  S: String;
  W: WideString;
begin
  W:= Text;
  S:= '';
  for I := 1 to Length(W) do
    S:= S+IntToHex(Word(W[1]), 4);
  Writer.WriteString(S);
end;
*)

procedure TWideStrings.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TWideStrings.SaveToStream(Stream: TStream);
var
  //S: WideString;
  tmp:string;
begin
  //S := WideGetText;
  //tmp := WideCharToString(PWideChar(S));
  tmp := GetText;
  Stream.WriteBuffer(Pointer(tmp)^, Length(tmp));
  //Stream.WriteBuffer(Pointer(S)^, Length(S));
end;

procedure TWideStrings.SetCapacity(NewCapacity: Integer);
begin
  // do nothing - descendants may optionally implement this method
end;

procedure TWideStrings.SetText(const Value: string);
begin
  WideSetText(CharToWide(Value, __cp));
  //WideSetText(WideCharToString(PWideChar(Value)));
end;

procedure TWideStrings.WideSetText(const Value: WideString);
var
  P, Start: PWideChar;
  S: WideString;
begin
  BeginUpdate;
  try
    Clear;
    P := Pointer(Value);
    if P <> nil then
      while P^ <> #0 do
      begin
        Start := P;
        while not (P^ in [WideChar(#0), WideChar(#10), WideChar(#13)]) do Inc(P);
        SetString(S, Start, P - Start);
        Add(S);
        if P^ = #13 then Inc(P);
        if P^ = #10 then Inc(P);
      end;
  finally
    EndUpdate;
  end;
end;

function TWideStrings.GetCodePage: Word;
begin
  Result := CP_OEMCP;
end;

(*
procedure TWideStrings.WideSetText(const Value: WideString);
var
  P, Start: PChar;
  S: WideString;
  tmp: string;
begin
  BeginUpdate;
  try
    Clear;
    tmp := WideCharToString(PWideChar(Value));
    P := PChar(tmp);
    //P := Pointer(Value);
    if P <> nil then
      while P^ <> #0 do
      begin
        Start := P;
        while not (P^ in [#0, #10, #13]) do Inc(P);
        //while not (P^ in [WideChar(#0), WideChar(#10), WideChar(#13)]) do Inc(P);
        SetString(tmp, Start, P - Start);
        //SetString(S, Start, P - Start);
        S := tmp;
        Add(S);
        if P^ = #13 then Inc(P);
        if P^ = #10 then Inc(P);
      end;
  finally
    EndUpdate;
  end;
end;
*)

procedure TWideStrings.SetUpdateState(Updating: Boolean);
begin
end;

const
  RTFConversionFormat: TRichConversionFormat = (
    ConversionClass: TConversion;
    Extension: 'rtf';
    PlainText: False;
    Next: nil);
  TextConversionFormat: TRichConversionFormat = (
    ConversionClass: TConversion;
    Extension: 'txt';
    PlainText: True;
    Next: @RTFConversionFormat);

//-----------------------------------------------------------------------------
{TextAttributes / TParaAttributes}

var
  ConversionFormatList: PRichConversionFormat = @TextConversionFormat;

const
  RichEdit10ModuleName = 'RICHED32.DLL';
  RichEdit20ModuleName = 'RICHED20.DLL';

//I just want to use riched20.dll::RichEdit20W, so disabled else.
//but the component would meet trouble if run on some win-platforms.
//comments by wang junjiao 2001.2

(*
{$IFNDEF RX_D3}
  RICHEDIT_CLASSA      = 'RichEdit20A';     { Richedit 2.0 Window Class }
  RICHEDIT_CLASSW      = 'RichEdit20W';     { Richedit 2.0 Unicode }
  RICHEDIT_CLASS10A    = 'RICHEDIT';        { Richedit 1.0 }
  RICHEDIT_CLASS       = RICHEDIT_CLASSA;
{$ENDIF}
*)
  _RICHEDIT_CLASS        = RICHEDIT_CLASSW;

const
  FT_DOWN = 1;

type
  PENLink = ^TENLink;
  PENOleOpFailed = ^TENOleOpFailed;
  TFindTextEx = TFindTextExW;
  //TFindTextEx = TFindTextExA;

  TTextRangeA = record
    chrg: TCharRange;
    lpstrText: PAnsiChar;
  end;
  TTextRangeW = record
    chrg: TCharRange;
    lpstrText: PWideChar;
  end;
  {$IFDEF UNICODE}
  TTextRange = TTextRangeW;
  {$ELSE}
  TTextRange = TTextRangeA;
  {$ENDIF}

{$IFDEF RX_D3}
function ResStr(const Ident: string): string;
begin
  Result := Ident;
end;
{$ELSE}
function ResStr(Ident: Cardinal): string;
begin
  Result := LoadStr(Ident);
end;
{$ENDIF}

{ TRxTextAttributes }

const
  AttrFlags: array[TRxAttributeType] of Word = (0, SCF_SELECTION,
    SCF_WORD or SCF_SELECTION);

constructor TRxTextAttributes.Create(AOwner: TRxCustomRichEdit; AttributeType: TRxAttributeType);
begin
  inherited Create;
  RichEdit := AOwner;
  FType := AttributeType;
end;

procedure TRxTextAttributes.InitFormat(var Format: TCharFormat2W);
begin
  FillChar(Format, SizeOf(Format), 0);
  if RichEditVersion >= 2 then Format.cbSize := SizeOf(Format)
  else Format.cbSize := SizeOf(TCharFormat);
end;

function TRxTextAttributes.GetConsistentAttributes: TRxConsistentAttributes;
var
  Format: TCharFormat2W;
begin
  Result := [];
  if RichEdit.HandleAllocated and (FType <> atDefaultText) then begin
    InitFormat(Format);
    SendMessage(RichEdit.Handle, EM_GETCHARFORMAT,
      AttrFlags[FType], LPARAM(@Format));
    with Format do begin
      if (dwMask and CFM_BOLD) <> 0 then Include(Result, caBold);
      if (dwMask and CFM_COLOR) <> 0 then Include(Result, caColor);
      if (dwMask and CFM_FACE) <> 0 then Include(Result, caFace);
      if (dwMask and CFM_ITALIC) <> 0 then Include(Result, caItalic);
      if (dwMask and CFM_SIZE) <> 0 then Include(Result, caSize);
      if (dwMask and CFM_STRIKEOUT) <> 0 then Include(Result, caStrikeOut);
      if (dwMask and CFM_UNDERLINE) <> 0 then Include(Result, caUnderline);
      if (dwMask and CFM_PROTECTED) <> 0 then Include(Result, caProtected);
      if (dwMask and CFM_OFFSET) <> 0 then Include(Result, caOffset);
      if (dwMask and CFM_HIDDEN) <> 0 then Include(result, caHidden);
      if RichEditVersion >= 2 then begin
        if (dwMask and CFM_LINK) <> 0 then Include(Result, caLink);
        if (dwMask and CFM_BACKCOLOR) <> 0 then Include(Result, caBackColor);
        if (dwMask and CFM_DISABLED) <> 0 then Include(Result, caDisabled);
        if (dwMask and CFM_WEIGHT) <> 0 then Include(Result, caWeight);
        if (dwMask and CFM_SUBSCRIPT) <> 0 then Include(Result, caSubscript);
        if (dwMask and CFM_REVAUTHOR) <> 0 then Include(Result, caRevAuthor);
        //append further attributes  [by wang junjiao]
        if (dwMask and CFM_LCID) <> 0 then Include(Result, caLanguage);
        if (dwMask and CFM_SUPERSCRIPT) <> 0 then Include(Result, caIndexKind);
        if (dwMask and CFM_SPACING) <> 0 then Include(Result, caSpacing);
        if (dwMask and CFM_KERNING) <> 0 then Include(Result, caKerning);
        if (dwMask and CFM_UNDERLINETYPE) <> 0 then Include(Result, caULType);
        if (dwMask and CFM_ANIMATION) <> 0 then Include(Result, caAnimation);
        if (dwMask and CFM_SMALLCAPS) <> 0 then Include(Result, caSmallCaps);
        if (dwMask and CFM_ALLCAPS) <> 0 then Include(Result, caAllCaps);
        if (dwMask and CFM_HIDDEN) <> 0 then Include(Result, caHidden);
        if (dwMask and CFM_OUTLINE) <> 0 then Include(Result, caOutline);
        if (dwMask and CFM_SHADOW) <> 0 then Include(Result, caShadow);
        if (dwMask and CFM_EMBOSS) <> 0 then Include(Result, caEmboss);
        if (dwMask and CFM_IMPRINT) <> 0 then Include(Result, caImprint);
        if (dwMask and CFM_LINK)<>0 then Include(result, caURL);
      end;
    end;
  end;
end;

procedure TRxTextAttributes.GetAttributes(var Format: TCharFormat2W);
begin
  InitFormat(Format);
  if RichEdit.HandleAllocated then
    SendMessage(RichEdit.Handle, EM_GETCHARFORMAT, AttrFlags[FType],
      LPARAM(@Format));
end;

procedure TRxTextAttributes.SetAttributes(var Format: TCharFormat2W);
begin
  if RichEdit.HandleAllocated then
    SendMessage(RichEdit.Handle, EM_SETCHARFORMAT, AttrFlags[FType],
      LPARAM(@Format));
end;

//{$IFNDEF VER90}
function TRxTextAttributes.GetCharset: TFontCharset;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.bCharset;
end;

procedure TRxTextAttributes.SetCharset(Value: TFontCharset);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_CHARSET;
    bCharSet := Value;
  end;
  SetAttributes(Format);
end;
//{$ENDIF}

function TRxTextAttributes.GetProtected: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  with Format do
    Result := (dwEffects and CFE_PROTECTED) <> 0;
end;

procedure TRxTextAttributes.SetProtected(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_PROTECTED;
    if Value then dwEffects := CFE_PROTECTED;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetLink: Boolean;
var
  Format: TCharFormat2W;
begin
  Result := False;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Format);
  with Format do Result := (dwEffects and CFE_LINK) <> 0;
end;

procedure TRxTextAttributes.SetLink(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_LINK;
    if Value then dwEffects := CFE_LINK;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetRevAuthorIndex: Byte;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.bRevAuthor;
end;

procedure TRxTextAttributes.SetRevAuthorIndex(Value: Byte);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_REVAUTHOR;
    bRevAuthor := Value;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetHidden: Boolean;
var
  Format: TCharFormat2W;
begin
  Result := False;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_HIDDEN <> 0;
end;

procedure TRxTextAttributes.SetHidden(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_HIDDEN;
    if Value then dwEffects := CFE_HIDDEN;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetDisabled: Boolean;
var
  Format: TCharFormat2W;
begin
  Result := False;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_DISABLED <> 0;
end;

procedure TRxTextAttributes.SetDisabled(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_DISABLED;
    if Value then dwEffects := CFE_DISABLED;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetColor: TColor;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  with Format do
    if (dwEffects and CFE_AUTOCOLOR) <> 0 then Result := clWindowText
    else Result := crTextColor;
end;

procedure TRxTextAttributes.SetColor(Value: TColor);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_COLOR;
    if (Value = clWindowText) or (Value = clDefault) then
      dwEffects := CFE_AUTOCOLOR
    else crTextColor := ColorToRGB(Value);
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetBackColor: TColor;
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then begin
    Result := clWindow;
    Exit;
  end;
  GetAttributes(Format);
  with Format do
    if (dwEffects and CFE_AUTOBACKCOLOR) <> 0 then Result := clWindow
    else Result := crBackColor;
end;

procedure TRxTextAttributes.SetBackColor(Value: TColor);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_BACKCOLOR;
    if (Value = clWindow) or (Value = clDefault) then
      dwEffects := CFE_AUTOBACKCOLOR
    else crBackColor := ColorToRGB(Value);
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetName: TFontName;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.szFaceName; //???????????? can auto-convert? maybe cause trouble?;
end;

procedure TRxTextAttributes.SetName(Value: TFontName);
var
  Format: TCharFormat2W;
  I: Integer;
  W: WideString;
begin
  (*
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_FACE;
    StrPLCopy(szFaceName, Value, SizeOf(szFaceName));
  end;
  SetAttributes(Format);
  *)
  //replace with the code comes from richedit98
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_FACE;
    W:= Value;
    for I:= 0 to Length(Value)-1 do
      szFaceName[I]:= W[I+1];
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetStyle: TFontStyles;
var
  Format: TCharFormat2W;
begin
  Result := [];
  GetAttributes(Format);
  with Format do begin
    if (dwEffects and CFE_BOLD) <> 0 then Include(Result, fsBold);
    if (dwEffects and CFE_ITALIC) <> 0 then Include(Result, fsItalic);
    if (dwEffects and CFE_UNDERLINE) <> 0 then Include(Result, fsUnderline);
    if (dwEffects and CFE_STRIKEOUT) <> 0 then Include(Result, fsStrikeOut);
  end;
end;

procedure TRxTextAttributes.SetStyle(Value: TFontStyles);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_BOLD or CFM_ITALIC or CFM_UNDERLINE or CFM_STRIKEOUT;
    if fsBold in Value then dwEffects := dwEffects or CFE_BOLD;
    if fsItalic in Value then dwEffects := dwEffects or CFE_ITALIC;
    if fsUnderline in Value then dwEffects := dwEffects or CFE_UNDERLINE;
    if fsStrikeOut in Value then dwEffects := dwEffects or CFE_STRIKEOUT;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetUnderlineType: TUnderlineType;
var
  Format: TCharFormat2W;
begin
  Result := utNone;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Format);
  with Format do begin
    if (dwEffects and CFE_UNDERLINE <> 0) and
      (dwMask and CFM_UNDERLINETYPE = CFM_UNDERLINETYPE) then
      Result := TUnderlineType(bUnderlineType);
  end;
end;

procedure TRxTextAttributes.SetUnderlineType(Value: TUnderlineType);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := CFM_UNDERLINETYPE or CFM_UNDERLINE;
    bUnderlineType := Ord(Value);
    if Value <> utNone then dwEffects := dwEffects or CFE_UNDERLINE;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetOffset: Integer;
var
  Format: TCharFormat2W;
begin
  Result := 0;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Format);
  Result := Format.yOffset div 20;
end;

procedure TRxTextAttributes.SetOffset(Value: Integer);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := DWORD(CFM_OFFSET);
    yOffset := Value * 20;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetSize: Integer;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.yHeight div 20;
end;

procedure TRxTextAttributes.SetSize(Value: Integer);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do begin
    dwMask := DWORD(CFM_SIZE);
    yHeight := Value * 20;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetHeight: Integer;
begin
  Result := MulDiv(Size, RichEdit.FScreenLogPixels, 72);
end;

procedure TRxTextAttributes.SetHeight(Value: Integer);
begin
  Size := MulDiv(Value, 72, RichEdit.FScreenLogPixels);
end;

function TRxTextAttributes.GetPitch: TFontPitch;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  case (Format.bPitchAndFamily and $03) of
    DEFAULT_PITCH: Result := fpDefault;
    VARIABLE_PITCH: Result := fpVariable;
    FIXED_PITCH: Result := fpFixed;
    else Result := fpDefault;
  end;
end;

procedure TRxTextAttributes.SetPitch(Value: TFontPitch);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do begin
    case Value of
      fpVariable: bPitchAndFamily := VARIABLE_PITCH;
      fpFixed: bPitchAndFamily := FIXED_PITCH;
      else bPitchAndFamily := DEFAULT_PITCH;
    end;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetSubscriptStyle: TSubscriptStyle;
var
  Format: TCharFormat2W;
begin
  Result := ssNone;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Format);
  with Format do begin
    if (dwEffects and CFE_SUBSCRIPT) <> 0 then
      Result := ssSubscript
    else if (dwEffects and CFE_SUPERSCRIPT) <> 0 then
      Result := ssSuperscript;
  end;
end;

procedure TRxTextAttributes.SetSubscriptStyle(Value: TSubscriptStyle);
var
  Format: TCharFormat2W;
begin
  if RichEditVersion < 2 then Exit;
  InitFormat(Format);
  with Format do begin
    dwMask := DWORD(CFM_SUBSCRIPT);
    case Value of
      ssSubscript: dwEffects := CFE_SUBSCRIPT;
      ssSuperscript: dwEffects := CFE_SUPERSCRIPT;
    end;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetWeight: Word;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.wWeight;
end;

procedure TRxTextAttributes.SetWeight(Value: Word);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_Weight;
    wWeight := Value;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetSpacing: Double;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.sSpacing/20;
end;

procedure TRxTextAttributes.SetSpacing(Value: Double);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_SPACING;
    sSpacing := Round(Value*20);
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetKerning: Double;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.wKerning/20;
end;

procedure TRxTextAttributes.SetKerning(Value: Double);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_KERNING;
    wKerning := Round(Value*20);
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetAnimation: TAnimationType;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := TAnimationType(Format.bAnimation);
end;

procedure TRxTextAttributes.SetAnimation(Value: TAnimationType);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_ANIMATION;
    bAnimation := Byte(Value);
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetSmallCaps: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_SMALLCAPS <>0;
end;

procedure TRxTextAttributes.SetSmallCaps(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_SMALLCAPS;
    if Value then
      dwEffects:= CFE_SMALLCAPS;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetAllCaps: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_ALLCAPS <>0;
end;

procedure TRxTextAttributes.SetAllCaps(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_ALLCAPS;
    if Value then
      dwEffects:= CFE_ALLCAPS;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetOutline: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_OUTLINE <>0;
end;

procedure TRxTextAttributes.SetOutline(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_OUTLINE;
    if Value then
      dwEffects:= CFE_OUTLINE;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetShadow: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_SHADOW <>0;
end;

procedure TRxTextAttributes.SetShadow(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_SHADOW;
    if Value then
      dwEffects:= CFE_SHADOW;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetEmboss: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_EMBOSS <>0;
end;

procedure TRxTextAttributes.SetEmboss(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_EMBOSS;
    if Value then
      dwEffects:= CFE_EMBOSS;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetImprint: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_IMPRINT <>0;
end;

procedure TRxTextAttributes.SetImprint(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_IMPRINT;
    if Value then
      dwEffects:= CFE_IMPRINT;
  end;
  SetAttributes(Format);
end;

function TRxTextAttributes.GetIsURL: Boolean;
var
  Format: TCharFormat2W;
begin
  GetAttributes(Format);
  Result := Format.dwEffects and CFE_LINK <>0;
end;

procedure TRxTextAttributes.SetIsURL(Value: Boolean);
var
  Format: TCharFormat2W;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_LINK;
    if Value then
      dwEffects:= CFE_LINK;
  end;
  SetAttributes(Format);
end;

procedure TRxTextAttributes.AssignFont(Font: TFont);
var
  LogFont: TLogFont;
  Format: TCharFormat2W;
  fn: WideString;
  I: Integer;
begin
  InitFormat(Format);
  with Format do begin
    case Font.Pitch of
      fpVariable: bPitchAndFamily := VARIABLE_PITCH;
      fpFixed: bPitchAndFamily := FIXED_PITCH;
      else bPitchAndFamily := DEFAULT_PITCH;
    end;
    dwMask := dwMask or CFM_SIZE or CFM_BOLD or CFM_ITALIC or
      CFM_UNDERLINE or CFM_STRIKEOUT or CFM_FACE or CFM_COLOR;
    yHeight := Font.Size * 20;
    if fsBold in Font.Style then dwEffects := dwEffects or CFE_BOLD;
    if fsItalic in Font.Style then dwEffects := dwEffects or CFE_ITALIC;
    if fsUnderline in Font.Style then dwEffects := dwEffects or CFE_UNDERLINE;
    if fsStrikeOut in Font.Style then dwEffects := dwEffects or CFE_STRIKEOUT;

    fn := CharToWide(Font.Name,RichEdit.__FCP);
    for I:= 0 to Length(Font.Name)-1 do
      szFaceName[I]:= fn[I+1];

    //I know ObjectPascal less, so make below trials.
    //MoveMemory(@szFaceName, PWideChar(fn), SizeOf(szFaceName));
    //MoveMemory(POINTER(szFaceName[0]), PWideChar(fn), SizeOf(szFaceName));
    //StrPLCopy(szFaceName, PWideChar(fn), SizeOf(szFaceName));
    //StrPLCopy(szFaceName, Font.Name, SizeOf(szFaceName));

    if (Font.Color = clWindowText) or (Font.Color = clDefault) then
      dwEffects := CFE_AUTOCOLOR
    else crTextColor := ColorToRGB(Font.Color);
{$IFNDEF VER90}
    dwMask := dwMask or CFM_CHARSET;
    bCharSet := Font.Charset;
{$ENDIF}

    if GetObject(Font.Handle, SizeOf(LogFont), @LogFont) <> 0 then begin
      dwMask := dwMask or DWORD(CFM_WEIGHT);
      wWeight := Word(LogFont.lfWeight);
    end;

  end;
  SetAttributes(Format);
end;

procedure TRxTextAttributes.Assign(Source: TPersistent);
var
  Format: TCharFormat2W;
begin
  if Source is TFont then AssignFont(TFont(Source))
  else if Source is TTextAttributes then begin
    Name := TTextAttributes(Source).Name;
{$IFDEF RX_D3}
    Charset := TTextAttributes(Source).Charset;
{$ENDIF}
    Style := TTextAttributes(Source).Style;
    Pitch := TTextAttributes(Source).Pitch;
    Color := TTextAttributes(Source).Color;
  end
  else if Source is TRxTextAttributes then begin
    TRxTextAttributes(Source).GetAttributes(Format);
    SetAttributes(Format);
  end
  else inherited Assign(Source);
end;

procedure TRxTextAttributes.AssignTo(Dest: TPersistent);
begin
  if Dest is TFont then begin
    TFont(Dest).Color := Color;
    TFont(Dest).Name := Name;
{$IFNDEF VER90}
    TFont(Dest).Charset := Charset;
{$ENDIF}
    TFont(Dest).Style := Style;
    TFont(Dest).Size := Size;
    TFont(Dest).Pitch := Pitch;
  end
  else if Dest is TTextAttributes then begin
    TTextAttributes(Dest).Color := Color;
    TTextAttributes(Dest).Name := Name;
{$IFDEF RX_D3}
    TTextAttributes(Dest).Charset := Charset;
{$ENDIF}
    TTextAttributes(Dest).Style := Style;
    TTextAttributes(Dest).Pitch := Pitch;
  end
  else inherited AssignTo(Dest);
end;

{ TRxParaAttributes }

constructor TRxParaAttributes.Create(AOwner: TRxCustomRichEdit);
begin
  inherited Create;
  RichEdit := AOwner;
end;

procedure TRxParaAttributes.InitPara(var Paragraph: TParaFormat2);
begin
  FillChar(Paragraph, SizeOf(Paragraph), 0);
  if RichEditVersion >= 2 then
    Paragraph.cbSize := SizeOf(Paragraph)
  else
    Paragraph.cbSize := SizeOf(TParaFormat);
end;

procedure TRxParaAttributes.GetAttributes(var Paragraph: TParaFormat2);
begin
  InitPara(Paragraph);
  if RichEdit.HandleAllocated then
    SendMessage(RichEdit.Handle, EM_GETPARAFORMAT, 0, LPARAM(@Paragraph));
end;

procedure TRxParaAttributes.SetAttributes(var Paragraph: TParaFormat2);
begin
{$IFDEF RX_D4}
  RichEdit.HandleNeeded; { we REALLY need the handle for BiDi }
{$ENDIF}
  if RichEdit.HandleAllocated then begin
{$IFDEF RX_D4}
    if RichEdit.UseRightToLeftAlignment then
      if Paragraph.wAlignment = PFA_LEFT then
        Paragraph.wAlignment := PFA_RIGHT
      else if Paragraph.wAlignment = PFA_RIGHT then
        Paragraph.wAlignment := PFA_LEFT;
{$ENDIF}
    SendMessage(RichEdit.Handle, EM_SETPARAFORMAT, 0, LPARAM(@Paragraph));
  end;
end;

function TRxParaAttributes.GetAlignment: TParaAlignment;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := TParaAlignment(Paragraph.wAlignment - 1);
end;

procedure TRxParaAttributes.SetAlignment(Value: TParaAlignment);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_ALIGNMENT;
    wAlignment := Ord(Value) + 1;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetNumbering: TRxNumbering;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := TRxNumbering(Paragraph.wNumbering);
  if RichEditVersion = 1 then
    if Result <> nsNone then Result := nsBullet;
end;

procedure TRxParaAttributes.SetNumbering(Value: TRxNumbering);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion = 1 then
    if Value <> nsNone then Value := TRxNumbering(PFN_BULLET);
  case Value of
    nsNone: LeftIndent := 0;
    else if LeftIndent < 10 then LeftIndent := 10;
  end;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_NUMBERING;
    wNumbering := Ord(Value);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetNumberingStyle: TRxNumberingStyle;
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    Result := nsSimple
  else begin
    GetAttributes(Paragraph);
    Result := TRxNumberingStyle(Paragraph.wNumberingStyle);
  end;
end;

procedure TRxParaAttributes.SetNumberingStyle(Value: TRxNumberingStyle);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_NUMBERINGSTYLE;
    wNumberingStyle := Ord(Value);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetNumberingTab: Word;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.wNumberingTab div 20;
end;

procedure TRxParaAttributes.SetNumberingTab(Value: Word);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_NUMBERINGTAB;
    wNumberingTab := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetNumberingStart: Word;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.wNumberingStart;
end;

procedure TRxParaAttributes.SetNumberingStart(Value: Word);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do
    begin
      dwMask := PFM_NUMBERINGSTART;
      wNumberingStart := Value;
    end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetHeadingStyle: THeadingStyle;
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 3 then Result := 0
  else begin
    GetAttributes(Paragraph);
    Result := Paragraph.sStyle;
  end;
end;

procedure TRxParaAttributes.SetHeadingStyle(Value: THeadingStyle);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 3 then Exit;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_STYLE;
    sStyle := Value;
  end;
  SetAttributes(Paragraph);
end;

(*
function TRxParaAttributes.GetFirstIndent: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dxStartIndent div 20;
end;

procedure TRxParaAttributes.SetFirstIndent(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_STARTINDENT;
    dxStartIndent := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetLeftIndent: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dxOffset div 20;
end;

procedure TRxParaAttributes.SetLeftIndent(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_OFFSET;
    dxOffset := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetRightIndent: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dxRightIndent div 20;
end;

procedure TRxParaAttributes.SetRightIndent(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_RIGHTINDENT;
    dxRightIndent := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetSpaceAfter: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dySpaceAfter div 20;
end;

procedure TRxParaAttributes.SetSpaceAfter(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_SPACEAFTER;
    dySpaceAfter := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetSpaceBefore: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dySpaceBefore div 20;
end;

procedure TRxParaAttributes.SetSpaceBefore(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_SPACEBEFORE;
    dySpaceBefore := Value * 20;
  end;
  SetAttributes(Paragraph);
end;
function TRxParaAttributes.GetLineSpacing: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dyLineSpacing div 20;
end;

procedure TRxParaAttributes.SetLineSpacing(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  GetAttributes(Paragraph);
  with Paragraph do begin
    dwMask := PFM_LINESPACING;
    dyLineSpacing := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetLineSpacingRule: TLineSpacingRule;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := TLineSpacingRule(Paragraph.bLineSpacingRule);
end;

procedure TRxParaAttributes.SetLineSpacingRule(Value: TLineSpacingRule);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  GetAttributes(Paragraph);
  with Paragraph do begin
    dwMask := PFM_LINESPACING;
    bLineSpacingRule := Ord(Value);
  end;
  SetAttributes(Paragraph);
end;
*)

function TRxParaAttributes.GetFirstIndent: Double;
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    begin
      Result:= TRichEdit(RichEdit).Paragraph.FirstIndent;
      Exit;
    end;
  GetAttributes(Paragraph);
  Result := Paragraph.dxStartIndent/20;
end;

procedure TRxParaAttributes.SetFirstIndent(Value: Double);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    begin
      TRichEdit(RichEdit).Paragraph.FirstIndent:= Round(Value);
      Exit;
    end;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_STARTINDENT;
    dxStartIndent := Round(Value * 20);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetLeftIndent: Double;
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    begin
      Result:= TRichEdit(RichEdit).Paragraph.LeftIndent;
      Exit;
    end;
  GetAttributes(Paragraph);
  Result := Paragraph.dxOffset/20;
end;

procedure TRxParaAttributes.SetLeftIndent(Value: Double);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    begin
      TRichEdit(RichEdit).Paragraph.LeftIndent:= Round(Value);
      Exit;
    end;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_OFFSET;
    dxOffset := Round(Value * 20);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetRightIndent: Double;
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    begin
      Result:= TRichEdit(RichEdit).Paragraph.RightIndent;
      Exit;
    end;
  GetAttributes(Paragraph);
  Result := Paragraph.dxRightIndent/20;
end;

procedure TRxParaAttributes.SetRightIndent(Value: Double);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then
    begin
      TRichEdit(RichEdit).Paragraph.RightIndent:= Round(Value);
      Exit;
    end;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_RIGHTINDENT;
    dxRightIndent := Round(Value * 20);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetSpaceBefore: Double;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dySpaceBefore/20;
end;

procedure TRxParaAttributes.SetSpaceBefore(Value: Double);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_SPACEBEFORE;
    dySpaceBefore := Round(Value*20);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetSpaceAfter: Double;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dySpaceAfter/20;
end;

procedure TRxParaAttributes.SetSpaceAfter(Value: Double);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_SPACEAFTER;
    dySpaceAfter := Round(Value*20);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetLineSpacing: Double;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dyLineSpacing/20;
end;

function TRxParaAttributes.GetLineSpacingRule: TLineSpacingRule;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := TLineSpacingRule(Paragraph.bLineSpacingRule);
end;

procedure TRxParaAttributes.SetLineSpacing(Rule: TLineSpacingRule; Value: Double);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_LINESPACING;
    bLineSpacingRule:= Ord(Rule);
    dyLineSpacing := Round(Value*20);
  end;
  SetAttributes(Paragraph);
end;

function TRxParaAttributes.GetTab(Index: Byte): Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.rgxTabs[Index] div 20;
end;

procedure TRxParaAttributes.SetTab(Index: Byte; Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  with Paragraph do
  begin
    rgxTabs[Index] := Value * 20;
    dwMask := PFM_TABSTOPS;
    if cTabCount < Index then cTabCount := Index;
    SetAttributes(Paragraph);
  end;
end;

function TRxParaAttributes.GetTabCount: Integer;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.cTabCount;
end;

procedure TRxParaAttributes.SetTabCount(Value: Integer);
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_TABSTOPS;
    cTabCount := Value;
    SetAttributes(Paragraph);
  end;
end;

function TRxParaAttributes.GetTableStyle: TParaTableStyle;
var
  Paragraph: TParaFormat2;
begin
  Result := tsNone;
  if RichEditVersion < 2 then Exit;
  GetAttributes(Paragraph);
  with Paragraph do begin
    if (wReserved and PFE_TABLEROW) <> 0 then
      Result := tsTableRow
    else if (wReserved and PFE_TABLECELLEND) <> 0 then
      Result := tsTableCellEnd
    else if (wReserved and PFE_TABLECELL) <> 0 then
      Result := tsTableCell;
  end;
end;

procedure TRxParaAttributes.SetTableStyle(Value: TParaTableStyle);
var
  Paragraph: TParaFormat2;
begin
  if RichEditVersion < 2 then Exit;
  InitPara(Paragraph);
  with Paragraph do begin
    dwMask := PFM_TABLE;
    case Value of
      tsTableRow: wReserved := PFE_TABLEROW;
      tsTableCellEnd: wReserved := PFE_TABLECELLEND;
      tsTableCell: wReserved := PFE_TABLECELL;
    end;
  end;
  SetAttributes(Paragraph);
end;

(*
procedure TRxParaAttributes.AssignTo(Dest: TPersistent);
var
  I: Integer;
begin
  if Dest is TParaAttributes then begin
    with TParaAttributes(Dest) do begin
      if Self.Alignment = paJustify then Alignment := taLeftJustify
      else Alignment := TAlignment(Self.Alignment);
      FirstIndent := Self.FirstIndent;
      LeftIndent := Self.LeftIndent;
      RightIndent := Self.RightIndent;
      if Self.Numbering <> nsNone then
        Numbering := TNumberingStyle(nsBullet)
      else Numbering := TNumberingStyle(nsNone);
      for I := 0 to MAX_TAB_STOPS - 1 do
        Tab[I] := Self.Tab[I];
    end;
  end
  else inherited AssignTo(Dest);
end;

procedure TRxParaAttributes.Assign(Source: TPersistent);
var
  I: Integer;
  Paragraph: TParaFormat2;
begin
  if Source is TParaAttributes then begin
    Alignment := TParaAlignment(TParaAttributes(Source).Alignment);
    FirstIndent := TParaAttributes(Source).FirstIndent;
    LeftIndent := TParaAttributes(Source).LeftIndent;
    RightIndent := TParaAttributes(Source).RightIndent;
    Numbering := TRxNumbering(TParaAttributes(Source).Numbering);
    for I := 0 to MAX_TAB_STOPS - 1 do
      Tab[I] := TParaAttributes(Source).Tab[I];
  end
  else if Source is TRxParaAttributes then begin
    TRxParaAttributes(Source).GetAttributes(Paragraph);
    SetAttributes(Paragraph);
  end
  else inherited Assign(Source);
end;
*)
//-----------------------------------------------------------------------------
{ OLE utility routines }

function WStrLen(Str: PWideChar): Integer;
begin
  Result := 0;
  while Str[Result] <> #0 do Inc(Result);
end;

procedure ReleaseObject(var Obj);
begin
  if IUnknown(Obj) <> nil then begin
{$IFNDEF RX_D3}
    IUnknown(Obj).Release; //????????????????
{$ENDIF}
    IUnknown(Obj) := nil;
  end;
end;

procedure CreateStorage(var Storage: IStorage);
var
  LockBytes: ILockBytes;
begin
  OleCheck(CreateILockBytesOnHGlobal(0, True, LockBytes));
  try
    OleCheck(StgCreateDocfileOnILockBytes(LockBytes, STGM_READWRITE
      or STGM_SHARE_EXCLUSIVE or STGM_CREATE, 0, Storage));
  finally
    ReleaseObject(LockBytes);
  end;
end;

procedure DestroyMetaPict(MetaPict: HGlobal);
begin
  if MetaPict <> 0 then begin
    DeleteMetaFile(PMetaFilePict(GlobalLock(MetaPict))^.hMF);
    GlobalUnlock(MetaPict);
    GlobalFree(MetaPict);
  end;
end;

function OleSetDrawAspect(OleObject: IOleObject; Iconic: Boolean;
  IconMetaPict: HGlobal; var DrawAspect: Longint): HResult;
var
  OleCache: IOleCache;
  EnumStatData: IEnumStatData;
  OldAspect, AdviseFlags, Connection: Longint;
  TempMetaPict: HGlobal;
  FormatEtc: TFormatEtc;
  Medium: TStgMedium;
  ClassID: TCLSID;
  StatData: TStatData;
begin
  Result := S_OK;
  OldAspect := DrawAspect;
  if Iconic then begin
    DrawAspect := DVASPECT_ICON;
    AdviseFlags := ADVF_NODATA;
  end
  else begin
    DrawAspect := DVASPECT_CONTENT;
    AdviseFlags := ADVF_PRIMEFIRST;
  end;
  if (DrawAspect <> OldAspect) or (DrawAspect = DVASPECT_ICON) then begin
{$IFDEF RX_D3}
    Result := OleObject.QueryInterface(IOleCache, OleCache);
{$ELSE}
    Result := OleObject.QueryInterface(IID_IOleCache, OleCache);
{$ENDIF}
    if Succeeded(Result) then
    try
      if DrawAspect <> OldAspect then begin
        { Setup new cache with the new aspect }
        FillChar(FormatEtc, SizeOf(FormatEtc), 0);
        FormatEtc.dwAspect := DrawAspect;
        FormatEtc.lIndex := -1;
        Result := OleCache.Cache(FormatEtc, AdviseFlags, Connection);
      end;
      if Succeeded(Result) and (DrawAspect = DVASPECT_ICON) then begin
        TempMetaPict := 0;
        if IconMetaPict = 0 then begin
          if Succeeded(OleObject.GetUserClassID(ClassID)) then begin
            TempMetaPict := OleGetIconOfClass(ClassID, nil, True);
            IconMetaPict := TempMetaPict;
          end;
        end;
        try
          FormatEtc.cfFormat := CF_METAFILEPICT;
          FormatEtc.ptd := nil;
          FormatEtc.dwAspect := DVASPECT_ICON;
          FormatEtc.lIndex := -1;
          FormatEtc.tymed := TYMED_MFPICT;
          Medium.tymed := TYMED_MFPICT;
          Medium.hMetaFilePict := IconMetaPict;
          Medium.unkForRelease := nil;
          Result := OleCache.SetData(FormatEtc, Medium, False);
        finally
          DestroyMetaPict(TempMetaPict);
        end;
      end;
      if Succeeded(Result) and (DrawAspect <> OldAspect) then begin
        { remove any existing caches that are set up for the old display aspect }
        OleCache.EnumCache(EnumStatData);
        if EnumStatData <> nil then
        try
          while EnumStatData.Next(1, StatData, nil) = 0 do
            if StatData.formatetc.dwAspect = OldAspect then
              OleCache.Uncache(StatData.dwConnection);
        finally
          ReleaseObject(EnumStatData);
        end;
      end;
    finally
      ReleaseObject(OleCache);
    end;
    if Succeeded(Result) and (DrawAspect <> DVASPECT_ICON) then
      OleObject.Update;
  end;
end;

function GetIconMetaPict(OleObject: IOleObject; DrawAspect: Longint): HGlobal;
var
  DataObject: IDataObject;
  FormatEtc: TFormatEtc;
  Medium: TStgMedium;
  ClassID: TCLSID;
begin
  Result := 0;
  if DrawAspect = DVASPECT_ICON then begin
{$IFDEF RX_D3}
    OleObject.QueryInterface(IDataObject, DataObject);
{$ELSE}
    OleObject.QueryInterface(IID_IDataObject, DataObject);
{$ENDIF}
    if DataObject <> nil then begin
      FormatEtc.cfFormat := CF_METAFILEPICT;
      FormatEtc.ptd := nil;
      FormatEtc.dwAspect := DVASPECT_ICON;
      FormatEtc.lIndex := -1;
      FormatEtc.tymed := TYMED_MFPICT;
      if Succeeded(DataObject.GetData(FormatEtc, Medium)) then
        Result := Medium.hMetaFilePict;
      ReleaseObject(DataObject);
    end;
  end;
  if Result = 0 then begin
    OleCheck(OleObject.GetUserClassID(ClassID));
    Result := OleGetIconOfClass(ClassID, nil, True);
  end;
end;

{ Return the first piece of a moniker }

function OleStdGetFirstMoniker(Moniker: IMoniker): IMoniker;
var
  Mksys: Longint;
  EnumMoniker: IEnumMoniker;
begin
  Result := nil;
  if Moniker <> nil then begin
    if (Moniker.IsSystemMoniker(Mksys) = 0) and
      (Mksys = MKSYS_GENERICCOMPOSITE) then
    begin
      if Moniker.Enum(True, EnumMoniker) <> 0 then Exit;
      EnumMoniker.Next(1, Result, nil);
      ReleaseObject(EnumMoniker);
    end
    else begin
{$IFNDEF RX_D3}
      Moniker.AddRef;
{$ENDIF}
      Result := Moniker;
    end;
  end;
end;

{ Return length of file moniker piece of the given moniker }

function OleStdGetLenFilePrefixOfMoniker(Moniker: IMoniker): Integer;
var
  MkFirst: IMoniker;
  BindCtx: IBindCtx;
  Mksys: Longint;
  P: PWideChar;
begin
  Result := 0;
  if Moniker <> nil then begin
    MkFirst := OleStdGetFirstMoniker(Moniker);
    if MkFirst <> nil then begin
      if (MkFirst.IsSystemMoniker(Mksys) = 0) and
        (Mksys = MKSYS_FILEMONIKER) then
      begin
        if CreateBindCtx(0, BindCtx) = 0 then begin
          if (MkFirst.GetDisplayName(BindCtx, nil, P) = 0) and (P <> nil) then
          begin
            Result := WStrLen(P);
            CoTaskMemFree(P);
          end;
          ReleaseObject(BindCtx);
        end;
      end;
      ReleaseObject(MkFirst);
    end;
  end;
end;

function CoAllocCStr(const S: string): PChar;
begin
  Result := StrCopy(CoTaskMemAlloc(Length(S) + 1), PChar(S));
end;

function WStrToString(P: PWideChar): string;
begin
  Result := '';
  if P <> nil then begin
    Result := WideCharToString(P);
    CoTaskMemFree(P);
  end;
end;

function GetFullNameStr(OleObject: IOleObject): string;
var
  P: PWideChar;
begin
  OleObject.GetUserType(USERCLASSTYPE_FULL, P);
  Result := WStrToString(P);
end;

function GetShortNameStr(OleObject: IOleObject): string;
var
  P: PWideChar;
begin
  OleObject.GetUserType(USERCLASSTYPE_SHORT, P);
  Result := WStrToString(P);
end;

function GetDisplayNameStr(OleLink: IOleLink): string;
var
  P: PWideChar;
begin
  OleLink.GetSourceDisplayName(P);
  Result := WStrToString(P);
end;

{$IFDEF RX_D3}
function GetVCLFrameForm(Form: TCustomForm): IVCLFrameForm;
begin
  if Form.OleFormObject = nil then TOleForm.Create(Form);
  Result := Form.OleFormObject as IVCLFrameForm;
end;

function IsFormMDIChild(Form: TCustomForm): Boolean;
begin
  Result := (Form is TForm) and (TForm(Form).FormStyle = fsMDIChild);
end;
{$ENDIF}

//-----------------------------------------------------------------------------
{ Clipboard formats }

var
  CFEmbeddedObject: Integer;
  CFLinkSource: Integer;
  CFRtf: Integer;
  CFRtfNoObjs: Integer;

const
{$IFNDEF RX_D3}
  CF_RTFNOOBJS = 'Rich Text Format Without Objects';
{$ENDIF}
  CF_EMBEDDEDOBJECT = 'Embedded Object';
  CF_LINKSOURCE = 'Link Source';

{************************************************************************}

{ OLE Extensions to the Rich Text Editor }
{ Converted from RICHOLE.H               }

{ Structure passed to GetObject and InsertObject }

type
  _ReObject = record
    cbStruct: DWORD;           { Size of structure                }
    cp: ULONG;                 { Character position of object     }
    clsid: TCLSID;             { Class ID of object               }
    poleobj: IOleObject;       { OLE object interface             }
    pstg: IStorage;            { Associated storage interface     }
    polesite: IOleClientSite;  { Associated client site interface }
    sizel: TSize;              { Size of object (may be 0,0)      }
    dvAspect: Longint;         { Display aspect to use            }
    dwFlags: DWORD;            { Object status flags              }
    dwUser: DWORD;             { Dword for user's use             }
  end;
  TReObject = _ReObject;

const

{ Flags to specify which interfaces should be returned in the structure above }

  REO_GETOBJ_NO_INTERFACES   =  $00000000;
  REO_GETOBJ_POLEOBJ         =  $00000001;
  REO_GETOBJ_PSTG            =  $00000002;
  REO_GETOBJ_POLESITE        =  $00000004;
  REO_GETOBJ_ALL_INTERFACES  =  $00000007;

{ Place object at selection }

  REO_CP_SELECTION    = ULONG(-1);

{ Use character position to specify object instead of index }

  REO_IOB_SELECTION   = ULONG(-1);
  REO_IOB_USE_CP      = ULONG(-2);

{ Object flags }

  REO_NULL            = $00000000;  { No flags                         }
  REO_READWRITEMASK   = $0000003F;  { Mask out RO bits                 }
  REO_DONTNEEDPALETTE = $00000020;  { Object doesn't need palette      }
  REO_BLANK           = $00000010;  { Object is blank                  }
  REO_DYNAMICSIZE     = $00000008;  { Object defines size always       }
  REO_INVERTEDSELECT  = $00000004;  { Object drawn all inverted if sel }
  REO_BELOWBASELINE   = $00000002;  { Object sits below the baseline   }
  REO_RESIZABLE       = $00000001;  { Object may be resized            }
  REO_LINK            = $80000000;  { Object is a link (RO)            }
  REO_STATIC          = $40000000;  { Object is static (RO)            }
  REO_SELECTED        = $08000000;  { Object selected (RO)             }
  REO_OPEN            = $04000000;  { Object open in its server (RO)   }
  REO_INPLACEACTIVE   = $02000000;  { Object in place active (RO)      }
  REO_HILITED         = $01000000;  { Object is to be hilited (RO)     }
  REO_LINKAVAILABLE   = $00800000;  { Link believed available (RO)     }
  REO_GETMETAFILE     = $00400000;  { Object requires metafile (RO)    }

{ Flags for IRichEditOle.GetClipboardData,   }
{ IRichEditOleCallback.GetClipboardData and  }
{ IRichEditOleCallback.QueryAcceptData       }

  RECO_PASTE          = $00000000;  { paste from clipboard  }
  RECO_DROP           = $00000001;  { drop                  }
  RECO_COPY           = $00000002;  { copy to the clipboard }
  RECO_CUT            = $00000003;  { cut to the clipboard  }
  RECO_DRAG           = $00000004;  { drag                  }

//-----------------------------------------------------------------------------
{ RichEdit GUIDs }
(*
  IID_IRichEditOle: TGUID = (
    D1:$00020D00;D2:$0000;D3:$0000;D4:($C0,$00,$00,$00,$00,$00,$00,$46));
  IID_IRichEditOleCallback: TGUID = (
    D1:$00020D03;D2:$0000;D3:$0000;D4:($C0,$00,$00,$00,$00,$00,$00,$46));
*)

type

{
 *  IRichEditOle
 *
 *  Purpose:
 *    Interface used by the client of RichEdit to perform OLE-related
 *    operations.
 *
 *    The methods herein may just want to be regular Windows messages.
}

{$IFDEF RX_D3}
  IRichEditOle = interface(IUnknown)
    ['{00020d00-0000-0000-c000-000000000046}']
    function GetClientSite(out clientSite: IOleClientSite): HResult; stdcall;
    function GetObjectCount: HResult; stdcall;
    function GetLinkCount: HResult; stdcall;
    function GetObject(iob: Longint; out reobject: TReObject;
      dwFlags: DWORD): HResult; stdcall;
    function InsertObject(var reobject: TReObject): HResult; stdcall;
    function ConvertObject(iob: Longint; rclsidNew: TIID;
      lpstrUserTypeNew: LPCSTR): HResult; stdcall;
    function ActivateAs(rclsid: TIID; rclsidAs: TIID): HResult; stdcall;
    function SetHostNames(lpstrContainerApp: LPCSTR;
      lpstrContainerObj: LPCSTR): HResult; stdcall;
    function SetLinkAvailable(iob: Longint; fAvailable: BOOL): HResult; stdcall;
    function SetDvaspect(iob: Longint; dvaspect: DWORD): HResult; stdcall;
    function HandsOffStorage(iob: Longint): HResult; stdcall;
    function SaveCompleted(iob: Longint; const stg: IStorage): HResult; stdcall;
    function InPlaceDeactivate: HResult; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; stdcall;
    function GetClipboardData(var chrg: TCharRange; reco: DWORD;
      out dataobj: IDataObject): HResult; stdcall;
    function ImportDataObject(dataobj: IDataObject; cf: TClipFormat;
      hMetaPict: HGLOBAL): HResult; stdcall;
  end;

{$ELSE}
  IRichEditOle = class(IUnknown)
    function GetClientSite(var clientSite: IOleClientSite): HResult; virtual; stdcall; abstract;
    function GetObjectCount: HResult; virtual; stdcall; abstract;
    function GetLinkCount: HResult; virtual; stdcall; abstract;
    function GetObject(iob: Longint; var reobject: TReObject;
      dwFlags: DWORD): HResult; virtual; stdcall; abstract;
    function InsertObject(var reobject: TReObject): HResult; virtual; stdcall; abstract;
    function ConvertObject(iob: Longint; rclsidNew: TIID;
      lpstrUserTypeNew: LPCSTR): HResult; virtual; stdcall; abstract;
    function ActivateAs(rclsid: TIID; rclsidAs: TIID): HResult; virtual; stdcall; abstract;
    function SetHostNames(lpstrContainerApp: LPCSTR;
      lpstrContainerObj: LPCSTR): HResult; virtual; stdcall; abstract;
    function SetLinkAvailable(iob: Longint; fAvailable: BOOL): HResult; virtual; stdcall; abstract;
    function SetDvaspect(iob: Longint; dvaspect: DWORD): HResult; virtual; stdcall; abstract;
    function HandsOffStorage(iob: Longint): HResult; virtual; stdcall; abstract;
    function SaveCompleted(iob: Longint; const stg: IStorage): HResult; virtual; stdcall; abstract;
    function InPlaceDeactivate: HResult; virtual; stdcall; abstract;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; virtual; stdcall; abstract;
    function GetClipboardData(var chrg: TCharRange; reco: DWORD;
      var dataobj: IDataObject): HResult; virtual; stdcall; abstract;
    function ImportDataObject(dataobj: IDataObject; cf: TClipFormat;
      hMetaPict: HGLOBAL): HResult; virtual; stdcall; abstract;
  end;
{$ENDIF}


//-----------------------------------------------------------------------------
{
 *  IRichEditOleCallback
 *
 *  Purpose:
 *    Interface used by the RichEdit to get OLE-related stuff from the
 *    application using RichEdit.
}

{$IFDEF RX_D3}
  IRichEditOleCallback = interface(IUnknown)
    ['{00020d03-0000-0000-c000-000000000046}']
    function GetNewStorage(out stg: IStorage): HResult; stdcall;
    function GetInPlaceContext(out Frame: IOleInPlaceFrame;
      out Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HResult; stdcall;
    function ShowContainerUI(fShow: BOOL): HResult; stdcall;
    function QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
      cp: Longint): HResult; stdcall;
    function DeleteObject(const oleobj: IOleObject): HResult; stdcall;
    function QueryAcceptData(const dataobj: IDataObject;
      var cfFormat: TClipFormat; reco: DWORD; fReally: BOOL;
      hMetaPict: HGLOBAL): HResult; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; stdcall;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
      out dataobj: IDataObject): HResult; stdcall;
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
      var dwEffect: DWORD): HResult; stdcall;
    function GetContextMenu(seltype: Word; const oleobj: IOleObject;
      const chrg: TCharRange; out menu: HMENU): HResult; stdcall;
  end;

{$ELSE}
  IRichEditOleCallback = class(IUnknown)
    function GetNewStorage(var stg: IStorage): HResult; virtual; stdcall; abstract;
    function GetInPlaceContext(var Frame: IOleInPlaceFrame;
      var Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HResult; virtual; stdcall; abstract;
    function ShowContainerUI(fShow: BOOL): HResult; virtual; stdcall; abstract;
    function QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
      cp: Longint): HResult; virtual; stdcall; abstract;
    function DeleteObject(const oleobj: IOleObject): HResult; virtual; stdcall; abstract;
    function QueryAcceptData(const dataobj: IDataObject;
      var cfFormat: TClipFormat; reco: DWORD; fReally: BOOL;
      hMetaPict: HGLOBAL): HResult; virtual; stdcall; abstract;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; virtual; stdcall; abstract;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
      var dataobj: IDataObject): HResult; virtual; stdcall; abstract;
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
      var dwEffect: DWORD): HResult; virtual; stdcall; abstract;
    function GetContextMenu(seltype: Word; const oleobj: IOleObject;
      const chrg: TCharRange; var menu: HMENU): HResult; virtual; stdcall; abstract;
  end;
{$ENDIF}


//-----------------------------------------------------------------------------
{ TRichEditOleCallback }

type
{$IFDEF RX_D3}
  TRichEditOleCallback = class(TObject, IUnknown, IRichEditOleCallback)
  private
    FDocForm: IVCLFrameForm;
    FFrameForm: IVCLFrameForm;
    FAccelTable: HAccel;
    FAccelCount: Integer;
{$IFDEF RX_D4}
    FAutoScroll: Boolean;
{$ENDIF}
    procedure CreateAccelTable;
    procedure DestroyAccelTable;
    procedure AssignFrame;
{$ELSE}
  TRichEditOleCallback = class(IRichEditOleCallback)
{$ENDIF}
  private
    FRefCount: Longint;
    FRichEdit: TRxCustomRichEdit;
  public
    constructor Create(RichEdit: TRxCustomRichEdit);
    destructor Destroy; override;
{$IFDEF RX_D3}
    function QueryInterface(const iid: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Longint; stdcall;
    function _Release: Longint; stdcall;
    function GetNewStorage(out stg: IStorage): HResult; stdcall;
    function GetInPlaceContext(out Frame: IOleInPlaceFrame;
      out Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HResult; stdcall;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
      out dataobj: IDataObject): HResult; stdcall;
    function GetContextMenu(seltype: Word; const oleobj: IOleObject;
      const chrg: TCharRange; out menu: HMENU): HResult; stdcall;
{$ELSE}
    function QueryInterface(const iid: TIID; var Obj): HResult; override;
    function AddRef: Longint; override;
    function Release: Longint; override;
    function GetNewStorage(var stg: IStorage): HResult; override;
    function GetInPlaceContext(var Frame: IOleInPlaceFrame;
      var Doc: IOleInPlaceUIWindow;
      lpFrameInfo: POleInPlaceFrameInfo): HResult; override;
    function GetClipboardData(const chrg: TCharRange; reco: DWORD;
      var dataobj: IDataObject): HResult; override;
    function GetContextMenu(seltype: Word; const oleobj: IOleObject;
      const chrg: TCharRange; var menu: HMENU): HResult; override;
{$ENDIF}
    function ShowContainerUI(fShow: BOOL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
      cp: Longint): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function DeleteObject(const oleobj: IOleObject): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function QueryAcceptData(const dataobj: IDataObject; var cfFormat: TClipFormat;
      reco: DWORD; fReally: BOOL; hMetaPict: HGLOBAL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
      var dwEffect: DWORD): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
  end;

constructor TRichEditOleCallback.Create(RichEdit: TRxCustomRichEdit);
begin
  inherited Create;
  FRichEdit := RichEdit;
end;

destructor TRichEditOleCallback.Destroy;
begin
{$IFDEF RX_D3}
  DestroyAccelTable;
  FFrameForm := nil;
  FDocForm := nil;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF RX_D3}

function TRichEditOleCallback.QueryInterface(const iid: TGUID; out Obj): HResult;
begin
  if GetInterface(iid, Obj) then Result := S_OK
  else Result := E_NOINTERFACE;
end;

function TRichEditOleCallback._AddRef: Longint;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TRichEditOleCallback._Release: Longint;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

procedure TRichEditOleCallback.CreateAccelTable;
var
  Menu: TMainMenu;
begin
  if (FAccelTable = 0) and Assigned(FFrameForm) then begin
    Menu := FFrameForm.Form.Menu;
    if Menu <> nil then
      Menu.GetOle2AcceleratorTable(FAccelTable, FAccelCount, [0, 2, 4]);
  end;
end;

procedure TRichEditOleCallback.DestroyAccelTable;
begin
  if FAccelTable <> 0 then begin
    DestroyAcceleratorTable(FAccelTable);
    FAccelTable := 0;
    FAccelCount := 0;
  end;
end;

procedure TRichEditOleCallback.AssignFrame;
begin
  if (GetParentForm(FRichEdit) <> nil) and not Assigned(FFrameForm) and
    FRichEdit.AllowInPlace then
  begin
    FDocForm := GetVCLFrameForm(ValidParentForm(FRichEdit));
    FFrameForm := FDocForm;
    if IsFormMDIChild(FDocForm.Form) then
      FFrameForm := GetVCLFrameForm(Application.MainForm);
  end;
end;

{$ELSE}

function TRichEditOleCallback.QueryInterface(const iid: TIID; var Obj): HResult;
begin
  if IsEqualIID(iid, IID_IUnknown) or
    IsEqualIID(iid, IID_IRichEditOleCallback) then
  begin
    Pointer(Obj) := Self;
    AddRef;
    Result := S_OK;
  end else begin
    Pointer(Obj) := nil;
    Result := E_NOINTERFACE;
  end;
end;

function TRichEditOleCallback.AddRef: Longint;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TRichEditOleCallback.Release: Longint;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

{$ENDIF RX_D3}

function TRichEditOleCallback.GetNewStorage(
  {$IFDEF RX_D3} out {$ELSE} var {$ENDIF} stg: IStorage): HResult;
begin
  try
    CreateStorage(stg);
    Result := S_OK;
  except
    Result:= E_OUTOFMEMORY;
  end;
end;

function TRichEditOleCallback.GetInPlaceContext(
  {$IFDEF RX_D3} out {$ELSE} var {$ENDIF} Frame: IOleInPlaceFrame;
  {$IFDEF RX_D3} out {$ELSE} var {$ENDIF} Doc: IOleInPlaceUIWindow;
  lpFrameInfo: POleInPlaceFrameInfo): HResult;
begin
{$IFDEF RX_D3}
  AssignFrame;
  if Assigned(FFrameForm) and FRichEdit.AllowInPlace then begin
    Frame := FFrameForm;
    Doc := FDocForm;
    CreateAccelTable;
    with lpFrameInfo^ do begin
      fMDIApp := False;
      FFrameForm.GetWindow(hWndFrame);
      hAccel := FAccelTable;
      cAccelEntries := FAccelCount;
    end;
    Result := S_OK;
  end
  else Result := E_NOTIMPL;
{$ELSE}
  Result := E_NOTIMPL;
{$ENDIF}
end;

function TRichEditOleCallback.QueryInsertObject(const clsid: TCLSID; const stg: IStorage;
  cp: Longint): HResult;
begin
  Result := NOERROR;
end;

function TRichEditOleCallback.DeleteObject(const oleobj: IOleObject): HResult;
begin
  if Assigned(oleobj) then oleobj.Close(OLECLOSE_NOSAVE);
  Result := NOERROR;
end;

function TRichEditOleCallback.QueryAcceptData(const dataobj: IDataObject;
  var cfFormat: TClipFormat; reco: DWORD; fReally: BOOL;
  hMetaPict: HGLOBAL): HResult;
begin
  Result := S_OK;
end;

function TRichEditOleCallback.ContextSensitiveHelp(fEnterMode: BOOL): HResult;
begin
  Result := NOERROR;
end;

function TRichEditOleCallback.GetClipboardData(const chrg: TCharRange; reco: DWORD;
  {$IFDEF RX_D3} out {$ELSE} var {$ENDIF} dataobj: IDataObject): HResult;
begin
  Result := E_NOTIMPL;
end;

function TRichEditOleCallback.GetDragDropEffect(fDrag: BOOL; grfKeyState: DWORD;
  var dwEffect: DWORD): HResult;
begin
  Result := E_NOTIMPL;
end;

function TRichEditOleCallback.GetContextMenu(seltype: Word;
  const oleobj: IOleObject; const chrg: TCharRange;
  {$IFDEF RX_D3} out {$ELSE} var {$ENDIF} menu: HMENU): HResult;
begin
  Result := E_NOTIMPL;
end;

function TRichEditOleCallback.ShowContainerUI(fShow: BOOL): HResult;
begin
{$IFDEF RX_D3}
  if not fShow then AssignFrame;
  if Assigned(FFrameForm) then begin
    if fShow then begin
      FFrameForm.SetMenu(0, 0, 0);
      FFrameForm.ClearBorderSpace;
      FRichEdit.SetUIActive(False);
      DestroyAccelTable;
{$IFDEF RX_D4}
      TForm(FFrameForm.Form).AutoScroll := FAutoScroll;
{$ENDIF}
      FFrameForm := nil;
      FDocForm := nil;
    end
    else begin
{$IFDEF RX_D4}
      FAutoScroll := TForm(FFrameForm.Form).AutoScroll;
      TForm(FFrameForm.Form).AutoScroll := False;
{$ENDIF}
      FRichEdit.SetUIActive(True);
    end;
    Result := S_OK;
  end
  else Result := E_NOTIMPL;
{$ELSE}
  Result := E_NOTIMPL;
{$ENDIF}
end;

//-----------------------------------------------------------------------------
{ TOleUIObjInfo - helper interface for Object Properties dialog }

type
{$IFDEF RX_D3}
  TOleUIObjInfo = class(TInterfacedObject, IOleUIObjInfo)
{$ELSE}
  TOleUIObjInfo = class(IOleUIObjInfo)
{$ENDIF}
  private
    FRichEdit: TRxCustomRichEdit;
    FReObject: TReObject;
  public
    constructor Create(RichEdit: TRxCustomRichEdit; ReObject: TReObject);
{$IFNDEF RX_D3}
    function QueryInterface(const iid: TIID; var obj): HResult; override;
    function AddRef: Longint; override;
    function Release: Longint; override;
{$ENDIF}
    function GetObjectInfo(dwObject: Longint;
      var dwObjSize: Longint; var lpszLabel: PChar;
      var lpszType: PChar; var lpszShortType: PChar;
      var lpszLocation: PChar): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function GetConvertInfo(dwObject: Longint; var ClassID: TCLSID;
      var wFormat: Word; var ConvertDefaultClassID: TCLSID;
      var lpClsidExclude: PCLSID; var cClsidExclude: Longint): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function ConvertObject(dwObject: Longint;
      const clsidNew: TCLSID): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function GetViewInfo(dwObject: Longint; var hMetaPict: HGlobal;
      var dvAspect: Longint; var nCurrentScale: Integer): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function SetViewInfo(dwObject: Longint; hMetaPict: HGlobal;
      dvAspect: Longint; nCurrentScale: Integer;
      bRelativeToOrig: BOOL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
  end;

constructor TOleUIObjInfo.Create(RichEdit: TRxCustomRichEdit;
  ReObject: TReObject);
begin
  inherited Create;
  FRichEdit := RichEdit;
  FReObject := ReObject;
end;

{$IFNDEF RX_D3}

function TOleUIObjInfo.QueryInterface(const iid: TIID; var obj): HResult;
begin
  Pointer(obj) := nil;
  Result := E_NOINTERFACE;
end;

function TOleUIObjInfo.AddRef: Longint;
begin
  Result := 0;
end;

function TOleUIObjInfo.Release: Longint;
begin
  Result := 0;
end;

{$ENDIF RX_D3}

function TOleUIObjInfo.GetObjectInfo(dwObject: Longint;
  var dwObjSize: Longint; var lpszLabel: PChar;
  var lpszType: PChar; var lpszShortType: PChar;
  var lpszLocation: PChar): HResult;
begin
  if @dwObjSize <> nil then
    dwObjSize := -1 { Unknown size };
  if @lpszLabel <> nil then
    lpszLabel := CoAllocCStr(GetFullNameStr(FReObject.poleobj));
  if @lpszType <> nil then
    lpszType := CoAllocCStr(GetFullNameStr(FReObject.poleobj));
  if @lpszShortType <> nil then
    lpszShortType := CoAllocCStr(GetShortNameStr(FReObject.poleobj));
  if (@lpszLocation <> nil) then begin
    if Trim(FRichEdit.Title) <> '' then
      lpszLocation := CoAllocCStr(Format('%s - %s',
        [FRichEdit.Title, Application.Title]))
    else
      lpszLocation := CoAllocCStr(Application.Title);
  end;
  Result := S_OK;
end;

function TOleUIObjInfo.GetConvertInfo(dwObject: Longint; var ClassID: TCLSID;
  var wFormat: Word; var ConvertDefaultClassID: TCLSID;
  var lpClsidExclude: PCLSID; var cClsidExclude: Longint): HResult;
begin
  FReObject.poleobj.GetUserClassID(ClassID);
  Result := S_OK;
end;

function TOleUIObjInfo.ConvertObject(dwObject: Longint;
  const clsidNew: TCLSID): HResult;
begin
  Result := E_NOTIMPL;
end;

function TOleUIObjInfo.GetViewInfo(dwObject: Longint; var hMetaPict: HGlobal;
  var dvAspect: Longint; var nCurrentScale: Integer): HResult;
begin
  if @hMetaPict <> nil then
    hMetaPict := GetIconMetaPict(FReObject.poleobj, FReObject.dvAspect);
  if @dvAspect <> nil then dvAspect := FReObject.dvAspect;
  if @nCurrentScale <> nil then nCurrentScale := 0;
  Result := S_OK;
end;

function TOleUIObjInfo.SetViewInfo(dwObject: Longint; hMetaPict: HGlobal;
  dvAspect: Longint; nCurrentScale: Integer;
  bRelativeToOrig: BOOL): HResult;
var
  Iconic: Boolean;
begin
  if Assigned(FRichEdit.FRichEditOle) then begin
    case dvAspect of
      DVASPECT_CONTENT:
        Iconic := False;
      DVASPECT_ICON:
        Iconic := True;
      else
        Iconic := FReObject.dvAspect = DVASPECT_ICON;
    end;
    IRichEditOle(FRichEdit.FRichEditOle).InPlaceDeactivate;
    Result := OleSetDrawAspect(FReObject.poleobj, Iconic, hMetaPict,
      FReObject.dvAspect);
    if Succeeded(Result) then
      IRichEditOle(FRichEdit.FRichEditOle).SetDvaspect(
        Longint(REO_IOB_SELECTION), FReObject.dvAspect);
  end
  else Result := E_NOTIMPL;
end;

//-----------------------------------------------------------------------------
{ TOleUILinkInfo - helper interface for Object Properties dialog }

type
{$IFDEF RX_D3}
  TOleUILinkInfo = class(TInterfacedObject, IOleUILinkInfo)
{$ELSE}
  TOleUILinkInfo = class(IOleUILinkInfo)
{$ENDIF}
  private
    FReObject: TReObject;
    FRichEdit: TRxCustomRichEdit;
    FOleLink: IOleLink;
  public
    constructor Create(RichEdit: TRxCustomRichEdit; ReObject: TReObject);
{$IFNDEF RX_D3}
    destructor Destroy; override;
    function QueryInterface(const iid: TIID; var obj): HResult; override;
    function AddRef: Longint; override;
    function Release: Longint; override;
{$ENDIF}
    function GetNextLink(dwLink: Longint): Longint;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function SetLinkUpdateOptions(dwLink: Longint;
      dwUpdateOpt: Longint): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function GetLinkUpdateOptions(dwLink: Longint;
      var dwUpdateOpt: Longint): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function SetLinkSource(dwLink: Longint; pszDisplayName: PChar;
      lenFileName: Longint; var chEaten: Longint;
      fValidateSource: BOOL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function GetLinkSource(dwLink: Longint; var pszDisplayName: PChar;
      var lenFileName: Longint; var pszFullLinkType: PChar;
      var pszShortLinkType: PChar; var fSourceAvailable: BOOL;
      var fIsSelected: BOOL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function OpenLinkSource(dwLink: Longint): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function UpdateLink(dwLink: Longint; fErrorMessage: BOOL;
      fErrorAction: BOOL): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function CancelLink(dwLink: Longint): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
    function GetLastUpdate(dwLink: Longint;
      var LastUpdate: TFileTime): HResult;
      {$IFDEF RX_D3} stdcall {$ELSE} override {$ENDIF};
  end;

{$IFDEF RX_D3}
procedure LinkError(const Ident: string);
begin
  Application.MessageBox(PChar(Ident), PChar(SLinkProperties),
    MB_OK or MB_ICONSTOP);
end;
{$ELSE}
procedure LinkError(Ident: Integer);
begin
  Application.MessageBox(PChar(LoadStr(Ident)),
    PChar(LoadStr(SLinkProperties)), MB_OK or MB_ICONSTOP);
end;
{$ENDIF}

constructor TOleUILinkInfo.Create(RichEdit: TRxCustomRichEdit;
  ReObject: TReObject);
begin
  inherited Create;
  FReObject := ReObject;
  FRichEdit := RichEdit;
{$IFDEF RX_D3}
  OleCheck(FReObject.poleobj.QueryInterface(IOleLink, FOleLink));
{$ELSE}
  OleCheck(FReObject.poleobj.QueryInterface(IID_IOleLink, FOleLink));
{$ENDIF}
end;

{$IFNDEF RX_D3}

destructor TOleUILinkInfo.Destroy;
begin
  ReleaseObject(FOleLink);
  inherited Destroy;
end;

function TOleUILinkInfo.QueryInterface(const iid: TIID; var obj): HResult;
begin
  Pointer(obj) := nil;
  Result := E_NOINTERFACE;
end;

function TOleUILinkInfo.AddRef: Longint;
begin
  Result := 0;
end;

function TOleUILinkInfo.Release: Longint;
begin
  Result := 0;
end;

{$ENDIF}

function TOleUILinkInfo.GetNextLink(dwLink: Longint): Longint;
begin
  if dwLink = 0 then Result := Longint(FRichEdit)
  else Result := 0;
end;

function TOleUILinkInfo.SetLinkUpdateOptions(dwLink: Longint;
  dwUpdateOpt: Longint): HResult;
begin
  Result := FOleLink.SetUpdateOptions(dwUpdateOpt);
  if Succeeded(Result) then FRichEdit.Modified := True;
end;

function TOleUILinkInfo.GetLinkUpdateOptions(dwLink: Longint;
  var dwUpdateOpt: Longint): HResult;
begin
  Result := FOleLink.GetUpdateOptions(dwUpdateOpt);
end;

function TOleUILinkInfo.SetLinkSource(dwLink: Longint; pszDisplayName: PChar;
  lenFileName: Longint; var chEaten: Longint;
  fValidateSource: BOOL): HResult;
var
  DisplayName: string;
  Buffer: array[0..255] of WideChar;
begin
  Result := E_FAIL;
  if fValidateSource then begin
    DisplayName := pszDisplayName;
    if Succeeded(FOleLink.SetSourceDisplayName(StringToWideChar(DisplayName,
      Buffer, SizeOf(Buffer) div 2))) then
    begin
      chEaten := Length(DisplayName);
      try
        OleCheck(FReObject.poleobj.Update);
      except
        Application.HandleException(FRichEdit);
      end;
      Result := S_OK;
    end;
  end
  else LinkError(SInvalidLinkSource);
end;

function TOleUILinkInfo.GetLinkSource(dwLink: Longint; var pszDisplayName: PChar;
  var lenFileName: Longint; var pszFullLinkType: PChar;
  var pszShortLinkType: PChar; var fSourceAvailable: BOOL;
  var fIsSelected: BOOL): HResult;
var
  Moniker: IMoniker;
begin
  if @pszDisplayName <> nil then
    pszDisplayName := CoAllocCStr(GetDisplayNameStr(FOleLink));
  if @lenFileName <> nil then begin
    lenFileName := 0;
    FOleLink.GetSourceMoniker(Moniker);
    if Moniker <> nil then begin
      lenFileName := OleStdGetLenFilePrefixOfMoniker(Moniker);
      ReleaseObject(Moniker);
    end;
  end;
  if @pszFullLinkType <> nil then
    pszFullLinkType := CoAllocCStr(GetFullNameStr(FReObject.poleobj));
  if @pszShortLinkType <> nil then
    pszShortLinkType := CoAllocCStr(GetShortNameStr(FReObject.poleobj));
  Result := S_OK;
end;

function TOleUILinkInfo.OpenLinkSource(dwLink: Longint): HResult;
begin
  try
    OleCheck(FReObject.poleobj.DoVerb(OLEIVERB_SHOW, nil, FReObject.polesite,
      0, FRichEdit.Handle, FRichEdit.ClientRect));
  except
    Application.HandleException(FRichEdit);
  end;
  Result := S_OK;
end;

function TOleUILinkInfo.UpdateLink(dwLink: Longint; fErrorMessage: BOOL;
  fErrorAction: BOOL): HResult;
begin
  try
    OleCheck(FReObject.poleobj.Update);
  except
    Application.HandleException(FRichEdit);
  end;
  Result := S_OK;
end;

function TOleUILinkInfo.CancelLink(dwLink: Longint): HResult;
begin
  LinkError(SCannotBreakLink);
  Result := E_NOTIMPL;
end;

function TOleUILinkInfo.GetLastUpdate(dwLink: Longint;
  var LastUpdate: TFileTime): HResult;
begin
  Result := S_OK;
end;

//-----------------------------------------------------------------------------
{ Get RichEdit OLE interface }

function GetRichEditOle(Wnd: HWnd; var RichEditOle): Boolean;
begin
  Result := SendMessage(Wnd, EM_GETOLEINTERFACE, 0, Longint(@RichEditOle)) <> 0;
end;


//-----------------------------------------------------------------------------
{ TWideRichEditStrings }

const
  ReadError  = $0001;
  WriteError = $0002;
  NoError    = $0000;

type


  TWideRichEditStrings = class(TWideStrings)
  private
    RichEdit: TRxCustomRichEdit;
    FFormat: TRichStreamFormat;
    FMode: TRichStreamModes;
    FConverter: TConversion;
    procedure EnableChange(const Value: Boolean);
  protected
    function GetCount: Integer; override;
    procedure SetUpdateState(Updating: Boolean); override;

    //function Get(Index: Integer): string; override;
    function WideGet(Index: Integer): WideString; override;

    //procedure Put(Index: Integer; const S: string); override;
    procedure WidePut(Index: Integer; const S: WideString); override;

    procedure SetText(const Value: string); override;
    procedure WideSetText(const Value: WideString); override;

    function GetCodePage: Word; override;

  public
    destructor Destroy; override;
    procedure Clear; override;
    procedure AddStrings(Strings: TWideStrings); override;
    procedure Delete(Index: Integer); override;

    procedure Insert(Index: Integer; const S: string); override;
    procedure WideInsert(Index: Integer; const S: WideString); override;

    procedure LoadFromFile(const FileName: string); override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToFile(const FileName: string); override;
    procedure SaveToStream(Stream: TStream); override;
    
    property Format: TRichStreamFormat read FFormat write FFormat;
    property Mode: TRichStreamModes read FMode write FMode;
  end;

destructor TWideRichEditStrings.Destroy;
begin
  FConverter.Free;
  inherited Destroy;
end;

procedure TWideRichEditStrings.AddStrings(Strings: TWideStrings);
var
  SelChange: TNotifyEvent;
begin
  SelChange := RichEdit.OnSelectionChange;
  RichEdit.OnSelectionChange := nil;
  try
    inherited AddStrings(Strings);
  finally
    RichEdit.OnSelectionChange := SelChange;
  end;
end;

function TWideRichEditStrings.GetCount: Integer;
begin
  with RichEdit do begin
    Result := SendMessage(Handle, EM_GETLINECOUNT, 0, 0);
    if GetLineLength(GetLineIndex(Result - 1)) = 0 then Dec(Result);
  end;
end;

function TWideRichEditStrings.WideGet(Index: Integer): WideString;
var
  Text: array[0..4095] of WideChar;
  L: Integer;
begin
  ZeroMemory(@Text,Sizeof(Text));//added by junjiao
  Word((@Text)^) := SizeOf(Text);
  RichEdit.__Wide := true;
  L := SendMessage(RichEdit.Handle, EM_GETLINE, Index, Longint(@Text));
  RichEdit.__Wide := false;
  if (L > 0) then begin
     if (Text[L - 2] = #13) and (Text[L - 1] = #10) and (L >= 2) then Dec(L, 2)
     else if (RichEditVersion >= 2) and (Text[L - 1] = #13) then Dec(L);
     Result := Text;
     if(L>=0)then SetLength(Result,L);
     //SetString(Result, Text, L);
  end else
     Result := '';
end;

procedure TWideRichEditStrings.WidePut(Index: Integer; const S: WideString);
var
  Selection: TCharRange;
begin
  if Index >= 0 then
  begin
    Selection.cpMin := RichEdit.GetLineIndex(Index);
    if Selection.cpMin <> -1 then begin
      Selection.cpMax := Selection.cpMin +
        RichEdit.GetLineLength(Selection.cpMin);
      SendMessage(RichEdit.Handle, EM_EXSETSEL, 0, Longint(@Selection));
      RichEdit.FLinesUpdating := True;
      try
        RichEdit.__Wide := true;
        SendMessage(RichEdit.Handle, EM_REPLACESEL, 0, Longint(PWideChar(S)));
      finally
        RichEdit.__Wide := false;
        RichEdit.FLinesUpdating := False;
      end;
    end;
  end;
end;

procedure TWideRichEditStrings.Insert(Index: Integer; const S: string);
begin
   WideInsert(Index,WideString(PChar(S)));
end;

procedure TWideRichEditStrings.WideInsert(Index: Integer; const S: WideString);
var
  L: Integer;
  Selection: TCharRange;
  Str: WideString;
begin
  if Index >= 0 then
  begin
    Selection.cpMin := RichEdit.Perform(EM_LINEINDEX, Index, 0);
    if Selection.cpMin >= 0 then
      Str:= S+WideString(#13)
    else begin
      Selection.cpMin :=
        RichEdit.Perform(EM_LINEINDEX, Index - 1, 0);
      if Selection.cpMin < 0 then Exit;
      L := RichEdit.Perform(EM_LINELENGTH, Selection.cpMin, 0);
      if L = 0 then Exit;
      Inc(Selection.cpMin, L);
      Str := WideString(#13)+S;
    end;
    Selection.cpMax := Selection.cpMin;
    RichEdit.Perform(EM_EXSETSEL, 0, Longint(@Selection));

    RichEdit.__Wide:= True;
    RichEdit.PerformReally(EM_REPLACESEL, 0, LongInt(@Str[1]));
    RichEdit.__Wide:= False;
    
    if RichEdit.SelStart <> (Selection.cpMax + Length(Str)) then
      raise EOutOfResources.Create(sRichEditInsertError);
  end;
end;

procedure TWideRichEditStrings.Delete(Index: Integer);
const
  Empty: PWideChar = '';
var
  Selection: TCharRange;
begin
  if Index < 0 then Exit;
  Selection.cpMin := RichEdit.GetLineIndex(Index);
  if Selection.cpMin <> -1 then begin
    Selection.cpMax := RichEdit.GetLineIndex(Index + 1);
    if Selection.cpMax = -1 then
      Selection.cpMax := Selection.cpMin +
        RichEdit.GetLineLength(Selection.cpMin);
    SendMessage(RichEdit.Handle, EM_EXSETSEL, 0, Longint(@Selection));
    RichEdit.FLinesUpdating := True;
    try
      SendMessage(RichEdit.Handle, EM_REPLACESEL, 0, Longint(Empty));
    finally
      RichEdit.FLinesUpdating := False;
    end;
  end;
end;

procedure TWideRichEditStrings.Clear;
begin
  RichEdit.Clear;
end;

procedure TWideRichEditStrings.SetUpdateState(Updating: Boolean);
begin
  if RichEdit.Showing then
    SendMessage(RichEdit.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then begin
    RichEdit.Refresh;
    RichEdit.Perform(CM_TEXTCHANGED, 0, 0);
  end;
end;

procedure TWideRichEditStrings.EnableChange(const Value: Boolean);
var
  EventMask: Longint;
begin
  with RichEdit do begin
    EventMask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
    if Value then
      EventMask := EventMask or ENM_CHANGE
    else
      EventMask := EventMask and not ENM_CHANGE;
    SendMessage(Handle, EM_SETEVENTMASK, 0, EventMask);
  end;
end;

procedure TWideRichEditStrings.SetText(const Value: string);
begin
  WideSetText(CharToWide(Value, __cp));
end;

procedure TWideRichEditStrings.WideSetText(const Value: WideString);
begin
  EnableChange(False);
  try
    RichEdit.__Wide :=true;
    inherited SetText(Value);
  finally
    RichEdit.__Wide :=false;
    EnableChange(True);
  end;
end;

function TWideRichEditStrings.GetCodePage: Word;
begin
  Result := RichEdit.__FCP;
end;

function AdjustLineBreaks(Dest, Source: PChar): Integer; assembler;
//function AdjustLineBreaks(Dest, Source: PWideChar): Integer; assembler;//???????????
asm
        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EAX
        MOV     ESI,EDX
        MOV     EDX,EAX
        CLD
@@1:    LODSB
@@2:    OR      AL,AL
        JE      @@4
        CMP     AL,0AH
        JE      @@3
        STOSB
        CMP     AL,0DH
        JNE     @@1
        MOV     AL,0AH
        STOSB
        LODSB
        CMP     AL,0AH
        JE      @@1
        JMP     @@2
@@3:    MOV     EAX,0A0DH
        STOSW
        JMP     @@1
@@4:    STOSB
        LEA     EAX,[EDI-1]
        SUB     EAX,EDX
        POP     EDI
        POP     ESI
end;

function StreamSave(dwCookie: Longint; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; stdcall;
var
  StreamInfo: PRichEditStreamInfo;
begin
  Result := NoError;
  StreamInfo := PRichEditStreamInfo(Pointer(dwCookie));
  try
    pcb := 0;
    if StreamInfo^.Converter <> nil then
      pcb := StreamInfo^.Converter.ConvertWriteStream(StreamInfo^.Stream, PChar(pbBuff), cb);
  except
    Result := WriteError;
  end;
end;

function StreamLoad(dwCookie: Longint; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; stdcall;
var
  Buffer, pBuff: PChar;
  StreamInfo: PRichEditStreamInfo;
begin
  Result := NoError;
  StreamInfo := PRichEditStreamInfo(Pointer(dwCookie));
  Buffer := StrAlloc(cb + 1);
  try
    cb := cb div 2;
    pcb := 0;
    pBuff := Buffer + cb;
    try
      if StreamInfo^.Converter <> nil then
        pcb := StreamInfo^.Converter.ConvertReadStream(StreamInfo^.Stream, pBuff, cb);
      if pcb > 0 then
      begin
        pBuff[pcb] := #0;
        if pBuff[pcb - 1] = #13 then pBuff[pcb - 1] := #0;
        //2001.7.24 有人发现在粘贴中文时会出问题，甚至有些英文文本也会出问题 why? I don't know.
        //据估计，有可能是因为以下断行的函数(ASM代码)有问题. wang junjiao
        pcb := AdjustLineBreaks(Buffer, pBuff);//?????????????????????
        Move(Buffer^, pbBuff^, pcb);
      end;
    except
      Result := ReadError;
    end;
  finally
    StrDispose(Buffer);
  end;
end;

procedure TWideRichEditStrings.LoadFromStream(Stream: TStream);
var
  EditStream: TEditStream;
  Position: Longint;
  TextType: Longint;
  StreamInfo: TRichEditStreamInfo;
  Converter: TConversion;
begin
  StreamInfo.Stream := Stream;
  if FConverter <> nil then Converter := FConverter
  else Converter := RichEdit.DefaultConverter.Create;
  StreamInfo.Converter := Converter;
  try
    with EditStream do
    begin
      dwCookie := Longint(Pointer(@StreamInfo));
      pfnCallBack := @StreamLoad;
      dwError := 0;
    end;
    Position := Stream.Position;
    case FFormat of
      sfDefault:
        if RichEdit.PlainText then TextType := SF_TEXT
        else TextType := SF_RTF;
      sfRichText: TextType := SF_RTF;
      else {sfPlainText} TextType := SF_TEXT;
    end;
    if TextType = SF_RTF then begin
      if smPlainRtf in Mode then TextType := TextType or SFF_PLAINRTF;
    end;
    if TextType = SF_TEXT then begin
      if (smUnicode in Mode) and (RichEditVersion > 1) then
        TextType := TextType or SF_UNICODE;
    end;
    if smSelection in Mode then TextType := TextType or SFF_SELECTION;
    SendMessage(RichEdit.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
    if (EditStream.dwError <> 0) then begin
      Stream.Position := Position;
      if (TextType and SF_RTF = SF_RTF) then TextType := SF_TEXT
      else TextType := SF_RTF;
      SendMessage(RichEdit.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
      if EditStream.dwError <> 0 then
        raise EOutOfResources.Create(ResStr(sRichEditLoadFail));
    end;
    RichEdit.SetSelection(0, 0, True);
  finally
    if FConverter = nil then Converter.Free;
  end;
end;

procedure TWideRichEditStrings.SaveToStream(Stream: TStream);
var
  EditStream: TEditStream;
  TextType: Longint;
  StreamInfo: TRichEditStreamInfo;
  Converter: TConversion;
begin
  if FConverter <> nil then Converter := FConverter
  else Converter := RichEdit.DefaultConverter.Create;
  StreamInfo.Stream := Stream;
  StreamInfo.Converter := Converter;
  try
    with EditStream do
    begin
      dwCookie := Longint(Pointer(@StreamInfo));
      pfnCallBack := @StreamSave;
      dwError := 0;
    end;
    case FFormat of
      sfDefault:
        if RichEdit.PlainText then TextType := SF_TEXT
        else TextType := SF_RTF;
      sfRichText: TextType := SF_RTF;
      else {sfPlainText} TextType := SF_TEXT;
    end;
    if TextType = SF_RTF then begin
      if smNoObjects in Mode then TextType := SF_RTFNOOBJS;
      if smPlainRtf in Mode then TextType := TextType or SFF_PLAINRTF;
    end
    else if TextType = SF_TEXT then begin
      if (smUnicode in Mode) and (RichEditVersion > 1) then
        TextType := TextType or SF_UNICODE;
    end;
    if smSelection in Mode then TextType := TextType or SFF_SELECTION;
    SendMessage(RichEdit.Handle, EM_STREAMOUT, TextType, Longint(@EditStream));
    if EditStream.dwError <> 0 then
      raise EOutOfResources.Create(ResStr(sRichEditSaveFail));
  finally
    if FConverter = nil then Converter.Free;
  end;
end;

procedure TWideRichEditStrings.LoadFromFile(const FileName: string);
var
  Ext: string;
  Convert: PRichConversionFormat;
  SaveFormat: TRichStreamFormat;
begin
{$IFNDEF VER90}
  Ext := AnsiLowerCaseFileName(ExtractFileExt(Filename));
{$ELSE}
  Ext := LowerCase(ExtractFileExt(Filename));
{$ENDIF}
  System.Delete(Ext, 1, 1);
  Convert := ConversionFormatList;
  while Convert <> nil do
    with Convert^ do
      if Extension <> Ext then Convert := Next
      else Break;
  if (FConverter = nil) and (Convert <> nil) then
    FConverter := Convert^.ConversionClass.Create;
  try
    SaveFormat := Format;
    try
      if Convert <> nil then begin
        if Convert^.PlainText then FFormat := sfPlainText
        else FFormat := sfRichText;
      end;
      inherited LoadFromFile(FileName);
    finally
      FFormat := SaveFormat;
    end;
  except
    FConverter.Free;
    FConverter := nil;
    raise;
  end;
end;

procedure TWideRichEditStrings.SaveToFile(const FileName: string);
var
  Ext: string;
  Convert: PRichConversionFormat;
  SaveFormat: TRichStreamFormat;
begin
{$IFNDEF VER90}
  Ext := AnsiLowerCaseFileName(ExtractFileExt(Filename));
{$ELSE}
  Ext := LowerCase(ExtractFileExt(Filename));
{$ENDIF}
  System.Delete(Ext, 1, 1);
  Convert := ConversionFormatList;
  while Convert <> nil do
    with Convert^ do
      if Extension <> Ext then Convert := Next
      else Break;
  if (FConverter = nil) and (Convert <> nil) then
    FConverter := Convert^.ConversionClass.Create;
  try
    SaveFormat := Format;
    try
      if Convert <> nil then begin
        if Convert^.PlainText then FFormat := sfPlainText
        else FFormat := sfRichText;
      end;
      inherited SaveToFile(FileName);
    finally
      FFormat := SaveFormat;
    end;
  except
    FConverter.Free;
    FConverter := nil;
    raise;
  end;
end;

{ TOEMConversion }

function TOEMConversion.ConvertReadStream(Stream: TStream; Buffer: PChar;
  BufSize: Integer): Integer;
var
  Mem: TMemoryStream;
begin
  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(BufSize);
    Result := inherited ConvertReadStream(Stream, PChar(Mem.Memory), BufSize);
    OemToCharBuff(PChar(Mem.Memory), Buffer, Result);
  finally
    Mem.Free;
  end;
end;

function TOEMConversion.ConvertWriteStream(Stream: TStream; Buffer: PChar;
  BufSize: Integer): Integer;
var
  Mem: TMemoryStream;
begin
  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(BufSize);
    CharToOemBuff(Buffer, PChar(Mem.Memory), BufSize);
    Result := inherited ConvertWriteStream(Stream, PChar(Mem.Memory), BufSize);
  finally
    Mem.Free;
  end;
end;

{ TRxCustomRichEdit }

constructor TRxCustomRichEdit.Create(AOwner: TComponent);
var
  DC: HDC;
begin
  __Wide := false;
  //__FCP := GetOEMCP;
  //__FCP := GetACP;
  //__FCP := CP_OEMCP;
  __FCP := CP_ACP;

  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption];
  FSelAttributes := TRxTextAttributes.Create(Self, atSelected);
  FDefAttributes := TRxTextAttributes.Create(Self, atDefaultText);
  FWordAttributes := TRxTextAttributes.Create(Self, atWord);
  FParagraph := TRxParaAttributes.Create(Self);
  FRichEditStrings := TWideRichEditStrings.Create;
  TWideRichEditStrings(FRichEditStrings).RichEdit := Self;
  TabStop := True;
  Width := 185;
  Height := 89;
  AutoSize := False;
{$IFDEF RX_D4}
  DoubleBuffered := False;
{$ENDIF}
  FAllowObjects := True;
{$IFDEF RX_D3}
  FAllowInPlace := True;
{$ENDIF}
  FAutoVerbMenu := True;
  FHideSelection := True;
  FHideScrollBars := True;
  ScrollBars := ssBoth;
  FSelectionBar := True;
  FLangOptions := [rlAutoFont];
  DC := GetDC(0);
  FScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
  ReleaseDC(0, DC);
  DefaultConverter := TConversion;
  FOldParaAlignment := TParaAlignment(Alignment);
  FUndoLimit := 100;
  FAutoURLDetect := True;
  FWordSelection := True;
  with FClickRange do begin
    cpMin := -1;
    cpMax := -1;
  end;
  FCallback := TRichEditOleCallback.Create(Self);
{$IFDEF RX_D4}
  Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
{$ENDIF}
end;

destructor TRxCustomRichEdit.Destroy;
begin
  FLastFind := nil;
  FSelAttributes.Free;
  FDefAttributes.Free;
  FWordAttributes.Free;
  FParagraph.Free;
  FRichEditStrings.Free;
  FMemStream.Free;
  FPopupVerbMenu.Free;
  FFindDialog.Free;
  FReplaceDialog.Free;
  inherited Destroy;
  { be sure that callback object is destroyed after inherited Destroy }
  TRichEditOleCallback(FCallback).Free;
end;

procedure TRxCustomRichEdit.Clear;
begin
  CloseObjects;
  inherited Clear;
  Modified := False;
end;

procedure TRxCustomRichEdit.CreateParams(var Params: TCreateParams);
var
  WCW: TWndClassW;
  WCA: TWndClassA;
const
  HideScrollBars: array[Boolean] of DWORD = (ES_DISABLENOSCROLL, 0);
  HideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
  WordWraps: array[Boolean] of DWORD = (0, ES_AUTOHSCROLL);
  SelectionBars: array[Boolean] of DWORD = (0, ES_SELECTIONBAR);
begin

  if IsWinNT then
    begin
      GetClassInfoW(HInstance, _RICHEDIT_CLASS, WCW);
      __DefWndProcW:= WCW.lpfnWndProc;
    end
  else
  GetClassInfoA(HInstance, _RICHEDIT_CLASS, WCA);
  __DefWndProcA:= WCA.lpfnWndProc;

  inherited CreateParams(Params);
  case RichEditVersion of
    1: CreateSubClass(Params, RICHEDIT_CLASS10A);
    else CreateSubClass(Params, _RICHEDIT_CLASS);
  end;
  with Params do begin
    Style := (Style and not (WS_HSCROLL or WS_VSCROLL)) or ES_SAVESEL or
      (WS_CLIPSIBLINGS or WS_CLIPCHILDREN);
    { NOTE: WS_CLIPCHILDREN and WS_CLIPSIBLINGS are essential otherwise }
    { once the object is inserted you see some painting problems.       }
    Style := Style and not (WS_HSCROLL or WS_VSCROLL);
    if ScrollBars in [ssVertical, ssBoth] then
      Style := Style or WS_VSCROLL;
    if (ScrollBars in [ssHorizontal, ssBoth]) and not WordWrap then
      Style := Style or WS_HSCROLL;
    Style := Style or HideScrollBars[FHideScrollBars] or
      SelectionBars[FSelectionBar] or HideSelections[FHideSelection] and
      not WordWraps[WordWrap];
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TRxCustomRichEdit.CreateWnd;
var
  StreamFmt: TRichStreamFormat;
  Mode: TRichStreamModes;
  DesignMode: Boolean;
  Mask: Longint;
begin
  StreamFmt := TWideRichEditStrings(Lines).Format;
  Mode := TWideRichEditStrings(Lines).Mode;
  inherited CreateWnd;
{$IFNDEF VER90}
  if (SysLocale.FarEast) and not (SysLocale.PriLangID = LANG_JAPANESE) then
    Font.Charset := GetDefFontCharSet;
{$ENDIF}
  Mask := ENM_CHANGE or ENM_SELCHANGE or ENM_REQUESTRESIZE or ENM_PROTECTED;
  if RichEditVersion >= 2 then Mask := Mask or ENM_LINK;
  SendMessage(Handle, EM_SETEVENTMASK, 0, Mask);
  SendMessage(Handle, EM_SETBKGNDCOLOR, 0, ColorToRGB(Color));
{$IFDEF RX_D3}
  DoSetMaxLength(MaxLength);
{$ENDIF}
  SetWordSelection(FWordSelection);
  if RichEditVersion >= 2 then begin
    SendMessage(Handle, EM_AUTOURLDETECT, Longint(FAutoURLDetect), 0);
    FUndoLimit := SendMessage(Handle, EM_SETUNDOLIMIT, FUndoLimit, 0);
    UpdateTextModes(PlainText);
    SetLangOptions(FLangOptions);
  end;
  if FAllowObjects then begin
    SendMessage(Handle, EM_SETOLECALLBACK, 0,
      LPARAM(TRichEditOleCallback(FCallback) as IRichEditOleCallback));
    GetRichEditOle(Handle, FRichEditOle);
    UpdateHostNames;
  end;
  if FMemStream <> nil then begin
    FMemStream.ReadBuffer(DesignMode, SizeOf(DesignMode));
    if DesignMode then begin
      TWideRichEditStrings(Lines).Format := sfPlainText;
      TWideRichEditStrings(Lines).Mode := [];
    end;
    try
      Lines.LoadFromStream(FMemStream);
      FMemStream.Free;
      FMemStream := nil;
    finally
      TWideRichEditStrings(Lines).Format := StreamFmt;
      TWideRichEditStrings(Lines).Mode := Mode;
    end;
  end;
  if RichEditVersion < 2 then
    SendMessage(Handle, WM_SETFONT, 0, 0);
  Modified := FModified;
end;

procedure TRxCustomRichEdit.DestroyWnd;
var
  StreamFmt: TRichStreamFormat;
  Mode: TRichStreamModes;
  DesignMode: Boolean;
begin
  FModified := Modified;
  FMemStream := TMemoryStream.Create;
  StreamFmt := TWideRichEditStrings(Lines).Format;
  Mode := TWideRichEditStrings(Lines).Mode;
  DesignMode := (csDesigning in ComponentState);
  FMemStream.WriteBuffer(DesignMode, SizeOf(DesignMode));
  if DesignMode then begin
    TWideRichEditStrings(Lines).Format := sfPlainText;
    TWideRichEditStrings(Lines).Mode := [];
  end;
  try
    Lines.SaveToStream(FMemStream);
    FMemStream.Position := 0;
  finally
    TWideRichEditStrings(Lines).Format := StreamFmt;
    TWideRichEditStrings(Lines).Mode := Mode;
  end;
  inherited DestroyWnd;
end;

procedure TRxCustomRichEdit.SetAllowObjects(Value: Boolean);
begin
  if FAllowObjects <> Value then begin
    FAllowObjects := Value;
    RecreateWnd;    
  end;
end;

procedure TRxCustomRichEdit.UpdateHostNames;
var
  AppName: string;
begin
  if HandleAllocated and Assigned(FRichEditOle) then begin
    AppName := Application.Title;
    if Trim(AppName) = '' then
      AppName := ExtractFileName(Application.ExeName);
    if Trim(Title) = '' then
      IRichEditOle(FRichEditOle).SetHostNames(PChar(AppName), PChar(AppName))
    else
      IRichEditOle(FRichEditOle).SetHostNames(PChar(AppName), PChar(Title));
  end;
end;

procedure TRxCustomRichEdit.SetTitle(const Value: string);
begin
  if FTitle <> Value then begin
    FTitle := Value;
    UpdateHostNames;
  end;
end;

function TRxCustomRichEdit.GetPopupMenu: TPopupMenu;
var
  EnumOleVerb: IEnumOleVerb;
  OleVerb: TOleVerb;
  Item: TMenuItem;
  ReObject: TReObject;
begin
  FPopupVerbMenu.Free;
  FPopupVerbMenu := nil;
  Result := inherited GetPopupMenu;
  if FAutoVerbMenu and (SelectionType = [stObject]) and
    Assigned(FRichEditOle) then
  begin
    FillChar(ReObject, SizeOf(ReObject), 0);
    ReObject.cbStruct := SizeOf(ReObject);
    if Succeeded(IRichEditOle(FRichEditOle).GetObject(
      Longint(REO_IOB_SELECTION), ReObject, REO_GETOBJ_POLEOBJ)) then
    try
      if Assigned(ReObject.poleobj) and
        (ReObject.dwFlags and REO_INPLACEACTIVE = 0) then
      begin
        FPopupVerbMenu := TPopupMenu.Create(Self);
        if ReObject.poleobj.EnumVerbs(EnumOleVerb) = 0 then
        try
          while (EnumOleVerb.Next(1, OleVerb, nil) = 0) and
            (OleVerb.lVerb >= 0) and
            (OleVerb.grfAttribs and OLEVERBATTRIB_ONCONTAINERMENU <> 0) do
          begin
            Item := TMenuItem.Create(FPopupVerbMenu);
            Item.Caption := WideCharToString(OleVerb.lpszVerbName);
            Item.Tag := OleVerb.lVerb;
            Item.Default := (OleVerb.lVerb = OLEIVERB_PRIMARY);
            Item.OnClick := PopupVerbClick;
            FPopupVerbMenu.Items.Add(Item);
          end;
        finally
          ReleaseObject(EnumOleVerb);
        end;
        if (Result <> nil) and (Result.Items.Count > 0) then begin
          Item := TMenuItem.Create(FPopupVerbMenu);
          Item.Caption := '-';
          Result.Items.Add(Item);
          Item := TMenuItem.Create(FPopupVerbMenu);
          Item.Caption := Format(ResStr(SPropDlgCaption),
            [GetFullNameStr(ReObject.poleobj)]);
          Item.OnClick := ObjectPropsClick;
          Result.Items.Add(Item);
          if FPopupVerbMenu.Items.Count > 0 then begin
            FPopupVerbMenu.Items.Caption := GetFullNameStr(ReObject.poleobj);
            Result.Items.Add(FPopupVerbMenu.Items);
          end;
        end
        else if FPopupVerbMenu.Items.Count > 0 then begin
          Item := TMenuItem.Create(FPopupVerbMenu);
          Item.Caption := Format(ResStr(SPropDlgCaption),
            [GetFullNameStr(ReObject.poleobj)]);
          Item.OnClick := ObjectPropsClick;
          FPopupVerbMenu.Items.Insert(0, Item);
          Result := FPopupVerbMenu;
        end;
      end;
    finally
      ReleaseObject(ReObject.poleobj);
    end;
  end;
end;

procedure TRxCustomRichEdit.PopupVerbClick(Sender: TObject);
var
  ReObject: TReObject;
begin
  if Assigned(FRichEditOle) then begin
    FillChar(ReObject, SizeOf(ReObject), 0);
    ReObject.cbStruct := SizeOf(ReObject);
    if Succeeded(IRichEditOle(FRichEditOle).GetObject(
      Longint(REO_IOB_SELECTION), ReObject, REO_GETOBJ_POLEOBJ or
      REO_GETOBJ_POLESITE)) then
    try
      if ReObject.dwFlags and REO_INPLACEACTIVE = 0 then
        OleCheck(ReObject.poleobj.DoVerb((Sender as TMenuItem).Tag, nil,
          ReObject.polesite, 0, Handle, ClientRect));
    finally
      ReleaseObject(ReObject.polesite);
      ReleaseObject(ReObject.poleobj);
    end;
  end;
end;

procedure TRxCustomRichEdit.ObjectPropsClick(Sender: TObject);
begin
  ObjectPropertiesDialog;
end;

procedure TRxCustomRichEdit.WMSetFont(var Message: TWMSetFont);
begin
  FDefAttributes.Assign(Font);
end;

procedure TRxCustomRichEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  FDefAttributes.Assign(Font);
end;

procedure TRxCustomRichEdit.CreateWindowHandle(const Params: TCreateParams);
var
  Bounds: TRect;
begin
  Bounds := BoundsRect;
  inherited CreateWindowHandle(Params);
  if HandleAllocated then BoundsRect := Bounds;
end;

{$IFDEF RX_D3}
procedure TRxCustomRichEdit.DoSetMaxLength(Value: Integer);
begin
  { The rich edit control's default maximum amount of text is 32K }
  { Let's set it at 16M by default }
  if Value = 0 then Value := $FFFFFF;
  SendMessage(Handle, EM_EXLIMITTEXT, 0, Value);
end;
{$ENDIF}

function TRxCustomRichEdit.GetCaretPos: TPoint;
var
  CharRange: TCharRange;
begin
  SendMessage(Handle, EM_EXGETSEL, 0, Longint(@CharRange));
  Result.X := CharRange.cpMax;
  Result.Y := LineFromChar(Result.X);
  Dec(Result.X, GetLineIndex(-1));
end;

//{$IFDEF RX_D3}
function TRxCustomRichEdit.GetSelLength: Integer;
begin
  with GetSelection do
    Result := cpMax - cpMin;
end;

function TRxCustomRichEdit.GetSelStart: Integer;
begin
  Result := GetSelection.cpMin;
end;

procedure TRxCustomRichEdit.AnsiSetText(Value: string);
begin
  WideSetText(CharToWide(Value,__FCP));
end;

function TRxCustomRichEdit.AnsiGetText: string;
begin
  Result := WideToChar(WideGetText(),__FCP);
end;

procedure TRxCustomRichEdit.WideSetText(Value: WideString);
begin
  __Wide:= True;
//  SetWindowTextW(Handle, @Value[1]);
  SendMessage(Handle, WM_SETTEXT, 0, Integer(@Value[1]));
  __Wide:= False;
end;

function TRxCustomRichEdit.WideGetText: WideString;
var
  GTL: TGetTextLengthEx;
  GT: TGetTextEx;
  L: Integer;
begin
  GTL.flags:= GTL_DEFAULT;
  GTL.codepage:= 1200;//for unicode
  L:= Perform(EM_GETTEXTLENGTHEX, Integer(@GTL), 0);
  //SetLength(Result, L);
  SetLength(Result, L+1);
  GT.cb:= L*2+2;
  GT.flags:= GT_DEFAULT;
  GT.codepage:= 1200;
  GT.lpDefaultChar:= nil;
  GT.lpUsedDefChar:= nil;
  Perform(EM_GETTEXTEX, Integer(@GT), Integer(@Result[1]));
  //PerformReally(EM_GETTEXTEX, Integer(@GT), Integer(@Result[1]));
end;

procedure TRxCustomRichEdit.SetRTFSelText(Value: String);
var
  MS: TMemoryStream;
  OldMode: TRichStreamModes;
  OldFormat:  TRichStreamFormat;
begin
  OldMode := StreamMode;
  OldFormat := StreamFormat;
  MS:= TMemoryStream.Create;
  MS.Write(Value[1], Length(Value)+1);
  MS.Position:= 0;
  StreamMode := [smSelection]+StreamMode;
  StreamFormat := sfRichText;
  Lines.LoadFromStream(MS);
  StreamMode := OldMode;
  StreamFormat := OldFormat;
  MS.Free;
end;

function TRxCustomRichEdit.GetRTFSelText: String;
var
  MS: TMemoryStream;
  OldMode: TRichStreamModes;
  OldFormat:  TRichStreamFormat;
begin
  OldMode := StreamMode;
  OldFormat := StreamFormat;
  MS:= TMemoryStream.Create;
  StreamMode := [smSelection]+StreamMode;
  StreamFormat := sfRichText;
  Lines.SaveToStream(MS);
  Result:= PChar(MS.Memory);
  MS.Free;
  StreamMode := OldMode;
  StreamFormat := OldFormat;
end;

procedure TRxCustomRichEdit.InsertFromFile(const FileName: String);
var
  OldMode: TRichStreamModes;
begin
  OldMode := StreamMode;
  StreamMode := [smSelection]+StreamMode;
  Lines.LoadFromFile(FileName);
  StreamMode := OldMode;
end;

function TRxCustomRichEdit.WideGetSelText: WideString;
var
  Length: Integer;
begin
  __Wide:= True;
  SetLength(Result, SelLength + 1);
  Length := Perform(EM_GETSELTEXT, 0, Longint(@Result[1]));
  SetLength(Result, Length);
  __Wide:= False;
end;

procedure TRxCustomRichEdit.WideSetSelText(Value: WideString);
begin
  __Wide:= True;
  Perform(EM_REPLACESEL, 1, Integer(@Value[1]));
  //SendMessage(Handle, EM_REPLACESEL, 1, Longint(PWideChar(Value)));
  __Wide:= False;
end;

function TRxCustomRichEdit.AnsiGetSelText: string;
begin
  Result := WideCharToString(PWideChar(WideGetSelText));
end;

procedure TRxCustomRichEdit.AnsiSetSelText(Value: string);
begin
  WideSetSelText(CharToWide(Value,__FCP));
end;

(*
function TRxCustomRichEdit.GetSelText: string;
var
   tmp: WideString; //for debug
begin
     tmp := WideSelText;
     Result := WideCharToString(PWideChar(tmp));
end;

function TRxCustomRichEdit.WideGetSelText: WideString;
begin
  with GetSelection do
  begin
    Result := GetTextRange(cpMin, cpMax);
  end;
end;

function TRxCustomRichEdit.WideGetSelTextBuf(Buffer: PWideChar; BufSize: Integer): Integer;
var
  S: WideString;
  i: Integer;
begin

  S := SelText;
  Result := WStrLen(PWideChar(S));
  i := 0;
  while( i < BufSize) do
         Buffer[i] := (PWideChar(S))[i];
end;
*)
//{$ENDIF RX_D3}

{$IFDEF RX_D4}
procedure TRxCustomRichEdit.CMBiDiModeChanged(var Message: TMessage);
var
  AParagraph: TParaFormat2;
begin
  HandleNeeded; { we REALLY need the handle for BiDi }
  inherited;
  Paragraph.GetAttributes(AParagraph);
  AParagraph.dwMask := PFM_ALIGNMENT;
  AParagraph.wAlignment := Ord(Alignment) + 1;
  Paragraph.SetAttributes(AParagraph);
end;
{$ENDIF}

procedure TRxCustomRichEdit.SetHideScrollBars(Value: Boolean);
begin
  if HideScrollBars <> Value then begin
    FHideScrollBars := Value;
    RecreateWnd;
  end;
end;

procedure TRxCustomRichEdit.SetSelectionBar(Value: Boolean);
begin
  if FSelectionBar <> Value then begin
    FSelectionBar := Value;
    RecreateWnd;
  end;
end;

procedure TRxCustomRichEdit.SetHideSelection(Value: Boolean);
begin
  if HideSelection <> Value then begin
    FHideSelection := Value;
    SendMessage(Handle, EM_HIDESELECTION, Ord(HideSelection), LPARAM(True));
  end;
end;

function TRxCustomRichEdit.GetAutoURLDetect: Boolean;
begin
  Result := FAutoURLDetect;
  if HandleAllocated and not (csDesigning in ComponentState) then begin
    if RichEditVersion >= 2 then
      Result := Boolean(SendMessage(Handle, EM_GETAUTOURLDETECT, 0, 0));
  end;
end;

procedure TRxCustomRichEdit.SetAutoURLDetect(Value: Boolean);
begin
  if Value <> FAutoURLDetect then begin
    FAutoURLDetect := Value;
    if HandleAllocated and (RichEditVersion >= 2) then
      SendMessage(Handle, EM_AUTOURLDETECT, Longint(FAutoURLDetect), 0);
  end;
end;

function TRxCustomRichEdit.GetWordSelection: Boolean;
begin
  Result := FWordSelection;
  if HandleAllocated then
    Result := (SendMessage(Handle, EM_GETOPTIONS, 0, 0) and
      ECO_AUTOWORDSELECTION) <> 0;
end;

procedure TRxCustomRichEdit.SetWordSelection(Value: Boolean);
var
  Options: LPARAM;
begin
  FWordSelection := Value;
  if HandleAllocated then begin
    Options := SendMessage(Handle, EM_GETOPTIONS, 0, 0);
    if Value then Options := Options or ECO_AUTOWORDSELECTION
    else Options := Options and not ECO_AUTOWORDSELECTION;
    SendMessage(Handle, EM_SETOPTIONS, ECOOP_SET, Options);
  end;
end;

const
  RichLangOptions: array[TRichLangOption] of DWORD = (IMF_AUTOKEYBOARD,
    IMF_AUTOFONT, IMF_IMECANCELCOMPLETE, IMF_IMEALWAYSSENDNOTIFY);

function TRxCustomRichEdit.GetLangOptions: TRichLangOptions;
var
  Flags: Longint;
  I: TRichLangOption;
begin
  Result := FLangOptions;
  if HandleAllocated and not (csDesigning in ComponentState) and
    (RichEditVersion >= 2) then
  begin
    Result := [];
    Flags := SendMessage(Handle, EM_GETLANGOPTIONS, 0, 0);
    for I := Low(TRichLangOption) to High(TRichLangOption) do
      if Flags and RichLangOptions[I] <> 0 then Include(Result, I);
  end;
end;

procedure TRxCustomRichEdit.SetLangOptions(Value: TRichLangOptions);
var
  Flags: DWORD;
  I: TRichLangOption;
begin
  FLangOptions := Value;
  if HandleAllocated and (RichEditVersion >= 2) then begin
    Flags := 0;
    for I := Low(TRichLangOption) to High(TRichLangOption) do
      if I in Value then Flags := Flags or RichLangOptions[I];
    SendMessage(Handle, EM_SETLANGOPTIONS, 0, LPARAM(Flags));
  end;
end;

procedure TRxCustomRichEdit.SetSelAttributes(Value: TRxTextAttributes);
begin
  FSelAttributes.Assign(Value);
end;

function TRxCustomRichEdit.GetCanRedo: Boolean;
begin
  Result := False;
  if HandleAllocated and (RichEditVersion >= 2) then
    Result := SendMessage(Handle, EM_CANREDO, 0, 0) <> 0;
end;

function TRxCustomRichEdit.GetCanPaste: Boolean;
begin
  Result := False;
  if HandleAllocated then
    Result := SendMessage(Handle, EM_CANPASTE, 0, 0) <> 0;
end;

{$IFNDEF RX_V110}
function TRxCustomRichEdit.GetCanUndo: Boolean;
begin
  Result := False;
  if HandleAllocated then
    Result := SendMessage(Handle, EM_CANUNDO, 0, 0) <> 0;
end;
{$ENDIF}

function TRxCustomRichEdit.GetRedoName: TUndoName;
begin
  Result := unUnknown;
  if (RichEditVersion >= 2) and HandleAllocated then
    Result := TUndoName(SendMessage(Handle, EM_GETREDONAME, 0, 0));
end;

function TRxCustomRichEdit.GetUndoName: TUndoName;
begin
  Result := unUnknown;
  if (RichEditVersion >= 2) and HandleAllocated then
    Result := TUndoName(SendMessage(Handle, EM_GETUNDONAME, 0, 0));
end;

function TRxCustomRichEdit.GetSelectionType: TRichSelectionType;
const
  SelTypes: array[TRichSelection] of Integer = (
    SEL_TEXT, SEL_OBJECT, SEL_MULTICHAR, SEL_MULTIOBJECT);
var
  Selection: Integer;
  I: TRichSelection;
begin
  Result := [];
  if HandleAllocated then begin
    Selection := SendMessage(Handle, EM_SELECTIONTYPE, 0, 0);
    for I := Low(TRichSelection) to High(TRichSelection) do
      if SelTypes[I] and Selection <> 0 then Include(Result, I);
  end;
end;

function TRxCustomRichEdit.GetSelection: TCharRange;
begin
  SendMessage(Handle, EM_EXGETSEL, 0, Longint(@Result));
end;

procedure TRxCustomRichEdit.SetSelection(StartPos, EndPos: Longint;
  ScrollCaret: Boolean);
var
  CharRange: TCharRange;
begin
  with CharRange do begin
    cpMin := StartPos;
    cpMax := EndPos;
  end;
  SendMessage(Handle, EM_EXSETSEL, 0, Longint(@CharRange));
  if ScrollCaret then SendMessage(Handle, EM_SCROLLCARET, 0, 0);
end;

{$IFDEF RX_D3}
procedure TRxCustomRichEdit.SetSelLength(Value: Integer);
begin
  with GetSelection do SetSelection(cpMin, cpMin + Value, True);
end;

procedure TRxCustomRichEdit.SetSelStart(Value: Integer);
begin
  SetSelection(Value, Value, False);
end;
{$ENDIF RX_D3}

function TRxCustomRichEdit.GetCharPos(CharIndex: Integer): TPoint;
var
  Res: Longint;
begin
  FillChar(Result, SizeOf(Result), 0);
  if HandleAllocated then begin
    if RichEditVersion = 2 then begin
      Res := SendMessage(Handle, Messages.EM_POSFROMCHAR, CharIndex, 0);
      Result.X := LoWord(Res);
      Result.Y := HiWord(Res);
    end
    else { RichEdit 1.0 and 3.0 }
      SendMessage(Handle, Messages.EM_POSFROMCHAR, WPARAM(@Result), CharIndex);
  end;
end;
(*
function TRxCustomRichEdit.GetTextRange(StartPos, EndPos: Longint): string;
var
  TextRange: TTextRange;
begin
  SetLength(Result, EndPos - StartPos + 1);
  TextRange.chrg.cpMin := StartPos;
  TextRange.chrg.cpMax := EndPos;
  TextRange.lpstrText := PAnsiChar(Result);
  SetLength(Result, SendMessage(Handle, EM_GETTEXTRANGE, 0, Longint(@TextRange)));
end;
*)
function TRxCustomRichEdit.GetTextRange(StartPos, EndPos: Longint): WideString;
var
  TextRange: TTextRange;
  //txt:	string;
  txt:	WideString;
  //x:	Integer;
begin
  //modified by wang junjiao for UNICODE
  SetLength(txt,EndPos - StartPos + 1);
  //SetLength(txt,( EndPos - StartPos + 1 ) * 2 );
  TextRange.chrg.cpMin := StartPos;
  TextRange.chrg.cpMax := EndPos;
  TextRange.lpstrText := PWideChar(txt);
  __Wide := true;
  {x := }SendMessage(Handle, EM_GETTEXTRANGE, 0, Longint(@TextRange));
  __Wide := false;

  //x := WideCharToMultiByte(CP_ACP,0,PWideChar(txt),x,PChar(Result),0,NIL,NIL);
  //SetLength(Result,x+1);
  //WideCharToMultiByte(CP_ACP,0,PWideChar(txt),x,PChar(Result),x,NIL,NIL);
  Result := txt;
end;

function TRxCustomRichEdit.WordAtCursor: string;
begin
  Result := WideCharToString(PWideChar(_WordAtCursor));
  //Trim(Result);
end;

function TRxCustomRichEdit._WordAtCursor: WideString;
var
  Range: TCharRange;
begin
  Result := '';
  if HandleAllocated then begin
    Range.cpMax := SelStart;
    if Range.cpMax = 0 then Range.cpMin := 0
    else if SendMessage(Handle, EM_FINDWORDBREAK, WB_ISDELIMITER, Range.cpMax) <> 0 then
      Range.cpMin := SendMessage(Handle, EM_FINDWORDBREAK, WB_MOVEWORDLEFT, Range.cpMax)
    else
      Range.cpMin := SendMessage(Handle, EM_FINDWORDBREAK, WB_LEFT, Range.cpMax);
    while SendMessage(Handle, EM_FINDWORDBREAK, WB_ISDELIMITER, Range.cpMin) <> 0 do
      Inc(Range.cpMin);
    Range.cpMax := SendMessage(Handle, EM_FINDWORDBREAK, WB_RIGHTBREAK, Range.cpMax);
    //Result := Trim(GetTextRange(Range.cpMin, Range.cpMax));
    Result := GetTextRange(Range.cpMin, Range.cpMax);
  end;
end;

function TRxCustomRichEdit.LineFromChar(CharIndex: Integer): Integer;
begin
  Result := SendMessage(Handle, EM_EXLINEFROMCHAR, 0, CharIndex);
end;

function TRxCustomRichEdit.GetLineIndex(LineNo: Integer): Integer;
begin
  Result := SendMessage(Handle, EM_LINEINDEX, LineNo, 0);
end;

function TRxCustomRichEdit.GetLineLength(CharIndex: Integer): Integer;
begin
  Result := SendMessage(Handle, EM_LINELENGTH, CharIndex, 0);
end;

procedure TRxCustomRichEdit.SetUndoLimit(Value: Integer);
begin
  if (Value <> FUndoLimit) then begin
    FUndoLimit := Value;
    if (RichEditVersion >= 2) and HandleAllocated then
      FUndoLimit := SendMessage(Handle, EM_SETUNDOLIMIT, Value, 0);
  end;
end;

procedure TRxCustomRichEdit.SetDefAttributes(Value: TRxTextAttributes);
begin
  FDefAttributes.Assign(Value);
end;

procedure TRxCustomRichEdit.SetWordAttributes(Value: TRxTextAttributes);
begin
  FWordAttributes.Assign(Value);
end;

function TRxCustomRichEdit.GetStreamFormat: TRichStreamFormat;
begin
  Result := TWideRichEditStrings(Lines).Format;
end;

function TRxCustomRichEdit.GetStreamMode: TRichStreamModes;
begin
  Result := TWideRichEditStrings(Lines).Mode;
end;

procedure TRxCustomRichEdit.SetStreamFormat(Value: TRichStreamFormat);
begin
  TWideRichEditStrings(Lines).Format := Value;
end;

procedure TRxCustomRichEdit.SetStreamMode(Value: TRichStreamModes);
begin
  TWideRichEditStrings(Lines).Mode := Value;
end;

procedure TRxCustomRichEdit.SetPlainText(Value: Boolean);
var
  MemStream: TStream;
  StreamFmt: TRichStreamFormat;
  Mode: TRichStreamModes;
begin
  if PlainText <> Value then begin
    if HandleAllocated and (RichEditVersion >= 2) then begin
      MemStream := TMemoryStream.Create;
      try
        StreamFmt := TWideRichEditStrings(Lines).Format;
        Mode := TWideRichEditStrings(Lines).Mode;
        try
          if (csDesigning in ComponentState) or Value then
            TWideRichEditStrings(Lines).Format := sfPlainText
          else TWideRichEditStrings(Lines).Format := sfRichText;
          TWideRichEditStrings(Lines).Mode := [];
          Lines.SaveToStream(MemStream);
          MemStream.Position := 0;
          TWideRichEditStrings(Lines).EnableChange(False);
          try
            SendMessage(Handle, WM_SETTEXT, 0, 0);
            //????????? I think LParam should be '' but not 0;[wang junjiao]
            UpdateTextModes(Value);
            FPlainText := Value;
          finally
            TWideRichEditStrings(Lines).EnableChange(True);
          end;
          Lines.LoadFromStream(MemStream);
        finally
          TWideRichEditStrings(Lines).Format := StreamFmt;
          TWideRichEditStrings(Lines).Mode := Mode;
        end;
      finally
        MemStream.Free;
      end;
    end;
    FPlainText := Value;
  end;
end;

procedure TRxCustomRichEdit.UpdateTextModes(Plain: Boolean);
const
  TextModes: array[Boolean] of DWORD = (TM_RICHTEXT, TM_PLAINTEXT);
  UndoModes: array[Boolean] of DWORD = (TM_SINGLELEVELUNDO, TM_MULTILEVELUNDO);
begin
  if (RichEditVersion >= 2) and HandleAllocated then begin
    SendMessage(Handle, EM_SETTEXTMODE, TextModes[Plain] or
      UndoModes[FUndoLimit > 1], 0);
  end;
end;

procedure TRxCustomRichEdit.CMColorChanged(var Message: TMessage);
begin
  inherited;
  SendMessage(Handle, EM_SETBKGNDCOLOR, 0, ColorToRGB(Color))
end;

(*
procedure TRxCustomRichEdit.EMReplaceSel(var Message: TMessage);
var
  CharRange: TCharRange;
  W: WideString;
begin
  Perform(EM_EXGETSEL, 0, Longint(@CharRange));
  W:= PWideChar(Message.LParam);
  with CharRange do
    cpMax := cpMin + WStrLen((PWideChar(Message.lParam)));
    //cpMax := cpMin + Integer(StrLen(PChar(Message.lParam)));
  if (FUndoLimit > 1) and (RichEditVersion >= 2) and not FLinesUpdating then
    Message.wParam := 1; { allow Undo }
  //Message.Result:= Perform(Message.Msg, Message.WParam, Message.LParam);//will cause stack overflow
  Message.Result:= PerformReally(Message.Msg, Message.WParam, Message.LParam);
  //inherited;
  if not FLinesUpdating then begin
    Perform(EM_EXSETSEL, 0, Longint(@CharRange));
    Perform(EM_SCROLLCARET, 0, 0);
  end;
end;

procedure TRxCustomRichEdit.EMGetSelText(var Message: TMessage);
var
  W: WideString;
  S: String;
  P: PChar;
  L: Integer;
begin
  if SelLength=0 then
    begin
      Message.Result:= 0;
      Exit;
    end;

  if not __Wide then
    begin
      P:= PChar(Message.LParam);
      L:= SelLength;
      SetLength(W, L);
      Message.LParam:= Integer(@W[1]);
    end;

  Message.Result:= PerformReally(Message.Msg, Message.WParam, Message.LParam);

  if not __Wide then
    begin
      WideCharToMultiByte(__FCP, 0, @W[1], -1, P, L, nil, nil);
      Message.LParam:= Integer(P);
    end;
  
end;
*)
procedure TRxCustomRichEdit.EMReplaceSel(var Message: TMessage);
var
  W: WideString;
begin
  if not __Wide then
    begin
      W:= CharToWide(PChar(Message.LParam), __FCP);
      Message.LParam:= Integer(@W[1]);
    end;
  Message.WParam:= 1;
  Message.Result:= PerformReally(Message.Msg, Message.WParam, Message.LParam);
end;

procedure TRxCustomRichEdit.EMGetSelText(var Message: TMessage);
var
  W: WideString;
  //S: String;
  P: PChar;
  L: Integer;
begin
  if SelLength=0 then
    begin
      Message.Result:= 0;
      Exit;
    end;
  P := nil;
  L := 0;
  if not __Wide then
    begin
      P:= PChar(Message.LParam);
      L:= SelLength;
      SetLength(W, L);
      Message.LParam:= Integer(@W[1]);
    end;
  Message.Result:= PerformReally(Message.Msg, Message.WParam, Message.LParam);
  if not __Wide then
    begin
      WideCharToMultiByte(__FCP, 0, @W[1], -1, P, L, nil, nil);
      Message.LParam:= Integer(P);
    end;
end;

procedure TRxCustomRichEdit.EMGetTextRange(var Message: TMessage);
var
  W: WideString;
  P: PChar;
type
  PTextRange = ^TTextRange;
begin
  P := nil; 
  if not __Wide then
    with PTextRange(Message.LParam)^ do
      begin
        P:= PChar(lpstrText);
        SetLength(W, Abs(chrg.cpMax - chrg.cpMin));
        lpstrText:= PWideChar(@W[1]);
      end;
  Message.Result:= PerformReally(Message.Msg, Message.WParam, Message.LParam);
  if not __Wide then
    with PTextRange(Message.LParam)^ do
      begin
        StrPCopy(P, WideToChar(W, __FCP));
        lpstrText:= PWideChar(P);
      end;
end;

procedure TRxCustomRichEdit.WMSetText(var Message: TMessage);
var
  W: WideString;
begin
  if (not __Wide) and (Message.LParam <> 0) then
    begin
      W:= CharToWide(PChar(Message.LParam), __FCP);
      Message.LParam:= Integer(@W[1]);
    end;
  Message.WParam:= 0;
  Message.Result:= PerformReally(Message.Msg, Message.WParam, Message.LParam);
end;

(*
function TRxCustomRichEdit.PerformReally(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  wndproc: TFNWndProc;
begin
  Result := 0;
  if HandleAllocated then  begin
    wndproc := TFNWndProc(GetWindowLong(Handle,GWL_WNDPROC));
    Result:= CallWindowProc(wndproc, Handle, Msg, Wparam, Lparam)
  end;
end;
*)
{
procedure TRxCustomRichEdit.DefineProperties(Filer:TFiler);
  function DoWrite: Boolean;
  begin
    if Filer.Ancestor <> nil then /// check Ancestor for an inherited value
    begin
      if TRxCustomRichEdit(Filer.Ancestor).Lines = nil then
        Result := Lines <> nil
      else if (Lines = nil) or
         (TRxCustomRichEdit(Filer.Ancestor).Lines.ClassName <> Lines.ClassName) then
        Result := True

      else Result := False;
    end
    else /// no inherited value -- check for default (nil) value
      Result := Lines <> nil;
  end;

begin
  inherited; /// allow base classes to define properties
  Filer.DefineBinaryProperty('Lines', LoadRTFProperty, SaveRTFProperty, DoWrite);
end;
}

procedure TRxCustomRichEdit.LoadRTFProperty(Reader:TStream);
var
  b:Boolean;
begin
  Reader.Position :=0;
  Reader.Read(B,SizeOf(B));
  Reader.Position :=1;
  if B then Lines.LoadFromStream(Reader);
end;

procedure TRxCustomRichEdit.SaveRTFProperty(Writer:TStream);
var
  b:boolean;
begin
{  Writer.WriteBoolean(Lines<>nil); }
  b:=Lines<>nil;
  Writer.Position :=0;
  Writer.Write(B,SizeOf(B));
  Writer.Position :=1;
  if Lines<>nil then
    Lines.SaveToStream(Writer);
end;

function TRxCustomRichEdit.PerformReally(Msg: Cardinal; WParam, LParam: Longint): Longint;
begin
  Result := 0;
  if HandleAllocated then
    if IsWinNT {and FWide }then
      Result:= CallWindowProcW(__DefWndProcW, Handle, Msg, Wparam, Lparam)
    else
      Result:= CallWindowProcA(__DefWndProcA, Handle, Msg, Wparam, Lparam)
end;

procedure TRxCustomRichEdit.SetRichEditStrings(Value: TWideStrings);
begin
  FRichEditStrings.Assign(Value);
end;

procedure TRxCustomRichEdit.CloseObjects;
var
  I: Integer;
  ReObject: TReObject;
begin
  if Assigned(FRichEditOle) then begin
    FillChar(ReObject, SizeOf(ReObject), 0);
    ReObject.cbStruct := SizeOf(ReObject);
    with IRichEditOle(FRichEditOle) do begin
      for I := GetObjectCount - 1 downto 0 do
        if Succeeded(GetObject(I, ReObject, REO_GETOBJ_POLEOBJ)) then begin
          if ReObject.dwFlags and REO_INPLACEACTIVE <> 0 then
            IRichEditOle(FRichEditOle).InPlaceDeactivate;
          ReObject.poleobj.Close(OLECLOSE_NOSAVE);
          ReleaseObject(ReObject.poleobj);
        end;
    end;
  end;
end;

function TRxCustomRichEdit.PasteSpecialDialog: Boolean;

  procedure SetPasteEntry(var Entry: TOleUIPasteEntry; Format: TClipFormat;
    tymed: DWORD; const FormatName, ResultText: string; Flags: DWORD);
  begin
    with Entry do begin
      fmtetc.cfFormat := Format;
      fmtetc.dwAspect := DVASPECT_CONTENT;
      fmtetc.lIndex := -1;
      fmtetc.tymed := tymed;
      if FormatName <> '' then lpstrFormatName := PChar(FormatName)
      else lpstrFormatName := '%s';
      if ResultText <> '' then lpstrResultText := PChar(ResultText)
      else lpstrResultText := '%s';
      dwFlags := Flags;
    end;
  end;

const
  PasteFormatCount = 6;
var
  Data: TOleUIPasteSpecial;
  PasteFormats: array[0..PasteFormatCount - 1] of TOleUIPasteEntry;
  Format: Integer;
  OleClientSite: IOleClientSite;
  Storage: IStorage;
  OleObject: IOleObject;
  ReObject: TReObject;
  Selection: TCharRange;
begin
  Result := False;
  if not CanPaste or not Assigned(FRichEditOle) then Exit;
  FillChar(Data, SizeOf(Data), 0);
  FillChar(PasteFormats, SizeOf(PasteFormats), 0);
  with Data do begin
    cbStruct := SizeOf(Data);
    hWndOwner := Handle;
    arrPasteEntries := @PasteFormats;
    cPasteEntries := PasteFormatCount;
    arrLinkTypes := @CFLinkSource;
    cLinkTypes := 1;
    dwFlags := PSF_SELECTPASTE;
  end;
  SetPasteEntry(PasteFormats[0], CFEmbeddedObject, TYMED_ISTORAGE, '', '',
    OLEUIPASTE_PASTE or OLEUIPASTE_ENABLEICON);
  SetPasteEntry(PasteFormats[1], CFLinkSource, TYMED_ISTREAM, '', '',
    OLEUIPASTE_LINKTYPE1 or OLEUIPASTE_ENABLEICON);
  SetPasteEntry(PasteFormats[2], CFRtf, TYMED_ISTORAGE,
    CF_RTF, CF_RTF, OLEUIPASTE_PASTE);
  SetPasteEntry(PasteFormats[3], CFRtfNoObjs, TYMED_ISTORAGE,
    CF_RTFNOOBJS, CF_RTFNOOBJS, OLEUIPASTE_PASTE);
  SetPasteEntry(PasteFormats[4], CF_TEXT, TYMED_HGLOBAL,
    'Unformatted text', 'text without any formatting', OLEUIPASTE_PASTE);
  SetPasteEntry(PasteFormats[5], CF_BITMAP, TYMED_GDI,
    'Windows Bitmap', 'bitmap image', OLEUIPASTE_PASTE);
  try
    if OleUIPasteSpecial(Data) = OLEUI_OK then begin
      Result := True;
      if Data.nSelectedIndex in [0, 1] then begin
        { CFEmbeddedObject, CFLinkSource }
        FillChar(ReObject, SizeOf(TReObject), 0);
        IRichEditOle(FRichEditOle).GetClientSite(OleClientSite);
        Storage := nil;
        try
          CreateStorage(Storage);
          case Data.nSelectedIndex of
            0: OleCheck(OleCreateFromData(Data.lpSrcDataObj,
               {$IFDEF RX_D3} IOleObject {$ELSE} IID_IOleObject {$ENDIF},
               OLERENDER_DRAW, nil, OleClientSite, Storage, OleObject));
            1: OleCheck(OleCreateLinkFromData(Data.lpSrcDataObj,
               {$IFDEF RX_D3} IOleObject {$ELSE} IID_IOleObject {$ENDIF},
               OLERENDER_DRAW, nil, OleClientSite, Storage, OleObject));
          end;
          try
            with ReObject do begin
              cbStruct := SizeOf(TReObject);
              cp := REO_CP_SELECTION;
              poleobj := OleObject;
              OleObject.GetUserClassID(clsid);
              pstg := Storage;
              polesite := OleClientSite;
              dvAspect := DVASPECT_CONTENT;
              dwFlags := REO_RESIZABLE;
              OleCheck(OleSetDrawAspect(OleObject,
                Data.dwFlags and PSF_CHECKDISPLAYASICON <> 0,
                Data.hMetaPict, dvAspect));
            end;
            SendMessage(Handle, EM_EXGETSEL, 0, Longint(@Selection));
            Selection.cpMax := Selection.cpMin + 1;
            OleCheck(IRichEditOle(FRichEditOle).InsertObject(ReObject));
            SendMessage(Handle, EM_EXSETSEL, 0, Longint(@Selection));
            IRichEditOle(FRichEditOle).SetDvaspect(
              Longint(REO_IOB_SELECTION), ReObject.dvAspect);
          finally
            ReleaseObject(OleObject);
          end;
        finally
          ReleaseObject(OleClientSite);
          ReleaseObject(Storage);
        end;
      end
      else begin
        Format := PasteFormats[Data.nSelectedIndex].fmtetc.cfFormat;
        OleCheck(IRichEditOle(FRichEditOle).ImportDataObject(
          Data.lpSrcDataObj, Format, Data.hMetaPict));
      end;
      SendMessage(Handle, EM_SCROLLCARET, 0, 0);
    end;
  finally
    DestroyMetaPict(Data.hMetaPict);
    ReleaseObject(Data.lpSrcDataObj);
  end;
end;

function TRxCustomRichEdit.InsertObjectDialog: Boolean;
var
  Data: TOleUIInsertObject;
  NameBuffer: array[0..255] of Char;
  OleClientSite: IOleClientSite;
  Storage: IStorage;
  OleObject: IOleObject;
  ReObject: TReObject;
  IsNewObject: Boolean;
  Selection: TCharRange;
begin
  FillChar(Data, SizeOf(Data), 0);
  FillChar(NameBuffer, SizeOf(NameBuffer), 0);
  FillChar(ReObject, SizeOf(TReObject), 0);
  if Assigned(FRichEditOle) then begin
    IRichEditOle(FRichEditOle).GetClientSite(OleClientSite);
    Storage := nil;
    try
      CreateStorage(Storage);
      with Data do begin
        cbStruct := SizeOf(Data);
        dwFlags := IOF_SELECTCREATENEW or IOF_VERIFYSERVERSEXIST or 
          IOF_CREATENEWOBJECT or IOF_CREATEFILEOBJECT or IOF_CREATELINKOBJECT;
        hWndOwner := Handle;
        lpszFile := NameBuffer;
        cchFile := SizeOf(NameBuffer);
        iid := {$IFDEF RX_D3} IOleObject {$ELSE} IID_IOleObject {$ENDIF};
        oleRender := OLERENDER_DRAW;
        lpIOleClientSite := OleClientSite;
        lpIStorage := Storage;
        ppvObj := @OleObject;
      end;
      try
        Result := OleUIInsertObject(Data) = OLEUI_OK;
        if Result then
        try
          IsNewObject := Data.dwFlags and IOF_SELECTCREATENEW = IOF_SELECTCREATENEW;
          with ReObject do begin
            cbStruct := SizeOf(TReObject);
            cp := REO_CP_SELECTION;
            clsid := Data.clsid;
            poleobj := OleObject;
            pstg := Storage;
            polesite := OleClientSite;
            dvAspect := DVASPECT_CONTENT;
            dwFlags := REO_RESIZABLE;
            if IsNewObject then dwFlags := dwFlags or REO_BLANK;
            OleCheck(OleSetDrawAspect(OleObject,
              Data.dwFlags and IOF_CHECKDISPLAYASICON <> 0,
              Data.hMetaPict, dvAspect));
          end;
          SendMessage(Handle, EM_EXGETSEL, 0, Longint(@Selection));
          Selection.cpMax := Selection.cpMin + 1;
          OleCheck(IRichEditOle(FRichEditOle).InsertObject(ReObject));
          SendMessage(Handle, EM_EXSETSEL, 0, Longint(@Selection));
          SendMessage(Handle, EM_SCROLLCARET, 0, 0);
          IRichEditOle(FRichEditOle).SetDvaspect(
            Longint(REO_IOB_SELECTION), ReObject.dvAspect);
          if IsNewObject then OleObject.DoVerb(OLEIVERB_SHOW, nil,
            OleClientSite, 0, Handle, ClientRect);
        finally
          ReleaseObject(OleObject);
        end;
      finally
        DestroyMetaPict(Data.hMetaPict);
      end;
    finally
      ReleaseObject(OleClientSite);
      ReleaseObject(Storage);
    end;
  end
  else Result := False;
end;

function TRxCustomRichEdit.ObjectPropertiesDialog: Boolean;
var
  ObjectProps: TOleUIObjectProps;
  PropSheet: TPropSheetHeader;
  GeneralProps: TOleUIGnrlProps;
  ViewProps: TOleUIViewProps;
  LinkProps: TOleUILinkProps;
  DialogCaption: string;
  ReObject: TReObject;
begin
  Result := False;
  if not Assigned(FRichEditOle) or (SelectionType <> [stObject]) then Exit;
  FillChar(ObjectProps, SizeOf(ObjectProps), 0);
  FillChar(PropSheet, SizeOf(PropSheet), 0);
  FillChar(GeneralProps, SizeOf(GeneralProps), 0);
  FillChar(ViewProps, SizeOf(ViewProps), 0);
  FillChar(LinkProps, SizeOf(LinkProps), 0);
  FillChar(ReObject, SizeOf(ReObject), 0);
  ReObject.cbStruct := SizeOf(ReObject);
  if Succeeded(IRichEditOle(FRichEditOle).GetObject(Longint(REO_IOB_SELECTION),
    ReObject, REO_GETOBJ_POLEOBJ or REO_GETOBJ_POLESITE)) then
  try
    if ReObject.dwFlags and REO_INPLACEACTIVE = 0 then begin
      ObjectProps.cbStruct := SizeOf(ObjectProps);
      ObjectProps.dwFlags := OPF_DISABLECONVERT;
      ObjectProps.lpPS := @PropSheet;
      ObjectProps.lpObjInfo := TOleUIObjInfo.Create(Self, ReObject);
      if (ReObject.dwFlags and REO_LINK) <> 0 then begin
        ObjectProps.dwFlags := ObjectProps.dwFlags or OPF_OBJECTISLINK;
        ObjectProps.lpLinkInfo := TOleUILinkInfo.Create(Self, ReObject);
      end;
      ObjectProps.lpGP := @GeneralProps;
      ObjectProps.lpVP := @ViewProps;
      ObjectProps.lpLP := @LinkProps;
      PropSheet.dwSize := SizeOf(PropSheet);
      PropSheet.hWndParent := Handle;
{$IFDEF RX_D3}
      PropSheet.hInstance := MainInstance;
{$ELSE}
      PropSheet.hInstance := HInstance;
{$ENDIF}
      DialogCaption := Format(ResStr(SPropDlgCaption),
        [GetFullNameStr(ReObject.poleobj)]);
      PropSheet.pszCaption := PChar(DialogCaption);
      GeneralProps.cbStruct := SizeOf(GeneralProps);
      ViewProps.cbStruct := SizeOf(ViewProps);
      ViewProps.dwFlags := VPF_DISABLESCALE;
      LinkProps.cbStruct := SizeOf(LinkProps);
      LinkProps.dwFlags := ELF_DISABLECANCELLINK;
      Result := OleUIObjectProperties(ObjectProps) = OLEUI_OK;
    end;
  finally
{$IFNDEF RX_D3}
    ObjectProps.lpLinkInfo.Free;
    ObjectProps.lpObjInfo.Free;
    ReleaseObject(ReObject.polesite);
    ReleaseObject(ReObject.poleobj);
{$ENDIF}
  end;
end;

procedure TRxCustomRichEdit.Print(const Caption: string);
var
  Range: TFormatRange;
  LastChar, MaxLen, LogX, LogY, OldMap: Integer;
  SaveRect: TRect;
  TextLenEx: TGetTextLengthEx;
begin
  FillChar(Range, SizeOf(TFormatRange), 0);
  with Printer, Range do begin
    Title := Caption;
    BeginDoc;
    hdc := Handle;
    hdcTarget := hdc;
    LogX := GetDeviceCaps(Handle, LOGPIXELSX);
    LogY := GetDeviceCaps(Handle, LOGPIXELSY);
    if IsRectEmpty(PageRect) then begin
      rc.right := PageWidth * 1440 div LogX;
      rc.bottom := PageHeight * 1440 div LogY;
    end
    else begin
      rc.left := PageRect.Left * 1440 div LogX;
      rc.top := PageRect.Top * 1440 div LogY;
      rc.right := PageRect.Right * 1440 div LogX;
      rc.bottom := PageRect.Bottom * 1440 div LogY;
    end;
    rcPage := rc;
    SaveRect := rc;
    LastChar := 0;
    if RichEditVersion >= 2 then begin
      with TextLenEx do begin
        flags := GTL_DEFAULT;
        codepage := CP_ACP;
      end;
      MaxLen := Perform(EM_GETTEXTLENGTHEX, WParam(@TextLenEx), 0);
    end
    else MaxLen := GetTextLen;
    chrg.cpMax := -1;
    { ensure printer DC is in text map mode }
    OldMap := SetMapMode(hdc, MM_TEXT);
    SendMessage(Self.Handle, EM_FORMATRANGE, 0, 0);    { flush buffer }
    try
      repeat
        rc := SaveRect;
        chrg.cpMin := LastChar;
        LastChar := SendMessage(Self.Handle, EM_FORMATRANGE, 1, Longint(@Range));
        if (LastChar < MaxLen) and (LastChar <> -1) then NewPage;
      until (LastChar >= MaxLen) or (LastChar = -1);
      EndDoc;
    finally
      SendMessage(Self.Handle, EM_FORMATRANGE, 0, 0);  { flush buffer }
      SetMapMode(hdc, OldMap);       { restore previous map mode }
    end;
  end;
end;

var
  Painting: Boolean = False;

procedure TRxCustomRichEdit.WMPaint(var Message: TWMPaint);
var
  R, R1: TRect;
begin
  if RichEditVersion >= 2 then
    inherited
  else begin
    if GetUpdateRect(Handle, R, True) then
    begin
      with ClientRect do R1 := Rect(Right - 3, Top, Right, Bottom);
      if IntersectRect(R, R, R1) then InvalidateRect(Handle, @R1, True);
    end;
    if Painting then
      Invalidate
    else begin
      Painting := True;
      try
        inherited;
      finally
        Painting := False;
      end;
    end;
  end;
end;

procedure TRxCustomRichEdit.WMDestroy(var Msg: TWMDestroy);
begin
  CloseObjects;
  ReleaseObject(FRichEditOle);
  inherited;
end;

procedure TRxCustomRichEdit.WMMouseMove(var Message: TMessage);
begin
  inherited;
end;

procedure TRxCustomRichEdit.WMSetCursor(var Message: TWMSetCursor);
begin
  inherited;
end;

{$IFDEF RX_D5}
procedure TRxCustomRichEdit.WMRButtonUp(var Message: TMessage);
begin
  { RichEd20 does not pass the WM_RBUTTONUP message to defwndproc, }
  { so we get no WM_CONTEXTMENU message. Simulate message here.    }
  if Win32MajorVersion < 5 then
    Perform(WM_CONTEXTMENU, Handle, LParam(PointToSmallPoint(
      ClientToScreen(SmallPointToPoint(TWMMouse(Message).Pos)))));
  inherited;
end;
{$ENDIF}

procedure TRxCustomRichEdit.CNNotify(var Message: TWMNotify);
var
  AMsg: TMessage;
  tmp: WideString;
begin
  with Message do
    case NMHdr^.code of
      EN_SELCHANGE: SelectionChange;
      EN_REQUESTRESIZE: RequestSize(PReqSize(NMHdr)^.rc);
      EN_SAVECLIPBOARD:
        with PENSaveClipboard(NMHdr)^ do
          if not SaveClipboard(cObjectCount, cch) then Result := 1;
      EN_PROTECTED:
        with PENProtected(NMHdr)^ do begin
          AMsg.Msg := Msg;
          AMsg.WParam := WParam;
          AMsg.LParam := LParam;
          AMsg.Result := 0;
          if not ProtectChange(AMsg, chrg.cpMin, chrg.cpMax) then
            Result := 1;
        end;
      EN_LINK:
        with PENLink(NMHdr)^ do begin
          case Msg of
            WM_RBUTTONDOWN:
              begin
                FClickRange := chrg;
                FClickBtn := mbRight;
              end;
            WM_RBUTTONUP:
              begin
                if (FClickBtn = mbRight) and (FClickRange.cpMin = chrg.cpMin) and
                  (FClickRange.cpMax = chrg.cpMax) then begin
                  tmp := GetTextRange(chrg.cpMin, chrg.cpMax);
                  URLClick(WideCharToString(PWideChar(tmp)), mbRight);
                  //URLClick(GetTextRange(chrg.cpMin, chrg.cpMax), mbRight);
                end;
                with FClickRange do begin
                  cpMin := -1;
                  cpMax := -1;
                end;
              end;
            WM_LBUTTONDOWN:
              begin
                FClickRange := chrg;
                FClickBtn := mbLeft;
              end;
            WM_LBUTTONUP:
              begin
                if (FClickBtn = mbLeft) and (FClickRange.cpMin = chrg.cpMin) and
                  (FClickRange.cpMax = chrg.cpMax) then begin
                  tmp := GetTextRange(chrg.cpMin, chrg.cpMax);
                  URLClick(WideCharToString(PWideChar(tmp)), mbRight);
                  //URLClick(GetTextRange(chrg.cpMin, chrg.cpMax), mbLeft);
                end;
                with FClickRange do begin
                  cpMin := -1;
                  cpMax := -1;
                end;
              end;
          end;
        end;
      EN_STOPNOUNDO:
        begin
          { cannot allocate enough memory to maintain the undo state }
        end;
    end;
end;

(*
procedure TRxCustomRichEdit.EMStreamIn(var Message: TMessage);
begin
  if __StreamSel then
    Message.WParam:= Message.WParam or SFF_SELECTION;
  inherited;
end;

procedure TRxCustomRichEdit.EMStreamOut(var Message: TMessage);
begin
  if __StreamSel then
    Message.WParam:= Message.WParam or SFF_SELECTION;
  inherited;
end;
*)

function TRxCustomRichEdit.SaveClipboard(NumObj, NumChars: Integer): Boolean;
begin
  Result := True;
  if Assigned(OnSaveClipboard) then
    OnSaveClipboard(Self, NumObj, NumChars, Result);
end;

function TRxCustomRichEdit.ProtectChange(const Message: TMessage; StartPos,
  EndPos: Integer): Boolean;
begin
  Result := False;
  if Assigned(OnProtectChangeEx) then
    OnProtectChangeEx(Self, Message, StartPos, EndPos, Result)
  else if Assigned(OnProtectChange) then
    OnProtectChange(Self, StartPos, EndPos, Result);
end;

procedure TRxCustomRichEdit.SelectionChange;
begin
  if Assigned(OnSelectionChange) then OnSelectionChange(Self);
end;

procedure TRxCustomRichEdit.RequestSize(const Rect: TRect);
begin
  if Assigned(OnResizeRequest) then OnResizeRequest(Self, Rect);
end;

procedure TRxCustomRichEdit.URLClick(const URLText: string; Button: TMouseButton);
begin
  if Assigned(OnURLClick) then OnURLClick(Self, URLText, Button);
end;

function TRxCustomRichEdit.FindText(const SearchStr: string;
  StartPos, Length: Integer; Options: TRichSearchTypes): Integer;
var
  Find: TFindTextEx;
  Flags: Integer;
  wSearchStr: WideString;
begin
  with Find.chrg do begin
    cpMin := StartPos;
    cpMax := cpMin + Abs(Length);
  end;
  if RichEditVersion >= 2 then begin
    if not (stBackward in Options) then Flags := FT_DOWN
    else Flags := 0;
  end
  else begin
    Options := Options - [stBackward];
    Flags := 0;
  end;
  if stWholeWord in Options then Flags := Flags or FT_WHOLEWORD;
  if stMatchCase in Options then Flags := Flags or FT_MATCHCASE;
  wSearchStr := SearchStr;
  Find.lpstrText := PWideChar(wSearchStr);
  Result := SendMessage(Handle, EM_FINDTEXTEX, Flags, Longint(@Find));
  if (Result >= 0) and (stSetSelection in Options) then begin
    SendMessage(Handle, EM_EXSETSEL, 0, Longint(@Find.chrgText));
    SendMessage(Handle, EM_SCROLLCARET, 0, 0);
  end;
end;

procedure TRxCustomRichEdit.ClearUndo;
begin
  SendMessage(Handle, EM_EMPTYUNDOBUFFER, 0, 0);
end;

procedure TRxCustomRichEdit.Redo;
begin
  SendMessage(Handle, EM_REDO, 0, 0);
end;

{$IFNDEF RX_V110}
procedure TRxCustomRichEdit.Undo;
begin
  SendMessage(Handle, WM_UNDO, 0, 0);
end;
{$ENDIF}

procedure TRxCustomRichEdit.StopGroupTyping;
begin
  if (RichEditVersion >= 2) and HandleAllocated then
    SendMessage(Handle, EM_STOPGROUPTYPING, 0, 0);
end;

{$IFDEF RX_D3}
procedure TRxCustomRichEdit.SetUIActive(Active: Boolean);
var
  Form: TCustomForm;
begin
  try
    Form := GetParentForm(Self);
    if Form <> nil then
      if Active then begin
        if (Form.ActiveOleControl <> nil) and
          (Form.ActiveOleControl <> Self) then
          Form.ActiveOleControl.Perform(CM_UIDEACTIVATE, 0, 0);
        Form.ActiveOleControl := Self;
        if AllowInPlace and CanFocus then SetFocus;
      end
      else begin
        if Form.ActiveOleControl = Self then Form.ActiveOleControl := nil;
        if (Form.ActiveControl = Self) and AllowInPlace then begin
          Windows.SetFocus(Handle);
          SelectionChange;
        end;
      end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TRxCustomRichEdit.CMDocWindowActivate(var Message: TMessage);
begin
  if Assigned(FCallback) then
    with TRichEditOleCallback(FCallback) do
      if Assigned(FDocForm) and IsFormMDIChild(FDocForm.Form) then begin
        if Message.WParam = 0 then begin
          FFrameForm.SetMenu(0, 0, 0);
          FFrameForm.ClearBorderSpace;
        end;
      end;
end;

procedure TRxCustomRichEdit.CMUIDeactivate(var Message: TMessage);
begin
  if (GetParentForm(Self) <> nil) and Assigned(FRichEditOle) and
    (GetParentForm(Self).ActiveOleControl = Self) then
    {IRichEditOle(FRichEditOle).InPlaceDeactivate};
end;
{$ENDIF RX_D3}

{ Find & Replace Dialogs }

procedure TRxCustomRichEdit.SetupFindDialog(Dialog: TFindDialog;
  const SearchStr, ReplaceStr: string);
begin
  with Dialog do begin
    if SearchStr <> '' then FindText := SearchStr;
    if RichEditVersion = 1 then
      Options := Options + [frHideUpDown, frDown];
    OnFind := FindDialogFind;
{$IFDEF RX_D3}
    OnClose := FindDialogClose;
{$ENDIF}
  end;
  if Dialog is TReplaceDialog then
    with TReplaceDialog(Dialog) do begin
      if ReplaceStr <> '' then ReplaceText := ReplaceStr;
      OnReplace := ReplaceDialogReplace;
    end;
end;

function TRxCustomRichEdit.FindDialog(const SearchStr: string): TFindDialog;
begin
  if FFindDialog = nil then begin
    FFindDialog := TFindDialog.Create(Self);
    if FReplaceDialog <> nil then
      FFindDialog.FindText := FReplaceDialog.FindText;
  end;
  Result := FFindDialog;
  SetupFindDialog(FFindDialog, SearchStr, '');
  FFindDialog.Execute;
end;

function TRxCustomRichEdit.ReplaceDialog(const SearchStr,
  ReplaceStr: string): TReplaceDialog;
begin
  if FReplaceDialog = nil then begin
    FReplaceDialog := TReplaceDialog.Create(Self);
    if FFindDialog <> nil then
      FReplaceDialog.FindText := FFindDialog.FindText;
  end;
  Result := FReplaceDialog;
  SetupFindDialog(FReplaceDialog, SearchStr, ReplaceStr);
  FReplaceDialog.Execute;
end;

function TRxCustomRichEdit.GetCanFindNext: Boolean;
begin
  Result := HandleAllocated and (FLastFind <> nil) and
    (FLastFind.FindText <> '');
end;

function TRxCustomRichEdit.FindNext: Boolean;
begin
  if CanFindNext then Result := FindEditText(FLastFind, False, True)
  else Result := False;
end;

procedure TRxCustomRichEdit.AdjustFindDialogPosition(Dialog: TFindDialog);
var
  TextRect, R: TRect;
begin
  if Dialog.Handle = 0 then Exit;
  with TextRect do begin
    TopLeft := ClientToScreen(GetCharPos(SelStart));
    BottomRight := ClientToScreen(GetCharPos(SelStart + SelLength));
    Inc(Bottom, 20);
  end;
  with Dialog do begin
    GetWindowRect(Handle, R);
    if PtInRect(R, TextRect.TopLeft) or PtInRect(R, TextRect.BottomRight) then
    begin
      if TextRect.Top > R.Bottom - R.Top + 20 then
        OffsetRect(R, 0, TextRect.Top - R.Bottom - 20)
      else begin
        if TextRect.Top + R.Bottom - R.Top < GetSystemMetrics(SM_CYSCREEN) then
          OffsetRect(R, 0, 40 + TextRect.Top - R.Top);
      end;
      Position := R.TopLeft;
    end;
  end;
end;

function Max(A, B: Longint): Longint;
begin
  if A > B then Result := A
  else Result := B;
end;

function Min(A, B: Longint): Longint;
begin
  if A < B then Result := A
  else Result := B;
end;

function TRxCustomRichEdit.FindEditText(Dialog: TFindDialog; AdjustPos, Events: Boolean): Boolean;
var
  Length, StartPos: Integer;
  SrchOptions: TRichSearchTypes;
begin
  with TFindDialog(Dialog) do begin
    SrchOptions := [stSetSelection];
    if frDown in Options then begin
      StartPos := Max(SelStart, SelStart + SelLength);
      Length := System.Length(Text) - StartPos + 1;
    end
    else begin
      SrchOptions := SrchOptions + [stBackward];
      StartPos := Min(SelStart, SelStart + SelLength);
      Length := StartPos + 1;
    end;
    if frMatchCase in Options then
      SrchOptions := SrchOptions + [stMatchCase];
    if frWholeWord in Options then
      SrchOptions := SrchOptions + [stWholeWord];
    Result := Self.FindText(FindText, StartPos, Length, SrchOptions) >= 0;
    if FindText <> '' then FLastFind := Dialog;
    if Result then begin
      if AdjustPos then AdjustFindDialogPosition(Dialog);
    end
    else if Events then TextNotFound(Dialog);
  end;
end;

procedure TRxCustomRichEdit.TextNotFound(Dialog: TFindDialog);
begin
  with Dialog do
    if Assigned(FOnTextNotFound) then FOnTextNotFound(Self, FindText);
end;

procedure TRxCustomRichEdit.FindDialogFind(Sender: TObject);
begin
  FindEditText(TFindDialog(Sender), True, True);
end;

procedure TRxCustomRichEdit.ReplaceDialogReplace(Sender: TObject);
var
  Cnt: Integer;
  SaveSelChange: TNotifyEvent;
begin
  with TReplaceDialog(Sender) do begin
    if (frReplaceAll in Options) then begin
      Cnt := 0;
      SaveSelChange := FOnSelChange;
      TWideRichEditStrings(Lines).EnableChange(False);
      try
        FOnSelChange := nil;
        while FindEditText(TFindDialog(Sender), False, False) do begin
          SelText := ReplaceText;
          Inc(Cnt);
        end;
        if Cnt = 0 then TextNotFound(TFindDialog(Sender))
        else AdjustFindDialogPosition(TFindDialog(Sender));
      finally
        TWideRichEditStrings(Lines).EnableChange(True);
        FOnSelChange := SaveSelChange;
        if Cnt > 0 then begin
          Change;
          SelectionChange;
        end;
      end;
    end
    else if (frReplace in Options) then begin
      if FindEditText(TFindDialog(Sender), True, True) then
        SelText := ReplaceText;
    end;
  end;
end;

{$IFDEF RX_D3}
procedure TRxCustomRichEdit.FindDialogClose(Sender: TObject);
begin
  CloseFindDialog(Sender as TFindDialog);
end;

procedure TRxCustomRichEdit.CloseFindDialog(Dialog: TFindDialog);
begin
  if Assigned(FOnCloseFindDialog) then FOnCloseFindDialog(Self, Dialog);
end;
{$ENDIF RX_D3}

{ Conversion formats }

procedure AppendConversionFormat(const Ext: string; Plain: Boolean;
  AClass: TConversionClass);
var
  NewRec: PRichConversionFormat;
begin
  New(NewRec);
  with NewRec^ do begin
{$IFNDEF VER90}
    Extension := AnsiLowerCaseFileName(Ext);
{$ELSE}
    Extension := LowerCase(Ext);
{$ENDIF}
    PlainText := Plain;
    ConversionClass := AClass;
    Next := ConversionFormatList;
  end;
  ConversionFormatList := NewRec;
end;

class procedure TRxCustomRichEdit.RegisterConversionFormat(const AExtension: string;
  APlainText: Boolean; AConversionClass: TConversionClass);
begin
  AppendConversionFormat(AExtension, APlainText, AConversionClass);
end;

procedure TRxCustomRichEdit.ShowEditor;
begin
  TRtfEditDlg.ShowEditor(Self);
end;

procedure Register;
begin
  RegisterComponents('Win32', [TRxRichEdit]);
  RegisterComponents('Standard',[TRtfEditDlg]);
  RegisterPropertyEditor(TypeInfo(TWideStrings),TRxRichEdit,'Lines',TRTFProperty);
end;

var
  OldError: Longint;
  FLibHandle: THandle;
  Ver: TOsVersionInfo;
  OSVI: TOSVersionInfo;


{ Initialization part }
initialization
  RichEditVersion := 1;
  OldError := SetErrorMode(SEM_NOOPENFILEERRORBOX);
  try
{$IFNDEF RICHEDIT_VER_10}
    FLibHandle := LoadLibrary(RichEdit20ModuleName);
    if (FLibHandle > 0) and (FLibHandle < HINSTANCE_ERROR) then FLibHandle := 0;
    (* 2001.2.14
    if FLibHandle <> 0 then ShowMessage(RichEdit20ModuleName+' loaded.')
    else  ShowMessage(RichEdit20ModuleName+' load failure.');
    *)
{$ELSE}
    FLibHandle := 0;
{$ENDIF}
    if FLibHandle = 0 then begin
      //FLibHandle := LoadLibrary(RichEdit10ModuleName);
      //if (FLibHandle > 0) and (FLibHandle < HINSTANCE_ERROR) then FLibHandle := 0;
      Raise Exception.Create('Riched20.DLL is required but not found in system folder.');
    end
    else begin
      RichEditVersion := 2;
      Ver.dwOSVersionInfoSize := SizeOf(Ver);
      GetVersionEx(Ver);
      with Ver do begin
        if (dwPlatformId = VER_PLATFORM_WIN32_NT) and
          (dwMajorVersion >= 5) then
          RichEditVersion := 3;
      end;
    end;
  finally
    SetErrorMode(OldError);
  end;

  OSVI.dwOSVersionInfoSize:= SizeOf(OSVI);
  GetVersionEx(OSVI);
  IsWinNT:= OSVI.dwPlatformId=VER_PLATFORM_WIN32_NT;

  CFEmbeddedObject := RegisterClipboardFormat(CF_EMBEDDEDOBJECT);
  CFLinkSource := RegisterClipboardFormat(CF_LINKSOURCE);
  CFRtf := RegisterClipboardFormat(CF_RTF);
  CFRtfNoObjs := RegisterClipboardFormat(CF_RTFNOOBJS);
finalization
  if FLibHandle <> 0 then FreeLibrary(FLibHandle);
end.
