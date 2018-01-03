object MCForm: TMCForm
  Left = 363
  Top = 197
  Caption = 'Monte carlo rendering '
  ClientHeight = 626
  ClientWidth = 794
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 600
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 45
    Align = alTop
    TabOrder = 0
    object Button9: TSpeedButton
      Left = 15
      Top = 9
      Width = 30
      Height = 30
      Hint = 'Open a m3c file'
      Glyph.Data = {
        16060000424D1606000000000000360400002800000012000000180000000100
        080000000000E0010000C30E0000C30E00000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60000000000357C62007C8B1400758B1F006D8D2C00738D25003B917C005B89
        43004C8755004E895E0053935E0048936D0053966000439478008F8D0500878B
        0900898B09000177A1000077B200007CC10018809A00358F84000B80AB000384
        B2000584B8000D87BB000B8BBA001B93BF002AA1BF00018FCA00008BCE00148F
        C3001493C7001094C700169ACC00189ACA000091D6000094D4000094D6000B96
        D000219ECC000BA5E60000A5EC0009A7E8000BABEE0012ADEE0000ABF30000B4
        FF0005B8FF0012BFFF0005C1FF0001C7FF0000ECFF0019E7F90000F1FF0000FF
        FF0080FFFF00C6C6C6001400140058871B0018000000E401000060EE12004000
        00000000000000000000A8EE120068EE12000000000000000000000000000000
        000000000000000000000000000040000000ACEE120020E99100000000000200
        000001000000E401000060EE1200E401000060149200F8D62200D8D622000000
        00000000000090EC01008F00000004EC120020E99100C0EC12007C94370011A9
        000011A90000D4EC12001E9437005044AF0011A9000000000000ECEC1200E294
        37005044AF003D150F00F057E200B057E2000CED1200824C0F00F057E200A603
        3700B64C0F00F057E20014ED120000000000B8009200105BCE00E0ED12004100
        9200A80714005D00920038EE1200000000003CED120000000000B80092005087
        1B0008EE1200410092004807140058ED120000000000B800920050871B0024EE
        120041009200480714005D00920068EE12000400000000000000020000000000
        0000040000003000000000000000185BCE00D98B360000F0FD00300000000400
        00000000140098EB12005CF69100200000000000000058871B00C4ED12000000
        0000B800920020210B0090EE120041009200380BE2005D009200806A0A002821
        0B000300000061F69100EECF9100CEDD910000001400E4ED1200DADD91008CEE
        120020E9910068F69100FFFF01000400000068ED1200000000008CEE120020E9
        910060009200FFFFFF005D009200AC04920000001400C800000058871B0048EE
        12008204920058871B00000000009CEE12000EECDA0020ECDA00C8A662000000
        E200D4A66200000000000000000000000000000000000000010019000000D4ED
        120028210B00C8EE120020E9910060009200FFFFFF005D009200DEC2BF000000
        E20000000000E3C2BF00806A0A0028210B0003000000AA68D30028210B002821
        0B00D4EE1200A4EE1200FFFFFF0040EF1200945CC0007020BE00FFFFFF00E3C2
        BF00D595440028210B00A01B6300A01B6300F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00430018132440
        2E1C323227303C291018004300004300180D2C37392F1C281D36411B0C180043
        00004300180E2D2241333431383D23260F180043000043001818191E353B3A41
        3E252B1A1818004300004300181818160B2A2921201F17181818004300004300
        1818181818151211141818181818004300004300181818181818181818181818
        1818004300004300000000000000000000000000000000430000434343434343
        4343434343434343434343430000434343434343434343434343434343434343
        000043430000000000000000000000004343434300004300003F3F3F3F3F3F3F
        3F3F3F3F004343430000430042003F3F3F3F3F3F3F3F3F3F0043434300004300
        42003F3F3F3F3F3F3F3F3F3F3F004343000043004242003F3F3F3F3F3F3F3F3F
        3F004343000043004242003F3F3F3F3F3F3F3F3F3F3F00430000430042424200
        000000003F3F3F3F3F3F00430000430042424242424242420000000000004343
        0000430042424242424242424242420043434343000043004242424242424242
        4242420043434343000043004242424242000000000000434343434300004343
        0000000000434343434343434343434300004343434343434343434343434343
        4343434300004343434343434343434343434343434343430000}
      ParentShowHint = False
      ShowHint = True
      OnClick = Button9Click
    end
    object Button8: TSpeedButton
      Left = 51
      Top = 8
      Width = 30
      Height = 30
      Hint = 'Save a m3c file'
      Enabled = False
      Glyph.Data = {
        16060000424D1606000000000000360400002800000012000000180000000100
        080000000000E0010000C30E0000C30E00000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60000000000357C6200FF0000007C8B1400758B1F006D8D2C00738D25003B91
        7C005B8943004C8755004E895E0053935E0048936D0053966000439478008484
        00008F8D0500878B0900898B09000177A1000077B200007CC10018809A00358F
        84000B80AB000384B2000584B8000D87BB000B8BBA001B93BF002AA1BF00018F
        CA00008BCE00148FC3001493C7001094C700169ACC00189ACA000091D6000094
        D4000094D6000B96D000219ECC000BA5E60000A5EC0009A7E8000BABEE0012AD
        EE0000ABF30000B4FF0005B8FF0012BFFF0005C1FF0001C7FF0000ECFF0000F1
        FF0000FFFF0084848400C6C6C600FFFFFF00180000007401000060EE12004000
        00000000000000000000A8EE120068EE12000000000000000000000000000000
        000000000000000000000000000040000000ACEE120020E99100000000000200
        0000010000007401000060EE12007401000060149200C01F1800A01F18000000
        00000000000090EC0100C301000004EC120020E99100C0EC12007C94370011A9
        000011A90000D4EC12001E9437004047AF0011A9000000000000ECEC1200E294
        37004047AF003D150F00F057E200B057E2000CED1200824C0F00F057E2003E03
        5B00B64C0F00F057E20014ED120000000000B8009200A04E2200E0ED12004100
        9200A80714005D00920038EE1200000000003CED120000000000B8009200A851
        220008EE1200410092004807140058ED120000000000B8009200A851220024EE
        120041009200480714005D00920068EE12000400000000000000020000000000
        0000040000003000000000000000A84E2200D98B360000F0FD00300000000400
        00000000140098EB12005CF691002000000000000000B0512200C4ED12000000
        0000B800920020210B0090EE120041009200380BE2005D009200806A0A002821
        0B000300000061F69100EECF9100CEDD910000001400E4ED1200DADD91008CEE
        120020E9910068F69100FFFF01000400000068ED1200000000008CEE120020E9
        910060009200FFFFFF005D009200AC04920000001400C8000000B051220048EE
        120082049200B0512200000000009CEE12000EECDA0020ECDA00C8A662000000
        E200D4A66200000000000000000000000000000000000000010019000000D4ED
        120028210B00C8EE120020E9910060009200FFFFFF005D009200DEC2BF000000
        E20000000000E3C2BF00806A0A0028210B0003000000AA68D30028210B002821
        0B00D4EE1200A4EE1200FFFFFF0040EF1200945CC0007020BE00FFFFFF00E3C2
        BF00D595440028210B00A01B6300A01B6300F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0044001A142641
        301E343429323E2B111A0044000044001A0E2E393B311E2A1F38421D0D1A0044
        000044001A0F2F24423536333A3F2528101A0044000044001A1A1B20373D3C42
        40272D1C1A1A0044000044001A1A1A170B2C2B232221181A1A1A004400004400
        1A1A1A1A1A161312151A1A1A1A1A0044000044001A1A1A1A1A1A1A1A1A1A1A1A
        1A1A004400004400000000000000000000000000000000440000444444444444
        4444444444444444444444440000444443000000000000000000000000434444
        00004444000C0C00430C0C454444000C0C00444400004444000C0C00430C0C45
        4444000C0C00444400004444000C0C00444343444444000C0C00444400004444
        000C0C19000000000000190C0C00444400004444000C0C0C0C0C0C0C0C0C0C0C
        0C00444400004444000C190000000000000000190C00444400004444000C0045
        45454545454545000C00444400004444000C004545454545454545000C004444
        00004444000C004545454545454545000C00444400004444000C004545454545
        454545000C004444000044440000004545454545454545000000444400004444
        000C004545454545454545000C00444400004444430000000000000000000000
        0043444400004444444444444444444444444444444444440000}
      ParentShowHint = False
      ShowHint = True
      OnClick = Button8Click
    end
    object SpeedButton1: TSpeedButton
      Left = 102
      Top = 8
      Width = 33
      Height = 30
      Hint = 'Save the image as BMP or PNG file.'
      Enabled = False
      Glyph.Data = {
        F6010000424DF601000000000000760000002800000019000000180000000100
        04000000000080010000C30E0000C30E0000100000001000000000000000FF00
        00008484000084848400C6C6C600FFFFFF0040404000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00444444444444
        4444444444444000000044444444444644444444444440000000003404040443
        4044404404300000000004040404044440444046040400000000003403040034
        4003403304030000000004040004040440404064040440000000003404040034
        4003404404300000000044444444444444444444444440000000444444444444
        4444444444444000000044444300000000000034444440000000444440110311
        5440110444444000000044444011031154401104444440000000444440110433
        4440110444444000000044444011200000021104444440000000444440111111
        1111110444444000000044444012000000002104444440000000444440105555
        5555010444444000000044444010555555550104444440000000444440105555
        5555010444444000000044444010555555550104444440000000444440005555
        5555000444444000000044444010555555550104444440000000444443000000
        0000003444444000000044444444444444444444444440000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object JvgLabel6: TJvgLabel
      Left = 438
      Top = 16
      Width = 32
      Height = 15
      Caption = '??????'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Colors.Text = clBtnText
      Colors.TextDisabled = clGrayText
      Colors.Delineate = clBtnShadow
      Colors.Shadow = clBlack
      Colors.Highlight = 4013373
      Colors.TextActive = clBtnHighlight
      Colors.DelineateActive = clBtnHighlight
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Alignment = taLeftJustify
    end
    object Button3: TButton
      Left = 194
      Top = 11
      Width = 105
      Height = 25
      Hint = 'Import the main programs parameter for mc rendering'
      Caption = 'Import parameter'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 301
      Top = 11
      Width = 127
      Height = 25
      Hint = 'send parameter to programs main render window'
      Caption = 'Send parameter to main'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 144
      Top = 12
      Width = 48
      Height = 23
      Hint = 'perform a noise filter on the image'
      Caption = '-noise'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = Button6Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 501
    Width = 794
    Height = 125
    Align = alBottom
    TabOrder = 1
    object Label8: TLabel
      Left = 172
      Top = 39
      Width = 78
      Height = 13
      Caption = '..til next update'
      Visible = False
    end
    object Label14: TLabel
      Left = 362
      Top = 36
      Width = 3
      Height = 13
    end
    object Label15: TLabel
      Left = 425
      Top = 36
      Width = 3
      Height = 13
    end
    object Button2: TButton
      Left = 16
      Top = 8
      Width = 116
      Height = 25
      Hint = 'You can always start/continue or stop the calculation'
      Caption = 'Start rendering'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button2Click
    end
    object ProgressBar1: TProgressBar
      Left = 144
      Top = 9
      Width = 111
      Height = 23
      TabOrder = 1
      Visible = False
    end
    object CheckBox5: TCheckBox
      Left = 21
      Top = 39
      Width = 134
      Height = 17
      Hint = 'Save the M3C file every update and 5 minutes passed'
      Alignment = taLeftJustify
      Caption = 'Auto-saving the m3c file:'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 520
      Top = 6
      Width = 262
      Height = 111
      BevelWidth = 2
      BorderStyle = bsSingle
      Caption = 'Lighting'
      TabOrder = 3
      object Label2: TLabel
        Left = 5
        Top = 31
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Exposure:  0.25'
      end
      object Label7: TLabel
        Left = 232
        Top = 31
        Width = 22
        Height = 13
        Caption = '2.24'
      end
      object Label26: TLabel
        Left = 11
        Top = 54
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'L-Gamma:  0.5'
      end
      object Label27: TLabel
        Left = 232
        Top = 54
        Width = 6
        Height = 13
        Caption = '2'
      end
      object Label28: TLabel
        Left = 7
        Top = 77
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saturation:   0  '
      end
      object Label29: TLabel
        Left = 233
        Top = 77
        Width = 6
        Height = 13
        Caption = '2'
      end
      object JvgLabel2: TJvgLabel
        Left = 6
        Top = 6
        Width = 43
        Height = 15
        Caption = 'Lighting:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Colors.Text = clBtnText
        Colors.TextDisabled = clGrayText
        Colors.Delineate = clBtnShadow
        Colors.Shadow = clBlack
        Colors.Highlight = 4013373
        Colors.TextActive = clBtnHighlight
        Colors.DelineateActive = clBtnHighlight
        Colors.AutoHighlight = True
        Colors.AutoShadow = True
        FontWeight = fwDONTCARE
        Options = [floActiveWhileControlFocused]
        Gradient.Active = False
        Gradient.Orientation = fgdHorizontal
        Alignment = taLeftJustify
      end
      object TrackBar1: TTrackBar
        Left = 83
        Top = 27
        Width = 145
        Height = 25
        Hint = 
          'If selected, press '#39'1'#39' to set this slider to the default positio' +
          'n.'
        Max = 255
        ParentShowHint = False
        Frequency = 128
        Position = 128
        SelStart = 128
        ShowHint = True
        TabOrder = 0
        ThumbLength = 18
        TickStyle = tsNone
        OnChange = TrackBar1Change
        OnKeyPress = TrackBar18KeyPress
      end
      object TrackBar2: TTrackBar
        Left = 83
        Top = 50
        Width = 145
        Height = 25
        Max = 63
        ParentShowHint = False
        Frequency = 128
        Position = 32
        SelStart = 32
        ShowHint = True
        TabOrder = 1
        ThumbLength = 18
        TickStyle = tsNone
        OnChange = TrackBar1Change
        OnKeyPress = TrackBar18KeyPress
      end
      object CheckBox8: TCheckBox
        Left = 167
        Top = 5
        Width = 84
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Soft clipping:'
        TabOrder = 2
        OnClick = TrackBar1Change
      end
      object TrackBar3: TTrackBar
        Left = 84
        Top = 73
        Width = 145
        Height = 25
        Max = 63
        Frequency = 128
        Position = 32
        SelStart = 32
        TabOrder = 3
        ThumbLength = 18
        TickStyle = tsNone
        OnChange = TrackBar1Change
        OnKeyPress = TrackBar18KeyPress
      end
    end
    object Panel3: TPanel
      Left = 276
      Top = 6
      Width = 238
      Height = 111
      BevelWidth = 2
      BorderStyle = bsSingle
      TabOrder = 4
      object Label4: TLabel
        Left = 41
        Top = 22
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Average noise:'
      end
      object Label2avrgnoise: TLabel
        Left = 120
        Top = 22
        Width = 33
        Height = 13
        Caption = ' ??????'
      end
      object Label10: TLabel
        Left = 62
        Top = 38
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Max noise:'
      end
      object Label12: TLabel
        Left = 120
        Top = 38
        Width = 30
        Height = 13
        Caption = '??????'
      end
      object Label5: TLabel
        Left = 23
        Top = 54
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Average raycount:'
      end
      object Label7avrgrays: TLabel
        Left = 120
        Top = 54
        Width = 33
        Height = 13
        Caption = ' ??????'
      end
      object Label11: TLabel
        Left = 44
        Top = 70
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Max raycount:'
      end
      object Label13: TLabel
        Left = 120
        Top = 70
        Width = 33
        Height = 13
        Caption = ' ??????'
      end
      object Label17: TLabel
        Left = 10
        Top = 86
        Width = 104
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total calculation time:'
      end
      object Label18: TLabel
        Left = 120
        Top = 87
        Width = 33
        Height = 13
        Caption = ' ??????'
      end
      object JvgLabel1: TJvgLabel
        Left = 6
        Top = 6
        Width = 49
        Height = 15
        Caption = 'Statistics:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Colors.Text = clBtnText
        Colors.TextDisabled = clGrayText
        Colors.Delineate = clBtnShadow
        Colors.Shadow = clBlack
        Colors.Highlight = 4013373
        Colors.TextActive = clBtnHighlight
        Colors.DelineateActive = clBtnHighlight
        Colors.AutoHighlight = True
        Colors.AutoShadow = True
        FontWeight = fwDONTCARE
        Options = [floActiveWhileControlFocused]
        Gradient.Active = False
        Gradient.Orientation = fgdHorizontal
        Alignment = taLeftJustify
      end
    end
    object Button1: TButton
      Left = 16
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object ScrollBoxMC: TScrollBox
    Left = 276
    Top = 45
    Width = 518
    Height = 456
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 1
      Height = 1
      AutoSize = True
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 45
    Width = 276
    Height = 456
    Align = alLeft
    TabOrder = 3
    object Label25: TLabel
      Left = 8
      Top = 233
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 46
      Top = 28
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ambient rays depth:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 45
      Top = 81
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hard shadow radius:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 71
      Top = 110
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Anti aliasing:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 12
      Top = 307
      Width = 258
      Height = 13
      Caption = 'Only 1 focuspoint, made from average of Zsharp1+2!'
    end
    object Label21: TLabel
      Left = 45
      Top = 195
      Width = 107
      Height = 13
      Alignment = taRightJustify
      Caption = 'Reflection rays depth:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 55
      Top = 226
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = 'Reflection diffusity:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 64
      Top = 387
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'Bokeh:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Image2: TImage
      Left = 164
      Top = 378
      Width = 33
      Height = 33
      Visible = False
    end
    object Label23: TLabel
      Left = 12
      Top = 417
      Width = 258
      Height = 13
      Caption = 'Only 1 focuspoint, made from average of Zsharp1+2!'
    end
    object Label3: TLabel
      Left = 12
      Top = 432
      Width = 255
      Height = 13
      Caption = 'More options: send paras to main, adjust and import.'
    end
    object Label22: TLabel
      Left = 100
      Top = 387
      Width = 14
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object JvgLabel4: TJvgLabel
      Left = 8
      Top = 146
      Width = 140
      Height = 15
      Caption = 'Reflections + Transparency:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Colors.Text = clBtnText
      Colors.TextDisabled = clGrayText
      Colors.Delineate = clBtnShadow
      Colors.Shadow = clBlack
      Colors.Highlight = 4013373
      Colors.TextActive = clBtnHighlight
      Colors.DelineateActive = clBtnHighlight
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Alignment = taLeftJustify
    end
    object JvgLabel5: TJvgLabel
      Left = 12
      Top = 333
      Width = 73
      Height = 15
      Caption = 'Depth of Field:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Colors.Text = clBtnText
      Colors.TextDisabled = clGrayText
      Colors.Delineate = clBtnShadow
      Colors.Shadow = clBlack
      Colors.Highlight = 4013373
      Colors.TextActive = clBtnHighlight
      Colors.DelineateActive = clBtnHighlight
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Alignment = taLeftJustify
    end
    object JvgLabel3: TJvgLabel
      Left = 8
      Top = 8
      Width = 96
      Height = 15
      Caption = 'Calculation options:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Colors.Text = clBtnText
      Colors.TextDisabled = clGrayText
      Colors.Delineate = clBtnShadow
      Colors.Shadow = clBlack
      Colors.Highlight = 4013373
      Colors.TextActive = clBtnHighlight
      Colors.DelineateActive = clBtnHighlight
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Alignment = taLeftJustify
    end
    object Edit21: TEdit
      Left = 153
      Top = 27
      Width = 30
      Height = 19
      Hint = 
        'determines how many following objects diffuse reflections will b' +
        'e calculated'
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = '3'
    end
    object UpDown3: TUpDown
      Left = 183
      Top = 27
      Width = 15
      Height = 19
      Associate = Edit21
      Min = 1
      Max = 30
      Position = 3
      TabOrder = 1
    end
    object CheckBox6: TCheckBox
      Left = 20
      Top = 55
      Width = 146
      Height = 17
      Hint = 
        'A faster method than binsearch, but can lead to failures if DE'#39's' +
        ' are bad'
      Alignment = taLeftJustify
      Caption = 'Secant searchmode:'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 155
      Top = 82
      Width = 48
      Height = 19
      Hint = 
        'Softens the hard shadows. The value is relative to the size of t' +
        'he lightsource, a bigger value leads to a softer shadow.'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '1.0'
    end
    object ComboBox1: TComboBox
      Left = 138
      Top = 107
      Width = 67
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'Box'
      Items.Strings = (
        'Box'
        'Gauss')
    end
    object CheckBox2: TCheckBox
      Left = 30
      Top = 170
      Width = 145
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Calculate reflections:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = CheckBox2Click
    end
    object Edit1: TEdit
      Left = 158
      Top = 193
      Width = 30
      Height = 19
      Hint = 
        'determines how many following straight reflections will be calcu' +
        'lated'
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
      Text = '3'
    end
    object UpDown1: TUpDown
      Left = 188
      Top = 193
      Width = 15
      Height = 19
      Associate = Edit1
      Enabled = False
      Min = 1
      Max = 30
      Position = 3
      TabOrder = 7
    end
    object Edit2: TEdit
      Left = 158
      Top = 224
      Width = 48
      Height = 19
      Hint = 'Makes reflections a little diffuse, value range from 0 to 2.5'
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Text = '0.0'
    end
    object CheckBox3: TCheckBox
      Left = 12
      Top = 252
      Width = 162
      Height = 17
      Hint = 'Reflections must be calculated too, else this has no effect'
      Alignment = taLeftJustify
      Caption = 'Calculate transparency:'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object Button5: TButton
      Left = 180
      Top = 253
      Width = 49
      Height = 41
      Hint = 
        'Verify that sum of diffuse and specular colors dont exceed 1, de' +
        'pending on the choosen options'
      Caption = 'Check colors'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      WordWrap = True
      OnClick = Button5Click
    end
    object CheckBox7: TCheckBox
      Left = 41
      Top = 279
      Width = 133
      Height = 17
      Hint = 
        'Verify while calculating if specular+diffuse amount exceeds 1.  ' +
        'Useful when using diffmaps.'
      Alignment = taLeftJustify
      Caption = 'Autoclip spec+diff :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object CheckBox4: TCheckBox
      Left = 64
      Top = 352
      Width = 110
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Calculate DoF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = CheckBox4Click
    end
    object UpDown2: TUpDown
      Left = 131
      Top = 385
      Width = 23
      Height = 21
      Enabled = False
      Min = 1
      Max = 9999
      Position = 5000
      TabOrder = 13
      OnClick = UpDown2Click
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 387
    Top = 123
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 387
    Top = 188
  end
  object SaveDialog3: TSaveDialog
    DefaultExt = 'm3c'
    Filter = 'M3D monte carlo file (*.m3c)|*.m3c'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 324
    Top = 190
  end
  object SaveDialog6: TSaveDialog
    DefaultExt = 'bmp'
    Filter = 
      'Windows Bitmap|*.bmp|Portable Network Graphic|*.png|JPEG image|*' +
      '.jpg'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    OnTypeChange = SaveDialog6TypeChange
    Left = 327
    Top = 129
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 500
    Left = 389
    Top = 248
  end
end
