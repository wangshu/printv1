object Form2: TForm2
  Left = 303
  Top = 312
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #30427#24847#38534#31080#25454#25171#21360#31995#32479
  ClientHeight = 375
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    TabOrder = 0
    Height = 375
    Width = 185
    object cxListBox1: TcxListBox
      Left = 2
      Top = 73
      Width = 181
      Height = 300
      Align = alClient
      ItemHeight = 16
      TabOrder = 0
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 21
      Align = alTop
      TabOrder = 1
      Height = 52
      Width = 181
      object cxButton4: TcxButton
        Left = 8
        Top = 17
        Width = 75
        Height = 25
        Caption = #28155#21152
        Enabled = False
        TabOrder = 0
      end
      object cxButton5: TcxButton
        Left = 89
        Top = 17
        Width = 75
        Height = 25
        Caption = #20462#25913
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 185
    Top = 0
    Align = alClient
    TabOrder = 1
    Height = 375
    Width = 459
    object Panel4: TPanel
      Left = 2
      Top = 328
      Width = 455
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object cxButton1: TcxButton
        Left = 95
        Top = 8
        Width = 75
        Height = 25
        Caption = #25171#21360
        Enabled = False
        TabOrder = 0
      end
      object cxButton2: TcxButton
        Left = 176
        Top = 8
        Width = 75
        Height = 25
        Caption = #35774#35745
        Enabled = False
        TabOrder = 1
      end
      object cxButton3: TcxButton
        Left = 14
        Top = 8
        Width = 75
        Height = 25
        Caption = #27880#20876
        TabOrder = 2
      end
    end
    object ValueListEditor1: TValueListEditor
      Left = 2
      Top = 21
      Width = 455
      Height = 307
      Align = alClient
      DisplayOptions = [doAutoColResize, doKeyColFixed]
      TabOrder = 1
      ColWidths = (
        192
        257)
    end
  end
  object RMDesigner1: TRMDesigner
    DesignerRestrictions = []
    Left = 313
    Top = 120
  end
  object RMReport1: TRMReport
    ThreadPrepareReport = True
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbPageSetup, pbExit, pbExport, pbNavigator]
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'Software\ReportMachine\ReportSettings\'
    PreviewOptions.RulerUnit = rmutScreenPixels
    PreviewOptions.RulerVisible = False
    PreviewOptions.DrawBorder = False
    PreviewOptions.BorderPen.Color = clGray
    PreviewOptions.BorderPen.Style = psDash
    CompressLevel = rmzcFastest
    CompressThread = False
    LaterBuildEvents = True
    OnlyOwnerDataSet = False
    Left = 353
    Top = 120
    ReportData = {}
  end
end
