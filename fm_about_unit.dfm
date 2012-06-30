object frm_about: Tfrm_about
  Left = 487
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20851#20110
  ClientHeight = 239
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 206
    Width = 380
    Height = 33
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 298
      Top = 5
      Width = 61
      Height = 20
      Caption = #30830#23450
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 206
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 174
      Width = 47
      Height = 16
      AutoSize = False
      Caption = #28608#27963#30721
    end
    object Label2: TLabel
      Left = 32
      Top = 129
      Width = 47
      Height = 16
      AutoSize = False
      Caption = #24207#21015#21495
    end
    object Label3: TLabel
      Left = 97
      Top = 128
      Width = 60
      Height = 16
      AutoSize = False
    end
    object lbl1: TLabel
      Left = 32
      Top = 148
      Width = 260
      Height = 16
      AutoSize = False
      Caption = #24207#21015#21495
    end
    object cxTextEdit1: TcxTextEdit
      Left = 97
      Top = 172
      TabOrder = 0
      Width = 262
    end
    object cxMemo1: TcxMemo
      Left = 32
      Top = 19
      Lines.Strings = (
        #31080#25454#32508#21512#25171#21360#31995#32479)
      TabOrder = 1
      Height = 105
      Width = 319
    end
  end
end
