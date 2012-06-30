object Form3: TForm3
  Left = 431
  Top = 325
  Width = 507
  Height = 340
  Caption = #31080#25454#26684#24335#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 489
    Height = 254
    ActivePage = cxTabSheet1
    Align = alClient
    TabOrder = 0
    ClientRectBottom = 254
    ClientRectRight = 489
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = #22522#30784#35774#32622
      ImageIndex = 0
      object Label2: TLabel
        Left = 48
        Top = 32
        Width = 89
        Height = 16
        AutoSize = False
        Caption = #31080#25454#21517#31216
      end
      object Label3: TLabel
        Left = 48
        Top = 80
        Width = 73
        Height = 16
        AutoSize = False
        Caption = #25253#34920#25991#20214
      end
      object cxTextEdit2: TcxTextEdit
        Left = 128
        Top = 29
        TabOrder = 0
        Width = 249
      end
      object cxButtonEdit1: TcxButtonEdit
        Left = 128
        Top = 80
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 1
        Width = 249
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #20869#23481#35774#32622
      ImageIndex = 1
      object Label1: TLabel
        Left = 230
        Top = 32
        Width = 75
        Height = 16
        AutoSize = False
        Caption = #39033#30446#21517#31216
      end
      object cxListBox1: TcxListBox
        Left = 0
        Top = 0
        Width = 217
        Height = 227
        Align = alLeft
        ItemHeight = 16
        TabOrder = 0
      end
      object cxTextEdit1: TcxTextEdit
        Left = 296
        Top = 29
        TabOrder = 1
        Width = 121
      end
      object cxButton3: TcxButton
        Left = 408
        Top = 128
        Width = 75
        Height = 25
        Caption = #28155#21152
        TabOrder = 2
      end
      object cxButton4: TcxButton
        Left = 408
        Top = 159
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 3
      end
      object cxCheckBox1: TcxCheckBox
        Left = 288
        Top = 72
        Caption = #24517#22635
        TabOrder = 4
        Width = 121
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 254
    Width = 489
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
