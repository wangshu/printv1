object frm_about: Tfrm_about
  Left = 487
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20851#20110
  ClientHeight = 295
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 469
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 368
      Top = 6
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 469
    Height = 254
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 215
      Width = 57
      Height = 20
      AutoSize = False
      Caption = #28608#27963#30721
    end
    object Label2: TLabel
      Left = 40
      Top = 159
      Width = 57
      Height = 20
      AutoSize = False
      Caption = #24207#21015#21495
    end
    object Label3: TLabel
      Left = 120
      Top = 158
      Width = 74
      Height = 20
      AutoSize = False
    end
    object lbl1: TLabel
      Left = 40
      Top = 183
      Width = 321
      Height = 20
      AutoSize = False
      Caption = #24207#21015#21495
    end
    object cxTextEdit1: TcxTextEdit
      Left = 120
      Top = 212
      TabOrder = 0
      Width = 323
    end
    object cxMemo1: TcxMemo
      Left = 40
      Top = 24
      Lines.Strings = (
        #31080#25454#32508#21512#25171#21360#31995#32479)
      TabOrder = 1
      Height = 129
      Width = 393
    end
  end
end
