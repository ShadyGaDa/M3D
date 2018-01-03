object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 597
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    597)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_frm_top: TLabel
    Left = 8
    Top = 300
    Width = 126
    Height = 18
    ParentCustomHint = False
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'F  O  R  M  U  L  A'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowAccelChar = False
    ShowHint = False
    Transparent = True
    Visible = False
  end
  object lbl_frm_lbl: TLabel
    Left = 23
    Top = 253
    Width = 47
    Height = 13
    Caption = 'Formula '#7
    Visible = False
  end
  object lbl_frm2: TLabel
    Left = 76
    Top = 253
    Width = 15
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object sb_frm_type_1: TSpeedButton
    Tag = 1
    Left = 511
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime 3D formulas'
    AllowAllUp = True
    GroupIndex = 5
    Caption = '3D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_2: TSpeedButton
    Tag = 2
    Left = 484
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime 3D formulas'
    AllowAllUp = True
    GroupIndex = 5
    Caption = '3D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_3: TSpeedButton
    Tag = 3
    Left = 455
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime 3D formulas with analytic (faster) DE calculation'
    AllowAllUp = True
    GroupIndex = 5
    Caption = '3Da'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_4: TSpeedButton
    Tag = 4
    Left = 426
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime 4D formulas'
    AllowAllUp = True
    GroupIndex = 5
    Caption = '4D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_5: TSpeedButton
    Tag = 5
    Left = 397
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime 4D formulas with analytic (faster) DE calculation'
    AllowAllUp = True
    GroupIndex = 5
    Caption = '4Da'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_6: TSpeedButton
    Tag = 6
    Left = 367
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime 4D formulas with analytic (faster) DE calculation'
    AllowAllUp = True
    GroupIndex = 5
    Caption = 'Ads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_7: TSpeedButton
    Tag = 7
    Left = 340
    Top = 377
    Width = 28
    Height = 21
    Hint = 'escapetime transformations only,'
    AllowAllUp = True
    GroupIndex = 5
    Caption = 'Ads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_8: TSpeedButton
    Tag = 8
    Left = 314
    Top = 378
    Width = 28
    Height = 21
    Hint = 'escapetime 4D formulas with analytic (faster) DE calculation'
    AllowAllUp = True
    GroupIndex = 5
    Caption = 'Ads'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_9: TSpeedButton
    Tag = 9
    Left = 285
    Top = 378
    Width = 28
    Height = 21
    Hint = 'dIFS shapes'
    AllowAllUp = True
    GroupIndex = 5
    Caption = 'dIFS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_10: TSpeedButton
    Tag = 10
    Left = 256
    Top = 378
    Width = 28
    Height = 21
    Hint = 'dIFS shapes'
    AllowAllUp = True
    GroupIndex = 5
    Caption = 'dIFS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object sb_frm_type_11: TSpeedButton
    Tag = 11
    Left = 227
    Top = 378
    Width = 28
    Height = 21
    Hint = 'dIFS transformations'
    AllowAllUp = True
    GroupIndex = 5
    Caption = 'dIFS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object Bevel_F_1: TBevel
    Left = 313
    Top = 412
    Width = 226
    Height = 23
    Style = bsRaised
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 369
    Top = 211
    Width = 23
    Height = 22
    Visible = False
  end
  object JvSpeedButton1: TJvSpeedButton
    Left = 368
    Top = 242
    Width = 25
    Height = 25
    Visible = False
  end
  object JvgSpeedButton1: TJvgSpeedButton
    Left = 408
    Top = 242
    Width = 23
    Height = 22
    Enabled = True
    Visible = False
    Color = 3355443
    ActiveColor = 4013373
    FrameColor = clBlack
    DefaultStyle = False
    ModalResult = 0
  end
  object JvgExtSpeedButton1: TJvgExtSpeedButton
    Left = 476
    Top = 242
    Width = 23
    Height = 22
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
    FrameColor = clBlack
    DefaultStyle = False
    ModalResult = 0
    Style.Gradient.Active = False
    Style.Gradient.Orientation = fgdHorizontal
    Style.Color = 3355443
    Style.DelineateColor = clBlack
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.Bevel.Inner = bvRaised
    Style.Bevel.Outer = bvNone
    Style.Bevel.Bold = False
    Style.TextStyle = fstNone
    Style.TextGradient.Active = False
    Style.TextGradient.Orientation = fgdHorizontal
    StyleActive.Gradient.Active = False
    StyleActive.Gradient.Orientation = fgdHorizontal
    StyleActive.Color = 4013373
    StyleActive.DelineateColor = clBlack
    StyleActive.Font.Charset = DEFAULT_CHARSET
    StyleActive.Font.Color = clWindowText
    StyleActive.Font.Height = -11
    StyleActive.Font.Name = 'Tahoma'
    StyleActive.Font.Style = []
    StyleActive.Bevel.Inner = bvRaised
    StyleActive.Bevel.Outer = bvNone
    StyleActive.Bevel.Bold = False
    StyleActive.TextStyle = fstNone
    StyleActive.TextGradient.Active = False
    StyleActive.TextGradient.Orientation = fgdHorizontal
    StylePushed.Gradient.Active = False
    StylePushed.Gradient.Orientation = fgdHorizontal
    StylePushed.Color = 2697513
    StylePushed.DelineateColor = clBlack
    StylePushed.Font.Charset = DEFAULT_CHARSET
    StylePushed.Font.Color = clWindowText
    StylePushed.Font.Height = -11
    StylePushed.Font.Name = 'Tahoma'
    StylePushed.Font.Style = []
    StylePushed.Bevel.Inner = bvLowered
    StylePushed.Bevel.Outer = bvNone
    StylePushed.Bevel.Bold = False
    StylePushed.TextStyle = fstNone
    StylePushed.TextGradient.Active = False
    StylePushed.TextGradient.Orientation = fgdHorizontal
  end
  object Bevel_F_2: TBevel
    Left = 228
    Top = 220
    Width = 24
    Height = 24
    Shape = bsFrame
    Style = bsRaised
    Visible = False
  end
  object DockTabSet1: TDockTabSet
    Left = 8
    Top = 276
    Width = 155
    Height = 18
    ParentCustomHint = False
    AutoScroll = False
    DitherBackground = False
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    SoftTop = True
    Style = tsSoftTabs
    TabHeight = 18
    Tabs.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
    TabIndex = 0
    Visible = False
    StyleElements = []
    DockSite = False
  end
  object JvTabControl1: TJvTabControl
    Left = 38
    Top = 320
    Width = 129
    Height = 18
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabHeight = 16
    TabOrder = 1
    Tabs.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
    TabIndex = 0
    TabWidth = 12
    Visible = False
    Color = clBlue
    object Label1: TLabel
      Left = 87
      Top = 2
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
  end
  object ts_frm: TTabSet
    Left = 6
    Top = 368
    Width = 166
    Height = 18
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ParentCustomHint = False
    AutoScroll = False
    DitherBackground = False
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    SoftTop = True
    Style = tsSoftTabs
    TabHeight = 16
    Tabs.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
    TabIndex = 0
    Visible = False
    StyleElements = []
  end
  object ud_frm2: TUpDown
    Left = 92
    Top = 254
    Width = 16
    Height = 16
    ParentCustomHint = False
    DoubleBuffered = False
    Max = 5
    Orientation = udHorizontal
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    Thousands = False
    Visible = False
  end
  object pn_right: TPanel
    Left = 8
    Top = 432
    Width = 166
    Height = 18
    ParentCustomHint = False
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = clBtnShadow
    Ctl3D = False
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 8
    Top = 19
    Width = 159
    Height = 228
    Caption = 'Panel1'
    Enabled = False
    TabOrder = 5
    Visible = False
    object Bevel1: TBevel
      Left = 1
      Top = 67
      Width = 155
      Height = 2
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 1
      Top = 177
      Width = 155
      Height = 2
      Shape = bsTopLine
    end
    object Image1: TImage
      Left = 144
      Top = 70
      Width = 12
      Height = 11
      AutoSize = True
      Picture.Data = {
        07544269746D6170C2010000424DC20100000000000036000000280000000C00
        00000B00000001001800000000008C010000110B0000110B0000000000000000
        000084C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C3
        84C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4
        C384C4C384C4C384C4C384C4C300000000000000000000000000000000000000
        000000000000000000000084C4C384C4C3000000292929484848484848484848
        48484848484848484829292900000084C4C384C4C384C4C30000003535355454
        5454545454545454545435353500000084C4C384C4C384C4C384C4C384C4C300
        000041414163636363636341414100000084C4C384C4C384C4C384C4C384C4C3
        84C4C384C4C300000046464646464600000084C4C384C4C384C4C384C4C384C4
        C384C4C384C4C384C4C384C4C300000000000084C4C384C4C384C4C384C4C384
        C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C3
        84C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4
        C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384
        C4C384C4C384C4C384C4C384C4C3}
      Transparent = True
      Visible = False
    end
    object Image2: TImage
      Left = 144
      Top = 165
      Width = 12
      Height = 11
      AutoSize = True
      Picture.Data = {
        07544269746D6170C2010000424DC20100000000000036000000280000000C00
        00000B00000001001800000000008C010000110B0000110B0000000000000000
        000084C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C3
        84C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4
        C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384
        C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C3000000
        00000084C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C30000
        0046464646464600000084C4C384C4C384C4C384C4C384C4C384C4C384C4C300
        000041414163636363636341414100000084C4C384C4C384C4C384C4C384C4C3
        00000035353554545454545454545454545435353500000084C4C384C4C384C4
        C300000029292948484848484848484848484848484848484829292900000084
        C4C384C4C3000000000000000000000000000000000000000000000000000000
        00000084C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4
        C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384C4C384
        C4C384C4C384C4C384C4C384C4C3}
      Transparent = True
      Visible = False
    end
    object Label_N_45: TLabel
      Left = 1
      Top = 28
      Width = 24
      Height = 13
      Caption = 'F.nr:'
    end
    object Label_N_F0: TLabel
      Left = 2
      Top = 69
      Width = 43
      Height = 13
      Caption = 'fp name:'
    end
    object Label_N_F1: TLabel
      Left = 2
      Top = 101
      Width = 43
      Height = 13
      Caption = 'fp name:'
    end
    object Label_N_F2: TLabel
      Left = 2
      Top = 135
      Width = 43
      Height = 13
      Caption = 'fp name:'
    end
    object Label_N_V0: TLabel
      Tag = 3
      Left = 84
      Top = 84
      Width = 65
      Height = 16
      Hint = 'You can also click on a value to change it'
      Alignment = taCenter
      AutoSize = False
      Caption = '0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label_N_V1: TLabel
      Tag = 4
      Left = 84
      Top = 118
      Width = 65
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
    end
    object Label_N_V2: TLabel
      Tag = 5
      Left = 85
      Top = 152
      Width = 65
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
    end
    object lb_fname: TLabel
      Left = 67
      Top = 28
      Width = 89
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Transparent = True
    end
    object lbl_frm: TLabel
      Left = 27
      Top = 28
      Width = 14
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_frm_design: TLabel
      Left = 2
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Iterations:'
    end
    object lbl_frm_its: TLabel
      Left = 92
      Top = 48
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sb_frm_move: TSpeedButton
      Left = 0
      Top = 0
      Width = 18
      Height = 18
      Hint = 'Move Formula Panel in/out of side panel.'
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object sb_frm_out: TSpeedButton
      Left = 4
      Top = 202
      Width = 154
      Height = 20
      Hint = 'Send all adjusted formula values to the main program parameters.'
      Caption = 'Send all formula values'
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object sb_frm_val_in: TSpeedButton
      Left = 2
      Top = 180
      Width = 71
      Height = 20
      Hint = 'Input the original value from the main program parameters.'
      Caption = 'Reset value'
      Enabled = False
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object sb_frm_val_out: TSpeedButton
      Left = 84
      Top = 180
      Width = 71
      Height = 20
      Hint = 'Put this adjusted value into the main program parameter.'
      Caption = 'Send value'
      Enabled = False
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object scr_frm: TScrollBar
      Left = 141
      Top = 70
      Width = 14
      Height = 107
      Kind = sbVertical
      Max = 13
      PageSize = 0
      TabOrder = 0
      Visible = False
    end
    object TrackBarEx_N_4: TTrackBarEx
      Tag = 3
      Left = -2
      Top = 81
      Width = 90
      Height = 21
      Ctl3D = True
      Max = 60
      Min = -60
      ParentCtl3D = False
      TabOrder = 1
      ThumbLength = 18
      TickMarks = tmBoth
      TickStyle = tsNone
    end
    object TrackBarEx_N_5: TTrackBarEx
      Tag = 4
      Left = -2
      Top = 115
      Width = 90
      Height = 21
      Ctl3D = True
      Max = 60
      Min = -60
      ParentCtl3D = False
      TabOrder = 2
      ThumbLength = 18
      TickMarks = tmBoth
      TickStyle = tsNone
    end
    object TrackBarEx_N_6: TTrackBarEx
      Tag = 5
      Left = -2
      Top = 148
      Width = 90
      Height = 21
      Ctl3D = True
      Max = 60
      Min = -60
      ParentCtl3D = False
      TabOrder = 3
      ThumbLength = 18
      TickMarks = tmBoth
      TickStyle = tsNone
    end
    object ud_frm: TUpDown
      Left = 45
      Top = 25
      Width = 21
      Height = 19
      Max = 5
      TabOrder = 4
    end
    object ud_frm_it: TUpDown
      Left = 104
      Top = 45
      Width = 19
      Height = 21
      Min = -30000
      Max = 30000
      TabOrder = 5
    end
  end
  object cbx_frm: TComboBoxEx
    Left = 224
    Top = 351
    Width = 145
    Height = 20
    ItemsEx = <
      item
      end>
    Style = csExDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    DropDownCount = 64
  end
  object jclb: TJvComboListBox
    Left = 382
    Top = 333
    Width = 121
    Height = 23
    ScrollBars = ssVertical
    TabOrder = 7
    Visible = False
  end
  object JvCLB_frm: TJvComboListBox
    Left = 213
    Top = 536
    Width = 326
    Height = 46
    IntegralHeight = True
    ScrollBars = ssNone
    Columns = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      '3d'
      '3da'
      '4d'
      '4da'
      'ads1'
      'ads2'
      'ifsS'
      'ifsT')
    ParentFont = False
    TabOrder = 8
    Visible = False
  end
  object rg_frm_type_11: TRadioButton
    Left = 461
    Top = 467
    Width = 27
    Height = 18
    Alignment = taLeftJustify
    Caption = 'ifs'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 9
    Visible = False
  end
  object rg_frm_type_1: TRadioButton
    Left = 428
    Top = 467
    Width = 27
    Height = 18
    Alignment = taLeftJustify
    Caption = '3d'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 10
    Visible = False
  end
  object ComboEdit_F_1: TEdit
    Left = 378
    Top = 527
    Width = 156
    Height = 21
    Hint = 'You can also type in the formula directly'
    Alignment = taCenter
    AutoSize = False
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
    TabOrder = 11
    Visible = False
  end
  object ListBoxEx_F_12: TListBoxEx
    Tag = 12
    Left = 334
    Top = 554
    Width = 155
    Height = 28
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 12
    Visible = False
  end
  object ListBoxEx_F_15: TListBoxEx
    Tag = 15
    Left = 233
    Top = 408
    Width = 75
    Height = 36
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 13
    Visible = False
  end
  object ListBoxEx_F_1: TListBoxEx
    Tag = 1
    Left = 321
    Top = 421
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 14
    Visible = False
  end
  object ListBoxEx_F_2: TListBoxEx
    Tag = 2
    Left = 314
    Top = 434
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 15
    Visible = False
  end
  object ListBoxEx_F_3: TListBoxEx
    Tag = 3
    Left = 306
    Top = 452
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 16
    Visible = False
  end
  object ListBoxEx_F_4: TListBoxEx
    Tag = 4
    Left = 297
    Top = 471
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 17
    Visible = False
  end
  object ListBoxEx_F_5: TListBoxEx
    Tag = 5
    Left = 288
    Top = 486
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 18
    Visible = False
  end
  object ListBoxEx_F_6: TListBoxEx
    Tag = 6
    Left = 281
    Top = 501
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 19
    Visible = False
  end
  object ListBoxEx_F_7: TListBoxEx
    Tag = 7
    Left = 270
    Top = 515
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 20
    Visible = False
  end
  object ListBoxEx_F_8: TListBoxEx
    Tag = 8
    Left = 258
    Top = 518
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 21
    Visible = False
  end
  object ListBoxEx_F_9: TListBoxEx
    Tag = 9
    Left = 248
    Top = 518
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 22
    Visible = False
  end
  object ListBoxEx_F_10: TListBoxEx
    Tag = 10
    Left = 239
    Top = 518
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 23
    Visible = False
  end
  object ListBoxEx_F_11: TListBoxEx
    Tag = 11
    Left = 223
    Top = 518
    Width = 64
    Height = 64
    Style = lbOwnerDrawFixed
    AutoCompleteDelay = 750
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvRaised
    Color = clMenuBar
    Ctl3D = True
    ExtendedSelect = False
    ItemHeight = 12
    ParentCtl3D = False
    TabOrder = 24
    Visible = False
  end
  object RadioButton1: TRadioButton
    Left = 252
    Top = 247
    Width = 113
    Height = 17
    Caption = 'RadioButton1'
    TabOrder = 25
    Visible = False
  end
  object JvTB: TJvTrackBar
    Left = 227
    Top = 33
    Width = 102
    Height = 159
    ParentCustomHint = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    DoubleBuffered = False
    Max = 60
    Min = -60
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    PositionToolTip = ptTop
    ShowHint = False
    TabOrder = 26
    Visible = False
    ToolTips = True
    ToolTipSide = tsTop
  end
  object JvT: TJvTracker
    AlignWithMargins = True
    Left = 371
    Top = 273
    Width = 141
    Height = 133
    Minimum = -100
    BackBorder = True
    TrackColorStart = clGradientActiveCaption
    TrackColorEnd = clScrollBar
    TrackPositionColored = True
    BorderColor = clBtnText
    ThumbColor = clBtnFace
    ThumbBorder = True
    ThumbWidth = 16
    ShowCaption = False
    CaptionColor = clBtnText
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    Visible = False
  end
  object Edit2: TEdit
    Left = 223
    Top = 312
    Width = 121
    Height = 21
    Alignment = taCenter
    BorderStyle = bsNone
    Ctl3D = True
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 28
    Text = 'Edit2'
    Visible = False
  end
  object Edit1: TEdit
    Left = 231
    Top = 279
    Width = 121
    Height = 21
    TabOrder = 29
    Text = 'Edit1'
    Visible = False
  end
  object JvTrackBar1: TJvTrackBar
    Left = 377
    Top = 122
    Width = 150
    Height = 45
    TabOrder = 30
    Visible = False
  end
  object JvxS: TJvxSlider
    AlignWithMargins = True
    Left = 218
    Top = 151
    Width = 139
    Height = 133
    BevelStyle = bvRaised
    MinValue = -60
    MaxValue = 60
    EdgeSize = 0
    ParentShowHint = False
    ShowHint = False
    TabOrder = 31
    Visible = False
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object TrackBarEx1: TTrackBarEx
    Left = 364
    Top = 328
    Width = 150
    Height = 32
    TabOrder = 32
    Visible = False
  end
  object TrackBar1: TTrackBar
    Left = 365
    Top = 297
    Width = 150
    Height = 45
    TabOrder = 33
    Visible = False
  end
  object CheckListBox1: TCheckListBox
    Left = 420
    Top = 307
    Width = 74
    Height = 164
    ItemHeight = 13
    Items.Strings = (
      'all'
      '3d'
      '3da1'
      '3da2'
      '4d'
      '4da1'
      '4da2'
      'ads1'
      'ads2'
      'ifsT'
      'ifsS')
    TabOrder = 34
  end
  object JvgCheckListBox1: TJvgCheckListBox
    Left = 258
    Top = 303
    Width = 122
    Height = 83
    MultiSelect = True
    Items.Strings = (
      '3d'
      '4d'
      'ads'
      'ifs')
    TabOrder = 35
    ItemStyle.Gradient.FromColor = clGradientActiveCaption
    ItemStyle.Gradient.ToColor = clGradientInactiveCaption
    ItemStyle.Gradient.Active = False
    ItemStyle.Gradient.Orientation = fgdHorizontal
    ItemStyle.Gradient.Steps = 16
    ItemStyle.Color = clBtnFace
    ItemStyle.DelineateColor = clGrayText
    ItemStyle.Font.Charset = DEFAULT_CHARSET
    ItemStyle.Font.Color = clWindowText
    ItemStyle.Font.Height = -11
    ItemStyle.Font.Name = 'Tahoma'
    ItemStyle.Font.Style = []
    ItemStyle.Bevel.Inner = bvLowered
    ItemStyle.Bevel.Outer = bvRaised
    ItemStyle.Bevel.Bold = True
    ItemStyle.TextStyle = fstRecessed
    ItemSelStyle.Gradient.FromColor = clGradientActiveCaption
    ItemSelStyle.Gradient.ToColor = clGradientInactiveCaption
    ItemSelStyle.Gradient.Active = True
    ItemSelStyle.Gradient.BufferedDraw = True
    ItemSelStyle.Gradient.Orientation = fgdHorizontal
    ItemSelStyle.Gradient.Steps = 16
    ItemSelStyle.Color = clBtnShadow
    ItemSelStyle.DelineateColor = clGrayText
    ItemSelStyle.Font.Charset = DEFAULT_CHARSET
    ItemSelStyle.Font.Color = clWindowText
    ItemSelStyle.Font.Height = -11
    ItemSelStyle.Font.Name = 'Tahoma'
    ItemSelStyle.Font.Style = []
    ItemSelStyle.Bevel.Inner = bvLowered
    ItemSelStyle.Bevel.Outer = bvRaised
    ItemSelStyle.Bevel.Bold = True
    ItemSelStyle.TextStyle = fstNone
    TransparentColor = clGrayText
    HotTrackColor = clHotLight
    Options = [fboExcludeGlyphs, fboHotTrack, fboWordWrap]
    ChangeGlyphColor.FromColor = clGradientActiveCaption
    ChangeGlyphColor.ToColor = clGradientInactiveCaption
  end
  object JvCheckListBox1: TJvCheckListBox
    Left = 217
    Top = 278
    Width = 303
    Height = 44
    Columns = 5
    Ctl3D = True
    DoubleBuffered = True
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'all'
      ''
      ''
      '3d'
      '3d'
      '3da'
      '4d'
      '4d'
      '4da'
      'ads'
      'ads1'
      'ads2'
      'ifs'
      'ifsT'
      'ifsS')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollWidth = 45
    TabOrder = 36
    MultiSelect = True
    HorScrollbar = False
  end
  object RG_Adj: TRadioGroup
    Left = 399
    Top = 247
    Width = 107
    Height = 30
    Caption = 'Adjustments:  x  '
    Color = clBtnFace
    Columns = 4
    ItemIndex = 2
    Items.Strings = (
      '0'
      '1'
      '2'
      '3')
    ParentBackground = False
    ParentColor = False
    TabOrder = 37
    Visible = False
  end
  object cbtxt_F: TCheckBox
    Left = 242
    Top = 91
    Width = 85
    Height = 15
    Hint = 'Text InPut'
    Alignment = taLeftJustify
    Caption = 'Text On/Off'
    TabOrder = 38
    Visible = False
  end
  object JvTracker1: TJvTracker
    Left = 335
    Top = 80
    Width = 112
    Height = 26
    DotNetHighlighting = True
    Minimum = -100
    BackBorder = True
    TrackColorStart = clGradientActiveCaption
    TrackColorEnd = clScrollBar
    TrackPositionColored = True
    BorderColor = clBtnHighlight
    ThumbColor = clBtnHighlight
    ThumbBorder = True
    ThumbWidth = 16
    TrackHeight = 8
    ShowCaption = False
    CaptionColor = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 39
    Visible = False
  end
  object tbx: TTrackBarEx
    Left = 462
    Top = 8
    Width = 24
    Height = 21
    TabOrder = 40
    Visible = False
  end
  object Button_F_4: TButton
    Left = 492
    Top = 6
    Width = 25
    Height = 25
    Hint = 'Push to normalise the 3d vector length to 1. '
    Caption = 'N'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 41
    Visible = False
    WordWrap = True
  end
  object JvSpeedBar1: TJvSpeedBar
    Left = 371
    Top = 35
    Width = 224
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'SegoeUISB'
    Font.Style = []
    Position = bpCustom
    Align = alNone
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 24
    BtnHeight = 23
    TabOrder = 42
    Visible = False
    InternalVer = 1
  end
end
