object frm_debug: Tfrm_debug
  Left = 415
  Top = 151
  BorderStyle = bsSingle
  Caption = #35843#35797#27169#24335
  ClientHeight = 451
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object MPHexEditor1: TMPHexEditor
    Left = 0
    Top = 0
    Width = 699
    Height = 400
    Cursor = crIBeam
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    BytesPerRow = 16
    Translation = tkAsIs
    OffsetFormat = '-!10:0x|'
    Colors.Background = clWindow
    Colors.ChangedBackground = 11075583
    Colors.ChangedText = clMaroon
    Colors.CursorFrame = clNavy
    Colors.Offset = clBlack
    Colors.OddColumn = clBlue
    Colors.EvenColumn = clNavy
    Colors.CurrentOffsetBackground = clBtnShadow
    Colors.OffsetBackGround = clBtnFace
    Colors.CurrentOffset = clBtnHighlight
    Colors.Grid = clBtnFace
    Colors.NonFocusCursorFrame = clAqua
    FocusFrame = True
    DrawGridLines = False
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 400
    Align = alBottom
    TabOrder = 1
    Height = 51
    Width = 699
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 41
      Height = 21
      AutoSize = False
      Caption = #31471#21475
    end
    object cxButton1: TcxButton
      Left = 504
      Top = 16
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 600
      Top = 16
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 1
    end
    object cxComboBox1: TcxComboBox
      Left = 96
      Top = 13
      Properties.Items.Strings = (
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'LPT1'
        'LPT2'
        '')
      TabOrder = 2
      Text = 'COM1'
      Width = 105
    end
  end
end
