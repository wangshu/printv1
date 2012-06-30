object Form4: TForm4
  Left = 686
  Top = 472
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #32988#24847#38534#31080#25454#25171#21360#31243#24207#21152#23494#29399#21046#20316#26426
  ClientHeight = 257
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 21
  object Label1: TLabel
    Left = 32
    Top = 43
    Width = 82
    Height = 22
    AutoSize = False
    Caption = #21152#23494#29399#24207#21495
  end
  object Label2: TLabel
    Left = 32
    Top = 99
    Width = 82
    Height = 22
    AutoSize = False
    Caption = #24403#21069#26085#26399
  end
  object Label3: TLabel
    Left = 32
    Top = 147
    Width = 82
    Height = 22
    AutoSize = False
    Caption = #25130#27490#26085#26399
  end
  object Label4: TLabel
    Left = 32
    Top = 195
    Width = 82
    Height = 22
    AutoSize = False
    Caption = #21152#23494#23383#31526#20018
  end
  object cxTextEdit1: TcxTextEdit
    Left = 120
    Top = 40
    Properties.MaxLength = 5
    TabOrder = 0
    Width = 121
  end
  object cxTextEdit2: TcxTextEdit
    Left = 120
    Top = 192
    TabOrder = 1
    Width = 321
  end
  object cxButton1: TcxButton
    Left = 336
    Top = 40
    Width = 75
    Height = 25
    Caption = #20889#20837#24207#21495
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 336
    Top = 71
    Width = 75
    Height = 25
    Caption = #20889#20837#26085#26399
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 336
    Top = 102
    Width = 75
    Height = 25
    Caption = #29983#25104#23494#21273
    TabOrder = 4
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 336
    Top = 133
    Width = 75
    Height = 25
    Caption = #35835#21462
    TabOrder = 5
    OnClick = cxButton4Click
  end
  object cxMaskEdit1: TcxMaskEdit
    Left = 120
    Top = 96
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    TabOrder = 6
    Text = 'cxMaskEdit1'
    Width = 121
  end
  object cxMaskEdit2: TcxMaskEdit
    Left = 120
    Top = 144
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    TabOrder = 7
    Text = 'cxMaskEdit1'
    Width = 121
  end
end
