object frm_about: Tfrm_about
  Left = 565
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20851#20110
  ClientHeight = 340
  ClientWidth = 391
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
    Top = 307
    Width = 391
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
    Width = 391
    Height = 307
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
    object Label4: TLabel
      Left = 32
      Top = 208
      Width = 329
      Height = 97
      AutoSize = False
      Caption = 
        #20813#36131#35828#26126':'#26412#31243#24207#20026#24320#28304#31243#24207#65292#20165#20316#20026#23398#20064#19982#25171#21360#26426#27979#35797#29992#36884#65292#26368#32456#29992#25143#23545#20854#20351#29992#26041#24335#36127#25285#20840#37096#36131#20219#12290#24320#21457#32773#19981#20026#26368#32456#29992#25143#30340#20351#29992#26041#24335#32780#25215#25285#20219#20309 +
        #36131#20219#65281#22312#20351#29992#26412#31243#24207#26102#35270#20026#24050#32463#40664#35748#27492#26465#20214#65281
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
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
      Height = 94
      Width = 329
    end
  end
end
