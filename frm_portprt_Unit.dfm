object frm_portprt: Tfrm_portprt
  Left = 314
  Top = 225
  Width = 781
  Height = 581
  Caption = #31471#21475#25171#21360#39044#35272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 57
    Align = alTop
    Caption = 'Panel1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 482
    Width = 763
    Height = 52
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 41
      Height = 21
      AutoSize = False
      Caption = #31471#21475
    end
    object cxButton1: TcxButton
      Left = 592
      Top = 16
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 0
      OnClick = cxButton1Click
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
      TabOrder = 1
      Text = 'COM1'
      Width = 105
    end
    object cxButton2: TcxButton
      Left = 672
      Top = 16
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 2
      OnClick = cxButton2Click
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 57
    Width = 763
    Height = 64
    Align = alTop
    TabOrder = 2
    object btn1: TSpeedButton
      Left = 16
      Top = 8
      Width = 49
      Height = 49
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B000001000000010000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3E54545463636361
        61615A5A5A5E5E5E6464646A6A6A6F6F6F7575757B7B7B8181818787878D8D8D
        9292929898989D9D9DA3A3A3A8A8A8ACACACADADADACACACA8A8A8A3A3A39D9D
        9D9898989292928D8D8D8787878181817B7B7B7575756F6F6F6A6A6A6464645F
        5F5F646464626262565656444444FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF3A3A3A575757858585BEBEBEC7C7C7C3C3C3C1C1C1C2C2C2C4C4C4C5C5
        C5C7C7C7C8C8C8CACACACCCCCCCDCDCDCFCFCFD0D0D0D2D2D2D3D3D3D5D5D5D6
        D6D6D7D7D7D6D6D6D5D5D5D3D3D3D2D2D2D0D0D0CFCFCFCDCDCDCCCCCCCACACA
        C8C8C8C7C7C7C5C5C5C4C4C4C2C2C2C3C3C3C7C7C7BDBDBD8686866161613E3E
        3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424242737473DCDCDCDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDCDCDC7D7E7D494949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF464747B3B3B3DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBB8B8B85051
        51FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF454545BEBEBEDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDC1C1C14E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF434343BABABADDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDBDBDBD4949
        49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF454545BABABADEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEBCBCBC4B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF474847BABBBADFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFBCBCBC4D4E
        4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4B4ABABBBADFDFDFDFDFDFE8
        E8E8F7F7F7F7F7F7EEEEEEDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFF0F0F0F7F7F7F7F7F7E8E8
        E8DFDFDFF4F4F4EEEEEEDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFE3E3E3F7
        F7F7E8E8E8DFDFDFDFDFDFBCBCBC4F504FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4C4D4DBBBBBBE0E0E0E0E0E0C1C2C27E82807E8280B4B7B5E1E1E1E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E2E2E2ACAEAD7D817F7D817FC1C2C2E0E0E0868887AEB0AEE1E1E1E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0D7D8D8727573BDBEBEE0E0E0E0E0E0BCBCBC5152
        52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4E4EBBBBBBE0E0E0E0E0E0DE
        DEDE8286837B7F7C7E8380E1E1E1E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0DEDFDE7A7E7B7A7E7B828683DEDE
        DEE0E0E0ACADAC717471E1E1E1E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0B5B7B576
        7876DEDEDEE0E0E0E0E0E0BDBDBD535454FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4F5050BBBBBBE1E1E1E1E1E1E1E1E1A3A5A4777B79777B79C6C8C7E1E1
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
        E1E1C1C3C2777B78777A78A4A6A5E1E1E1E1E1E1D5D5D5696B68C8C9C8F1F1F1
        F1F1F1F1F1F1F1F1F1F0F0F07577749B9C9BE1E1E1E1E1E1E1E1E1BDBDBD5555
        55FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF515352BBBCBBE1E1E1E1E1E1E1
        E1E1C9CAC9747875747875959895E5E5E5E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E5E5E58A8D8A747774747774CBCCCBE1E1
        E1E1E1E1E1E1E18586847375729A9B9A9A9B9A9A9B9A9A9B9A8D8F8D626461C7
        C8C7E1E1E1E1E1E1E1E1E1BDBDBD565857FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF535554BCBCBCE2E2E2E2E2E2E2E2E2E2E2E2818481717471717471D7D7
        D7E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2D2
        D2D2717471707471838784E2E2E2E2E2E2E2E2E2E2E2E2B3B3B25D5F5B9E9F9D
        A3A4A2A3A4A2A6A7A5777875737571E2E2E2E2E2E2E2E2E2E2E2E2BDBEBE585A
        59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555756BCBDBCE2E2E2E2E2E2E2
        E2E2E2E2E2A9AAA96E716E6E716EB4B5B4EBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBABADAB6D706D6D706DACAEACE2E2E2E2E2
        E2E2E2E2E2E2E2DCDCDC5E5F5CB2B3B1E2E2E2E2E2E2E0E0E05B5C58A2A2A0E2
        E2E2E2E2E2E2E2E2E2E2E2BDBEBE5A5C5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF575958BDBDBDE4E4E4E4E4E4E4E4E4E4E4E4D4D4D46B6E6A6B6E6A7477
        73CACAC9CACAC9CACAC9CACAC9CACAC9CACAC9C9CAC9C9CAC9C9CAC9C8C9C86D
        706D6A6D6A6B6E6BD8D8D8E4E4E4E4E4E4E4E4E4E4E4E4E4E4E48888857B7C79
        E7E7E7E4E4E4BEBEBD53544FD5D5D4E4E4E4E4E4E4E4E4E4E4E4E4BEBFBF5C5E
        5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595B5BBDBEBEE4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4858684686A67686A67686A67686A67686A67676A66676A66
        676A66676A66676A66676A66676A66676A66676A668A8C8AE4E4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4E4E4BCBCBB4D4D49D6D6D6E5E5E5949491767673E4E4E4E4
        E4E4E4E4E4E4E4E4E4E4E4BEBFBF5E6060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF5C5E5DBEBEBEE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5B2B3B16567636567
        63646763696B68686A67686A67686967686967686967686967696A6864666364
        6663646663B8B9B8E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E4E4E4595954
        ADADACE2E2E24D4D49ADADABE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5BFC0C06162
        62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E605FBEBFBEE5E5E5E5E5E5E5
        E5E5E5E5E5E5E5E5DDDDDD65676461635F676965E4E4E4E5E5E5E5E5E5E5E5E5
        E5E5E5E5E5E5E5E5E5DDDEDD61635F61635F696B67E1E1E1E5E5E5E5E5E5E5E5
        E5E5E5E5E5E5E5E5E5E5E5E5E58E8D8A73726EC4C4C24B4A45DFDFDEE5E5E5E5
        E5E5E5E5E5E5E5E5E5E5E5BFC0C0626463FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF606261BEBFBEE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E68A8C895E60
        5C5E605CC5C6C5E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6BCBCBB5E5F5C5E
        5F5B949492E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6C9C9C8
        3D3C367675717D7D79E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6C0C0C06466
        65FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF626362BFBFBFE6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6BBBCBB5B5C585B5C589F9F9DE7E7E7E6E6E6E6E6E6
        E6E6E6E6E6E6E8E8E890908D5B5C585B5C58C6C6C5E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6595853383630BBBBB9E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6C0C1C1666867FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF636564BFC0BFE7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E4E4E46364
        605859555E5F5BE6E6E6E7E7E7E7E7E7E7E7E7E7E7E7DFDFDF5859545859546C
        6D69E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7C1C1C1686A
        69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656867C0C0C0E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7929390555651555651C4C4C3E7E7E7E7E7E7
        E7E7E7E7E7E7BBBBBA5555515555519F9F9DE7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7C1C2C26A6D6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF676A69C0C1C1E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8C8C8
        C752524E52524E9B9B99E8E8E8E8E8E8E8E8E8E9E9E98C8D8951524D52534ED5
        D5D5E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E9E9E9EFEFEFE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8C2C2C26C6E
        6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696C6BC1C1C1E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E96767624F4F4A575752E7E7E7E9E9E9
        E9E9E9E1E1E04E4F4A4E4E4A757572E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EBEBEBD3D4D4EAEAEAE9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9C2C3C36E706FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6B6E6DC1C2C1EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
        EA9D9D9B4B4B464B4B46C4C4C2EAEAEAEAEAEABABAB84B4B464B4B46AEAEACEA
        EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAECECEC
        BDBFBE767A77E8E8E8EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAC3C4C46F72
        71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D706FC1C3C2EAEAEAEAEAEAEA
        EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAD6D6D5494944484843979795EAEAEA
        EBEBEB8A8A874848434F4F4AE2E2E2EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
        EAEAEAEAEAEAEAEAEAEAEAEAEAE3E4E36A6C69686A67ADADACEDEDEDEAEAEAEA
        EAEAEAEAEAEAEAEAEAEAEAC3C4C3717473FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6F7371C2C3C2EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEB6D6D6945453F4D4C47E8E8E7E3E3E347464145443F82817EEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEFEFEF999996
        5F605C5F605C5F605CDDDDDDEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC3C5C47377
        75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF717574C2C4C4EBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBA9A8A642413C42413CC0C0BF
        BCBBBA42413C42413CBFBEBDEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBD3D3D256575256575256575256575282837FEEEFEEEB
        EBEBEBEBEBEBEBEBEBEBEBC4C5C5757978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF737776C3C4C4ECECECECECECECECECECECECECECECECECECECECECECEC
        ECECECECE2E2E144433E3F3E389494918D8D893F3E3853524CEBEBEBECECECEC
        ECECECECECECECECECECECECECECECECECECECECECECECEDEDED6B6B674D4D48
        4D4D484D4D484D4D484D4D48C9C9C7EDEDEDECECECECECECECECECC4C6C6777B
        7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF767877C4C5C4ECECECECECECEC
        ECECECECECECECECECECECECECECECECECECECECECECEC7776733C3A35504E4A
        44433E3C3A34908F8CECECECECECECECECECECECECECECECECECECECECECECEC
        ECECECECEDEDEDBABAB844443E44443E44443E44443E44443E44443E565650E9
        E9E9ECECECECECECECECECC5C6C57A7C7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF777A79C4C5C4EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDB7B7B5393731393731393731393731D2D2D1EDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE5E5E444433D3B3A343B3A34
        3B3A343B3A343B3A343B3A343B3A34A8A8A6EFEFEFEDEDEDEDEDEDC5C7C67B7E
        7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF797D7BC4C6C5EDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEAEAEA45433E36342E
        36342E5E5D58EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDED7B7A7636342E36342E36342E36342E36342E36342E36342E36342E38
        3630CCCCCBEDEDEDEDEDEDC6C7C77D817FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7B7F7DC5C6C6EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEC6C8C77F83
        81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D817FC6C7C6EEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEC7C9C8818583FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F8382C6C8C8EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFC8C9C98387
        86FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF828685CCCDCDF0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0CFD0D0868A88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8E9290D5D6D6F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0DADCDB989C
        9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969B99D3D5D5F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1DBDCDCA0A3A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8F9390C6C9C8FAFAFAF6F6F6F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F6F6F6F9F9F9D1D3D29399
        96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8F8AA9ADACCBCDCCDADCDBDD
        DEDDD3D5D4CFD1D0D0D2D1D2D4D3D4D6D5D6D7D7D7D9D8D9DBDADBDCDCDDDEDD
        DEE0DFE0E1E1E2E3E2E3E5E4E5E6E5E6E7E7E7E8E7E6E7E7E5E6E5E3E5E4E2E3
        E2E0E1E1DEE0DFDDDEDDDBDCDCD9DBDAD7D9D8D6D7D7D4D6D5D2D4D3D0D2D1D3
        D4D3D9DADAD6D8D7C4C6C6AAADAB8D928DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8D928D989B9AA6A9A8A3A8A69B9F9D9FA2A1A2A6A4A5A9A8A9AC
        ABACB0AEB0B3B2B3B7B5B7BAB9BABDBCBDC0BFC1C3C2C4C7C6C7CAC9CBCDCCCD
        CFCECED0CFCDCFCECBCDCCC7CAC9C4C7C6C1C3C2BDC0BFBABDBCB7BAB9B3B7B5
        B0B3B2ACB0AEA9ACABA5A9A8A2A6A49FA2A1A1A5A3A3A8A6999D9C8D9292FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btn1Click
    end
    object btn2: TSpeedButton
      Left = 80
      Top = 8
      Width = 49
      Height = 49
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B000001000000010000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3E54545463636361
        61615A5A5A5E5E5E6464646A6A6A6F6F6F7575757B7B7B8181818787878D8D8D
        9292929898989D9D9DA3A3A3A8A8A8ACACACADADADACACACA8A8A8A3A3A39D9D
        9D9898989292928D8D8D8787878181817B7B7B7575756F6F6F6A6A6A6464645F
        5F5F646464626262565656444444FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF3A3A3A575757858585BEBEBEC7C7C7C3C3C3C1C1C1C2C2C2C4C4C4C5C5
        C5C7C7C7C8C8C8CACACACCCCCCCDCDCDCFCFCFD0D0D0D2D2D2D3D3D3D5D5D5D6
        D6D6D7D7D7D6D6D6D5D5D5D3D3D3D2D2D2D0D0D0CFCFCFCDCDCDCCCCCCCACACA
        C8C8C8C7C7C7C5C5C5C4C4C4C2C2C2C3C3C3C7C7C7BDBDBD8686866161613E3E
        3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424242737473DCDCDCDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDCDCDC7D7E7D494949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF464747B3B3B3DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBB8B8B85051
        51FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF454545BEBEBEDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDC1C1C14E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF434343BABABADDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDBDBDBD4949
        49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF454545BABABADEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEBCBCBC4B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF474847BABBBADFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFBCBCBC4D4E
        4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4B4ABABBBADFDFDFDFDFDFE8
        E8E8F7F7F7E3E3E3DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEEEEEEF4F4F4
        DFDFDFE8E8E8F7F7F7F7F7F7F0F0F0DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEEEEEEF7F7F7F7
        F7F7E8E8E8DFDFDFDFDFDFBCBCBC4F504FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4C4D4DBBBBBBE0E0E0E0E0E0BDBEBE727573D7D8D8E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E1E1E1AEB0AE868887E0E0E0C1C2C27D817F7D817FACAEADE2
        E2E2E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E1E1E1B4B7B57E82807E8280C1C2C2E0E0E0E0E0E0BCBCBC5152
        52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4E4EBBBBBBE0E0E0E0E0E0DE
        DEDE767876B5B7B5E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E1E1E1717471ACADAC
        E0E0E0DEDEDE8286837A7E7B7A7E7BDEDFDEE0E0E0E0E0E0E0E0E0E0E0E0E0E0
        E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E1E1E17E83807B7F7C82
        8683DEDEDEE0E0E0E0E0E0BDBDBD535454FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4F5050BBBBBBE1E1E1E1E1E1E1E1E19B9C9B757774F0F0F0F1F1F1F1F1
        F1F1F1F1F1F1F1C8C9C8696B68D5D5D5E1E1E1E1E1E1A4A6A5777A78777B78C1
        C3C2E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
        E1E1E1E1E1E1C6C8C7777B79777B79A3A5A4E1E1E1E1E1E1E1E1E1BDBDBD5555
        55FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF515352BBBCBBE1E1E1E1E1E1E1
        E1E1C7C8C76264618D8F8D9A9B9A9A9B9A9A9B9A9A9B9A737572858684E1E1E1
        E1E1E1E1E1E1CBCCCB7477747477748A8D8AE5E5E5E1E1E1E1E1E1E1E1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E5E5E5959895747875747875C9
        CAC9E1E1E1E1E1E1E1E1E1BDBDBD565857FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF535554BCBCBCE2E2E2E2E2E2E2E2E2E2E2E2737571777875A6A7A5A3A4
        A2A3A4A29E9F9D5D5F5BB2B3B1E2E2E2E2E2E2E2E2E2E2E2E283878470747171
        7471D2D2D2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2D7D7D7717471717471818481E2E2E2E2E2E2E2E2E2E2E2E2BDBEBE585A
        59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555756BCBDBCE2E2E2E2E2E2E2
        E2E2E2E2E2A2A2A05B5C58E0E0E0E2E2E2E2E2E2B2B3B15E5F5CDCDCDCE2E2E2
        E2E2E2E2E2E2E2E2E2ACAEAC6D706D6D706DABADABEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBB4B5B46E716E6E716EA9AAA9E2
        E2E2E2E2E2E2E2E2E2E2E2BDBEBE5A5C5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF575958BDBDBDE4E4E4E4E4E4E4E4E4E4E4E4D5D5D453544FBEBEBDE4E4
        E4E7E7E77B7C79888885E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D8D8D86B6E6B6A
        6D6A6D706DC8C9C8C9CAC9C9CAC9C9CAC9CACAC9CACAC9CACAC9CACAC9CACAC9
        CACAC97477736B6E6A6B6E6AD4D4D4E4E4E4E4E4E4E4E4E4E4E4E4BEBFBF5C5E
        5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595B5BBDBEBEE4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4767674949491E5E5E5D6D6D64D4D49BCBCBBE4E4E4E4E4E4
        E4E4E4E4E4E4E4E4E4E4E4E48A8C8A676A66676A66676A66676A66676A66676A
        66676A66676A66676A66686A67686A67686A67686A67686A67858784E4E4E4E4
        E4E4E4E4E4E4E4E4E4E4E4BEBFBF5E6060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF5C5E5DBEBEBEE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5ADADAB4D4D49E2E2
        E2ADADAC595954E4E4E4E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5B8B9B864
        6663646663646663696A68686967686967686967686967686A67686A67696B68
        646763656763656763B2B3B1E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5BFC0C06162
        62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E605FBEBFBEE5E5E5E5E5E5E5
        E5E5E5E5E5E5E5E5DFDFDE4B4A45C4C4C273726E8E8D8AE5E5E5E5E5E5E5E5E5
        E5E5E5E5E5E5E5E5E5E5E5E5E1E1E1696B6761635F61635FDDDEDDE5E5E5E5E5
        E5E5E5E5E5E5E5E5E5E5E5E5E5E4E4E467696561635F656764DDDDDDE5E5E5E5
        E5E5E5E5E5E5E5E5E5E5E5BFC0C0626463FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF606261BEBFBEE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E67E7D7A7675
        713D3C36C9C9C8E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E694
        94925E5F5B5E5F5CBCBCBBE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6C5C6C5
        5E605C5E605C8B8C89E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6C0C0C06466
        65FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF626362BFBFBFE6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6BBBBB9383630595853E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6C6C6C55B5C585B5C5890908DE8E8E8E6E6
        E6E6E6E6E6E6E6E6E6E6E7E7E79F9F9D5B5C585B5C58BBBCBBE6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6C0C1C1666867FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF636564BFC0BFE7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E76C6D69585954585954DFDFDFE7E7E7E7E7E7E7E7E7E7E7E7E6E6E65E5F5B
        585955636460E4E4E4E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7C1C1C1686A
        69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656867C0C0C0E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E79F9F9D555551555551BBBBBAE7E7
        E7E7E7E7E7E7E7E7E7E7C4C4C3555651555651939391E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7C1C2C26A6D6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF676A69C0C1C1E8E8E8E8E8E8EDEDEDF9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F6F6F6E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8D5D5D552534E51524D8C8D89E9E9E9E8E8E8E8E8E8E8E8E89B9B9952524E
        52524EC8C8C7E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8C2C2C26C6E
        6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696C6BC1C1C1E9E9E9E9E9E9D0
        D0D0727572727572727572727572727572727572727572727572727572959795
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E97575724E4E4A4E4F4AE1E1
        E0E9E9E9E9E9E9E7E7E75757524F4F4A676762E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9C2C3C36E706FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6B6E6DC1C2C1EAEAEAEAEAEAEAEAEA989A98686A67686A67686A67686A
        67686A67686A67686A676B6D6AD7D7D6EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
        EAEAEAEAEAAEAEAC4B4B464B4B46BABAB8EAEAEAEAEAEAC4C4C24B4B464B4B46
        9E9D9BEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAC3C4C46F72
        71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D706FC1C3C2EAEAEAEAEAEAEA
        EAEADDDDDD6567635E605C5E605C5E605C5E605C5E605C5E605C9E9F9DEAEAEA
        EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAE2E2E24F4F4A4848438A8A
        87EBEBEBEAEAEA979795484843494944D6D6D5EAEAEAEAEAEAEAEAEAEAEAEAEA
        EAEAEAEAEAEAEAEAEAEAEAC3C4C3717473FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6F7371C2C3C2EBEBEBEBEBEBEBEBEBEBEBEBA6A7A45556515556515556
        5155565155565163645FE3E3E3EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEB82817E45443F474641E3E3E3E8E8E74D4C4745453F6D6D69
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC3C5C47377
        75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF717574C2C4C4EBEBEBEBEBEBEB
        EBEBEBEBEBE7E7E763635F4B4B464B4B464B4B464B4B46AFAFAEEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBBFBEBD42413C4241
        3CBCBBBAC0C0BF42413C42413CA9A9A7EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBC4C5C5757978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF737776C3C4C4ECECECECECECECECECECECECECECECBBBAB942413B4241
        3B42413B666560EBEBEBECECECECECECECECECECECECECECECECECECECECECEC
        ECECECECECECECECEBEBEB53524C3F3E388D8D899494913F3E3844433EE2E2E1
        ECECECECECECECECECECECECECECECECECECECECECECECECECECECC4C6C6777B
        7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF767877C4C5C4ECECECECECECEC
        ECECECECECECECECECECEC6C6B67383630393731C6C5C4ECECECECECECECECEC
        ECECECECECECECECECECECECECECECECECECECECECECECECECECEC908F8C3C3A
        3444433E504E4A3C3A35777673ECECECECECECECECECECECECECECECECECECEC
        ECECECECECECECECECECECC5C6C57A7C7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF777A79C4C5C4EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDD2D1D13A38
        327B7A76EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDD2D2D1393731393731393731393731B8B7B6EDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDC5C7C67B7E
        7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF797D7BC4C6C5EDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDED949390DCDCDBEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED5E5D
        5836342E36342E45433EEAEAEAEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDC6C7C77D817FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7B7F7DC5C6C6EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEC6C8C77F83
        81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D817FC6C7C6EEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEC7C9C8818583FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F8382C6C8C8EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFC8C9C98387
        86FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF828685CCCDCDF0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0CFD0D0868A88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8E9290D5D6D6F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0DADCDB989C
        9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969B99D3D5D5F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1DBDCDCA0A3A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8F9390C6C9C8FAFAFAF6F6F6F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F6F6F6F9F9F9D1D3D29399
        96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8F8AA9ADACCBCDCCDADCDBDD
        DEDDD3D5D4CFD1D0D0D2D1D2D4D3D4D6D5D6D7D7D7D9D8D9DBDADBDCDCDDDEDD
        DEE0DFE0E1E1E2E3E2E3E5E4E5E6E5E6E7E7E7E8E7E6E7E7E5E6E5E3E5E4E2E3
        E2E0E1E1DEE0DFDDDEDDDBDCDCD9DBDAD7D9D8D6D7D7D4D6D5D2D4D3D0D2D1D3
        D4D3D9DADAD6D8D7C4C6C6AAADAB8D928DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8D928D989B9AA6A9A8A3A8A69B9F9D9FA2A1A2A6A4A5A9A8A9AC
        ABACB0AEB0B3B2B3B7B5B7BAB9BABDBCBDC0BFC1C3C2C4C7C6C7CAC9CBCDCCCD
        CFCECED0CFCDCFCECBCDCCC7CAC9C4C7C6C1C3C2BDC0BFBABDBCB7BAB9B3B7B5
        B0B3B2ACB0AEA9ACABA5A9A8A2A6A49FA2A1A1A5A3A3A8A6999D9C8D9292FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btn2Click
    end
  end
end
