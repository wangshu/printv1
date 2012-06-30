object Form1: TForm1
  Left = 192
  Top = 146
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 318
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 32
    Top = 272
    Width = 65
    Height = 16
    AutoSize = False
    Caption = #31471#21475
  end
  object cxButton1: TcxButton
    Left = 512
    Top = 272
    Width = 75
    Height = 25
    Caption = #25171#21360
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxComboBox1: TcxComboBox
    Left = 120
    Top = 272
    Properties.Items.Strings = (
      'LPT1'
      'LPT2'
      'LPT3')
    TabOrder = 1
    Text = 'LPT1'
    Width = 121
  end
  object cxMemo1: TcxMemo
    Left = 8
    Top = 16
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 2
    Height = 233
    Width = 577
  end
  object cxCheckBox1: TcxCheckBox
    Left = 288
    Top = 272
    AutoSize = False
    Caption = #20351#29992#21387#32553
    TabOrder = 3
    Height = 24
    Width = 121
  end
end
