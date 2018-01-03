unit uDUMP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, TrackBarEx, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, JvExComCtrls, JvComCtrls, Vcl.Tabs, Vcl.DockTabSet,
  JvExCheckLst, JvCheckListBox, JvgListBox, Vcl.CheckLst, JvxSlider,
  JvExControls, JvTracker, ListBoxEx, JvExStdCtrls, JvListBox, JvComboListBox,
  JvgSpeedButton, JvSpeedButton, JvExExtCtrls, JvExtComponent, JvSpeedbar;

type
  TForm1 = class(TForm)
    lbl_frm_top: TLabel;
    lbl_frm_lbl: TLabel;
    lbl_frm2: TLabel;
    DockTabSet1: TDockTabSet;
    JvTabControl1: TJvTabControl;
    Label1: TLabel;
    ts_frm: TTabSet;
    ud_frm2: TUpDown;
    pn_right: TPanel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image1: TImage;
    Image2: TImage;
    Label_N_45: TLabel;
    Label_N_F0: TLabel;
    Label_N_F1: TLabel;
    Label_N_F2: TLabel;
    Label_N_V0: TLabel;
    Label_N_V1: TLabel;
    Label_N_V2: TLabel;
    lb_fname: TLabel;
    lbl_frm: TLabel;
    lbl_frm_design: TLabel;
    lbl_frm_its: TLabel;
    sb_frm_move: TSpeedButton;
    sb_frm_out: TSpeedButton;
    sb_frm_val_in: TSpeedButton;
    sb_frm_val_out: TSpeedButton;
    scr_frm: TScrollBar;
    TrackBarEx_N_4: TTrackBarEx;
    TrackBarEx_N_5: TTrackBarEx;
    TrackBarEx_N_6: TTrackBarEx;
    ud_frm: TUpDown;
    ud_frm_it: TUpDown;
    sb_frm_type_1: TSpeedButton;
    sb_frm_type_2: TSpeedButton;
    sb_frm_type_3: TSpeedButton;
    sb_frm_type_4: TSpeedButton;
    sb_frm_type_5: TSpeedButton;
    sb_frm_type_6: TSpeedButton;
    sb_frm_type_7: TSpeedButton;
    sb_frm_type_8: TSpeedButton;
    sb_frm_type_9: TSpeedButton;
    sb_frm_type_10: TSpeedButton;
    sb_frm_type_11: TSpeedButton;
    Bevel_F_1: TBevel;
    SpeedButton1: TSpeedButton;
    JvSpeedButton1: TJvSpeedButton;
    JvgSpeedButton1: TJvgSpeedButton;
    JvgExtSpeedButton1: TJvgExtSpeedButton;
    Bevel_F_2: TBevel;
    cbx_frm: TComboBoxEx;
    jclb: TJvComboListBox;
    JvCLB_frm: TJvComboListBox;
    rg_frm_type_11: TRadioButton;
    rg_frm_type_1: TRadioButton;
    ComboEdit_F_1: TEdit;
    ListBoxEx_F_12: TListBoxEx;
    ListBoxEx_F_15: TListBoxEx;
    ListBoxEx_F_1: TListBoxEx;
    ListBoxEx_F_2: TListBoxEx;
    ListBoxEx_F_3: TListBoxEx;
    ListBoxEx_F_4: TListBoxEx;
    ListBoxEx_F_5: TListBoxEx;
    ListBoxEx_F_6: TListBoxEx;
    ListBoxEx_F_7: TListBoxEx;
    ListBoxEx_F_8: TListBoxEx;
    ListBoxEx_F_9: TListBoxEx;
    ListBoxEx_F_10: TListBoxEx;
    ListBoxEx_F_11: TListBoxEx;
    RadioButton1: TRadioButton;
    JvTB: TJvTrackBar;
    JvT: TJvTracker;
    Edit2: TEdit;
    Edit1: TEdit;
    JvTrackBar1: TJvTrackBar;
    JvxS: TJvxSlider;
    TrackBarEx1: TTrackBarEx;
    TrackBar1: TTrackBar;
    CheckListBox1: TCheckListBox;
    JvgCheckListBox1: TJvgCheckListBox;
    JvCheckListBox1: TJvCheckListBox;
    RG_Adj: TRadioGroup;
    cbtxt_F: TCheckBox;
    JvTracker1: TJvTracker;
    tbx: TTrackBarEx;
    Button_F_4: TButton;
    JvSpeedBar1: TJvSpeedBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
