unit MAIN;


interface

{$REGION '============================================================================= > | USES'}
uses
  Winapi.Messages,
  Winapi.SHFolder,
  Winapi.Windows,
  System.Classes,
  System.Generics.Collections,
  System.ImageList,
  System.SysUtils,
  Vcl.Buttons,
  Vcl.CheckLst,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ExtDlgs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Vcl.Mask,
  JvExMask,
  JvSpin,
  JvCheckListBox,
  JvCheckTreeView,
  JvComboListBox,
  JvComCtrls,
  JvExCheckLst,
  JvExComCtrls,
  JvExControls,
  JvExExtCtrls,
  JvExStdCtrls,
  JvExtComponent,
  JvgCheckBox,
  JvgLabel,
  JvgListBox,
  JvgSpeedButton,
  JvListBox,
  JvMemo,
  JvMenus,
  JvRadioGroup,
  JvSpeedbar,
  JvSpeedButton,
  JvTracker,
  JvxCheckListBox,
  JvxSlider,
  uFormula,
  AmbShadowCalcThreadN,
  CalcThread,
  //ExTrackBar,
  FileHandling,
  ListBoxEx,
  M3Iregister,
  Math3D,
  PaintThread,
  //SciEdit,
  SpeedButtonEx,
  TrackBarEx,
  TypeDefinitions,
  uM2T;


{$ENDREGION '============================================================================= > | USES'}

//  function Byte2Str(var B: Byte): String;
//  function Word2Str(var W: Word): String;

type

  TqualPreset = packed record
    SmoothNormals: Integer;
    DEstop: Double;
    RayMultiplier: Single;
    BinSearch: Integer;
    ImageWidth: Integer;
    ImageScale: Integer;
    RayLimiter: Single;
  end;

  TGUI = class(TForm)

{$REGION '============================================================================= > | CONTROLS'}
    btnBlocky: TButton;
    btnCalc3D: TButton;
    sb_BugReport: TSpeedButton;
    btn_Random: TButton;
    btn_frm_info_close: TButton;
    Button_M_1: TButton;
    Button_M_12: TButton;
    Button_M_13: TButton;
    Button_M_16: TButton;
    Button_M_17: TButton;
    Button_M_19: TButton;
    Button_M_20: TButton;
    sb_save_PNG: TSpeedButton;
    btn_save_M3P: TSpeedButton;
    sb_open_M3P: TSpeedButton;
    Button_M_6: TButton;
    btn_SetRotation: TButton;
    sb_save_M3I: TSpeedButton;
    sb_open_M3I: TSpeedButton;
    ButtonAuthor: TButton;
    ButtonInsertAuthor: TButton;
    btn_ResetRotation: TButton;
    ButtonVolLight: TButton;
    CalcPnl: TPanel;
    CheckBox_F_1: TCheckBox;
    CheckBox_F_2: TCheckBox;
    CheckBox_M_1: TCheckBox;
    cb_keep_aspect: TCheckBox;
    cb_DoF_DEstop: TCheckBox;
    CheckBox_M_12: TCheckBox;
    cb_par_in_png: TCheckBox;
    CheckBox_M_14: TCheckBox;
    CheckBox_M_15: TCheckBox;
    CheckBox_M_16: TCheckBox;
    CheckBox_M_2: TCheckBox;
    CheckBox_M_3: TCheckBox;
    CheckBox_M_4: TCheckBox;
    CheckBox_M_5: TCheckBox;
    CheckBox_M_6: TCheckBox;
    cb_julia_mode: TCheckBox;
    CheckBox_M_8: TCheckBox;
    CheckBox_M_9: TCheckBox;
    ColorDialog_L_1: TColorDialog;
    ColorPnl: TPanel;
    ComboBox_F_1: TComboBox;
    ComboBoxThread: TComboBox;
    Copythevaluesto1: TMenuItem;
    Copythisformulatoformula21: TMenuItem;
    Copythisformulatoformula31: TMenuItem;
    Copythisformulatoformula41: TMenuItem;
    Copythisformulatoformula51: TMenuItem;
    Copythisformulatoformula61: TMenuItem;
    Copythisformulatoformulanr11: TMenuItem;
    CopythislighttoLight11: TMenuItem;
    CopythislighttoLight21: TMenuItem;
    CopythislighttoLight31: TMenuItem;
    CopythislighttoLight41: TMenuItem;
    CopythislighttoLight51: TMenuItem;
    CopythislighttoLight61: TMenuItem;
    CuttingPnl: TPanel;
    DECombineCmb: TComboBox;
    Deletethisformulapermanently1: TMenuItem;
    Donotmakethiswindowsticky1: TMenuItem;
    Edit_F_0: TEdit;
    Edit_F_1: TEdit;
    Edit_F_10: TEdit;
    Edit_F_11: TEdit;
    Edit_F_12: TEdit;
    Edit_F_13: TEdit;
    Edit_F_14: TEdit;
    Edit_F_15: TEdit;
    Edit_F_2: TEdit;
    Edit_F_23: TEdit;
    Edit_F_25: TEdit;
    Edit_F_3: TEdit;
    Edit_F_4: TEdit;
    Edit_F_5: TEdit;
    Edit_F_6: TEdit;
    Edit_F_7: TEdit;
    Edit_F_8: TEdit;
    Edit_F_9: TEdit;
    eZstart: TEdit;
    eYmid: TEdit;
    ed_width: TEdit;
    ed_height: TEdit;
    Edit_M_13: TEdit;
    eFOV: TEdit;
    Edit_M_15: TEdit;
    Edit_M_16: TEdit;
    eZmid: TEdit;
    Edit_M_18: TEdit;
    Edit_M_19: TEdit;
    Edit_M_2: TEdit;
    Edit_M_20: TEdit;
    Edit_M_22: TEdit;
    Edit_M_23: TEdit;
    Edit_M_24: TEdit;
    Edit_M_25: TEdit;
    ed_jpg_qual: TEdit;
    eXrot: TEdit;
    Edit_M_28: TEdit;
    Edit_M_29: TEdit;
    eZend: TEdit;
    Edit_M_30: TEdit;
    eYrot: TEdit;
    eZrot: TEdit;
    Edit_M_33: TEdit;
    Edit_M_34: TEdit;
    Edit_M_35: TEdit;
    Edit_M_4: TEdit;
    eZoom: TEdit;
    Edit_M_6: TEdit;
    eJW: TEdit;
    Edit_M_8: TEdit;
    eXmid: TEdit;
    EditItCount: TEdit;
    EditJITFormulaItm: TMenuItem;
    EditThread: TEdit;
    ExchangeFormulaLeftBtn: TSpeedButton;
    ExchangeFormulaRightBtn: TSpeedButton;
    FOVyPnl: TPanel;
    FrameEdit: TEdit;
    FrameUpDown: TUpDown;
    GroupBox_M_1: TGroupBox;
    GroupBox_M_2: TGroupBox;
    Hidethisformula1: TMenuItem;
    Ilikethisformula1: TMenuItem;
    Image_M_1: TImage;
    Image2_M_2: TImage;
    ImageList_L_1: TImageList;
    InfoPnl: TPanel;
    sb_IniDirs: TSpeedButton;
    Insertvolumetriclightcolor1: TMenuItem;
    JITFormulaBtn: TSpeedButton;
    JITPopupMenu: TPopupMenu;
    JuliaPnl: TPanel;
    Label_F_0: TLabel;
    Label_F_1: TLabel;
    Label_F_10: TLabel;
    Label_F_11: TLabel;
    Label_F_12: TLabel;
    Label_F_13: TLabel;
    Label_F_14: TLabel;
    Label_F_15: TLabel;
    Label_F_17: TLabel;
    Label_F_18: TLabel;
    Label_F_19: TLabel;
    Label_F_2: TLabel;
    Label_F_20: TLabel;
    Label_F_21: TLabel;
    Label_F_25: TLabel;
    Label_F_27: TLabel;
    Label_F_28: TLabel;
    Label_F_3: TLabel;
    Label_F_4: TLabel;
    Label_F_5: TLabel;
    Label_F_6: TLabel;
    Label_F_7: TLabel;
    Label_F_8: TLabel;
    Label_F_9: TLabel;
    Label_M_1: TLabel;
    Label_M_10: TLabel;
    Label_M_11: TLabel;
    Label_M_12: TLabel;
    Label_M_13: TLabel;
    Label_M_14: TLabel;
    Label_M_15: TLabel;
    Label_M_16: TLabel;
    Label_M_18: TLabel;
    Label_M_19: TLabel;
    Label_M_2: TLabel;
    Label_M_20: TLabel;
    Label_M_21: TLabel;
    Label_M_22: TLabel;
    Label_M_23: TLabel;
    Label_M_24: TLabel;
    Label_M_25: TLabel;
    Label_M_26: TLabel;
    Label_M_27: TLabel;
    Label_M_28: TLabel;
    Label_M_29: TLabel;
    Label_M_30: TLabel;
    Label_M_31: TLabel;
    Label_M_32: TLabel;
    Label_M_33: TLabel;
    Label_M_34: TLabel;
    Label_M_35: TLabel;
    Label_M_36: TLabel;
    Label_M_37: TLabel;
    Label_M_38: TLabel;
    Label_M_39: TLabel;
    Label_M_4: TLabel;
    Label_M_40: TLabel;
    Label_M_41: TLabel;
    Label_M_42: TLabel;
    Label_M_43: TLabel;
    Label_M_44: TLabel;
    Label_M_45: TLabel;
    Label_M_46: TLabel;
    Label_M_47: TLabel;
    Label_M_48: TLabel;
    Label_M_49: TLabel;
    Label_M_5: TLabel;
    Label_M_50: TLabel;
    Label_M_51: TLabel;
    Label_M_52: TLabel;
    Label_M_53: TLabel;
    Label_M_54: TLabel;
    Label_M_55: TLabel;
    Label_M_56: TLabel;
    Label_M_57: TLabel;
    Label_M_58: TLabel;
    Label_M_59: TLabel;
    Label_M_6: TLabel;
    Label_M_60: TLabel;
    Label_M_61: TLabel;
    Label_M_7: TLabel;
    Label_M_8: TLabel;
    Label_M_9: TLabel;
    LabelItCount: TLabel;
    sb_MapSequences: TSpeedButton;
    MaxIterEdit: TEdit;
    MaxIterHybridPart2Edit: TEdit;
    MeshExportBtn: TSpeedButton;
    MinIterEdit: TEdit;
    sb_MutaGen: TSpeedButton;
    N01: TMenuItem;
    N1: TMenuItem;
    N1101: TMenuItem;
    N111: TMenuItem;
    N12aa1: TMenuItem;
    N13aa1: TMenuItem;
    N141: TMenuItem;
    N151: TMenuItem;
    N161: TMenuItem;
    N171: TMenuItem;
    N181: TMenuItem;
    N191: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    NewJITFormulaItm: TMenuItem;
    OD_M3F: TOpenDialog;
    OpenDialog_L_1: TOpenDialog;
    OpenDialog_M_1: TOpenDialog;
    OpenDialogPic: TOpenPictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl_M_1: TPageControl;
    PageControl_M_2: TPageControl;
    PageCtrls: TJvPageControl;
    PageMain: TJvPageControl;
    Panel_F_1: TPanel;
    Panel_F_3: TPanel;
    Panel_M_1: TPanel;
    Panel_M_2: TPanel;
    Panel_M_3: TPanel;
    Panel_M_4: TPanel;
    Panel_M_5: TPanel;
    Panel_M_6: TPanel;
    Panel_M_7: TPanel;
    Panel1: TPanel;
    PopupMenu_M_1: TPopupMenu;
    PopupMenu_M_2: TPopupMenu;
    PopupMenu_M_3: TPopupMenu;
    PopupMenu_M_4: TPopupMenu;
    PopupMenuCopyFormula: TPopupMenu;
    PopupMenuCopyLight: TPopupMenu;
    PopupMenuLightBMP: TPopupMenu;
    PopupMenuLightVolCol: TPopupMenu;
    PopupMenuRateFormula: TPopupMenu;
    PositionPnl: TPanel;
    ProgressBar1: TProgressBar;
    RadioGroup_M_1: TRadioGroup;
    RadioGroup_M_2: TRadioGroup;
    Ratethisformulaasnormal1: TMenuItem;
    RBailoutEdit: TEdit;
    RichEdit_F_1: TRichEdit;
    RotationPnl: TPanel;
    SaveDialog_L_1: TSaveDialog;
    SaveDialog_M_1: TSaveDialog;
    SaveDialog_M_2: TSaveDialog;
    SaveDialog_M_3: TSaveDialog;
    SaveDialog_M_4: TSaveDialog;
    SaveDialog_M_6: TSaveDialog;
    sbm2t: TSpeedButton;
    sb_save_JPEG: TSpeedButton;
    ScrollBox_M: TScrollBox;
    Shape_M_1: TShape;
    Shape_M_2: TShape;
    ShapeBox_M_1: TMenuItem;
    ShapeDisc_M_1: TMenuItem;
    Shiftallformulasonetotheright1: TMenuItem;
    Shifttotheleft1: TMenuItem;
    sb_frm_load: TSpeedButton;
    sb_frm_info: TSpeedButton;
    sp_reset: TSpeedButton;
    sp_frm_hide: TSpeedButton;
    sb_zoom: TSpeedButton;
    SpeedButton_M_10: TSpeedButton;
    SpeedButton_M_11: TSpeedButton;
    sb_animate: TSpeedButton;
    SpeedButton_M_13: TSpeedButton;
    sb_Navi: TSpeedButton;
    SpeedButton_M_16: TSpeedButton;
    SpeedButton_M_17: TSpeedButton;
    SpeedButton_M_18: TSpeedButton;
    sb_aspect_43: TSpeedButton;
    sb_zoom_xy: TSpeedButton;
    sb_aspect_53: TSpeedButton;
    sb_aspect_user: TSpeedButton;
    SpeedButton_M_22: TSpeedButton;
    SpeedButton_M_23: TSpeedButton;
    sb_voxel: TSpeedButton;
    sb_Batch: TSpeedButton;
    sb_save_ZBUF: TSpeedButton;
    sb_tiling: TSpeedButton;
    sb_montecarlo: TSpeedButton;
    sb_save_JPEG_P: TSpeedButton;
    SpeedButton_M_3: TSpeedButton;
    sb_midpoint: TSpeedButton;
    sb_reset_pos: TSpeedButton;
    SpeedButton_M_32: TSpeedButton;
    SpeedButton_M_33: TSpeedButton;
    SpeedButton_M_34: TSpeedButton;
    sb_aspect: TSpeedButton;
    SpeedButton_M_36: TSpeedButton;
    sb_zoom_z: TSpeedButton;
    SpeedButton_M_5: TSpeedButton;
    SpeedButton_M_6: TSpeedButton;
    sb_ClipBrd_Out: TSpeedButton;
    sb_ClipBrd_In: TSpeedButton;
    sb_undo_redo: TSpeedButton;
    SpinEdit_M_2: TUpDown;
    SpinEdit_M_5: TUpDown;
    SplitView1: TSplitView;
    SplitView2: TSplitView;
    SplitView3: TSplitView;
    SplitView4: TSplitView;
    StartrenderingandsaveafterwardstheM3Ifile1: TMenuItem;
    StereoPnl: TPanel;
    Stickthiswindowtotheleftside1: TMenuItem;
    Stickthiswindowtotherightside1: TMenuItem;
    tc_frm: TTabControl;
    TabControl_F_2: TTabControl;
    TabImage: TTabSheet;
    TabMain: TTabSheet;
    TabSheet_M_10: TTabSheet;
    TabSheet_M_11: TTabSheet;
    TabSheet_M_12: TTabSheet;
    TabSheet_M_13: TTabSheet;
    TabSheet_M_14: TTabSheet;
    TabSheet_M_2: TTabSheet;
    TabSheet_M_4: TTabSheet;
    TabSheet_M_7: TTabSheet;
    TabFormula: TTabSheet;
    ThreadPnl: TPanel;
    Timer_M_1: TTimer;
    Timer_M_2: TTimer;
    Timer_M_3: TTimer;
    Timer_M_4: TTimer;
    Timer_M_5: TTimer;
    Timer_M_6: TTimer;
    Timer_M_8: TTimer;
    UpDown_F_1: TUpDown;
    ud_view: TUpDown;
    ud_scale: TUpDown;
    ud_Sharp: TUpDown;
    UpDown_M_5: TUpDown;
    UpDownThread: TUpDown;
    sb_VisualThemes: TSpeedButton;
    voteformula1: TMenuItem;
    btnHeader: TButton;
    sb_save_M3P: TSpeedButton;
    TabNew1: TTabSheet;
    cb_frm: TComboBox;
    jpm_3d: TJvPopupMenu;
    TabLight: TTabSheet;
    TabControl_L_1: TTabControl;
    Label_L_8: TLabel;
    Label_L_9: TLabel;
    Label_L_26: TLabel;
    SpeedButton_L_12: TSpeedButton;
    ComboBox_L_1: TComboBox;
    ComboBox_L_2: TComboBox;
    CheckBox_L_4: TCheckBox;
    PageControl_L_1: TPageControl;
    TabSheet_L_1: TTabSheet;
    Label_L_2: TLabel;
    Label_L_3: TLabel;
    Label_L_25: TLabel;
    CheckBox_L_6: TCheckBox;
    ComboBox_L_4: TComboBox;
    tbx_light_angX: TTrackBarEx;
    tbx_light_angY: TTrackBarEx;
    TabSheet_L_2: TTabSheet;
    Label_L_13: TLabel;
    Label_L_14: TLabel;
    Label_L_15: TLabel;
    Label_L_32: TLabel;
    tbx_light_posY: TTrackBarEx;
    tbx_light_posX: TTrackBarEx;
    tbx_light_posZ: TTrackBarEx;
    UpDownXpos: TUpDown;
    UpDownYpos: TUpDown;
    UpDownZpos: TUpDown;
    ButtonGetPos: TButton;
    ComboBox_L_5: TComboBox;
    TabSheet_L_6: TTabSheet;
    Label_L_39: TLabel;
    Label_L_29: TLabel;
    Label_L_30: TLabel;
    Label_L_31: TLabel;
    Image_L_3: TImage;
    tbx_light_rotY: TTrackBarEx;
    tbx_light_rotX: TTrackBarEx;
    tbx_light_rotZ: TTrackBarEx;
    CheckBox_L_14: TCheckBox;
    Edit_L_2: TEdit;
    UpDownLight: TUpDown;
    CheckBox_L_7: TCheckBox;
    Edit_L_1: TEdit;
    UpDown_L_4: TUpDown;
    PageControl_L_2: TPageControl;
    TabSheet_L_3: TTabSheet;
    Label_L_37: TLabel;
    SpeedButton_L_1: TSpeedButton;
    SpeedButton_L_2: TSpeedButton;
    Panel_L_2: TPanel;
    Label_L_40: TLabel;
    Label_L_34: TLabel;
    Label_L_35: TLabel;
    Label_L_36: TLabel;
    Image_L_4: TImage;
    Label_L_41: TLabel;
    Label_L_38: TLabel;
    TrackBar_L_28: TTrackBar;
    TrackBar_L_29: TTrackBar;
    TrackBar_L_30: TTrackBar;
    CheckBox_L_18: TCheckBox;
    RadioGroup_L_1: TRadioGroup;
    TrackBar_L_31: TTrackBar;
    Edit_L_21: TEdit;
    UpDownDiffMap: TUpDown;
    Panel_L_1: TPanel;
    Label_L_5: TLabel;
    Label_L_7: TLabel;
    sb_color_fine: TSpeedButton;
    Label_L_10: TLabel;
    Label_L_11: TLabel;
    Image_L_1: TImage;
    Image_L_2: TImage;
    Label_L_12: TLabel;
    Label_L_27: TLabel;
    SpeedButton_L_33: TSpeedButton;
    sb_color_histogram: TSpeedButton;
    TrackBar_L_9: TTrackBar;
    TrackBar_L_10: TTrackBar;
    TrackBar_L_12: TTrackBar;
    TrackBar_L_13: TTrackBar;
    CheckBox_L_1: TCheckBox;
    CheckBox_L_2: TCheckBox;
    TrackBar_L_14: TTrackBar;
    CheckBox_L_22: TCheckBox;
    TrackBar_L_5: TTrackBar;
    TrackBar_L_7: TTrackBar;
    CheckBox_L_15: TCheckBox;
    TabSheet_L_4: TTabSheet;
    Label_L_4: TLabel;
    SpeedButton_L_3: TSpeedButton;
    SpeedButton_L_6: TSpeedButton;
    SpeedButton_L_10: TSpeedButton;
    SpeedButton_L_11: TSpeedButton;
    Label_L_21: TLabel;
    Label_L_22: TLabel;
    Label_L_23: TLabel;
    SpeedButton_L_5: TSpeedButton;
    SpeedButton_L_7: TSpeedButton;
    SpeedButton_L_8: TSpeedButton;
    Label_L_28: TLabel;
    Label_L_42: TLabel;
    Label_L_43: TLabel;
    TrackBar_L_11: TTrackBar;
    TrackBar_L_4: TTrackBar;
    TrackBar_L_8: TTrackBar;
    CheckBox_L_3: TCheckBox;
    CheckBox_L_9: TCheckBox;
    TrackBar_L_23: TTrackBar;
    TrackBar_L_24: TTrackBar;
    TrackBar_L_32: TTrackBar;
    CheckBox_L_16: TCheckBox;
    Fog: TTabSheet;
    Label_L_1: TLabel;
    FogResetButton: TSpeedButton;
    Label_L_18: TLabel;
    SpeedButton_L_4: TSpeedButton;
    SpeedButton_L_30: TSpeedButton;
    Label_L_44: TLabel;
    Label_L_47: TLabel;
    TrackBar_L_3: TTrackBar;
    TrackBar_L_6: TTrackBar;
    TrackBar_L_19: TTrackBar;
    CheckBox_L_19: TCheckBox;
    CheckBox_L_23: TCheckBox;
    TabSheet_L_5: TTabSheet;
    Label_L_6: TLabel;
    Label_L_19: TLabel;
    Label_L_20: TLabel;
    Label_L_24: TLabel;
    Image_L_5: TImage;
    Label_L_33: TLabel;
    Label_L_45: TLabel;
    Label_L_46: TLabel;
    CheckBox_L_8: TCheckBox;
    TrackBar_L_20: TTrackBar;
    TrackBar_L_21: TTrackBar;
    TrackBar_L_22: TTrackBar;
    CheckBox_L_12: TCheckBox;
    CheckBox_L_13: TCheckBox;
    CheckBox_L_5: TCheckBox;
    CheckBox_L_17: TCheckBox;
    CheckBox_L_20: TCheckBox;
    CheckBox_L_21: TCheckBox;
    TrackBar_L_33: TTrackBar;
    Panel_L_3: TPanel;
    sb_light_load: TSpeedButton;
    sb_light_save: TSpeedButton;
    sb_light_preset_1: TSpeedButton;
    sb_light_preset_2: TSpeedButton;
    sb_light_preset_3: TSpeedButton;
    sb_light_preset_4: TSpeedButton;
    sb_light_preset_9: TSpeedButton;
    sb_light_preset_6: TSpeedButton;
    sb_light_preset_7: TSpeedButton;
    sb_light_preset_8: TSpeedButton;
    sb_light_preset: TSpeedButton;
    sb_light_preset_5: TSpeedButton;
    sb_light_preset_10: TSpeedButton;
    sb_light_preset_11: TSpeedButton;
    sb_light_preset_12: TSpeedButton;
    sb_light_preset_13: TSpeedButton;
    sb_light_preset_14: TSpeedButton;
    sb_light_preset_15: TSpeedButton;
    sb_light_history: TSpeedButton;
    sb_light_panel_up: TSpeedButton;
    sb_light_panel_down: TSpeedButton;
    cb_light_preset: TComboBox;
    CheckBox_L_11: TCheckBox;
    Panel_L_4: TPanel;
    Label_L_16: TLabel;
    Label_L_17: TLabel;
    TrackBar_L_18: TTrackBar;
    CheckBox_L_10: TCheckBox;
    TabHide: TTabSheet;
    EventDummi: TPanel;
    btn_postprocess: TButton;
    Button_M_18: TButton;
    Button_M_10: TButton;
    EventEdit: TEdit;
    Label_M_3: TLabel;
    Label_M_17: TLabel;
    Panel_F_2: TPanel;
    Label_F_22: TLabel;
    Label_F_23: TLabel;
    Label_F_24: TLabel;
    Label_F_26: TLabel;
    XWEdit: TEdit;
    YWEdit: TEdit;
    ZWEdit: TEdit;
    Memo_M_1: TJvMemo;
    Button1: TButton;
    JCTV_frm: TJvCheckTreeView;
    pn_frm: TPanel;
    JCB_frm_471: TJvgCheckBox;
    JCB_frm_0: TJvgCheckBox;
    JCB_frm_4: TJvgCheckBox;
    JCB_frm_1: TJvgCheckBox;
    JCB_frm_20: TJvgCheckBox;
    JCB_frm_21: TJvgCheckBox;
    JCB_frm_5: TJvgCheckBox;
    JCB_frm_2: TJvgCheckBox;
    JCB_frm_11: TJvgCheckBox;
    JCB_frm_6: TJvgCheckBox;
    JCB_frm_clear: TJvgCheckBox;
    JCB_frm_sort: TJvgCheckBox;
    JCB_frm_24: TJvgCheckBox;
    JCB_frm_25: TJvgCheckBox;
    JvSpinEdit1: TJvSpinEdit;

{$ENDREGION '========================================================================== > | CONTROLS'}

{$REGION '============================================================================= > | CONTROL PROCEDURES'}
    procedure sb_NaviClick(Sender: TObject);
    procedure sb_open_M3IClick(Sender: TObject);
    procedure btn_ResetRotationClick(Sender: TObject);
    procedure sb_save_M3IClick(Sender: TObject);
    procedure btn_save_M3PClick(Sender: TObject);
    procedure btn_SetRotationClick(Sender: TObject);
    procedure btnBlockyClick(Sender: TObject);
    procedure btnCalc3DClick(Sender: TObject);
    procedure btnCalc3DMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_BugReportClick(Sender: TObject);
    procedure Button_M_12Click(Sender: TObject);
    procedure Button_M_13Click(Sender: TObject);
    procedure sb_reset_posClick(Sender: TObject);
    procedure btn_postprocessClick(Sender: TObject);
    procedure Button_M_16Click(Sender: TObject);
    procedure Button_M_19Click(Sender: TObject);
    procedure Button_M_1Click(Sender: TObject);
    procedure ButtonAuthorClick(Sender: TObject);
    procedure ButtonInsertAuthorClick(Sender: TObject);
    procedure ButtonVolLightClick(Sender: TObject);
    procedure cb_keep_aspectClick(Sender: TObject);
    procedure CheckBox_M_14Click(Sender: TObject);
    procedure cb_julia_modeClick(Sender: TObject);
    procedure ed_widthChange(Sender: TObject);
    procedure Edit_M_33Change(Sender: TObject);
    procedure Edit_M_34Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormHide(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FrameEditExit(Sender: TObject);
    procedure FrameUpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure Image_M_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image_M_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image_M_1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image2_M_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image2_M_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sb_IniDirsClick(Sender: TObject);
    procedure sb_MapSequencesClick(Sender: TObject);
    procedure sb_MutaGenClick(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure PageControl_M_1Change(Sender: TObject);
    procedure SaveDialog_M_1TypeChange(Sender: TObject);
    procedure SaveDialog_M_6TypeChange(Sender: TObject);
    procedure sb_BatchClick(Sender: TObject);
    procedure sb_ClipBrd_InClick(Sender: TObject);
    procedure sb_ClipBrd_OutClick(Sender: TObject);
    procedure sb_open_M3PClick(Sender: TObject);
    procedure sb_save_JPEG_PClick(Sender: TObject);
    procedure sb_save_JPEGClick(Sender: TObject);
    procedure sb_save_PNGClick(Sender: TObject);
    procedure sb_save_ZBUFClick(Sender: TObject);
    procedure Shape_M_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Shape_M_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Shape_M_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ShapeBox_M_1Click(Sender: TObject);
    procedure ShapeDisc_M_1Click(Sender: TObject);
    procedure SpeedButton_M_10Click(Sender: TObject);
    procedure sb_animateClick(Sender: TObject);
    procedure SpeedButton_M_18MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_aspect_43Click(Sender: TObject);
    procedure sb_zoomClick(Sender: TObject);
    procedure sb_aspect_userMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_voxelClick(Sender: TObject);
    procedure sb_tilingClick(Sender: TObject);
    procedure sb_montecarloClick(Sender: TObject);
    procedure sb_midpointClick(Sender: TObject);
    procedure sb_aspectClick(Sender: TObject);
    procedure SpeedButton_M_36Click(Sender: TObject);
    procedure SpeedButton_M_3Click(Sender: TObject);
    procedure sb_undo_redoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpinButton2DownClick(Sender: TObject);
    procedure SpinButton2UpClick(Sender: TObject);
    procedure SpinEdit_M_2Change(Sender: TObject);
    procedure SpinEdit_M_2ChangingEx(Sender: TObject; var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
    procedure StartrenderingandsaveafterwardstheM3Ifile1Click(Sender: TObject);
    procedure Stickthiswindowtotherightside1Click(Sender: TObject);
    procedure Timer_M_1Timer(Sender: TObject);
    procedure Timer_M_2Timer(Sender: TObject);
    procedure Timer_M_3Timer(Sender: TObject);
    procedure Timer_M_4Timer(Sender: TObject);
    procedure Timer_M_5Timer(Sender: TObject);
    procedure Timer_M_6Timer(Sender: TObject);
    procedure Timer_M_8Timer(Sender: TObject);
    procedure ud_scaleClick(Sender: TObject; Button: TUDBtnType);
    procedure ud_SharpClick(Sender: TObject; Button: TUDBtnType);
    procedure ud_viewClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown_M_5Click(Sender: TObject; Button: TUDBtnType);
    procedure sb_VisualThemesClick(Sender: TObject);

//    procedure FormResize(Sender: TObject);
//    procedure Button_M_10Click(Sender: TObject);
//    procedure Button_M_18Click(Sender: TObject);
//    procedure Button_M_10MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure Panel_M_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure N11Click(Sender: TObject);
//    procedure PositionBtnClick(Sender: TObject);
//    procedure RotationBtnClick(Sender: TObject);
//    procedure MeshExportBtnClick(Sender: TObject);
//    procedure OpenPictureDialog1SelectionChange(Sender: TObject);
//    procedure PageControl_M_1DrawTab(Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect; Active: Boolean);

{FORMULA}

//    procedure FormShow(Sender: TObject);
//    procedure FormKeyPress(Sender: TObject; var Key: Char);
//    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
//    procedure FormActivate(Sender: TObject);
//    procedure FormHide(Sender: TObject);
//    procedure FormCreate(Sender: TObject);

    procedure btn_frm_info_closeClick(Sender: TObject);
//    procedure Button_F_4Click(Sender: TObject);
    procedure CheckBox_F_1Click(Sender: TObject);
//    procedure ComboEdit_F_1Change(Sender: TObject);
//    procedure ComboEdit_F_1Exit(Sender: TObject);
//    procedure ComboEdit_F_1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Copythevaluesto1Click(Sender: TObject);
    procedure Copythisformulatoformulanr11Click(Sender: TObject);
    procedure EditItCountChange(Sender: TObject);
    procedure ExchangeFormulaLeftBtnClick(Sender: TObject);
    procedure ExchangeFormulaRightBtnClick(Sender: TObject);
    procedure Hidethisformula1Click(Sender: TObject);
    procedure JITFormulaBtnClick(Sender: TObject);
//    procedure ListBoxEx_F_12MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure ListBoxEx_F_15MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure ListBoxEx_F_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure ListBoxEx_F_1MouseEnter(Sender: TObject);
//    procedure ListBoxEx_F_1MouseLeave(Sender: TObject);
//    procedure ListBoxEx_F_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//    procedure ListBoxEx_F_1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
//    procedure  sb_frm_type_1Click(Sender: TObject);
    procedure RadioGroup_F_1Click(Sender: TObject);
    procedure Shiftallformulasonetotheright1Click(Sender: TObject);
    procedure Shifttotheleft1Click(Sender: TObject);
    procedure sb_frm_loadClick(Sender: TObject);
    procedure sb_frm_infoClick(Sender: TObject);
    procedure sp_resetClick(Sender: TObject);
//    procedure sp_frm_hideClick(Sender: TObject);
//    procedure  sb_frm_type_1MouseEnter(Sender: TObject);
//    procedure  sb_frm_type_1MouseLeave(Sender: TObject);
    procedure tc_frmChange(Sender: TObject);
    procedure tc_frmMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TabControl_F_2Change(Sender: TObject);
    procedure TabControl_F_2Changing(Sender: TObject; var AllowChange: Boolean);
    //procedure Timer_F_1Timer(Sender: TObject);
    //procedure Timer_F_4Timer(Sender: TObject);
    //procedure Timer_F_5Timer(Sender: TObject);
    procedure UpDown_F_1Click(Sender: TObject; Button: TUDBtnType);

//    procedure NewJITFormulaItmClick(Sender: TObject); //+ event
//    procedure EditJITFormulaItmClick(Sender: TObject); //+ event

{LIGHT}

//    procedure FormShow(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
//    procedure FormDestroy(Sender: TObject);
//    procedure RadioGroup_L_1Click(Sender: TObject);
//    procedure RadioGroup_L_2Click(Sender: TObject);
//    procedure CheckBox_L_5Click(Sender: TObject);
//    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
//    procedure FormActivate(Sender: TObject);
//    procedure FormHide(Sender: TObject);

    procedure btn_RandomClick(Sender: TObject);
    procedure sb_light_loadClick(Sender: TObject);
    procedure sb_light_saveClick(Sender: TObject);
    procedure ButtonGetPosClick(Sender: TObject);
    procedure CheckBox_L_15Click(Sender: TObject);
    procedure CheckBox_L_16Click(Sender: TObject);
    procedure CheckBox_L_1Click(Sender: TObject);
    procedure CheckBox_L_21Click(Sender: TObject);
    procedure CheckBox_L_22Click(Sender: TObject);
    procedure CheckBox_L_2Click(Sender: TObject);
    procedure CheckBox_L_4Click(Sender: TObject);
    procedure CheckBox_L_6Click(Sender: TObject);
    procedure CheckBox_L_7Click(Sender: TObject);
    procedure CheckBox_L_8Click(Sender: TObject);
    procedure ComboBox_L_1Change(Sender: TObject);
    procedure cb_light_presetDropDown(Sender: TObject);
    procedure cb_light_presetSelect(Sender: TObject);
    procedure ComboBox_L_4Change(Sender: TObject);
    procedure CopythislighttoLight11Click(Sender: TObject);
    procedure Edit_L_1Change(Sender: TObject);
    procedure Edit_L_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FogResetButtonClick(Sender: TObject);
    procedure Insertvolumetriclightcolor1Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure PageControl_L_1Change(Sender: TObject);
    procedure PageControl_L_1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure sb_color_fineClick(Sender: TObject);
    procedure sb_light_preset_1Click(Sender: TObject);
    procedure SpeedButton_L_1Click(Sender: TObject);
    procedure SpeedButton_L_2Click(Sender: TObject);
    procedure sb_light_panel_upClick(Sender: TObject);
    procedure sb_color_histogramClick(Sender: TObject);
    procedure SpeedButton_L_3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton_L_4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_light_historyMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_light_presetClick(Sender: TObject);
    procedure SpinButton1Down;
    procedure SpinButton1Up;
    procedure TabControl_L_1Change(Sender: TObject);
    procedure TabControl_L_1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure TabControl_L_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBar_L_11KeyPress(Sender: TObject; var Key: Char);
    procedure TrackBar_L_21KeyPress(Sender: TObject; var Key: Char);
    procedure TrackBar_L_22Change(Sender: TObject);
    procedure tbx_light_rotXChange(Sender: TObject);
    procedure TrackBar_L_33Change(Sender: TObject);
    procedure tbx_light_posXChange(Sender: TObject);
    procedure tbx_light_posXMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbx_lightChange(Sender: TObject);
    procedure tbx_light_angXChange(Sender: TObject);
    procedure tbx_light_angYChange(Sender: TObject);
    //procedure TrackBarYangleChange(Sender: TObject);
    procedure UpDown_L_4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDownDiffMapChange(Sender: TObject);
    procedure UpDownLightChange(Sender: TObject);
    procedure UpDownXposClick(Sender: TObject; Button: TUDBtnType);

    // added

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageCtrlsChange(Sender: TObject);    //
    procedure sbm2tClick(Sender: TObject);
    procedure sb_save_M3PClick(Sender: TObject);
    procedure EventDummiDblClick(Sender: TObject);
    procedure EventDummiClick(Sender: TObject);
    procedure EventEditChange(Sender: TObject);

//    procedure tbxChange(Sender: TObject);
//    procedure tbxMouseUp(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
//    procedure UpdateFormulaLabels(Findex: TPoint);
//    function FormulaIndex(iSlider: Integer): TPoint;
//    procedure CheckFocus;
    procedure btnHeaderClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TriggerRepaint;
    procedure PageMainChange(Sender: TObject);
    procedure cb_frmSelect(Sender: TObject);
//    procedure cb_frmChange(Sender: TObject);
    procedure cb_frmDropDown(Sender: TObject);
    //procedure clb_frm1ClickCheck(Sender: TObject);
    //procedure JvCheckListBox1ClickCheck(Sender: TObject);
    procedure JCB_frm_471Click(Sender: TObject);
    procedure cb_frmDblClick(Sender: TObject);




{$ENDREGION}

{$REGION '============================================================================= > | PRIVATE'}

  private
    isRepainting: LongBool;
    MStartPos: TPoint;
    MXYStartPos: TPoint;
    MOrigStartPos: TPoint;
    SliceCalc: Integer;
    MZtranslate, MmaxShapeWid: Integer;
    notAllButtonsUp: LongBool;
    RepaintYact: Integer;
    CloseTries: Integer;
    StartupLoadM3I: LongBool;
    bUserChangeM: LongBool;
    bImageText: LongBool;
    TFSB9E, TFSB9Echecked: LongBool;
    StickIt: Integer;

    //FPopup: TPopupMenu;
{FORMULA}

    OldTab2index: Integer;
    MaxLBheight: Integer;
    HighlightedFormula: String;

    fVZero, fValue, fRange: array[0..16] of Double;
    fVType: array[0..16] of Integer;
    FocusedSlider: Integer;
    FValues: Integer;

{LIGHT}

//    LColHistoMaxN, LColInteriorHistoMaxN, LColInteriorHistoLength: Integer;
//    OTColHistoMaxN: Integer;
    OldTB15Pos: Integer;
    OldTB16Pos: Integer;
    OldTB17Pos: Integer;
    LastBGname: array[0..23] of Byte;

{MAIN}

  //  lastCP: TPoint;
    procedure RepaintMAIN(bStartTimer: LongBool);
    procedure CalcStatistic;
    procedure DisableBchange;
    procedure EnableBchange;
    procedure SetPreset(ip: Integer);
    procedure FillInPreset(ip: Integer);
    procedure Rotate4Dvec(var vec: TVec4D);
    procedure ScaleDEstop(s: Single);
//    procedure ScaleRclip(s: Single);
    function  OverImage(p: TPoint): LongBool;
    procedure SendMove;
    procedure WaitForPaintStop(maxSeconds: Integer);
    procedure SaveImageO(OutputType: Integer; FileNam: String);
    procedure UpdateScaledImageFull;
    procedure SetEulerEditsFromHeader;
    procedure FirstShowUpdate;
    procedure SetM3Dini;
    procedure LoadStartupParas;
    procedure ModColOnImage(X, Y: Integer);
    procedure SetShape_M_2Size(NewSize: Integer);
    procedure TriggerRepaintDraw(R: TRect);
    procedure SetEdit_M_16Text;
    procedure ClearFormula(nr: Integer);
    procedure IniHAddon(HA: PTHeaderCustomAddon);
//    procedure DoSaveAniImage;
//    procedure DoSaveTileImage;

{FORMULA}

    procedure CalcRstop;
    procedure SetTabNames;
//    function FNormalPos(Formula: THAformula): TPoint;
    procedure Check4DandInfo;
    procedure AdjustTC1height;
//    procedure HideAll_LBxCept(const n: Integer);
//    procedure SetListBoxWidth(LB: TListBoxEx);
    //procedure AddFormulaName(FName: String; DEfunc: Integer);
//    function FNameIsIncluded(Name: String): LongBool;
    procedure SelectFormula(FName: String);
//    procedure ListboxPopup(var LB: TListBoxEx; const pos: TPoint);
//    procedure MakeLB12list(text: String);
//    function ListBoxIsFull(LB: TListBoxEx): LongBool;
//    procedure ShowListBox(LB: TListBoxEx; const Visible: Boolean);
//    procedure ShowListBoxEx(T: Integer; const Visible: Boolean);
    procedure TCTI;


{LIGHT}

    procedure SetPresetL(nr: Integer; KeepLights: LongBool);
    procedure GetPresetL(nr: Integer);
    procedure MakeGlyph(SB: TSpeedButton; PNr: Integer);
    procedure UpdateTabHeader(nr: Integer);
    function MakeDynFogCol: TRGB;
    function GetPageContr1index(Loption: Byte): Integer;
    function TBChanged: LongBool;
    function OverForm(p: TPoint): LongBool;
    procedure MakeDepthColList;
    function VisLightExBit(const Light: TLight8): Integer;

//    procedure HandlePopupItem(Sender: TObject);

{$ENDREGION '========================================================================== > | PRIVATE'}

{$REGION '============================================================================= > | PROTECTED'}

  protected
    procedure WndProc(var Message: TMessage); override;
    procedure WmThreadReady(var Msg: TMessage); message WM_ThreadReady;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES; //moved

{$ENDREGION '========================================================================== > | PROTECTED'}

{$REGION '============================================================================= > | PUBLIC'}

  public

    MHeader: TMandHeader10;                                                     //TMandHeader10
    MCalcThreadStats: TCalcThreadStats;
//    siLight5: array of TsiLight5; //ulight.pas
    mSLoffset: Integer;
    bAniFormStick: Integer;
    SaveAniImage: LongBool;
    SaveTileImage: LongBool;
    HeaderLightVals: TLightVals;
    HybridCustoms: array[0..5] of TCustomFormula;
    HAddOn: THeaderCustomAddon;
    iActiveThreads: Integer;  //for triggering the timer
    iActivePaintThreads: Integer;
    iGetPosFromImage: Integer;
    UserAspect: TPoint;
    PaintVGrads: TMatrix3;
    CalcStart: Cardinal;
    CalcYact: Integer;
    mCalcRect: TRect;
    SSAORiteration: Integer;
    SaveM3IfileAuto: LongBool;
    InternAspect: Double;
    SaveAutoM3Ifilename: String;
    OPD: TOpenPictureDialogM3D;
    Authors: AuthorStrings;
    bOutMessageLoud: LongBool;
    bHideMessages: LongBool;
    DrawColSIndex: Single;
    DrawInOutside: Integer;
    DrawRect: TRect;
    bRandom: LongBool;

//   bLightFormStick: Integer;
//   bFGUIFormStick: Integer;
//   bPostProcessFormStick: Integer;
//   calc3D: LongBool;
//   bAllowUpDownChange: LongBool;
//   CalcStereoImage: LongBool;

{FORMULA}

    bUserChangeF: LongBool;

{LIGHT}

    bUserChangeL: Boolean;
    TBcolStartPos, TBcolStopPos: Integer;  // Coarse Color Adjustments
    LAtmpLight: TLightingParas9;    //ersetzt die privaten obigen cols+lights
    LightMaps: array[0..5] of TLightMap;
    DiffColMap: TLightMap;
    LAposMids: array[0..5] of TPos3D;
    ColorFormCreated: LongBool;

{MAIN}

    procedure OutMessage(s: String);
    procedure SetImageCursor;
    procedure AllPresetsUp;
    procedure EnableButtons;
    procedure DisableButtons;
    procedure IniMHeader;
    procedure MakeHeader;
    procedure CalcMand(bMakeHeader: LongBool);
    procedure CalcHardShadow;
    procedure SetEditsFromHeader;
    procedure getI1BMPSLs;
    procedure MButtonsUp;
    procedure RepaintMAINnoThread;
    procedure UpdateAspectCaption;
    function SizeOK(Verbose: LongBool): LongBool;
    procedure ClearScreen;
    procedure ParasChanged;
    procedure CalcAmbShadow;
    procedure SaveM3I(FileName: String; bSaveImgBuf: LongBool);
    procedure ProofPosLight;
    function GetCalcRect: TRect;
    procedure TextParsLoadSuccess;
    procedure UpdateAndScaleImageFull(NewScale: Integer);
    procedure RefreshNavigator(const Enabled: Boolean);
    function IsCalculating: Boolean;
    procedure PropagateCurrFrameNumber;

{FORMULA}

    function SetFormulaCBs(s: String): Integer;
    procedure LoadFormulaNames;
    procedure UpdateFromHeader(Header: TPMandHeader10);                         //TMandHeader10   pointer

{LIGHT}

    procedure SetSButtonColor(ButtonNr: Integer; Color: TRGB);
//    procedure RepaintColorHistory;
//    procedure MakeHistory;
    procedure PutLightFInHeader(var Header: TMandHeader10);                     //TMandHeader10
    procedure SetLightFromHeader(var Header: TMandHeader10);                    //TMandHeader10
    procedure SetStartPreset;
    procedure SetSDButtonColors;
    procedure SetLAplusPosToZero;
    procedure UpdateQuickLoadCB;
    procedure SetPosLightTo0(tab: Integer);
    procedure MHeaderToText;
//    procedure WndProc(var Message: TMessage); override;

{$ENDREGION '========================================================================== > | PUBLIC'}

  end;

//function AniFileAlreadyExists(var s: String): LongBool;
procedure SaveFormulaBytes;

{$REGION '============================================================================= > | VARIABLES'}

var
  GUI: TGUI;
  M3dVersion: Single = 1.9;   //0this needs sorting 'magic roundabout'
  Testing: LongBool = False;
  TBoostChanged: LongBool = False;
  MCalcStop: LongBool = False;
  ImageScale: Integer = 1;
  fullSizeImage: array of Cardinal;    //intern FullSizeImage = colors, array of Cardinal
  mFSIstart, mFSIoffset: Integer;
  I1BMPstartSL, I1BMPoffset: Integer;
  FormsSticky: array[0..2] of Integer = (1, 1, 1);
  AppFolder: String = '';
  AppDataDir: String = '';
  M3DBackGroundPic: TLightMap;
  M3DSmallBGpic: TLightMap;
  bSRVolLightMapCalculated: LongBool = False;
  dFormulaNames: TDictionary<String, Integer>;
  //dFormula: TDictionary<String, TFormulaClass>;

{FORMULA}

  //GUIFormula: TGUIFormula;
  //FGUIFormCreated: LongBool = False;
  //FGUIFormFirstShow: LongBool = True;
  sb_frm_type_count: Integer = 11;  //10
  InternFormulasDEfunc: array[0..6] of Integer = (0,0,4,0,11,0,0);
//  ROOT,n: TTreeNode;
//  n3d,n4d,nI,nA: TTreeNode;
//  n0,n2,n11,n4,n5,n6,n20,n21,n_1: TTreeNode;
 { InternFormulaNames: array[0..6] of String = ('Integer Power','Real Power',
   'Quaternion','Tricorn','Amazing Box','Bulbox','Folding Int Pow');  }


{LIGHT}

    // to Light.pas
  LastZoom: Double = 0;
  LastPositionDMScale: array[0..3] of Integer = (0,0,0,0);
  TBoldpos: array[0..24] of Integer;


{$ENDREGION '========================================================================== > | VARIABLES'}

implementation

{$REGION '============================================================================= > | USES'}
uses
  Winapi.CommDlg,
  Winapi.ShellAPI,
  System.DateUtils,
  System.Math,
  System.StrUtils,
  System.Types,
  System.UITypes,
  Vcl.ClipBrd,
  Vcl.FileCtrl,
  Vcl.Imaging.pngimage,
  Vcl.Themes,
  AmbHiQ,
  Calc,
  calcBlocky,
  CalcHardShadow,
  CalcSR,
  CalcThread2D,
  ColorPick,
  CustomFormulas,
  uCPU,
  DivUtils,
  DOF,
  formulas,
  HeaderTrafos,
  ImageProcess,
  IniDirsForm,
  Interpolation,
  Maps,
  MapSequences,
  NavGUI,
  TextBox,
  uLight,
  uMapCalcWindow,
  Undo,
  uTEST,
  //uM3P,
  VisualThemesGUI;
  //MutaGenGUI
   //FormulaGUI
   //FormulaNames
   //JITFormulaEditGUI
   //FormulaCompiler
   //Animation
   //AniPreviewWindow,
   //BatchForm, Tiling, VoxelExport, MonteCarloForm, MapSequencesGUI,
   //, PostProcessForm


{$ENDREGION}

{$R *.dfm}

{$REGION '============================================================================= > | BUTTONS'}


//------------------------------------------------------------------------------
procedure TGUI.sb_save_M3PClick(Sender: TObject);
begin
   //MHeaderToText;     //proc from form to form
   //fM3P.MH2Txt(MHeader);//proc of form from form
   //fM3P.caption := 'Convert Mand10 to text';
//fM3P.Visible := True;
   //   fM3P.RestartFromMain;
   //fM3P.ClearPanels;
   //fM3P.CreateInitialSet;
   //fM3P.CreateMutation(MutaGenFrm.Panel_1);

end;
procedure TGUI.sbm2tClick(Sender: TObject);
var i:Integer; t : TDateTime; s : String;
begin
    //t := EncodeDateTime(2000, 6, 5, 1, 2, 3, 4);
    //ShowMessage('hh:nn:ss.zzz = '+FormatDateTime('hh:nn:ss.zzz', t));
    //s:=FormatDateTime('zzz');
    //ShowMessage( FormatDateTime('hh:nn:ss.zzz', s ));
    //i := 1 + Random(999999999);
    //ShowMessage( Format( '{%.9d}', [ i ] ) );
    //s:=Format('<%.9d>', [IntToStr(i)]);
    //MHeaderToText;     //proc from form to form

   fM2T.MH2Txt(MHeader,HAddon);//proc of form from form
   fM2T.caption := 'Convert Mand10 to text';
   fM2T.Visible := True;
end;
procedure TGUI.MHeaderToText;
//proc from form to form
var s,r: String;
  begin

  //if value:=0 then ....
    r:= #13#10;
        s:= 'MandId:           '+IntToStr(MHeader.MandId);
    s:= s+r+'Width:            '+IntToStr(MHeader.Width);

   fM2T.mM2T.Text:=s;
  //sbm2tClick(Sender);
end;
procedure TGUI.sb_MutaGenClick(Sender: TObject);
begin

   fTEST.Visible := True;
   BringToFront2(fTEST.Handle);
   fTEST.RestartFromMain;
//   fTEST.ClearPanels;
//   fTEST.CreateInitialSet;
//   fTEST.CreateMutation(fTEST.Panel_1);
end;
procedure TGUI.sb_NaviClick(Sender: TObject);
begin
    GUINav.Visible := True;
    BringToFront2(GUINav.Handle);
end;
procedure TGUI.RefreshNavigator(const Enabled: Boolean);
begin
  if Enabled and GUINav.Visible then begin
    GUINav.sb_par_inClick(nil);
  end;
end;
//------------------------------------------------------------------------------
//60 sec save timer
procedure TGUI.Timer_M_2Timer(Sender: TObject);
begin   // 60 sec
    if (btnCalc3D.Caption = 'Calculate 3D') and
      (Now - LastHisParSaveTime > 1 / (24 * 12)) and not
        (CompareMem(@LHPSLight, @MHeader.Light, SizeOf(TLightingParas9))      ) then
//       or (AFormCreated and (AnimationForm.AniOption > 0))
//      or (BatchStatus > 0)) then
    begin
      StoreHistoryPars(MHeader);
      FastMove(MHeader.Light, LHPSLight, SizeOf(TLightingParas9));
    end;
end;

//r@ndom
procedure TGUI.btn_RandomClick(Sender: TObject);

var i, v, t, n: Integer;
    LB: TListBoxEx;
    cb: TComboBox;
    ca: array[1..9] of Integer;
    s: String;
    d: Double;

begin
    //PageCtrls.ActivePage := TabFormula;
    if btnCalc3D.Caption = 'Stop' then btnCalc3DClick(Self);
    sp_resetClick(Sender);
    {if ListBoxEx_F_1.Visible then  //(Key = 't') and
    begin
      ListBoxEx_F_1.Items.Add('test');
//      btn_Random.Visible := True;
      SetListBoxWidth(ListBoxEx_F_1);
      sb_frm_type_9.Visible := True;
      AddFormulaName('testIFS', testIFSDEoption);
      Copythevaluesto1.Visible := True;
    end;}
    with HAddOn do
    begin
      TabControl_F_2.TabIndex := 0;
      bOptions1 := 0;
      iFCount := 0 + Random(5);// + 1;
      for i := 0 to 5 do
      begin
        tc_frm.TabIndex := i;
//        if i >= iFCount then Formulas[i].iItCount := 0 else
        begin
//          Formulas[i].iItCount := Random(10) + 1;
          t := 0;
          //->

//          for j := 1 to sb_frm_type_count - 1 do
//          begin
//            LB := FindComponent('ListBoxEx_F_' + IntToStr(j)) as TListBoxEx;
            n := cb_frm.Items.Count - 1;
//            t := t + ca[j];
//          end;
            t := Random(n);
//          j := 1;
//          while (j < sb_frm_type_count) and (t >= ca[j]) do
//          begin
//            Dec(t, ca[j]);
//            Inc(j);
//          end;
//          LB := FindComponent('ListBoxEx_F_' + IntToStr(j)) as TListBoxEx;
//          j := Max(1, Min(LB.Items.Count - 1, t + 1));
//          if Pos('CondItcount', cb_frm.Items[t]) > 0 then
//            Formulas[i].iItCount := 0
//          else
//          begin
            SelectFormula(StrLastWords(cb_frm.Items[t]));
            //->

            for v := 0 to Formulas[i].iOptionCount - 1 do
            begin
              s := Uppercase(PTCustomFormula(MHeader.PHCustomF[i])^.sOptionStrings[v]);
              if Pos('SCALE', s) > 0 then begin d := Random - 0.5; if d < 0 then d := -1 - Sqr(d) * 15 else d := 1 + Sqr(d) * 15; end else
              if Pos(' MUL', s) > 0 then d := (Random - 0.5) * 20 else
              d := Random * 20;
              Formulas[i].dOptionValue[v] := d;
            end;
//          end;
        end;
      end;
      tc_frm.TabIndex := 0;
      tc_frm.OnChange(Self);
      bRandom:=True;
      i := 1 + Random(999999999);
      s:=Format('%.9d', [i] );
      GUI.Caption:='r-'+s;
      btnCalc3D.OnClick(Self);  //start calc3d
      bRandom:=False;
    end;
end;


//MAIN
procedure TGUI.btnBlockyClick(Sender: TObject);    //calculate a rough 8x8blocky image
//var TileSize: TPoint;
begin
    PropagateCurrFrameNumber;
//    TilingForm.SaveThisTile := False;
    MakeHeader;
    if (MHeader.Width < 1) or (MHeader.Height < 1) then Exit;
    MHeader.bCalc3D := 1;
    MHeader.bStereoMode := 0;
    MakeLightValsFromHeaderLight(@MHeader, @HeaderLightVals, 1, MHeader.bStereoMode);
    ProofPosLight;
    try
//      TileSize := GetTileSize(@MHeader);
//      SetLength(siLight5, TileSize.X * TileSize.Y);
//      mSLoffset := TileSize.X * SizeOf(TsiLight5);
      SetImageSize;
    except
      SetLength(siLight5, 0);
      mSLoffset := 0;
    end;
    if Length(siLight5) = 0 then
    begin
      mSLoffset := 0;
      btnCalc3D.Caption := 'Calculate 3D';
      ShowMessage('Out of memory, decrease the imagesize.');
      Exit;
    end;
    DisableButtons;
    try
      MCalcThreadStats.pLBcalcStop := @MCalcStop;
      MCalcThreadStats.pMessageHwnd := Self.Handle;
      CalcMandBlocky;
    finally
      EnableButtons;
      MCalcThreadStats.iProcessingType := 0;
    end;
end;
procedure TGUI.btnCalc3DClick(Sender: TObject);   //main Calc3D button
begin
    PropagateCurrFrameNumber;
//    TilingForm.SaveThisTile := False;
    if btnCalc3D.Caption = 'Stop' then
    begin
      if (MCalcThreadStats.iProcessingType > 0) and Timer_M_4.Enabled and
         ((GetTickCount - CalcStart) > 900000) then
      begin
        if MessageDlg('Do you really want to stop the calculations?', mtWarning,
                      [mbYes, mbNo], 0) = mrNo then Exit;
      end;
      Timer_M_1.Enabled := False;
      MCalcStop := True;

//      AnimationForm.bCalcStop := True;
//      if (AnimationForm.AniOption > 0) then
//      begin
//        AnimationForm.ActualKFsubframe := 1;
//        AnimationForm.ActualKeyFrame   := AnimationForm.HeaderCount;
//        AnimationForm.NextSubFrame;
//        Caption := 'Mandelbulb 3D';
//      end;
//      if BatchStatus > 0 then BatchStatus := -1;

      if not Timer_M_4.Enabled then
      begin
        EnableButtons;
//        if PPFormCreated then
//        begin
//          PostProForm.CheckBox_P_21.Checked := False;
//          PostProForm.CheckBox_P_25.Checked := False;
//        end;
      //  if SizeOK(False) then UpdateScaledImage(0, MHeader.Height div ImageScale);
      end;

    end else begin
      Timer_M_1.Enabled := False;
      if bImageText then
      begin
        Image_M_1.Canvas.Font.Color := clBtnFace;
        Image_M_1.Picture.Bitmap.Canvas.TextOut(8, 16, 'Press ''Calculate 3D'' to render');
        Image_M_1.Canvas.Font.Color := clWindowText;
        bImageText := False;
      end;
      ColorForm.CheckBox3.Checked := False;
      ProofPosLight;
      if MHeader.bStereoMode <> 0 then Caption := 'Mandelbulb 3D';
      MHeader.bStereoMode := 0;
      MHeader.bCalc3D := 1;
      StoreHistoryPars(MHeader);
      CalcMand(True);
    end;
end;
procedure TGUI.btnCalc3DMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var CP: TPoint;
begin
    if (Button = mbRight) and (btnCalc3D.Caption = 'Calculate 3D') then
    begin
      GetCursorPos(CP);
      PopupMenu_M_3.Popup(CP.X, CP.Y);
    end;
end;

//FORMS
procedure TGUI.sb_voxelClick(Sender: TObject);
begin           //        SpeedButton_M_24
//    FVoxelExport.Visible := True;
//    BringToFront2(FVoxelExport.Handle);
end;
procedure TGUI.sb_montecarloClick(Sender: TObject);
begin            //       SpeedButton_M_28
//    MCForm.Visible := True;
//    BringToFront2(MCForm.Handle);
end;
procedure TGUI.sb_VisualThemesClick(Sender: TObject);
begin
  VisualThemesFrm.Visible := True;
end;
procedure TGUI.sb_IniDirsClick(Sender: TObject);
begin
    LoadIni;
    IniDirForm.Visible := True;
end;
procedure TGUI.sb_MapSequencesClick(Sender: TObject);
begin
//  MapSequencesFrm.Visible := True;
end;
procedure TGUI.sb_BatchClick(Sender: TObject);  //Batch process
begin        //was SpeedButton_M_25
//    BatchForm1.Visible := True;
//    BringToFront2(BatchForm1.Handle);
end;
procedure TGUI.sb_BugReportClick(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', PChar('http://bugs.mb3d.org/'), '', '', SW_SHOWNORMAL);
end;
procedure TGUI.sb_animateClick(Sender: TObject);
begin    //          SpeedButton_M_12
//    AnimationForm.Visible := True;
//    BringToFront2(AnimationForm.Handle);
end;
procedure TGUI.btn_postprocessClick(Sender: TObject);
begin        //Button_M_15
//    PostProForm.Visible := True;
//    BringToFront2(PostProForm.Handle);
end;

//SAVE
procedure TGUI.SaveDialog_M_1TypeChange(Sender: TObject);
var S: String;
begin
    case SaveDialog_M_1.FilterIndex of
      1:  SaveDialog_M_1.DefaultExt := 'jpg';
      2:  SaveDialog_M_1.DefaultExt := 'png';
    end;
    S := SaveDialog_M_1.Filename;
    if DirectoryExists(S) then S := '';
    if S <> '' then
      case SaveDialog_M_1.FilterIndex of
        1:  S := ChangeFileExt(S, '.jpg');
        2:  S := ChangeFileExt(S, '.png');
      else
        S := '';
      end;
    if S <> '' then
      SendMessage(GetParent(SaveDialog_M_1.Handle), CDM_SETCONTROLTEXT, $480, Longint(PChar(ExtractFileName(S))));
end;
procedure TGUI.SaveDialog_M_6TypeChange(Sender: TObject);
var S: String;
begin
    case SaveDialog_M_6.FilterIndex of
      1:  SaveDialog_M_6.DefaultExt := 'bmp';
      2:  SaveDialog_M_6.DefaultExt := 'png';
    end;
    S := SaveDialog_M_6.Filename;
    if DirectoryExists(S) then S := '';
    if S <> '' then
      case SaveDialog_M_6.FilterIndex of
        1:  S := ChangeFileExt(S, '.bmp');
        2:  S := ChangeFileExt(S, '.png');
      else
        S := '';
      end;
    if S <> '' then
      SendMessage(GetParent(SaveDialog_M_6.Handle), CDM_SETCONTROLTEXT, $480, Longint(PChar(ExtractFileName(S))));
end;
procedure TGUI.sb_save_ZBUFClick(Sender: TObject);  //Save Zbuf
begin              //was SpeedButton_M_26
    if SaveDialog_M_6.Execute then SaveZBuf(SaveDialog_M_6.Filename, SaveDialog_M_6.FilterIndex);
end;
procedure TGUI.sb_save_PNGClick(Sender: TObject);    //save BMP,PNG
var i, c: Integer;    //was Button_M_3
begin
    Val(IniVal[16], i, c);
    if c = 0 then SaveDialog_M_6.FilterIndex := i + 1;
    if SaveDialog_M_6.Execute then
    begin
      IniVal[16] := IntToStr(SaveDialog_M_6.FilterIndex - 1);
      SaveImageO(4 - SaveDialog_M_6.FilterIndex * 2, SaveDialog_M_6.FileName);
      SetSaveDialogNames(SaveDialog_M_6.FileName);
    end;
end;
procedure TGUI.sb_save_JPEGClick(Sender: TObject);
//var s: String;
begin
    if SaveDialog_M_4.Execute then
    begin
  //    s := ExtractFileDir(SaveDialog_M_4.FileName);
      SaveImageO(1, SaveDialog_M_4.FileName);
      SetSaveDialogNames(SaveDialog_M_4.FileName);
 //     if s <> '' then SaveDialog_M_4.InitialDir := s;
    end;
end;
procedure TGUI.sb_save_JPEG_PClick(Sender: TObject); //save paras+image
var f: file;            //was SpeedButton_M_29
begin
    if SaveDialog_M_1.Execute then
    begin
      MakeHeader;
      AssignFile(f, ChangeFileExt(SaveDialog_M_1.FileName, '.m3p'));
      Rewrite(f, 1);
      MHeader.MandId := actMandId;
      BlockWrite(f, MHeader, SizeOf(MHeader));
      HAddon.bHCAversion := 16;
      BlockWrite(f, HAddon, SizeOf(THeaderCustomAddon));
      CloseFile(f);
      SaveImageO(2 - SaveDialog_M_1.FilterIndex, SaveDialog_M_1.FileName);
      SetSaveDialogNames(SaveDialog_M_1.FileName);
    end;
end;
procedure TGUI.SaveImageO(OutputType: Integer; FileNam: String);
var TileRect: TRect;
    Crop: Integer;
    bmp: TBitmap;
begin
    if (MHeader.TilingOptions shr 28) and 3 <> 0 then
    begin
      GetTilingInfosFromHeader(@MHeader, TileRect, Crop);
      SdoAA;
      bmp := TBitmap.Create;
      try
        bmp.PixelFormat := pf24bit;
        bmp.SetSize((TileRect.Right - TileRect.Left + 1 - 2 * Crop) div ImageScale,
          (TileRect.Bottom - TileRect.Top + 1 - 2 * Crop) div ImageScale);
        bmp.Canvas.CopyRect(Rect(0, 0, bmp.Width, bmp.Height), GUI.Image_M_1.Picture.Bitmap.Canvas,
            Rect(Crop div ImageScale, Crop div ImageScale,
                 Crop div ImageScale + bmp.Width, Crop div ImageScale + bmp.Height));
        case OutputType of
          0:  SavePNG(FileNam, bmp, cb_par_in_png.Checked);
          1:  SaveJPEGfromBMP(FileNam, bmp, StrToIntTry(ed_jpg_qual.Text, 95));
          2:  SaveBMP(FileNam, bmp, pf24bit);
        end;
      finally
        bmp.Free;
      end;
    end
    else
    begin
      SdoAA;
      case OutputType of
        0:  SavePNG(FileNam, GUI.Image_M_1.Picture.Bitmap, cb_par_in_png.Checked);
        1:  SaveJPEGfromBMP(FileNam, GUI.Image_M_1.Picture.Bitmap, StrToIntTry(ed_jpg_qual.Text, 95));
        2:  SaveBMP(FileNam, GUI.Image_M_1.Picture.Bitmap, pf24bit);
      end;
    end;
end;
procedure TGUI.btn_save_M3PClick(Sender: TObject);  // save parameter
var f: file;         // was Button_M_4
begin
    if SaveDialog_M_2.Execute then
    begin
      MakeHeader;
      AssignFile(f, ChangeFileExtSave(SaveDialog_M_2.FileName, '.m3p'));
      Rewrite(f, 1);
      InsertAuthorsToPara(@MHeader, Authors);
      try
        BlockWrite(f, MHeader, SizeOf(MHeader));
      finally
        IniMHeader; //to get pointers back
      end;
      HAddon.bHCAversion := 16;
      BlockWrite(f, HAddon, SizeOf(THeaderCustomAddon));
      CloseFile(f);
      SetSaveDialogNames(SaveDialog_M_2.FileName);
    end;
end;
procedure TGUI.sb_open_M3PClick(Sender: TObject);  // open parameter
begin        //was Button_M_5
    PageCtrls.ActivePage := TabImage;
    if OpenDialog_M_1.Execute and LoadParameter(MHeader, OpenDialog_M_1.FileName, True) then
    begin
      AllPresetsUp;
      OutMessage('Parameters loaded, press "Calculate 3D" to render.');
      ClearScreen;
      SetSaveDialogNames(OpenDialog_M_1.FileName);
    end;
end;
procedure TGUI.SaveM3I(FileName: String; bSaveImgBuf: LongBool);
var f: file;
begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    try
      MHeader.bImageScale := ImageScale;
      GUI.PutLightFInHeader(MHeader);{LIGHT}
      AssignFile(f, ChangeFileExtSave(FileName, '.m3i'));
      Rewrite(f, 1);
      InsertAuthorsToPara(@MHeader, Authors);
      try
        BlockWrite(f, MHeader, SizeOf(MHeader));
      finally
        IniMHeader;
      end;
      BlockWrite(f, siLight5[0], SizeOf(TsiLight5) * Length(siLight5));
      HAddon.bHCAversion := 16;
      BlockWrite(f, HAddon, SizeOf(THeaderCustomAddon));
      if bSaveImgBuf then
        BlockWrite(f, fullSizeImage[0], Length(fullSizeImage) * SizeOf(Cardinal));
      CloseFile(f);
    finally
      Screen.Cursor := crDefault;
    end;
end;
procedure TGUI.sb_save_M3IClick(Sender: TObject);  // save full m3i
var TileSize: TPoint;    // was Button_M_8
begin
    TileSize := GetTileSize(@MHeader);    //check imagesize
    if (Length(siLight5) <> TileSize.X * TileSize.Y) and
      (MessageDlg('The Image Size does not fit the parameters, store anyway?',
                  mtWarning, [mbYes, mbNo], 0) = mrNo) then Exit;
    if SaveDialog_M_3.Execute then
    begin
      SaveM3I(SaveDialog_M_3.FileName, CheckBox_M_16.Checked);
      SetSaveDialogNames(SaveDialog_M_3.FileName);
    end;
end;
procedure TGUI.sb_open_M3IClick(Sender: TObject);  // open full m3i
begin
    PageCtrls.ActivePage := TabImage;
    if OPD.Execute then
    begin
      Timer_M_1.Enabled := False;
      LoadFullM3I(MHeader, OPD.FileName);
      AllPresetsUp;
      SetSaveDialogNames(OPD.FileName);
    end;
end;
procedure TGUI.StartrenderingandsaveafterwardstheM3Ifile1Click(Sender: TObject);
begin  //start rendering+save M3I autom.
    if SaveDialog_M_3.Execute then
    begin
      SaveAutoM3Ifilename := SaveDialog_M_3.FileName;
      btnCalc3DClick(Self);
      SaveM3IfileAuto := True;
    end;
end;

//AUTHOR
procedure TGUI.ButtonAuthorClick(Sender: TObject);
var s: String;
begin
    s := Copy(InputBox('Authorname', 'Maximum 16 characters!', IniVal[33]), 1, 16);
    if not CheckAuthorValid(s) then
    begin
      ShowMessage('This name is not valid, max 16 characters and not to much uncommon characters.');
      Exit;
    end
    else IniVal[33] := s;
end;
procedure TGUI.ButtonInsertAuthorClick(Sender: TObject);
begin
    if IniVal[33] = '' then Exit;
    if (Edit_M_33.Text = '') then Edit_M_33.Text := IniVal[33] else
    if (Edit_M_33.Text <> IniVal[33]) then Edit_M_34.Text := IniVal[33];
end;
procedure TGUI.Edit_M_34Change(Sender: TObject);
begin         //Edit_M_34
    if bUserChangeM then Authors[1] := Edit_M_34.Text;
end;
procedure TGUI.Edit_M_33Change(Sender: TObject);
begin            //Edit_M_33
    if bUserChangeM then Authors[0] := Edit_M_33.Text;
end;

//CLIPBOARD
procedure TGUI.sb_ClipBrd_OutClick(Sender: TObject);
begin     //was SpeedButton_M_7
    MakeHeader;
    CopyHeaderAsTextToClipBoard(@MHeader, Caption);
end;
procedure TGUI.sb_ClipBrd_InClick(Sender: TObject);
var PC: PChar;    //was SpeedButton_M_8
    i: Integer;
    s: String;
begin
    PageCtrls.ActivePage := TabImage;
    PC := StrAlloc(3000);
    try
      i := Clipboard.GetTextBuf(PChar(PC), 3000);
      if (i > 800) and GetHeaderFromText(StrPas(PC), MHeader, s) then
      begin
        TextParsLoadSuccess;
        Caption := s;
      end
      else
        FTextBox.Visible := True;
    finally
      StrDispose(PC);
    end;
end;
procedure TGUI.TextParsLoadSuccess;
begin
    InternAspect := MHeader.Width / Max(1, MHeader.Height);
    ImageScale := Min(10, Max(1, MHeader.bImageScale));
    LoadBackgroundPicT(@MHeader.Light);
    SetEditsFromHeader;
    bUserChangeM := False;
    CheckBox_L_21.Checked := False;{LIGHT}
    bUserChangeM := True;
    SetLightFromHeader(MHeader);{LIGHT}
    if MHeader.Light.BGbmp[0] = 0 then
      Image_L_5.Visible := False
    else
      MakeLMPreviewImage(Image_L_5, @M3DBackGroundPic);{LIGHT}
    MButtonsUp;
    AllPresetsUp;
    OutMessage('Parameters loaded, press "Calculate 3D" to render.');
    ClearScreen;
    Caption := 'Mandelbulb 3D';
end;

//STICKY WINDOW
procedure TGUI.Stickthiswindowtotherightside1Click(Sender: TObject);
begin
    FormsSticky[StickIt] := (Sender as TMenuItem).Tag;
    SendMove;
end;

//buttons enable/disable
procedure TGUI.EnableButtons;
var P: TPoint;
begin
    Label_M_6.Caption := '';
    btnCalc3D.Caption := 'Calculate 3D';
    btnCalc3D.Hint := 'Start the main rendering of the image.';
    btn_Random.Enabled := True;
    btn_Random.Caption := '®';
    SpeedButton_M_32.Enabled := True;
    SpeedButton_M_33.Enabled := True;
    SpeedButton_M_34.Enabled := True;
    Button_M_1.Enabled := True;
    Button_M_6.Enabled := True;
    sb_open_M3P.Enabled := True;
    sb_open_M3I.Enabled := True;
    btnBlocky.Enabled := True;   //Button_M_11
    Button_M_12.Enabled := True;
    sb_ClipBrd_In.Enabled := True;
    sb_undo_redo.Enabled := (UndoCount > 1) or (RedoCount > 1);
    SpeedButton_M_11.Enabled := True;
    SpeedButton_M_16.Enabled := True;
    SpeedButton_M_17.Enabled := True;
    SpeedButton_M_18.Enabled := True;
    SpeedButton_M_22.Enabled := True;
    SpeedButton_M_23.Enabled := True;
    sb_zoom.Enabled := True;
    sb_zoom_xy.Enabled := True;
    sb_zoom_z.Enabled := True;
    sb_IniDirs.Enabled := True;
    sb_MapSequences.Enabled := True;
    sb_VisualThemes.Enabled := True;

//    if PPFormCreated then
//    begin
//      PostProForm.Button_P_1.Enabled := True;
//      PostProForm.Button_P_2.Enabled := True;
//      PostProForm.Button_P_3.Enabled := True;
//      PostProForm.Button_P_4.Enabled := True;
//      PostProForm.Button_P_5.Enabled := True;
//      PostProForm.Button_P_6.Enabled := True;
//      PostProForm.Button_P_7.Enabled := True;
//      PostProForm.Button_P_8.Enabled := True;
//      PostProForm.Button_P_9.Enabled := True;
//      PostProForm.Button_P_10.Enabled := True;
//      PostProForm.Button_P_12.Enabled := True;
//      PostProForm.Button_P_14.Enabled := True;
//      PostProForm.Button_P_15.Enabled := True;
//      PostProForm.Button_P_16.Enabled := True;
//      PostProForm.Button_P_18.Enabled := True;
//      PostProForm.CheckBox_P_21.Enabled := True;
//      PostProForm.CheckBox_P_25.Enabled := True;
//    end;

//    if BatchFormCreated then
//    begin
//      BatchForm1.Button1.Enabled := True;
//    end;
//    if bTilingFormCreated then
//    begin
//      TilingForm.Button2.Enabled := TFSB9E;
//      TilingForm.Button3.Enabled := True;
//      TilingForm.SpeedButton1.Enabled := True;
//      TilingForm.SpeedButton2.Enabled := True;
//      TilingForm.SpeedButton9.Enabled := TFSB9E;
//      TilingForm.SpeedButton11.Enabled := True;
//      TilingForm.Panel2.Enabled := TFSB9E;
//      TFSB9Echecked := False;
//    end;
//    if bVoxelFormCreated then
//    begin
//      FVoxelExport.Button3.Enabled := True;
//      FVoxelExport.SpeedButton11.Enabled := True;
//      FVoxelExport.Button4.Enabled := True;
//      FVoxelExport.Button5.Enabled := FVoxelExport.Benabled;  //prev
//      FVoxelExport.SpeedButton9.Enabled := FVoxelExport.Benabled;  //save
//      FVoxelExport.Button2.Enabled := FVoxelExport.Benabled;  //Start..
//      FVoxelExport.Panel3.Enabled := True;
//      FVoxelExport.Button5.Caption := 'Calculate preview';
//    end;
    {if bMeshExportFormCreated then
    begin
////      MeshExportFrm.Button3.Enabled := True;
////      MeshExportFrm.SpeedButton11.Enabled := True;
      MeshExportFrm.Button4.Enabled := True;
      MeshExportFrm.Button5.Enabled := MeshExportFrm.Benabled;  //prev
////      MeshExportFrm.SpeedButton9.Enabled := MeshExportFrm.Benabled;  //save
      MeshExportFrm.PLYBtn.Enabled := MeshExportFrm.Benabled;  //Start..
      MeshExportFrm.Panel3.Enabled := True;
      MeshExportFrm.Button5.Caption := 'Calculate preview';
    end;}



//    if MCFormCreated then MCForm.Button4.Enabled := MCForm.Button8.Enabled;
    ColorForm.CheckBox3.Enabled := True;
    SetImageCursor;
    GetCursorPos(P);
    SetCursorPos(P.X, P.Y - 1);   //To update the cursor, if over image
    SetCursorPos(P.X, P.Y);
    DragAcceptFiles(Self.Handle, True);
//    if AnimationForm.AniOption >= 0 then AnimationForm.EnableButtons;
    if FNaviFormCreated then GUINav.sb_par_out.Enabled := True;
//    if (AnimationForm.AniOption <> 3) and (BatchStatus <> 1) then
//      SetThreadExecutionState(ES_CONTINUOUS);
end;
procedure TGUI.DisableButtons;
begin
    SetThreadExecutionState(ES_CONTINUOUS or ES_SYSTEM_REQUIRED or ES_AWAYMODE_REQUIRED);
    SpeedButton_M_32.Enabled := False;
    SpeedButton_M_33.Enabled := False;
    SpeedButton_M_34.Enabled := False;
    Button_M_1.Enabled := False;
    Button_M_6.Enabled := False;
    sb_open_M3P.Enabled := False;
    sb_open_M3I.Enabled := False;
    btnBlocky.Enabled := False;    //Button_M_11
    Button_M_12.Enabled := False;
    btnCalc3D.Caption := 'Stop';
    btnCalc3D.Hint := 'Stop the current calculation.';
    btn_Random.Enabled := False;
    btn_Random.Caption := '©';
    sb_ClipBrd_In.Enabled := False;
    sb_undo_redo.Enabled := False;
    SpeedButton_M_11.Enabled := False;
    SpeedButton_M_16.Enabled := False;
    SpeedButton_M_17.Enabled := False;
    SpeedButton_M_18.Enabled := False;
    SpeedButton_M_22.Enabled := False;
    SpeedButton_M_23.Enabled := False;
    sb_zoom.Enabled := False;
    sb_zoom_xy.Enabled := False;
    sb_zoom_z.Enabled := False;
    sb_IniDirs.Enabled := False;
    sb_MapSequences.Enabled := False;
    sb_VisualThemes.Enabled := False;
    MCalcStop := False;

//    if PPFormCreated then
//    begin
//? var B:TButton;
//? with PostProForm do
//? B := FindComponent('Button_P_' + IntToStr(i)) as TButton;
//? if B in [1,2,3,4,5,6,7,8,9,10,12,14,15,16,18] then B.Enabled := False;
//      PostProForm.Button_P_1.Enabled := False;
//      PostProForm.Button_P_2.Enabled := False;
//      PostProForm.Button_P_3.Enabled := False;
//      PostProForm.Button_P_4.Enabled := False;
//      PostProForm.Button_P_5.Enabled := False;
//      PostProForm.Button_P_6.Enabled := False;
//      PostProForm.Button_P_7.Enabled := False;
//      PostProForm.Button_P_8.Enabled := False;
//      PostProForm.Button_P_9.Enabled := False;
//      PostProForm.Button_P_10.Enabled := False;
//      PostProForm.Button_P_12.Enabled := False;
//      PostProForm.Button_P_14.Enabled := False;
//      PostProForm.Button_P_15.Enabled := False;
//      PostProForm.Button_P_16.Enabled := False;
//      PostProForm.Button_P_18.Enabled := False;
//      PostProForm.CheckBox_P_21.Enabled := PostProForm.CheckBox_P_21.Checked;
//      PostProForm.CheckBox_P_25.Enabled := PostProForm.CheckBox_P_25.Checked;
//    end;

//    if BatchFormCreated then
//    begin
//      if BatchStatus = 0 then BatchForm1.Button1.Enabled := False;
//    end;
//    if bTilingFormCreated then
//    begin
//      TilingForm.Button2.Enabled := False;
//      TilingForm.Button3.Enabled := False;
//      TilingForm.SpeedButton1.Enabled := False;
//      TilingForm.SpeedButton2.Enabled := False;
//      if not TFSB9Echecked then
//        TFSB9E := TilingForm.SpeedButton9.Enabled;
//      TFSB9Echecked := True;
//      TilingForm.SpeedButton9.Enabled := False;
//      TilingForm.SpeedButton11.Enabled := False;
//      TilingForm.Panel2.Enabled := False;
//    end;
//    if bVoxelFormCreated then
//    begin
//      FVoxelExport.Button3.Enabled := False;
//      FVoxelExport.SpeedButton11.Enabled := False;
//      FVoxelExport.Button4.Enabled := False;
//      FVoxelExport.Button5.Enabled := False;  //prev
//      FVoxelExport.SpeedButton9.Enabled := False;  //save
//      FVoxelExport.Button2.Enabled := False;  //Start..
//      FVoxelExport.Panel3.Enabled := False;
//    end;


    {if bMeshExportFormCreated then
    begin
/////      MeshExportFrm.Button3.Enabled := False;
////      MeshExportFrm.SpeedButton11.Enabled := False;
      MeshExportFrm.Button4.Enabled := False;
      MeshExportFrm.Button5.Enabled := False;  //prev
////      MeshExportFrm.SpeedButton9.Enabled := False;  //save
      MeshExportFrm.PLYBtn.Enabled := False;  //Start..
      MeshExportFrm.Panel3.Enabled := False;
    end;}

//    if MCFormCreated then MCForm.Button4.Enabled := False;
    Image_M_1.Cursor := crHourGlass;
    DragAcceptFiles(Self.Handle, False);
//    AnimationForm.DisableButtons;
    ProgressBar1.Position := 0;
    if FNaviFormCreated then GUINav.sb_par_out.Enabled := False;
    if ColorForm.CheckBox3.Checked then ColorForm.CheckBox3.Checked := False;
    ColorForm.CheckBox3.Enabled := False;
end;
procedure TGUI.MButtonsUp;
begin
    sb_zoom.Down := False;
    sb_zoom_xy.Down := False;
    sb_zoom_z.Down := False;
    notAllButtonsUp   := False;
end;

//JULIA
procedure TGUI.cb_julia_modeClick(Sender: TObject);
begin      //     CheckBox_M_7
    PageControl_M_1Change(Sender);
end;
procedure TGUI.Button_M_13Click(Sender: TObject);  //insert julia values
var v4: TVec4D;
begin
    v4[0] := StrToFloatK(eXmid.Text);  //mid vals
    v4[1] := StrToFloatK(eYmid.Text);
    v4[2] := StrToFloatK(eZmid.Text);
    v4[3] := StrToFloatK(eJW.Text);//0;  //     Edit_*M_7
    Rotate4Dvec(v4);
    Edit_M_28.Text := FloatToStr(v4[0]);
    Edit_M_29.Text := FloatToStr(v4[1]);
    Edit_M_30.Text := FloatToStr(v4[2]);
    eJW.Text  := FloatToStr(v4[3]);
      //Wadd
{The following code causes “stay on top” forms to allow a MessageBox to appear on top. After the message box is closed, the topmost forms are restored so that they continue to float to the top.
Begin
  with Application do
  begin
    NormalizeTopMosts;
    MessageBox('This should be on top.', 'Look', MB_OK);
    RestoreTopMosts;
  end;
end; }
{  with Application do
  begin
    NormalizeTopMosts;
    MessageBox(PChar(FloatToStr(v4[3])), 'You have to set the W_Add value in the formula to:', MB_OK);
    RestoreTopMosts;
  end;  }
   //   InputBox('Information', 'You have to set the W_Add value in the formula to:', FloatToStr(v4[3]));
end;
procedure TGUI.Button_M_16Click(Sender: TObject);
var B: TButton; //was  Button_M_16
begin
    B := Sender as TButton;
    if B.Caption = 'Click on image' then
    begin
      if B.Tag = 4 then
        B.Caption := 'Get min.dist. from image'
      else
        B.Caption := 'Get values from image';
      iGetPosFromImage := 0;
      SetImageCursor;
    end
    else
    begin
      B.Caption := 'Click on image';
      iGetPosFromImage := B.Tag;
      MButtonsUp;
      Image_M_1.Cursor := crCross;
    end;
end;

//PRESETS
procedure TGUI.AllPresetsUp;
begin
    SpeedButton_M_3.Down  := False;
    SpeedButton_M_13.Down := False;
    SpeedButton_M_5.Down  := False;
    SpeedButton_M_6.Down  := False;
end;
procedure TGUI.SetPreset(ip: Integer);
var w: Integer;
begin
    DisableBchange;
    SpinEdit_M_2.Position     := AccPreset[ip].SmoothNormals;
    Edit_M_25.Text            := FloatToStrSingle(AccPreset[ip].DEstop);
    Edit_M_6.Text             := FloatToStrSingle(AccPreset[ip].RayMultiplier);
    Edit_M_8.Text             := FloatToStrSingle(AccPreset[ip].RayLimiter);
    SpinEdit_M_5.Position     := AccPreset[ip].BinSearch;
    ImageScale                := Max(1, Min(5, AccPreset[ip].ImageScale));
    w                         := StrToIntTrim(ed_width.Text);
    bUserChangeM              := False;
    ed_width.Text            := IntToStr(AccPreset[ip].ImageWidth);
    ed_height.Text            := IntToStr((StrToIntTrim(ed_height.Text) * AccPreset[ip].ImageWidth) div w);
    bUserChangeM              := True;
    sb_aspect.Caption  := '1:' + IntToStr(ImageScale);
    SetImageSize;
    UpdateScaledImageFull;
    EnableBchange;
end;
procedure TGUI.FillInPreset(ip: Integer);
begin
    AccPreset[ip].SmoothNormals := SpinEdit_M_2.Position;
    AccPreset[ip].DEstop        := StrToFloatK(Edit_M_25.Text);
    AccPreset[ip].RayMultiplier := StrToFloatK(Edit_M_6.Text);
    AccPreset[ip].BinSearch     := SpinEdit_M_5.Position;
    AccPreset[ip].ImageScale    := ImageScale;
    AccPreset[ip].ImageWidth    := StrToIntTrim(ed_width.Text);
    AccPreset[ip].RayLimiter    := StrToFloatK(Edit_M_8.Text);
end;
procedure TGUI.EnableBchange;
begin
    SpinEdit_M_2.OnChangingEx := SpinEdit_M_2ChangingEx;
    Edit_M_25.OnChange        := SpinEdit_M_2Change;
    Edit_M_6.OnChange         := SpinEdit_M_2Change;
    Edit_M_8.OnChange         := SpinEdit_M_2Change;
    SpinEdit_M_5.OnChangingEx := SpinEdit_M_2ChangingEx;
end;
procedure TGUI.DisableBchange;
begin
    SpinEdit_M_2.OnChangingEx := nil;
    Edit_M_25.OnChange        := nil;
    Edit_M_6.OnChange         := nil;
    Edit_M_8.OnChange         := nil;
    SpinEdit_M_5.OnChangingEx := nil;
end;

//ANIMATION
procedure TGUI.FrameUpDownClick(Sender: TObject; Button: TUDBtnType);
var
  Frame: Integer;
begin
  if FrameEdit.Text<>'' then begin
    Frame := StrToInt( FrameEdit.Text );
    if (Button = btNext) then
      FrameEdit.Text := IntToStr( Frame + 1 )
    else
      FrameEdit.Text := IntToStr( Max(1, Frame - 1) );
  end;
  PropagateCurrFrameNumber;
  UpDownLightChange(Sender);{LIGHT}
end;
procedure TGUI.FrameEditExit(Sender: TObject);
begin
  PropagateCurrFrameNumber;
  UpDownLightChange(Sender);{LIGHT}
end;
procedure TGUI.PropagateCurrFrameNumber;
begin
  TMapSequenceFrameNumberHolder.SetCurrFrameNumber( StrToInt('0'+GUI.FrameEdit.Text) );
end;

//TILING
procedure TGUI.sb_tilingClick(Sender: TObject);   //Big renders
begin        //         SpeedButton_M_27
//    TilingForm.Visible := True;
//    BringToFront2(TilingForm.Handle);
end;
function TGUI.GetCalcRect: TRect;
var //TileRect: TRect;
    Crop: Integer;
begin
    if MHeader.TilingOptions <> 0 then
      GetTilingInfosFromHeader(@MHeader, Result, Crop)
//     Result := TileRect;
//     Result := TilingForm.brCalcRect
    else
      Result := Rect(0, 0, MHeader.Width - 1, MHeader.Height - 1);
end;
function TGUI.SizeOK(Verbose: LongBool): LongBool;
var sp: TPoint;
begin
    sp := GetTileSize(@MHeader);
    Result := Length(siLight5) = sp.X * sp.Y;
    if Verbose and not Result then OutMessage('Error with image size.');
end;

//ROTATION
procedure TGUI.btn_ResetRotationClick(Sender: TObject);
begin                 //was ButtonR0
    BuildRotMatrix(0, 0, 0, @MHeader.hVGrads);
    NormVGrads(@MHeader);
    SetEulerEditsFromHeader;
    ParasChanged;
end;
procedure TGUI.btn_SetRotationClick(Sender: TObject);
var x, y, z: Double;   //was Button_*M_7
 //   Q: TQuaternion;
begin
    //apply euler angles to image -> make rotation matrix from euler
    x := StrToFloatK(eXrot.Text) * Pid180;   //  Edit_*M_27
    y := StrToFloatK(eYrot.Text) * Pid180;   //  Edit_*M_31
    z := StrToFloatK(eZrot.Text) * Pid180;   //  Edit_*M_32
   { Q := EulerToQuat(x, y, z);
    CreateMatrixFromQuat(MHeader.hVGrads, Q);  }

    BuildRotMatrix(x, y, z, @MHeader.hVGrads);
    NormVGrads(@MHeader);
    //Test to see new angles
    SetEulerEditsFromHeader;
    ParasChanged;
end;

//POSITION
procedure TGUI.sb_midpointClick(Sender: TObject); //get midpoint from image
begin
    if sb_reset_pos.Caption = 'click image' then
    begin
      sb_reset_pos.Caption := 'get midpoint';
      iGetPosFromImage := 0;
      SetImageCursor;
    end
    else
    begin
      sb_reset_pos.Caption := 'click image';
      iGetPosFromImage := 22;
      MButtonsUp;
      Image_M_1.Cursor := crCross;
    end;
end;
procedure TGUI.sb_reset_posClick(Sender: TObject);  //reset pos
var d: Double; //    Button_M_14Click    //SpeedButton31
begin
    eXmid.Text := '0.0';     //x   Edit_*M_9
    eYmid.Text := '0.0';     //y   Edit_*M_10
    eZmid.Text := '0.0';     //z   Edit_*M_17

    eZstart.Text := '-2.0';    //z start Edit_*M_1
    eZend.Text := '30.0';      //z end   Edit_*M_3

    eZoom.Text := '0.8';     //zoom     Edit_*M_5
    eFOV.Text := '30';     //FOV      Edit_*M_14
    BuildRotMatrix(0.0001, -0.0001, 0, @MHeader.hVgrads);
    if TryStrToFloat(RBailoutEdit.Text, d) and (d > 500) then //{FORMULA}
    begin
      eZstart.Text := '-8.0';     //z start    Edit_*M_1
      eZmid.Text   := '0.0';     //z          Edit_*M_17
      eZend.Text   := '120.0';    //z end      Edit_*M_3
      eZoom.Text   := '0.18';     //zoom       Edit_*M_5
    end;
    ParasChanged;
    SetEulerEditsFromHeader;
end;

//volumetric light fog
procedure TGUI.ButtonVolLightClick(Sender: TObject);
begin
    if ButtonVolLight.Caption = 'Dyn. fog on It.:' then
      MHeader.bVolLightNr := 1 or (2 shl 4)
    else MHeader.bVolLightNr := 2 shl 4;
    SetEdit_M_16Text;
end;
procedure TGUI.SetEdit_M_16Text;
begin
    if (MHeader.bVolLightNr and 7) = 0 then
    begin
      Edit_M_16.Text := IntToStr(MHeader.bDFogIt);
      ButtonVolLight.Caption := 'Dyn. fog on It.:';
      Edit_M_16.Width := Edit_M_35.Width;
      UpDown_M_5.Visible := False;
      Label_M_61.Visible := False;
    end else begin
      Edit_M_16.Text := IntToStr(Max(1, MHeader.bVolLightNr and 7));
      ButtonVolLight.Caption := 'Volume light nr:';
      Edit_M_16.Width := UpDown_M_5.Left - Edit_M_16.Left - 2;
      UpDown_M_5.Visible := True;
      UpDown_M_5.Position := (MHeader.bVolLightNr shr 4) - 2;
      if UpDown_M_5.Position > 0 then
        Label_M_61.Caption := '+' + IntToStr(UpDown_M_5.Position)
      else
        Label_M_61.Caption := IntToStr(UpDown_M_5.Position);
      Label_M_61.Visible := True;
    end;
end;
procedure TGUI.UpDown_M_5Click(Sender: TObject; Button: TUDBtnType);
var i: Integer;
begin
    i := UpDown_M_5.Position;
    if (Button = btNext) and (i < 9) then Inc(i) else
    if (Button = btPrev) and (i > -2) then Dec(i);
    if i > 0 then Label_M_61.Caption := '+' + IntToStr(i)
             else Label_M_61.Caption := IntToStr(i);
end;

//STEREO
procedure TGUI.Button_M_1Click(Sender: TObject);
begin
    SliceCalc := (Sender as TSpeedButton).Tag;
    Timer_M_1.Enabled := True;
end;
procedure TGUI.Button_M_12Click(Sender: TObject);   // calculate left eye image
begin              //     Button_M_12
    MHeader.bCalc3D := 1;
    StoreUndo;
    MHeader.bStereoMode := (Sender as TButton).Tag;
    CalcMand(True);
end;

//IMAGE SIZE
procedure TGUI.ed_widthChange(Sender: TObject);
var i: Integer;    //    ed_width   ed_height
    s: Single;
begin
    if bUserChangeM then
    begin
      AllPresetsUp;
      if cb_keep_aspect.Checked and ((Sender as TEdit).Tag > 0) then
      begin
        if (Sender as TEdit).Tag = 1 then  //width changing
        begin
          if TryStrToInt(Trim(ed_width.Text), i) and (i > 0) then
          begin
            s := i / MHeader.Width;
            bUserChangeM := False;
            ed_height.Text := IntToStr(Round(i / InternAspect));
            ScaleDEstop(s);
//            ScaleRclip(s);
            bUserChangeM := True;
          end;
        end
        else if (Sender as TEdit).Tag = 2 then  //height changing
        begin
          if TryStrToInt(Trim(ed_height.Text), i) and (i > 0) then
          begin
            bUserChangeM := False;
            ed_width.Text := IntToStr(Round(i * InternAspect));
            if TryStrToInt(Trim(ed_width.Text), i) and (i > 0) then
            begin
              s := i / MHeader.Width;
              ScaleDEstop(s);
//              ScaleRclip(s);
            end;
            bUserChangeM := True;
          end;
        end;
      end;
      if TryStrToInt(Trim(ed_width.Text), i) and (i > 0) then
        MHeader.Width := i;
      if TryStrToInt(Trim(ed_height.Text), i) and (i > 0) then
        MHeader.Height := i;
      MHeader.TilingOptions := 0;
    end;
end;
procedure TGUI.SpeedButton_M_3Click(Sender: TObject);
var SB: TSpeedButton;  // 3 /5 /6 /13
    t: Integer;
begin
    SB := Sender as TSpeedButton;
    t  := SB.Tag;
    if SB.Cursor = crUpArrow then
    begin
      SpeedButton_M_3.Cursor  := crDefault;
      SpeedButton_M_13.Cursor := crDefault;
      SpeedButton_M_5.Cursor  := crDefault;
      SpeedButton_M_6.Cursor  := crDefault;
      SpeedButton_M_10.Down   := False;
      FillInPreset(t);
      SaveAccPreset(t);
    end
    else if SB.Down then SetPreset(t);
end;
procedure TGUI.SpeedButton_M_10Click(Sender: TObject);
begin
    if SpeedButton_M_3.Cursor = crUpArrow then
    begin
      SpeedButton_M_3.Cursor  := crDefault;
      SpeedButton_M_13.Cursor := crDefault;
      SpeedButton_M_5.Cursor  := crDefault;
      SpeedButton_M_6.Cursor  := crDefault;
      SpeedButton_M_10.Down   := False;
    end else begin
      SpeedButton_M_3.Cursor  := crUpArrow;
      SpeedButton_M_13.Cursor := crUpArrow;
      SpeedButton_M_5.Cursor  := crUpArrow;
      SpeedButton_M_6.Cursor  := crUpArrow;
      AllPresetsUp;
    end;
end;
//ASPECT RATIO
procedure TGUI.sb_aspectClick(Sender: TObject);
var CP: TPoint;  //     SpeedButton_M_35
begin
    CP := sb_aspect.ClientToScreen(Point(0, sb_aspect.Height));
    PopupMenu_M_1.Popup(CP.X, CP.Y);
end;
procedure TGUI.cb_keep_aspectClick(Sender: TObject);
var dw, dh: Double;
begin
    if cb_keep_aspect.Checked then //keep aspect
      if StrToFloatKtry(ed_width.Text, dw) and StrToFloatKtry(ed_height.Text, dh) and
        (dw > 0.5) and (dh > 0.5) then InternAspect := dw / dh;
end;
procedure TGUI.sb_aspect_43Click(Sender: TObject);  //aspect
var t, wid: Integer;  //   SpeedButton_M_19 4:3   SpeedButton_M_19  5:3
    b: LongBool;
begin
    t := (Sender as TSpeedButton).Tag;
    wid := StrToIntTrim(ed_width.Text);
    b := bUserChangeM;
    bUserChangeM := False;
    case t of
      1:  ed_height.Text := IntToStr((wid * 3) div 4);
      2:  ed_height.Text := IntToStr((wid * 3) div 5);
      3:  if UserAspect.X > 0 then
            ed_height.Text := IntToStr((wid * UserAspect.Y) div UserAspect.X);
    end;
    MHeader.Height := StrToIntTry(ed_height.Text, MHeader.Height);
    MHeader.TilingOptions := 0;
    cb_keep_aspectClick(Sender);
    bUserChangeM := b;
end;
procedure TGUI.UpdateAspectCaption;
begin
    if UserAspect.X > 0 then
      sb_aspect_user.Caption := IntToStr(UserAspect.X) + ':' + IntToStr(UserAspect.Y)
    else
      sb_aspect_user.Caption := 'user';
end;
procedure TGUI.sb_aspect_userMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i: Integer;       //   SpeedButton_M_21 user
begin
    if ssRight in Shift then    //define user aspect ratio
    begin
      i := StrToIntTrim(InputBox('User defined aspect ratio', 'Input the width factor:', '16'));
      if i < 1 then Exit;
      UserAspect.X := i;
      i := StrToIntTrim(InputBox('User defined aspect ratio', 'Input the height divisor:', '9'));
      if i < 1 then
      begin
        UserAspect.X := 0;
        Exit;
      end;
      UserAspect.Y := i;
      UpdateAspectCaption;
      IniVal[11] := sb_aspect_user.Caption;
    end;
end;

//CUTTING
procedure TGUI.Button_M_19Click(Sender: TObject);
begin         //was Button_M_19
    Edit_M_23.Text := eXmid.Text;
    Edit_M_24.Text := eYmid.Text;
    Edit_M_22.Text := eZmid.Text;
end;

//UNDO/REDO
procedure TGUI.sb_undo_redoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin     //      SpeedButton_M_9
    if Button = mbLeft then RestoreUndo else
    if Button = mbRight then Redo else Exit;
    SetEditsFromHeader;
    GUI.SetLightFromHeader(MHeader);{LIGHT}
    GUI.cb_light_preset.ItemIndex := -1;{LIGHT}
    tc_frmChange(Sender);{FORMULA}
    ParasChanged;
    AllPresetsUp;
end;

//THREAD
procedure TGUI.CheckBox_M_14Click(Sender: TObject);
begin      //    CheckBox_M_14 CheckBox_M_15
    TBoostChanged := True;
end;

procedure TGUI.SpinEdit_M_2ChangingEx(Sender: TObject; var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
begin         //      SpinEdit_M_2    UpDownThread   ComboBoxThread
              //      SpinEdit_M_5    associate Edit_M_19
    AllPresetsUp;
end;

//CALC   DE / ray /step
procedure TGUI.SpinEdit_M_2Change(Sender: TObject);
begin    //associate Edit_M_19 .................(Smooth  normals:)
          //SpinEdit_M_5 associate Edit_M_20 ....Stepcount for binary search:
          // Edit_M_25   DE stop:
          // Edit_M_6    Raystep multiplier:
          // Edit_M_8    Stepwidth limiter:
    AllPresetsUp;
end;
//CheckBox_M_1 /CheckBox_M_2 /CheckBox_M_3 CheckBox_M_8 /CheckBox_M_8

//move object
procedure TGUI.SpeedButton_M_18MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var rot: Double;          // 11 16 17 18  22 23   names
    M: TMatrix3;          // 11 12 13 14  15 16   tags
begin
    ProofPosLight;
    MakeHeader;         // +.. store Undo in Header files!
    with MHeader do
    begin
      rot := StrToFloatK(Edit_M_4.Text) * MPid180;
      case (Sender as TSpeedButton).Tag of
        11:  BuildRotMatrix(rot, 0, 0, @M);
        12:  BuildRotMatrix(-rot, 0, 0, @M);
        13:  BuildRotMatrix(0, -rot, 0, @M);
        14:  BuildRotMatrix(0, rot, 0, @M);
        15:  BuildRotMatrix(0, 0, rot, @M);
        16:  BuildRotMatrix(0, 0, -rot, @M);
      end;
      if Button = mbLeft then
      begin
        Multiply2Matrix(@M, @hVgrads);
        hVgrads := M;
      end else begin
        Multiply2Matrix(@hVgrads, @M);
        RotateVectorReverse(@dXmid, @M);
        SetEditsFromHeader;
      end;
      SliceCalc := 2;
      Timer_M_1.Enabled := True; //calc2D
    end;
end;

//unused
procedure TGUI.getI1BMPSLs;
begin
    I1BMPstartSL := Integer(Image_M_1.Picture.Bitmap.ScanLine[0]);
    I1BMPoffset  := Integer(Image_M_1.Picture.Bitmap.ScanLine[1]) - I1BMPstartSL;
end;
procedure TGUI.N111Click(Sender: TObject);
var s: Integer;
begin
    s := (Sender as TMenuItem).Tag;
    if s in [1..10] then
    begin
      ImageScale := s;
      SetImageSize;
      UpdateScaledImageFull;
    end;
end;


{$ENDREGION '========================================================================== > | BUTTONS'}

{$REGION '============================================================================= > | PROCESSING'}

//IMAGE PROCESSING

function TGUI.IsCalculating: Boolean;
begin
  Result := btnCalc3D.Caption = 'Stop';
end;
procedure TGUI.TriggerRepaint;
begin
//    if (not AFormCreated) or (AnimationForm.AniOption <= 0) then
    begin
      Inc(RepaintCounter);
      Timer_M_3.Enabled := True;
      cb_light_preset.Font.Color := clGrayText;{LIGHT}
    end;
end;
procedure TGUI.TriggerRepaintDraw(R: TRect);
begin
//    if AFormCreated and (AnimationForm.AniOption > 0) then Exit;
    DrawRect.Top := Min(DrawRect.Top, R.Top);
    DrawRect.Left := Min(DrawRect.Left, R.Left);
    DrawRect.Right := Max(DrawRect.Right, R.Right);
    DrawRect.Bottom := Max(DrawRect.Bottom, R.Bottom);
    Timer_M_6.Enabled := True;
 //   PaintRect(DrawRect);
end;
procedure TGUI.UpdateAndScaleImageFull(NewScale: Integer);
begin
    NewScale := Min(10, Max(1, NewScale));
    if NewScale <> ImageScale then
    begin
      ImageScale := NewScale;
      bUserChangeM := False;
      SetImageSize;
      bUserChangeM := True;
    end;
    UpdateScaledImage(0, (MHeader.Height - 1) div ImageScale);
end;
procedure TGUI.UpdateScaledImageFull;
begin
    UpdateScaledImage(0, (MHeader.Height - 1) div ImageScale);
end;

procedure TGUI.ud_viewClick(Sender: TObject; Button: TUDBtnType);
var i: Integer;    //was  UpDown_M_1
begin
    if bUserChangeM then
    begin
      i := 0;
      if Button = btNext then i := Min(10, ud_view.Position + 1) else
      if Button = btPrev then i := Max(1, ud_view.Position - 1);
      if i <> 0 then
      begin
        ImageScale := 11 - i;
        MHeader.bImageScale := ImageScale;
        bUserChangeM := False;
        SetImageSize;
        bUserChangeM := True;
        UpdateScaledImageFull;
      end;
    end;
end;

procedure TGUI.ud_scaleClick(Sender: TObject; Button: TUDBtnType);
var b: LongBool;   //was UpDown_M_2
begin
    DisableTiling(@MHeader);
    b := bUserChangeM;
    bUserChangeM := False;
    if Button = btPrev then
    begin
      MHeader.Width := MHeader.Width div 2;
      MHeader.Height := MHeader.Height div 2;
      ScaleDEstop(0.5);
//      ScaleRclip(0.5);
    end
    else if Button = btNext then
    begin
      MHeader.Width := MHeader.Width * 2;
      MHeader.Height := MHeader.Height * 2;
      ScaleDEstop(2);
//      ScaleRclip(2);
    end;
    ed_width.Text := IntToStr(MHeader.Width);
    ed_height.Text := IntToStr(MHeader.Height);
    bUserChangeM := b;
end;

procedure TGUI.ud_SharpClick(Sender: TObject; Button: TUDBtnType);
begin            //was    UpDown_M_4
    if Button = btPrev then
    begin
      if Label_M_23.Caption <> '0' then Label_M_23.Caption := IntToStr(StrToInt(Label_M_23.Caption) - 1);
    end
    else if Button = btNext then
    begin
      if Label_M_23.Caption <> '3' then Label_M_23.Caption := IntToStr(StrToInt(Label_M_23.Caption) + 1);
    end;
    IniVal[13] := Label_M_23.Caption;
end;

procedure TGUI.ScaleDEstop(s: Single);
var d: Double;
begin
    if cb_DoF_DEstop.Checked then
    begin
      if StrToFloatKtry(Edit_M_25.Text, d) then
        Edit_M_25.Text := FloatToStrSingle(d * s)
      else
        Edit_M_25.Text := FloatToStrSingle(MHeader.sDEstop * s);
    end;
end;

procedure TGUI.ClearScreen;
begin
    Image_M_1.Picture.Bitmap.Canvas.FillRect(Image_M_1.Picture.Bitmap.Canvas.ClipRect);
    ParasChanged;
end;

procedure TGUI.CalcAmbShadow;
var pw: PWord;
    x: Integer;
begin
    if not SizeOK(True) then Exit;
    DisableButtons;
    ProgressBar1.Max := MHeader.Height;
    ProgressBar1.Visible := True;
    MCalcThreadStats.pLBcalcStop := @MCalcStop;
    MCalcThreadStats.pMessageHwnd := Self.Handle;
    MCalcThreadStats.iProcessingType := 4;  //AP=8
    if (MHeader.bCalcAmbShadowAutomatic and 12) in [4, 8] then
    begin
      if (MHeader.bCalcAmbShadowAutomatic and 12) = 8 then
      begin
        pw := @siLight5[0];
        Inc(pw, 6); //ambshadow = +12 bytes
        if SSAORiteration = 0 then //set ambshadow to 0, will be accumulated during iterations
        begin
          for x := 1 to Length(siLight5) do
          begin
            pw^ := 0;
            Inc(pw, 9);
          end;
        end;
        Inc(SSAORiteration);
      end;
      if ((MHeader.bCalcAmbShadowAutomatic and 12) = 8) and (MHeader.SSAORcount > 1) then
        Label_M_6.Caption := 'ambient shadow calculation ' + IntToStr(SSAORiteration) + ' of ' + IntToStr(MHeader.SSAORcount)
      else
        Label_M_6.Caption := 'ambient shadow calculation';
      CalcAmbShadowTHiQ(@MHeader, @siLight5[0], @MCalcThreadStats, @ATlevelHiQ);
      iActiveThreads := 0;
      Timer_M_4.Interval := 500;
      Timer_M_4.Enabled := True;
    end
    else
    begin
      if CalcAmbShadowT(@MHeader, @siLight5[0], mSLoffset, @MCalcThreadStats, @ATrousWL, GetCalcRect) then
      begin
        iActiveThreads := MCalcThreadStats.iTotalThreadCount;
//        if AnimationForm.AniOption > 0 then Timer_M_4.Interval := 200 else
        Timer_M_4.Interval := 500;
        CalcYact        := -1;
        Timer_M_4.Enabled  := True;
        Label_M_6.Caption  := 'ambient shadow calculation';
      end
      else
      begin
        EnableButtons;
        OutMessage('Error in ambient shadow calculation. Stopped.');
      end;
    end;
end;

procedure TGUI.CalcHardShadow;
begin
    if not SizeOK(True) then Exit;
    MHeader.bCalc3D := 1;
    DisableButtons;
    ProgressBar1.Max := MHeader.Height;
    ProgressBar1.Visible := True;
    MCalcThreadStats.pLBcalcStop := @MCalcStop;
    MCalcThreadStats.pMessageHwnd := Self.Handle;
    MCalcThreadStats.iProcessingType := 3; //AP=4
    AssignLightVal(@HScalcHeaderLightVals, @HeaderLightVals);
    if CalcHardShadowT(@MHeader, @MCalcThreadStats, @siLight5[0], mSLoffset, @HScalcHeaderLightVals, True, GetCalcRect) then
    begin
      iActiveThreads  := MCalcThreadStats.iTotalThreadCount;
      Timer_M_4.Interval := 500;
      CalcYact        := -1;
      Timer_M_4.Enabled  := True;
      Label_M_6.Caption  := 'hard shadow calculation';
    end
    else
    begin
      EnableButtons;
      OutMessage('Error in hard shadow calculation. Stopped.');
    end;
end;

procedure TGUI.CalcMand(bMakeHeader: LongBool);
var stmp: String;
    TileSize: TPoint;
    b: LongBool;
begin // could be bug
//    if AnimationForm.AniOption = 3 then
//    begin
//      AniFileAlreadyExists(stmp);
//      if (AnimationForm.CheckBox4.Checked and AnimationForm.CheckBox5.Checked and AnimationForm.AniRightImage) or
//         ((not AnimationForm.CheckBox6.Checked) and FileIsBigger1(stmp)) or
//         (not AnimationForm.OccupyDFile(stmp)) then
//      begin
//        AnimationForm.NextSubFrame;
//        Exit;
//      end;
//      Caption := ExtractFileName(stmp);
//      b := bUserChangeM;
//      bUserChangeM := False;
//      ed_width.Text := IntToStr(MHeader.Width);
//      ed_height.Text := IntToStr(MHeader.Height);
//      bUserChangeM := b;
//    end;
    SaveM3IfileAuto := False;
    SSAORiteration := 0;
    CalcStart := GetTickCount;
    Shape_M_1.Visible := False;
    Inc(RepaintCounter);
    MHeader.bHScalculated := 0;
    if bMakeHeader then
    begin
      MakeHeader;
      MakeLightValsFromHeaderLight(@MHeader, @HeaderLightVals, 1, MHeader.bStereoMode);
      MHeader.bSliceCalc := 0;    //for StoreUndo so that no identic headers are stored
//      if (AnimationForm.AniOption <= 0) and (MHeader.TilingOptions = 0) then StoreUndo;
        StoreUndo;
      MHeader.bSliceCalc := SliceCalc;
      CalcPosLightsRelPos(@MHeader, @HeaderLightVals);
    end;
//    else if AnimationForm.AniOption = 0 then
      CalcPosLightsRelPos(@MHeader, @HeaderLightVals);
    if (MHeader.Width < 1) or (MHeader.Height < 1) then Exit;
    try
      TileSize := GetTileSize(@MHeader);
      SetLength(siLight5, TileSize.X * TileSize.Y);
      mSLoffset := TileSize.X * SizeOf(TsiLight5);
      SetImageSize;
    except
      SetLength(siLight5, 0);
      mSLoffset := 0;
    end;
    if Length(siLight5) = 0 then
    begin
      btnCalc3D.Caption := 'Calculate 3D';
      ShowMessage('Out of memory, decrease the imagesize.');
      Exit;
    end;
    DisableButtons;
    if (MHeader.bCalc3D <> 0) and
        ((MHeader.bVolLightNr and 7) > 0) and
        ((MHeader.Light.Lights[Min(5, (MHeader.bVolLightNr and 7) - 1)].Loption and 3) = 0) then
    begin
      MapCalcWindow.pMap := @VolumeLightMap;
      MapCalcWindow.pHeader := @MHeader;
      MapCalcWindow.PLightVals := @HeaderLightVals;
      MapCalcWindow.Visible := True;
      while MapCalcWindow.Visible do delay(200);
      if MCalcStop then
      begin
        EnableButtons;
        Exit;
      end;
      bSRVolLightMapCalculated := True;
    end;
    MHeader.iCalcHStime := 0;
    MHeader.iAmbCalcTime := 0;
    Label_M_8.Caption := '-';
    Label_M_48.Caption := '-';
    Label_M_50.Caption := '-';
    MCalcThreadStats.pLBcalcStop := @MCalcStop;
    MCalcThreadStats.pMessageHwnd := Self.Handle;
    MCalcThreadStats.iProcessingType := 1;
    MCalcThreadStats.iAllProcessingOptions := AllAutoProcessings(@MHeader);

    if CalcMandT(@MHeader, @HeaderLightVals, @MCalcThreadStats,
                 @siLight5[0], mSLoffset, mFSIstart, mFSIoffset, GetCalcRect) then
    begin
      iActiveThreads := MCalcThreadStats.iTotalThreadCount;
      CalcYact := -1;  //for upgrading the image
      ProgressBar1.Max := MHeader.Height;
      ProgressBar1.Visible := MHeader.bCalc3D > 0;
      if ProgressBar1.Visible then Timer_M_4.Interval := 200 + (TileSize.X + TileSize.Y) shr 3
                              else Timer_M_4.Interval := 100 + (TileSize.X + TileSize.Y) shr 4;
      if Timer_M_4.Interval > 800 then Timer_M_4.Interval := 1000;
      Timer_M_4.Enabled := True;
      if ProgressBar1.Visible then Label_M_6.Caption := 'main rendering';
    end
    else
    begin
      EnableButtons;
      MCalcThreadStats.iProcessingType := 0;
    end;
end;

procedure TGUI.Timer_M_1Timer(Sender: TObject);  //start new 2D calculation
begin
    if StartupLoadM3I then
    begin
      Timer_M_1.Enabled := False;
      StartupLoadM3I := False;
      LoadFullM3I(MHeader, ParamStr(1));
    end else begin
      if MCalcThreadStats.iProcessingType > 0 then
        MCalcStop := True
      else
      begin
        Timer_M_1.Enabled  := False;
        MHeader.bCalc3D := 0;
        bImageText      := False;
        btnCalc3D.Caption := 'Stop';
        CalcMand(True);
      end;
    end;
end;


procedure TGUI.Timer_M_3Timer(Sender: TObject);
begin
    if not isRepainting then
    begin
      Timer_M_3.Enabled := False;
      RepaintMAIN(True);
    end;
end;
procedure TGUI.RepaintMAIN(bStartTimer: LongBool);
var x, y, ThreadCount, Crop: Integer;
    ppThread: array of TPaintThread;
    PaintParameter: TPaintParameter;
    d: Double;
    TileSize: TPoint;
    TilingRect: TRect;
begin
    if SizeOK(False) then
    begin
      Inc(RepaintCounter);
      WaitForPaintStop(5);
      isRepainting := True;
      RepaintYact  := 0;
//      if (AnimationForm.AniOption <= 0) then
//      begin
        GUI.PutLightFInHeader(MHeader);{LIGHT}
        MakeLightValsFromHeaderLight(@MHeader, @HeaderLightVals, 1, MHeader.bStereoMode);
//      end;
      SetImageSize;
      ThreadCount := Max(1, Min(GetTileSize(@MHeader).Y, Min(16, UpDownThread.Position)));
      SetLength(ppThread, ThreadCount);
      CalcStepWidth(@MHeader);
      with PaintParameter do
      begin
        PaintVGrads := NormaliseMatrixTo(MHeader.dStepWidth, @MHeader.hVGrads);
        ppWidth  := MHeader.Width;
        ppHeight := MHeader.Height;
        ppYinc   := ThreadCount;
        PLVals   := @HeaderLightVals;
        pVgrads  := @PaintVGrads;
        sFOVy    := MHeader.dFOVy * Pid180;
        ppXOff   := CalcXoff(@MHeader);
        ppPlanarOptic := MHeader.bPlanarOptic and 3;
        if ppPlanarOptic = 2 then sFOVy := Pi;
        d := Min(1.5, Max(0.01, sFOVy * 0.5));
        ppPlOpticZ := Cos(d) * d / Sin(d);
        CalcPPZvals(MHeader, Zcorr, ZcMul, ZZstmitDif);
        StepWidth := MHeader.dStepWidth;
        ppLocalCounter := RepaintCounter;
        pPsiLight := @siLight5[0];
        if MHeader.TilingOptions <> 0 then
        begin
          TileSize := GetTileSize(@MHeader);
          ppPaintWidth := TileSize.X;  //TilingForm.brTileW;
          ppPaintHeight := TileSize.Y; //TilingForm.brTileH;
          GetTilingInfosFromHeader(@MHeader, TilingRect, Crop);
          ppXplus := TilingRect.Left;
          ppYplus := TilingRect.Top;
        end else begin
          ppPaintWidth := ppWidth;
          ppPaintHeight := ppHeight;
          ppXplus := 0;
          ppYplus := 0;
        end;
        ppPLoffset := ppPaintWidth * SizeOf(TsiLight5);
        ppMessageHwnd := Self.Handle;
      end;
      for x := 0 to ThreadCount - 1 do
      begin
        RepYact[x] := 0;
        PaintParameter.ppYstart   := x;
        PaintParameter.ppThreadID := x;
        try
          ppThread[x]                 := TPaintThread.Create(True);
          ppThread[x].FreeOnTerminate := True;
          ppThread[x].PaintParameter  := PaintParameter;
          ppThread[x].Priority        := cTPrio[Min(3, ComboBoxThread.ItemIndex + 1)];
          Inc(RepaintCounts[x]);// := 1;
        except
          ThreadCount := x;
          for y := 0 to ThreadCount - 1 do
            ppThread[y].PaintParameter.ppYinc := ThreadCount;
          Break;
        end;
      end;
      RepYThreads := ThreadCount;
      iActivePaintThreads := ThreadCount;
      for x := 0 to ThreadCount - 1 do ppThread[x].Start;
      Timer_M_8.Interval := 100;
      if bStartTimer then Timer_M_8.Enabled := True;
//   mCalcThreadStats.cCalcTime := GetTickCount; //test
    end;
 //     if RepaintCounts[y] > 0 then Inc(c);
   //   if RepYact[y] < ymin then ymin := RepYact[y];
end;
procedure TGUI.RepaintMAINnoThread;
begin
    Screen.Cursor := crHourGlass;
    try
      Inc(RepaintCounter);
      Application.ProcessMessages;
      WaitForPaintStop(3);
      RepaintMAIN(False);
      WaitForPaintStop(40);
    finally
      Screen.Cursor := crDefault;
      isRepainting := False;
    end;
end;


procedure TGUI.CalcStatistic;
var i, iMa: Integer;
    dS, dI, dSC, dIC: Double;
begin
    dS  := 0;
    dI  := 0;
    dSC := 0;
    dIC := 0;
    iMa := 0;
    for i := 1 to MCalcThreadStats.iTotalThreadCount do
    with MCalcThreadStats.CTrecords[i] do
    begin
      dS  := dS + i64DEsteps;
      dI  := dI + i64Its;
      dSC := dSC + iDEAvrCount;
      dIC := dIC + iItAvrCount;
      if MaxIts > iMa then iMa := MaxIts;
    end;
    with MHeader do
    begin
      if dSC > 0 then iAvrgDEsteps := Round(dS * 10 / dSC)
                 else iAvrgDEsteps := 0;
      if dIC > 0 then iAvrgIts := Round(dI * 10 / dIC)
                 else iAvrgIts := 0;
      iMaxIts := iMa;
      if iAvrgDEsteps = 0 then Label_M_31.Caption := '?' else
      Label_M_31.Caption := IntToStr(iAvrgDEsteps div 10) + '.' + IntToStr(iAvrgDEsteps mod 10);
      Label_M_32.Caption := IntToStr(iAvrgIts div 10) + '.' + IntToStr(iAvrgIts mod 10);
      Label_M_40.Caption := IntToStr(iMa);
      Label_M_52.Caption := IntToTimeStr(iCalcTime);
    end;
end;

procedure TGUI.WaitForPaintStop(maxSeconds: Integer);
var i, c, y: Integer;
begin
    i := maxSeconds * 50;
    repeat
      c := 0;
      for y := 0 to RepYThreads - 1 do if RepaintCounts[y] > 0 then Inc(c);
      if c > 0 then Sleep(20);
      Dec(i);
    until (c = 0) or (i = 0);
end;

procedure TGUI.Timer_M_4Timer(Sender: TObject);   // proof if threads are still calculating
var x, y, z, ymin, c, yoff, yimi: Integer;
    yy, xx, ymax: Double;
    s: String;
    DoFrec: TDoFrec;
begin
    ymin := 999999;
    c    := 0;
    yy   := 0;
    with MCalcThreadStats do
    begin
      ymax := (ctCalcRect.Bottom - ctCalcRect.Top + 1) / iTotalThreadCount;
      xx := 1 / Max(1, ctCalcRect.Right - ctCalcRect.Left + 1);
      yimi := 0;
      for y := 1 to iTotalThreadCount do
      with CTrecords[y] do
      begin
        if iActualYpos < ymin then
        begin
          ymin := iActualYpos;
          yimi := y;
        end;
        if isActive > 0 then
        begin
          Inc(c);
          yy := yy + MinCD(ymax, Max(0, iActualYpos - ctCalcRect.Top - y + 1) / iTotalThreadCount +
                                 Max(0, iActualXpos - ctCalcRect.Left) * xx);
        end
        else yy := yy + ymax;
      end;
    end;
    yoff := MCalcThreadStats.ctCalcRect.Top;   //HS:3  AO:4
    if (MCalcThreadStats.iProcessingType in [1, 3, 4]) and (ymin > CalcYact) and             //DEAO
       ((MCalcThreadStats.iProcessingType in [1, 3]) or ((MHeader.bCalcAmbShadowAutomatic and 12) = 12)) then
    begin
      if CalcYact < 0 then CalcYact := 0;
      if ymin >= MHeader.Height then ymin := MHeader.Height - 1;
      if c = 0 then
      begin
        PaintRowsNoThread(CalcYact - yoff, ymin - yoff);   //worst case: still one PaintRows Thread active.. can lead to failures
        x := 600;
        while (ActivePRThreads > 0) and (x > 0) do
        begin
          Dec(x);
          Sleep(50);
        end;
      end          //<0
      else with MCalcThreadStats do
      begin
        PaintRows(CalcYact - yoff, ymin - yoff);
         //new test: give slowest thread a higher priority
        if (iTotalThreadCount > 1) and (yimi > 0) and (HandleType = 1) and (TBoostChanged or not CheckBox_M_14.Checked) then
        try
          for y := 1 to iTotalThreadCount do  //  [0..4] of TTHreadPriority = (tpIdle, tpLowest, tpLower, tpNormal, tpHigher);
          if CTrecords[y].isActive > 0 then
          begin
            if (y = yimi) and not CheckBox_M_14.Checked then
              TThread(CThandles[y]).Priority := ByteToThreadPrio(ComboBoxThread.ItemIndex + 1)
            else TThread(CThandles[y]).Priority := ByteToThreadPrio(ComboBoxThread.ItemIndex);
          end;
          TBoostChanged := False;
        except
        end;
      end;
    end
    else if (MCalcThreadStats.iProcessingType in [6, 10]) and (ymin > CalcYact) then
    begin
      if CalcYact < yoff then CalcYact := yoff;
      if ymin >= MHeader.Height then ymin := MHeader.Height - 1; //not in tiling
      UpdateScaledImage((CalcYact - yoff) div ImageScale, (ymin - yoff) div ImageScale);
    end;
    CalcYact := ymin;
    if MCalcThreadStats.iProcessingType in [1, 3, 4, 6, 10] then
    begin
      ProgressBar1.Position := (ProgressBar1.Max * Max(0, (ymin - MCalcThreadStats.ctCalcRect.Top))) div
        Max(1, MCalcThreadStats.ctCalcRect.Bottom - MCalcThreadStats.ctCalcRect.Top);
      if (MCalcThreadStats.iProcessingType in [1, 3, 6, 10]) or (MHeader.bCalcAmbShadowAutomatic and 12 = 12) then
      begin
        y := Max(0, GetTickCount - MCalcThreadStats.cCalcTime);
        if y > 100000 then MButtonsUp;
        xx := y / MSecsPerDay;
        Label_M_1.Caption := dDateTimeToStr(xx);
        if y > 2000 then
        begin
          yy := MaxCD(0.0001, yy);
          Label_M_19.Caption := 'togo: ' +  dDateTimeToStr(xx * (ymax * MCalcThreadStats.iTotalThreadCount - yy) / yy *
                                           (MCalcThreadStats.iTotalThreadCount / Max(c, 1)));
        end;
      end
      else if MCalcThreadStats.iProcessingType = 4 then
        y := Max(0, GetTickCount - MCalcThreadStats.cCalcTime);
    end;

    if c = 0 then
    begin
      if not isRepainting then CloseTries := 0;
      Timer_M_4.Enabled := False;
      c := MCalcThreadStats.iProcessingType;
      MCalcThreadStats.iProcessingType := 0;
      if MCalcStop or not (c in [1, 6]) then MCalcThreadStats.iTotalThreadCount := 0;
      Label_M_19.Caption := '';
      Label_M_6.Caption := '';
      Label_M_1.Caption := '';
      ProgressBar1.Visible := False;
      if not MCalcStop then
      begin          //Postprocessings of single procs
        case c of    //0: not calculating, 1: main calculation, 2: hard shadow postcalc, 3: NsOnZBuf, 4: AO, 5: free, 6: Reflections, 7: DOF
      1, 10:  begin
                MHeader.iCalcTime := Round(y * 0.01);
                if MHeader.bCalc3D > 0 then CalcStatistic;
                MCalcThreadStats.iTotalThreadCount := 0;
//                if (AnimationForm.AniOption <= 0) and (c = 1) then MakeHistory;{LIGHT}
                if (c = 1) then MakeHistory;{LIGHT}
              end;
          3:  begin //HS
                MHeader.iCalcHStime := Round(y * 0.01);
                Label_M_8.Caption := IntToTimeStr(MHeader.iCalcHStime);
                for z := 0 to 5 do
                  HeaderLightVals.iHScalced[HeaderLightVals.SortTab[z]] :=
                    (MHeader.bHScalculated shr (z + 2)) and 1;
              end;
          4:  begin //AO
                MHeader.iAmbCalcTime := Round(y * 0.01);
                Label_M_48.Caption := IntToTimeStr(MHeader.iAmbCalcTime);
                if (MHeader.bCalcAmbShadowAutomatic and 12) = 8 then
                  if SSAORiteration < MHeader.SSAORcount then c := 3;
              end;
          6:  begin //Reflects
                MHeader.iReflectsCalcTime := Round(y * 0.01);
                Label_M_50.Caption := IntToTimeStr(MHeader.iReflectsCalcTime);
              end;
        end;

        x := 1 shl c;
        while (x < 256) and ((MCalcThreadStats.iAllProcessingOptions and x) = 0) do x := x shl 1;
      //  if (x = 64) and (BatchStatus > 0) then x := 0;

        if (MCalcThreadStats.iAllProcessingOptions and x) > 0 then
        begin              //next processing step
          case x of        // 2: NsOnZBuf, 4: hard shadow postcalc, 8: AO, 16: free, 32: Reflections, 64: DOF
            2:  begin
                  Screen.Cursor := crHourGlass;
                  Label_M_6.Caption := 'Normals on ZBuf';  //before HS!
                  try
                    NormalsOnZbuf(@MHeader, @siLight5[0]);
                  finally
                    Screen.Cursor := crDefault;
                  end;
                  MCalcThreadStats.iProcessingType := 2;
                  Timer_M_4.Enabled := True;
                end;
            4:  CalcHardShadow;
            8:  CalcAmbShadow;
       //    16:
           32:  begin //reflections
                  ProgressBar1.Max := MHeader.Height;
                  ProgressBar1.Position := 0;
                  ProgressBar1.Visible := True;
                  Label_M_6.Caption := 'Reflections';
                  RepaintMAINnoThread;
                  MCalcThreadStats.iProcessingType := 6;
                  UpdateScaledImageFull;
                  if CalcSRT(@MHeader, @HeaderLightVals, @MCalcThreadStats,
                             @siLight5[0], mFSIstart, mFSIoffset, GetCalcRect) then
                  begin
                    iActiveThreads       := MCalcThreadStats.iTotalThreadCount;
                    CalcYact             := -1;
                    ProgressBar1.Visible := True;
                    Timer_M_4.Interval := 1000;
                    Timer_M_4.Enabled := True;
                  end;
                end;
           64:  begin
                  ProgressBar1.Max := MHeader.Height;
                  ProgressBar1.Position := 0;
                  ProgressBar1.Visible := True;
                  if (MCalcThreadStats.iAllProcessingOptions and 32) = 0 then
                    RepaintMAINnoThread
                  else UpdateScaledImageFull;
                  DoFrec.SL := @siLight5[0];
                  DoFrec.colSL := @fullSizeImage[0];
                  DoFrec.MHeader := @MHeader;
                  DoFrec.SLoffset := MHeader.Width * 4;
                  DoFrec.Verbose := True;
                  z := (MHeader.bCalcDOFtype shr 1) and 3;
                  for y := 0 to z do
                  if not MCalcStop then
                  begin
                    DoFrec.pass := y;
                    if z > 0 then
                      Label_M_6.Caption := 'DoF calculation pass ' + IntToStr(y + 1) + ' of ' + IntToStr(z + 1)
                    else Label_M_6.Caption := 'DoF calculation';
                    if ((MHeader.bCalcDOFtype shr 3) and 1) = 1 then
                      doDOF(DoFrec)
                    else
                      doDOFsort(DoFrec);
                  end;
                  ProgressBar1.Visible := False;
                  MCalcThreadStats.iAllProcessingOptions := 0;
                end;
          end;
        end;

        if (MCalcThreadStats.iAllProcessingOptions and x) = 0 then
        begin

//          if AnimationForm.AniOption > 0 then
//          begin
//            if MCalcThreadStats.iAllProcessingOptions = 0 then  // for all last processings where no repaint has to occur
//              DoSaveAniImage
//            else
//            begin
//              if c > 5 then //SR
//              begin
//                UpdateScaledImageFull;
//                DoSaveAniImage;
//              end
//              else
//              begin
//                SaveAniImage := True;
//                RepaintMAIN(True);
//              end;
//            end;
//          end
//          else if SaveM3IfileAuto then

          if SaveM3IfileAuto then
          begin
            SaveM3I(SaveAutoM3Ifilename, True);
            EnableButtons;
          end;

//          else if BatchStatus > 0 then
//          begin
//            if BatchForm1.CheckBox2.Checked then s := IncludeTrailingPathDelimiter(IniDirs[0]) +
//              ExtractFileName(BatchForm1.ListView1.Items[BatchForm1.CurrentListIndex].Caption)
//            else s := BatchForm1.ListView1.Items[BatchForm1.CurrentListIndex].Caption;
//            SaveM3I(s, True);
//            BatchForm1.NextFile;
//          end

//          else if TilingForm.SaveThisTile and (MHeader.TilingOptions <> 0) then  //with TilingForm
//          begin
//            if MCalcThreadStats.iAllProcessingOptions = 0 then  // for all last processings where no repaint has to occur
//              DoSaveTileImage
//            else
//            begin
//              if c > 5 then //SR
//              begin
//                UpdateScaledImageFull;
//                DoSaveTileImage;
//              end
//              else
//              begin
//                SaveTileImage := True;
//                RepaintMAIN(True);
//              end;
//            end;
//          end
//          else

          begin
//            if PPFormCreated and PostProForm.CheckBox_P_25.Checked then  //calcSR rect   access violation, not created on startup?
//            begin
//              PostProForm.Button_P_15.Enabled := True;
//              Image_M_1.Cursor := crCross;
//            end
//            else EnableButtons;
            EnableButtons;
            if (c = 4) and ((MCalcThreadStats.iAllProcessingOptions and $FFF0) = 0) and
               (MCalcThreadStats.iAllProcessingOptions <> 0) then  //calcambsh only if no more calcs... or repaint seperate also in this function
              RepaintMAIN(True)
            else if (c < 4) and ((MCalcThreadStats.iAllProcessingOptions and $FFFC) = 0) then
               RepaintMAIN(True)
            else if c > 4 then
              UpdateScaledImageFull;
          end;
        end;
        if {(AnimationForm.AniOption <= 0) and} (c = 4) then
          for x := 1 to 9 do SetLength(ATrousWL[x], 0);

      end
      else
      begin
        EnableButtons;
        UpdateScaledImageFull;
        if c = 4 then for x := 1 to 9 do SetLength(ATrousWL[x], 0);
//        if BatchStatus > 0 then
//        begin
//          BatchStatus := -1;
//          BatchForm1.NextFile;
//        end;
      end;
    end;
end;

procedure TGUI.Timer_M_5Timer(Sender: TObject);
begin  //only on start check if all forms are made then start app
    //if LAFormCreated then
    begin
      Timer_M_5.Enabled := False;
      FirstShowUpdate;
      //GUILight.Visible := True;{LIGHT}
      //GUIFormula.Visible := True;{FORMULA}
      LoadStartupParas;
    end;
end;

procedure TGUI.Timer_M_6Timer(Sender: TObject);
begin
    if not isRepainting then
    begin
      Inc(RepaintCounter);
      Timer_M_6.Enabled := False;
      PaintRect(DrawRect);
    end;
end;


procedure TGUI.Timer_M_8Timer(Sender: TObject);  //Repaint done? + Animation save BMP
var y, ymin, c: Integer;
begin
    ymin := 999999;
    c := 0;
    for y := 0 to RepYThreads - 1 do
    begin
      if RepaintCounts[y] > 0 then Inc(c);
      if RepYact[y] < ymin then ymin := RepYact[y];
    end;
    if ymin >= RepaintYact then
      UpdateScaledImage(RepaintYact div ImageScale, ymin div ImageScale);
    RepaintYact := ymin;
    if c = 0 then
    begin
      Timer_M_8.Enabled := False;
      isRepainting   := False;
//      if (AnimationForm.AniOption > 0) and SaveAniImage then DoSaveAniImage else
//      if SaveTileImage then DoSaveTileImage else
      if Timer_M_3.Enabled then Timer_M_3Timer(Self) else StoreUndoLight;
    end;
    Timer_M_8.Interval := 100;
end;


{$ENDREGION '========================================================================== > | PROCESSING'}

{$REGION '============================================================================= > | FORM'}

procedure TGUI.FormCreate(Sender: TObject);
var i, x: Integer; cFormula: TFormulaClass;

{LIGHT}

begin
    SetLAplusPosToZero;
    ColorFormCreated := False;
    for x := 0 to 5 do FreeLightMap(@LightMaps[x]);
    FreeLightMap(@DiffColMap);
//    LAFormCreated := True;
//end;

{MAIN}

//begin
    LoadIni;
    if IniVal[35] <> '' then TStyleManager.TrySetStyle(IniVal[35]);

    OPD := TOpenPictureDialogM3D.Create(Self);
    OPD.Filter         := 'M3D Image + Parameter (*.m3i)|*.m3i';
    OPD.DefaultExt     := 'm3i';
    Randomize;
    FormatSettings.DecimalSeparator  := '.';
    notAllButtonsUp    := True;
    ScrollBox_M.DoubleBuffered := True;
    bUserChangeM       := True;
    StartupLoadM3I     := False;
    SaveAniImage       := False;
    SaveTileImage      := False;
    isRepainting       := False;
    TFSB9Echecked      := False;
    bOutMessageLoud    := False;//    params ok
    CloseTries         := 0;
    iGetPosFromImage   := 0;
    MHeader.Width      := 0;
    MHeader.Height     := 0;
    MHeader.bSliceCalc := 2;
    MHeader.bCalc3D    := 0;
    MHeader.MCSoftShadowRadius := SingleToShortFloat(1);
    MHeader.MCDepth       := 3;
    MHeader.MCcontrast    := 128;
    MHeader.MCoptions     := 2;
    MHeader.bMCSaturation := 32;
    FreeLightMap(@M3DBackGroundPic);
    MCalcThreadStats.iProcessingType   := 0;
    MCalcThreadStats.iTotalThreadCount := 0;
    iActivePaintThreads                := 0;
    UserAspect                         := Point(0, 0);
    //--------------------------------------------------------------------------
    IniMHeader;
    //--------------------------------------------------------------------------
    for i := 0 to 5 do IniCustomF(@HybridCustoms[i]);
    for i := 0 to 5 do IniCustomF(@calcHybridCustoms[i]);
    //--------------------------------------------------------------------------
    IniHAddon(@HAddOn);
    cFormula.GetHAddOnFromInternFormula(@MHeader, 0, 0);
    //--------------------------------------------------------------------------
    UpDownThread.Position     := Min(64, Max(1, NumberOfCPUs));
    MHeader.Light.FineColAdj1 := 0;
    MHeader.Light.FineColAdj2 := 120;
    MHeader.Light.BGbmp[0]    := 0;
    MHeader.TilingOptions     := 0;
    DragAcceptFiles(Self.Handle, True);

    PageControl_M_2.ActivePageIndex := 0;
    //  if Testing then Showmessage('M3D load ini now...');
    //  LoadIni;
    //  SetM3Dini;
    //  CategoryPanelGroup1.ScaleBy(96, Screen.PixelsPerInch);

end;

procedure TGUI.FormShow(Sender: TObject);
var i: Integer;
begin

    //begin
    //bLFfirstShow := False;
    //  if Testing then Showmessage('M3D lightform show...');
    SetStartPreset;
    //      if FormsSticky[1] = 0 then
    //        SetBounds(StrToIntTry(StrFirstWord(IniVal[27]), 844),
    //                  StrToIntTry(StrLastWord(IniVal[27]), 100), Width, Height);
    SetSButtonColor(3, LAtmpLight.AmbCol);
    SetSButtonColor(4, MakeDynFogCol);
    SetSButtonColor(6, LAtmpLight.AmbCol2);
    SetSButtonColor(10, LAtmpLight.DepthCol);
    SetSButtonColor(11, LAtmpLight.DepthCol2);
    SetSButtonColor(30, LAtmpLight.DynFogCol2);
    SetDialogDirectory(OpenDialogPic, IniDirs[6]);
    OpenDialog_L_1.InitialDir := IniDirs[7];
    SaveDialog_L_1.InitialDir := IniDirs[7];
    for i := 1 to 5 do MakeGlyph((FindComponent('sb_light_preset_' + IntToStr(i)) as TSpeedButton), i);
    //     if Testing then Showmessage('M3D lightform load presets...');
    for i := 6 to 15 do begin
        if LoadColPreset(i) then MakeGlyph((FindComponent('sb_light_preset_' + IntToStr(i)) as TSpeedButton), i)
        else CustomPresets[i] := ConvertColPreset164To20(Presets[5]);
        end;

    //==========================================================================
    //==========================================================================
TabControl_L_1Change(Sender);
    //==========================================================================
    //==========================================================================

    //   if Testing then Showmessage('M3D lightform show done');
    UpdateQuickLoadCB;
    //make popupm2 depthcol images and create items...
    MakeDepthColList;
   //end;
//------------------------------------------------------------------------------
{FORMULA}
//------------------------------------------------------------------------------
    //    if Testing then Showmessage('M3D formulaform show...');
    OD_M3F.InitialDir := IniDirs[3];
    OldTab2index := 0;
    bUserChangeF := True;

    //==========================================================================
    //==========================================================================
tc_frmChange(Sender);
    //==========================================================================
    //==========================================================================

    //
    //    FGUIFormCreated := True;
    //    if FGUIFormFirstShow then
    begin
    //      FGUIFormFirstShow := False;
    //      if FormsSticky[0] = 0 then
    //        SetBounds(StrToIntTry(StrFirstWord(IniVal[26]), 844),
    //                  StrToIntTry(StrLastWord(IniVal[26]), 100), Width, Height);

//------------------------------------------------------------------------------
      if SupportSSE2 then  // let them all be damned and defeat quake
      begin
//        Bevel_F_1.Width := Bevel_F_1.Width + sb_frm_type_9.Width * 3;       /// add dIFS
//         sb_frm_type_9.Visible := True;
//         sb_frm_type_10.Visible := True;
//         sb_frm_type_11.Visible := True;
      ////  sb_frm_type_count := 11;
      end;
      //MaxLBheight := tc_frm.Height - sb_frm_type_1.Top - sb_frm_type_1.Height - 4;
      dFormulaNames := TDictionary<String, Integer>.Create;

    //dFormula := TDictionary<String, TFormulaClass>.Create;

      LoadFormulaNames;  //once only
//------------------------------------------------------------------------------

    end;
    //    if Testing then Showmessage('M3D formulaform show done');
{MAIN}
    Caption := 'Mandelbulb 3D v' + ProgramVersionStr(M3dVersion);
//    Caption := 'Mandelbulb 3D v1.9';// + ProgramVersionStr(M3dVersion);
    SetM3Dini;
    //JvCheckListBox1.CheckAll;
    //JvCheckListBox1.ItemEnabled
    //for i := 0 to JvCheckListBox1.Items.Count-1 do JvCheckListBox1.Checked[i] := True;
    //ShowMessage(clb_frm.Items[i] + ' IS Checked');
//    SaveFormulaBytes;
end;

procedure TGUI.FormHide(Sender: TObject);
begin
    IniVal[24] := IntToStr(Left) + ' ' + IntToStr(Top);
    IniVal[25] := IntToStr(Width) + ' ' + IntToStr(Height);
end;
procedure TGUI.FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := True;
end;
procedure TGUI.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    if Shape_M_2.Visible then
    begin
      if WheelDelta < 0 then SetShape_M_2Size(Shape_M_2.Width - 2) else
      if WheelDelta > 0 then SetShape_M_2Size(Shape_M_2.Width + 2);
      Handled := True;
    end
    else if OverImage(Image_M_1.ScreenToClient(MousePos)) then
    begin
      if WheelDelta < 0 then SpinButton2DownClick(Sender) else
      if WheelDelta > 0 then SpinButton2UpClick(Sender);
      Handled := True;
    end;

    if not OverForm(ScreenToClient(MousePos)) then
    begin
      Handled := True;
      GUI.FormMouseWheel(Sender, Shift, WheelDelta, MousePos, Handled);
      Exit;
    end;
    if UpDownLight.Focused then
    begin
      Handled := True;
      if WheelDelta > 0 then
        UpDownLight.Position := UpDownLight.Position + 1
      else if WheelDelta < 0 then
        UpDownLight.Position := UpDownLight.Position - 1;
    end
    else if UpDownDiffMap.Focused then
    begin
      Handled := True;
      if WheelDelta > 0 then
        UpDownDiffMap.Position := UpDownDiffMap.Position + 1
      else if WheelDelta < 0 then
        UpDownDiffMap.Position := UpDownDiffMap.Position - 1;
    end
    else if Edit_L_1.Focused then
    begin
      Handled := True;
      if WheelDelta > 0 then SpinButton1Up else
      if WheelDelta < 0 then SpinButton1Down;
    end;
end;
procedure TGUI.SetShape_M_2Size(NewSize: Integer);
var mx, my, ns: Integer;
begin
    if NewSize in [3..31] then
    begin
      ns := Shape_M_2.Width div 2;
      mx := Shape_M_2.Left + ns;
      my := Shape_M_2.Top + ns;
      ns := NewSize div 2;
      Shape_M_2.SetBounds(mx - ns, my - ns, NewSize, NewSize);
    end;
end;
function TGUI.OverImage(p: TPoint): LongBool;
begin
    Result := (p.X >= 0) and (p.Y >= 0) and (p.X < Max(Image_M_1.Width, ScrollBox_M.Width))
                         and (p.Y < Max(Image_M_1.Height, ScrollBox_M.Height));
end;
procedure TGUI.SpinButton2DownClick(Sender: TObject);
begin
    ImageScale := Min(10, ImageScale + 1);
    SetImageSize;
    UpdateScaledImageFull;
end;
procedure TGUI.SpinButton2UpClick(Sender: TObject);
begin
    ImageScale := Max(1, ImageScale - 1);
    SetImageSize;
    UpdateScaledImageFull;
end;
procedure TGUI.FormKeyPress(Sender: TObject; var Key: Char);
var i: Integer;
begin
    if (Key = #27) then
    begin
      i:= MessageDlg('Quit?', mtConfirmation, mbYesNoCancel,0);
      if i = mrYes then Application.Terminate();//ShowMessage('Esc');
    end;
    // and (Screen.Cursor = crNone) then GUINav.ChangeNaviMode;
end;
procedure TGUI.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//var              //no response!?
//  Msg: TMsg;
begin
  if (key=ord('T')) and (shift=[ssAlt]) then ShowMessage('!');//begin
//    PeekMessage(Msg, 0, WM_SYSCHAR, WM_SYSCHAR, PM_REMOVE);
//    key:=0;
//  end;
end;
procedure TGUI.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if ((MCalcThreadStats.iProcessingType > 0) and Timer_M_4.Enabled and
       ((GetTickCount - CalcStart) > 900000)) {or
       (MCForm.Button2.Caption = 'Stop rendering')} then
    begin
      if MessageDlg('Do you really want to stop the calculations?', mtWarning,
                    [mbYes, mbNo], 0) = mrNo then
      begin
        CanClose := False;
        Exit;
      end;
    end;
    Inc(RepaintCounter);
    Inc(NglobalCounter);
    MCalcStop := True;
//    MCForm.MCCalcStop := True;
    CanClose  := not ((MCalcThreadStats.iProcessingType > 0) or isRepainting or
                     (GUINav.Visible and GUINav.isCalculating));
    Inc(CloseTries);
    if CloseTries > 3 then CanClose := True;// else
   // if CloseTries = 2 then StopCalcThreads(MCalcThreadStats);
    if not CanClose then OutMessage('Stopping calculations...(' + IntToStr(CloseTries) + ')');
//    AnimationForm.CloseOutPutStream;
end;
procedure TGUI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Timer_M_1.Enabled := False;
    MCalcStop      := True;
    StoreHistoryPars(MHeader);
    CopyHeaderAsTextToClipBoard(@MHeader, Caption);
    IniVal[15] := IntToStr(Byte(cb_DoF_DEstop.Checked) and 1);
    if CheckBox_M_15.Checked then IniVal[29] := IntToStr(ComboBoxThread.ItemIndex) else IniVal[29] := '-1';
    if CheckBox_M_12.Checked then IniVal[21] := 'Auto' else IniVal[21] := IntToStr(UpDownThread.Position);
    if ColorForm.CheckBox3.Checked then ColorForm.CheckBox3.Checked := False;
end;
procedure TGUI.FormDestroy(Sender: TObject);
var i: Integer;
begin
    LAtmpLight.Lights[0].Loption := 1;{LIGHT}
    SaveIni(False); //only if filedatetime = lastIniFileDatetime
    for i := 0 to 5 do FreeCF(@HybridCustoms[i]);
    for i := 0 to 5 do FreeCF(@calcHybridCustoms[i]);
    //dFormulaNames.Free;
    OPD.Free;
end;

{$ENDREGION '========================================================================== > | FORM'}

{$REGION '============================================================================= > | HEADER'}

procedure TGUI.FirstShowUpdate;  //after light+formula windows were made
var i: Integer;
begin
    Label_M_3.Caption := 'M3D Version ' + ProgramVersionStr(M3dVersion);
    RadioGroup_M_2.Hint :=
      'Panorama mode:' + #13#10 +
      '- The FOV is choosen automatically' + #13#10 +
      '- Use the 24bit SSAO or DEAO for ambient shadows' + #13#10 +
      '- A 2:1 aspect ratio is recommended, but not necessary.';
    Edit_M_19.Hint :=
      'If set to a higher value than 0, the surface normals will be calculated with an average' + #13#10 +
      'of distributed points and a roughness factor is calculated too, resulting in lower aliasing.' + #13#10 +
      'A value of 8 will average over a volume, what is very slow but can be used in very' + #13#10 +
      'critical situations.  You could also use the Normals on ZBuf in postprocessings.';
    Edit_M_20.Hint :=
      'Defines how accurate the position with the defined distance to the surface will be calculated.' + #13#10 +
      'Higher values leads to more accuracy what leads also to a better normals calculation.' + #13#10 +
      'Much more than 12 are rarely needed.';
    ud_Sharp.Hint :=                                                            //was UpDown_M_4
      'Sharpen factor of the saved output image,' + #13#10 +
      'works only with downscales of 1:2 and 1:3 !' + #13#10 +
      '0: no sharpening ... 3: maximum sharpening';
    Edit_M_16.Hint :=
      'Dynamic fog:' + #13#10 +
      'The lower the number the farer away from the object the fog shows up.' + #13#10 +
      'With dIFS, the fog is around the object part calculated at this iteration.' + #13#10 +
      'Zero to disable this feature and do the dynamic fog on raystep count as usual.' + #13#10 +
      'Hint: Check the ''First step random'' option to prevent steps.' + #13#10 +
      'Volumetric light:' + #13#10 +
      'Choose the light nr from which lightscattering will be calculated.';
    Image_M_1.Canvas.Brush.Color := clBtnFace;
    Image_M_1.Canvas.Font.Color := clWindowText;
//    if Testing then Showmessage('M3D onshow...');
    MakeHeader;
    BuildRotMatrix(-0.7, -0.0001, 0, @MHeader.hVgrads);
    SetEulerEditsFromHeader;
    Application.HintHidePause  := 20000;
    Application.HintShortPause := 0;
    for i := 0 to 3 do LoadAccPreset(i);
    UpdateAspectCaption;
 //   if Testing then Showmessage('M3D load extern formulas now...');

    if SupportSSE then
    begin
      ChangeMathFuncsToSSE;
      VolLightMapPos := VolLightMapPosSSE;
      GetVolLightMapVec := GetVolLightMapVecSSE;
      if SupportSSE2 then ChangeMathFuncsToSSE2;
    end;

    InternAspect := Max(1, MHeader.Width) / Max(1, MHeader.Height);
    LastHisParSaveTime := Now;
    FastMove(MHeader.Light, LHPSLight, SizeOf(TLightingParas9));
//    FormResize(Self); //to do light+formula sticky options
    PageControl_M_1Change(Self); //to fit height
end;

Procedure TGUI.LoadStartupParas;
var s: String;
    bStartTimer: LongBool;
begin
    bStartTimer := True;
    if ParamCount > 0 then
    begin
      s := UpperCase(ExtractFileExt(ParamStr(1)));
      if s = '.M3P' then
      begin
        LoadParameter(MHeader, ParamStr(1), True);
        AllPresetsUp;
        OutMessage('Parameters loaded, press "Calculate 3D" to render.');
        ClearScreen;
        bStartTimer := False;
      end
      else if s = '.M3I' then
        StartupLoadM3I := True
//      else if (s = '.M3A') and AnimationForm.LoadAni(ParamStr(1)) then
//      begin
//        AniStartLoad := True;
//        AnimationForm.Visible := True;
//      end
//      else if (s = '.BIG') and TilingForm.LoadBig(ParamStr(1)) then TilingForm.Visible := True;
    end
    else if not LoadParameter(MHeader, AppFolder + 'Default.m3p', True) then
      if not LoadParameter(MHeader, IncludeTrailingPathDelimiter(IniDirs[1]) + 'Default.m3p', True) then
        tc_frm.OnChange(Self);{FORMULA}
    //////btnCalc3DClick(Self);
    Timer_M_1.Enabled := bStartTimer;

end;

procedure TGUI.ParasChanged;
begin
    Image_M_1.Picture.Bitmap.Canvas.TextOut(8, 16, 'Press ''Calculate 3D'' to render');
    bImageText := True;
end;

procedure TGUI.IniHAddon(HA: PTHeaderCustomAddon);
var i: Integer;   // setup new addon
begin
    with HA^ do
    begin
      bHCAversion := 1;
      bOptions1 := 0;
      bOptions2 := 0;
      bOptions3 := 0;
      iFCount := 0;
      bHybOpt1 := 0;
      bHybOpt2 := $151;
      for i := 0 to 5 do
        with Formulas[i] do
        begin
          iItCount := 0;
          iFnr := -1;
          CustomFname[0] := 0;
          dOptionValue[0] := 8;
        end;
      Formulas[0].iItCount := 1;
      Formulas[0].iFnr := 0;
    end;
end;

procedure TGUI.IniMHeader;
var i: Integer;
begin
    MHeader.PCFAddon := @HAddOn;
    for i := 0 to 5 do MHeader.PHCustomF[i] := @HybridCustoms[i];
end;

procedure TGUI.SpeedButton_M_36Click(Sender: TObject);
var
   today : TDateTime;
   ts, ds : TStringDynArray;
   dt, t, d, dd, mm, yy: string;
begin
   PageCtrls.ActivePage := TabImage;
   // StringReplace(const Source, OldPattern, NewPattern: string; Flags: TReplaceFlags)
   // SplitString(const S, Delimiters: string)
   today := Now;

//   t := TimeToStr(today);
//   ts := SplitString(t, ':');
//   h := ts[0]; m := ts[1]; s := ts[2];
//   t := s + '-' + m + '-' + h;

   d := DateToStr(today);
   ds := SplitString(d, '/');
   dd := ds[0]; mm := ds[1]; yy := ds[2];
   d := yy + '-' + mm + '-' + dd;

   t := StringReplace(TimeToStr(today), ':', '-', [rfReplaceAll, rfIgnoreCase]);
   dt := d + '-' + t;

//   msg1 := DateToStr(today) + ' ' + TimeToStr(today);
//   msg2 := StringReplace(msg1, '/', '-', [rfReplaceAll, rfIgnoreCase]);
//   msg1 := StringReplace(msg2, ':', '-', [rfReplaceAll, rfIgnoreCase]);

//   ShowMessage('today Now = ' + DateToStr(today) + '_' + TimeToStr(today));
//   ShowMessage(dt);
   FTextBox.caption := dt;
   FTextBox.Visible := True;
end;

procedure TGUI.SetM3Dini;
var i, j, l, w: Integer;
begin
    j := StrToIntTrim(IniVal[0]);
    FormsSticky[1] := j and 3;
    bAniFormStick := (j shr 2) and 3;
    FormsSticky[0] := (j shr 4) and 3;
    FormsSticky[2] := (j shr 6) and 3;
    Edit_M_4.Text := IniVal[1];
    i := Pos(':', IniVal[11]);  //user aspect
    if i > 0 then
    try
      j := StrToIntTrim(Copy(IniVal[11], i + 1, Length(IniVal[11]) - i));
      if j > 0 then
      begin
        UserAspect.Y := j;
        UserAspect.X := StrToIntTrim(Copy(IniVal[11], 1, i - 1));
      end;
    except
    end;
    cb_par_in_png.Checked := IniVal[23] <> 'No';
    CheckBox_M_14.Checked := IniVal[30] <> 'No';
    CheckBox_M_15.Checked := IniVal[29] <> '-1';
    CheckBox_M_16.Checked := IniVal[31] = 'Yes';
    if CheckBox_M_15.Checked then ComboBoxThread.ItemIndex := StrToIntTry(IniVal[29], 2);
    if IniVal[24] <> '' then
    begin  //set pos+size
      l := StrToIntTry(StrFirstWord(IniVal[24]), 65);
      j := StrToIntTry(StrLastWord(IniVal[24]), 100);
      w := StrToIntTry(StrFirstWord(IniVal[25]), 779);
      i := StrToIntTry(StrLastWord(IniVal[25]), 671);
      SetBounds(l, j, w, i);
    end;
    if TryStrToInt(IniVal[13], i) then Label_M_23.Caption := IntToStr(i);
    if TryStrToInt(IniVal[15], i) then if i = 0 then cb_DoF_DEstop.Checked := False;
    if IniVal[21] <> 'Auto' then // detect corecount
    begin
      CheckBox_M_12.Checked := False;
      UpDownThread.Position := Min(64, Max(1, StrToIntTry(IniVal[21], UpDownThread.Position)));
    end;
    OPD.InitialDir := IniDirs[0];
    SaveDialog_M_3.InitialDir := IniDirs[0];
    OpenDialog_M_1.InitialDir := IniDirs[1];
    SaveDialog_M_2.InitialDir := IniDirs[1];
    SaveDialog_M_4.InitialDir := IniDirs[2];
    SaveDialog_M_6.InitialDir := IniDirs[2];
    SaveDialog_M_1.InitialDir := IniDirs[2];
end;

{$ENDREGION '========================================================================== > | HEADER'}

{$REGION '============================================================================= > | MOUSE ON WINDOW'}

procedure TGUI.SetImageCursor;
begin
    if (iGetPosFromImage > 0) {or
        (PPFormCreated and (PostProForm.CheckBox_P_25.Checked or PostProForm.CheckBox_P_21.Checked)) } then
        Image_M_1.Cursor := crCross
    else if sb_zoom_xy.Down then Image_M_1.Cursor := crHandPoint
    else Image_M_1.Cursor := crDefault;
end;

procedure TGUI.sb_zoomClick(Sender: TObject);
begin      //      SpeedButton_M_1  SpeedButton_M_2   SpeedButton_M_4
    if Image_M_1.Cursor <> crHourGlass then SetImageCursor;
    notAllButtonsUp := sb_zoom.Down or sb_zoom_xy.Down or sb_zoom_z.Down;
end;

procedure TGUI.Image_M_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var vec4: TVec4D;
    v: TVec3D;
    i: Integer;
begin
    if not (Image_M_1.Cursor = crHourGlass) then
    begin
      GetCursorPos(MStartPos);
      MOrigStartPos := Point(X, Y);
      MmaxShapeWid  := 0;
      MZtranslate   := 0;
      if Image_M_1.Cursor = crHandPoint then
      begin
        Shape_M_1.SetBounds(Image_M_1.Left, Image_M_1.Top, Image_M_1.Width, Image_M_1.Height);
        if (ssLeft in Shift) then Shape_M_1.Visible := True;
      end
      else if (Image_M_1.Cursor = crCross) and (ssLeft in Shift) then
      begin
//        if PostProForm.CheckBox_P_21.Checked or PostProForm.CheckBox_P_25.Checked then  //reflections preview
//        begin
//          MXYStartPos := Point(X, Y);
//          PostProForm.iRect := Rect(X * ImageScale, Y * ImageScale, X * ImageScale, Y * ImageScale);
//          Shape_M_1.SetBounds(X + Image_M_1.Left, Y + Image_M_1.Top, 0, 0);
//          Shape_M_1.Visible := True;
//        end
//        else if iGetPosFromImage > 0 then  //if ssRight in Shift then popupmenu1.popup(x,y);
        if iGetPosFromImage > 0 then  //if ssRight in Shift then popupmenu1.popup(x,y);
        begin
          if iGetPosFromImage in [1, 10] then       //DOF Zsharp
          begin
            CalcStepWidth(@MHeader);
//            if iGetPosFromImage = 1 then
//            begin
//              if SizeOK(False) then PostProForm.Edit_P_1.Text :=
//                FloatToStrSingle(GetZPos(X * ImageScale, Y * ImageScale,
//                @MHeader, @siLight5[0]) / (MHeader.dStepWidth * MHeader.Width));
//                PostProForm.Button_P_2.Caption := 'Get Z1';
//            end else begin
//              if SizeOK(False) then PostProForm.Edit_P_10.Text :=
//                FloatToStrSingle(GetZPos(X * ImageScale, Y * ImageScale,
//                @MHeader, @siLight5[0]) / (MHeader.dStepWidth * MHeader.Width));
//                PostProForm.Button_P_18.Caption := 'Get Z2';
//            end;
          end
          else if iGetPosFromImage = 2 then  //posLight midpoint
          begin
            i := GUI.TabControl_L_1.TabIndex;{LIGHT}
            GUI.ButtonGetPos.Caption := 'mid';{LIGHT}
            CalcRealPosOffsetsFromImagePos(X * ImageScale, Y * ImageScale, @MHeader, @siLight5[0], @v);
            v := AddVecF(v, GetRealMidPos(@MHeader));
            GUI.LAposMids[i] := TPos3D(v);{LIGHT}
            SetLightPosFromDVec(GUI.LAtmpLight.Lights[i], v);{LIGHT}
            tbx_light_posXChange(GUI.tbx_light_posX);{LIGHT}
          end
          else if iGetPosFromImage in [3, 6, 22] then  //Julia Vals, cutting vals, get midpoint
          begin
            CalcRealPosOffsetsFromImagePos(X * ImageScale, Y * ImageScale, @MHeader, @siLight5[0], @vec4);
            vec4[3] := 0;
            AddVec(@vec4, GetRealMidPos(@MHeader));
            case iGetPosFromImage of
         3: begin
              Rotate4Dvec(vec4);
              Edit_M_28.Text := FloatToStr(vec4[0]);
              Edit_M_29.Text := FloatToStr(vec4[1]);
              Edit_M_30.Text := FloatToStr(vec4[2]);
              eJW.Text  := FloatToStr(vec4[3]);
              cb_julia_mode.Checked := True;
              Button_M_16.Caption := 'Get values from image';
            end;
        22: begin
              v[0] := MHeader.dZmid - MHeader.dZstart;
              v[1] := MHeader.dZend - MHeader.dZmid;
              eZstart.Text := FloatToStr(vec4[2] - v[0]);  //zstart
              eZmid.Text := FloatToStr(vec4[2]); //zmid
              eZend.Text := FloatToStr(vec4[2] + v[1]);  //zend
              eXmid.Text := FloatToStr(vec4[0]);  //xmid
              eYmid.Text := FloatToStr(vec4[1]); //ymid
              // rotate view + mod zstart to get the same camera pos?
              sb_reset_pos.Caption := 'get midpoint';
            end;
         6: begin
              Edit_M_23.Text := FloatToStr(vec4[0]);   //cutting
              Edit_M_24.Text := FloatToStr(vec4[1]);
              Edit_M_22.Text := FloatToStr(vec4[2]);
              CheckBox_M_4.Checked := True;
              CheckBox_M_5.Checked := True;
              CheckBox_M_6.Checked := True;
              Button_M_20.Caption := 'Get values from image';
            end;
            end;
            ParasChanged;
          end
          else if iGetPosFromImage = 4 then  //Stereo Zpoint of Screen, calc min distance, not ready yet
          begin
            if SizeOK(False) then
              vec4[0] := GetZPos(X * ImageScale, Y * ImageScale, @MHeader, @siLight5[0]);  //abs val relative to zstart
//      Edit_M_15.Text := FloatToStrSingle(StereoScreenWidth);
//      Edit_M_18.Text := FloatToStrSingle(StereoScreenDistance);
         //   MHeader.StereoMinDistance := ;

         //rotation angle of y axis is: dr := FOVx * -0.065 / StereoScreenWidth; //FOVx := dFOVy * Pid180 * Width / Height;

            Edit_M_13.Text := FloatToStrSingle(MHeader.StereoMinDistance);
            Button_M_17.Caption := 'Get min.dist. from image';
          end;
          iGetPosFromImage := 0;
          SetImageCursor;
        end
        else if Shape_M_2.Visible then ModColOnImage(X * ImageScale, Y * ImageScale);
      end;
    end;
end;

procedure TGUI.ModColOnImage(X, Y: Integer);
var ModOTrap, ShapeRect, ColCycling: LongBool;
    sCStart, sCmul, sColZmul, StepWid, DCIplus, st: Single;
    ps, ps2: TPsiLight5;
    ir, irr, ix, iy, wCol, wInOut, maxZdiff, iZ, iZ0, wid, hei: Integer;
    Zcorr, ZcMul, ZZstmitDif, ZZ: Double;
begin
    if not SizeOk(True) then Exit;
    GetPaintTileSizes(@MHeader, wid, hei, ix, iy);
    if (X < 0) or (Y < 0) or (X >= wid) or (Y >= hei) then Exit;
    ir := (Shape_M_2.Width div 2) * ImageScale;  //radius
    ShapeRect := Shape_M_2.Shape = stRectangle;
    if ShapeRect then Dec(ir);
    irr := ir * ir;
    if (not ShapeRect) and (irr < 10) and (irr > 3) then Dec(irr, 2);
    ps := @siLight5[X + Y * wid];
    if ps.Zpos > 32767 then Exit;
    sColZmul := MHeader.Light.VarColZpos * -0.005 / (MHeader.dStepWidth * MHeader.Width);
    CalcPPZvals(MHeader, Zcorr, ZcMul, ZZstmitDif);
    Zcorr := 1 / Zcorr;
    ZcMul := 1 / ZcMul;
    iZ0 := PInteger(@ps.RoughZposFine)^ shr 8;
    ZZ := (Sqr((8388351.5 - iZ0) * ZcMul + 1) - 1) * Zcorr;
    maxZdiff := Round(2 * ir * (1 + ZZ * GetDEstopFactor(@MHeader)) / Abs(ZZ - (Sqr((8388352.5 - iZ0) * ZcMul + 1) - 1) * Zcorr));
    ModOTrap := GUI.CheckBox_L_2.Checked and (DrawInOutside = 0);{LIGHT}
    ColCycling := GUI.CheckBox_L_1.Checked;{LIGHT}
    CalcSCstartAndSCmul(@MHeader, sCStart, sCmul, DrawInOutside = 1);
    sCmul := 1 / sCmul;
    if sCmul < 0 then DCIplus := -1 else DCIplus := 1;
    StepWid := MHeader.dStepWidth;
    if DrawInOutside = 1 then
    begin
      sCStart := sCStart - 32768;
      wInOut := $8000;
    end else wInOut := 0;
    for iy := -ir to ir do if (Y + iy >= 0) and (Y + iy < hei) then
    for ix := -ir to ir do if (X + ix >= 0) and (X + ix < wid) then
    if ShapeRect or (Sqr(iy) + Sqr(ix) < irr) then    //3x3 9   2,0 4  2,1 5  2,2 8
    begin
      ps2 := @siLight5[X + ix + (Y + iy) * wid];
      if ps2.Zpos > 32767 then Continue;
      iZ := PInteger(@ps2.RoughZposFine)^ shr 8;
      ZZ := (Sqr((8388351.5 - iZ) * ZcMul + 1) - 1) * Zcorr;
      if Abs(iZ0 - iZ) <= maxZdiff then
      begin    //DrawColSIndex * 32767 = ((wCol - sCStart) * sCmul + sColZmul * (ZZ * StepWidth + ZZstmitDif)) * 16384) and $7FFF
        wCol := Round(MinMaxCS(-1e9, (DrawColSIndex * 2 - sColZmul * (ZZ * StepWid + ZZstmitDif)) * sCmul + sCStart, 1e9));
        if (wCol < 0) or (wCol > 32767) then
        begin
          if ColCycling then
          begin
            if wCol < 0 then st := DCIplus else st := -DCIplus;
            wCol := Round(MinMaxCS(-1e9, ((DrawColSIndex + st) * 2 - sColZmul * (ZZ * StepWid + ZZstmitDif)) * sCmul + sCStart, 1e9));
            if (wCol < 0) or (wCol > 32767) then Continue;
          end
          else Continue;//sometimes it is clipped dependend on adjustment settings
        end;
        if ModOTrap then
        begin
          ps2.OTrap := wCol;
          ps2.SIgradient := ps2.SIgradient and $7FFF;// or wInOut;
        end
        else ps2.SIgradient := wCol or wInOut;
      end;
    end;
    TriggerRepaintDraw(Rect(X - ir, Y - ir, X + ir, Y + ir));
end;

procedure TGUI.Image_M_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var MAktPos: TPoint;
    ih, iy, sl, sw, st, sh: Integer;
begin
    if (ssLeft in Shift) and (Image_M_1.Cursor <> crHourGlass) and
       (Image_M_1.Cursor <> crCross) and notAllButtonsUp then
    begin
      GetCursorPos(MAktPos);
      if Image_M_1.Cursor = crHandPoint then
        Shape_M_1.SetBounds(MaktPos.X - MStartPos.X + Image_M_1.Left,
              MaktPos.Y - MStartPos.Y + Image_M_1.Top, Image_M_1.Width, Image_M_1.Height)
      else
      begin
        if sb_zoom_z.Down then
        begin
          MZtranslate := MStartPos.Y - MaktPos.Y;
          Label_M_20.Caption := IntToStr(-MZtranslate);
        end
        else
        begin
          ih := (Abs(MOrigStartPos.X - X) * Image_M_1.Height) div Image_M_1.Width;
          if Y > MOrigStartPos.Y then iy := 0 else iy := ih;
          Shape_M_1.SetBounds(Min(MOrigStartPos.X, X) + Image_M_1.Left,
                           MOrigStartPos.Y - iy + Image_M_1.Top,
                           Abs(MOrigStartPos.X - X) + 1, ih);
          if Shape_M_1.Width > MmaxShapeWid then MmaxShapeWid := Shape_M_1.Width;
        end;
      end;
      if not sb_zoom_z.Down then Shape_M_1.Visible := True;
    end
    else if (Image_M_1.Cursor = crCross) and (ssLeft in Shift) { and
      (PostProForm.CheckBox_P_21.Checked or PostProForm.CheckBox_P_25.Checked) } and Shape_M_1.Visible then
    begin
      if X > MXYStartPos.X then
//      begin
//        PostProForm.iRect.Right := X * ImageScale;
//        PostProForm.iRect.Left := MXYStartPos.X * ImageScale;
//        sl := MXYStartPos.X;
//        sw := X - sl + 1;
//      end else begin
//        PostProForm.iRect.Right := MXYStartPos.X * ImageScale;
//        PostProForm.iRect.Left := X * ImageScale;
//        sl := X;
//        sw := MXYStartPos.X - X + 1;
//      end;
//      if Y > MXYStartPos.Y then
//      begin
//        PostProForm.iRect.Bottom := Y * ImageScale;
//        PostProForm.iRect.Top := MXYStartPos.Y * ImageScale;
//        st := MXYStartPos.Y;
//        sh := Y - st + 1;
//      end else begin
//        PostProForm.iRect.Bottom := MXYStartPos.Y * ImageScale;
//        PostProForm.iRect.Top := Y * ImageScale;
//        st := Y;
//        sh := MXYStartPos.Y - Y + 1;
//      end;
      Shape_M_1.SetBounds(sl + Image_M_1.Left, st + Image_M_1.Top, sw, sh);
    end
    else if Shape_M_2.Visible then
    begin
      sh := Shape_M_2.Width div 2;
      Shape_M_2.Left := X - sh + Image_M_1.Left;
      Shape_M_2.Top := Y - sh + Image_M_1.Top;
      if ssLeft in Shift then ModColOnImage(X * ImageScale, Y * ImageScale);
    end;
  {  //test
    CalcRealPosOffsetsFromImagePos(X * ImageScale, Y * ImageScale, @MHeader, @siLight5[0], @Pos3);
    Label_M_19.Caption := FloatToStrSingle(Pos3[0] + MHeader.dXmid) + ',' +
                       FloatToStrSingle(Pos3[1] + MHeader.dYmid) + ',' +
                       FloatToStrSingle(Pos3[2] + MHeader.dZmid); }
end;

procedure TGUI.Image_M_1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var xh, yh, xx, yy, dZ: Double;
    Update: LongBool;
    iLeft, iTop: Integer;
    M: TMatrix3;
begin
    if (Image_M_1.Cursor <> crHourGlass) and (Image_M_1.Cursor <> crCross) and
      notAllButtonsUp then
    with MHeader do
    begin
      if Shape_M_1.Width < 8 then Shape_M_1.Visible := False;
      Update := False;
      iLeft  := Shape_M_1.Left - Image_M_1.Left;
      iTop   := Shape_M_1.Top  - Image_M_1.Top;
      xh     := Image_M_1.Width  * 0.5;
      yh     := Image_M_1.Height * 0.5;
      xx     := 0;
      yy     := 0;
      dZ     := 1;
      if Image_M_1.Cursor = crHandPoint then  //shift image
      begin
        if Button = mbLeft then
        begin
          xx     := - iLeft;
          yy     := - iTop;
          Update := True;
        end;
      end
      else if Shape_M_1.Visible then
      begin
        xx := iLeft + Shape_M_1.Width  * 0.5 - xh;
        yy := iTop  + Shape_M_1.Height * 0.5 - yh;
        Update := True;
      end
      else if MmaxShapeWid < 8 then
      begin
        xx := X - xh;
        yy := Y - yh;
        Update := True;
      end;
      if Update then
      begin
        if sb_zoom_z.Down then  // Zpos
        begin
          Label_M_20.Caption := '';
          xx := 0;
          yy := 0;
          Update := MZtranslate <> 0;
        end
        else
        begin
          MZtranslate := 0;
          if Shape_M_1.Visible then  // marking zoom
            dZ := Image_M_1.Width / Shape_M_1.Width
          else                    // click zoom    todo: if clicked pixel has zpos < 32768 do calc new pos on Zpos and FOVy
            if Button = mbLeft then dZ := 1.4      //zoom in
                               else dZ := 1 / 1.4; //zoom out
        end;
        if Update then
        begin
          MakeHeader;

          xx := xx * ImageScale;
          yy := yy * ImageScale;
          MZtranslate := MZtranslate * ImageScale;

          yh := 2.1345 / (dZoom * Width);
          yh := yh * (1 + Sin(dFOVy * Pid180) * (dZmid - dZstart) / (yh * Height));

          M := NormaliseMatrixTo(yh, @hVGrads);
          dXmid := dXmid + xx * M[0, 0] + yy * M[1, 0] - MZtranslate * M[2, 0];
          dYmid := dYmid + xx * M[0, 1] + yy * M[1, 1] - MZtranslate * M[2, 1];
          yh    := xx * M[0, 2] + yy * M[1, 2] - MZtranslate * M[2, 2];
          if Abs(dZ - 1) > 1e-4 then
          begin
            dZoom          := dZoom * dZ;
            eZoom.Text  := FloatToStr(dZoom);
            dZstart        := dZmid + (dZstart - dZmid) / dZ;
            dZend          := dZmid + (dZend - dZmid) / dZ;
          end;
          dZend   := dZend + yh;
          dZmid   := dZmid + yh;
          dZstart := dZstart + yh;
          eZstart.Text  := FloatToStr(dZstart);
          eZend.Text  := FloatToStr(dZend);
          eXmid.Text  := FloatToStr(dXmid);
          eYmid.Text := FloatToStr(dYmid);
          eZmid.Text := FloatToStr(dZmid);
          SliceCalc   := 2;
          Timer_M_1.Enabled := True;
        end;
      end;
      Shape_M_1.Visible := False;
    end;
end;

procedure TGUI.Image2_M_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    GetCursorPos(MStartPos);
end;

procedure TGUI.Image2_M_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var Mpos: TPoint;
    newWidth, newHeight: Integer;
begin
    if ssLeft in Shift then
    begin
      newWidth  := Width;
      newHeight := Height;
      GetCursorPos(Mpos);
      if Width + Mpos.x - MStartPos.X >= Constraints.MinWidth then
      begin
        newWidth    := Width + Mpos.x - MStartPos.X;
        MStartPos.X := Mpos.X;
      end;
      if Height + Mpos.y - MStartPos.y >= Constraints.MinHeight then
      begin
        newHeight   := Height + Mpos.Y - MStartPos.Y;
        MStartPos.Y := Mpos.Y;
      end;
      if (Width <> newWidth) or (Height <> newHeight) then
        SetBounds(Left, Top, newWidth, newHeight);
    end;
end;

procedure TGUI.Shape_M_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    Shape_M_1.Visible := False;
end;

procedure TGUI.Shape_M_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var p: TPoint;
begin
    if ssRight in Shift then
    begin
      p := Point(X, Y);
      p := Shape_M_2.ClientToScreen(p);
      PopupMenu_M_4.Popup(p.X, p.Y);
    end
    else
      Image_M_1MouseDown(Sender, Button, Shift, X + Shape_M_2.Left - Image_M_1.Left, Y + Shape_M_2.Top - Image_M_1.Top);
end;

procedure TGUI.Shape_M_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    Image_M_1MouseMove(Sender, Shift, X + Shape_M_2.Left - Image_M_1.Left, Y + Shape_M_2.Top - Image_M_1.Top);
end;

procedure TGUI.ShapeBox_M_1Click(Sender: TObject);
begin
    Shape_M_2.Shape := stRectangle;
end;

procedure TGUI.ShapeDisc_M_1Click(Sender: TObject);
begin
    Shape_M_2.Shape :=stCircle;
end;

{$ENDREGION '========================================================================== > | MOUSE ON WINDOW'}

{$REGION '============================================================================= > | WINDOW'}
procedure TGUI.OutMessage(s: String);
begin
  if not bHideMessages then begin
    if bOutMessageLoud then ShowMessage(s) else
    begin
      while Memo_M_1.Lines.Count > 15 do Memo_M_1.Lines.Delete(0);
      Memo_M_1.Lines.Add(s);
    end;
  end;
end;

procedure TGUI.WmThreadReady(var Msg: TMessage);
var sr, er: Integer;
begin
    if Msg.LParam = 222 then  //PaintRows thread finished
    begin
      sr := Msg.WParam and $FFFF;
      er := Msg.WParam shr 16;
      UpdateScaledImage(sr div ImageScale, er div ImageScale);   //tiling?
      if (DrawRect.Top = sr) and (DrawRect.Bottom = er) then
        DrawRect := Rect(MHeader.Width, MHeader.Height, 0, 0);
    end
    else if Msg.LParam = 3 then
    begin
      Dec(iActivePaintThreads);
      if iActivePaintThreads = 0 then Timer_M_8.Interval := 5;
    end
    else if Msg.LParam = 0 then
    begin
      Dec(iActiveThreads);
      if iActiveThreads = 0 then Timer_M_4.Interval := 5;
    end
    else if Msg.LParam = 66 then OutMessage('Not enough memory, DoF aborted.')
    else if Msg.LParam = 67 then ProgressBar1.Position := Msg.WParam;
end;

procedure TGUI.WMDROPFILES(var Msg: TMessage);
var size, i: Integer;
    Dateiname: PChar;
    s, st: String;
    tf: TextFile;
    stream: TFileStream;
    sa: AnsiString;
    success: LongBool;
begin
    inherited;
    try
      Dateiname := '';
      DragQueryFile(Msg.WParam, $FFFFFFFF, Dateiname, 255);
      size      := DragQueryFile(Msg.WParam, 0, nil, 0) + 1;
      Dateiname := StrAlloc(size);
      DragQueryFile(Msg.WParam, 0, Dateiname, size);
      s := UpperCase(ExtractFileExt(StrPas(Dateiname)));
      if s = '.M3I' then
      begin
        LoadFullM3I(MHeader, StrPas(Dateiname));
        AllPresetsUp;
       // TriggerRepaint;
      end
      else if s = '.M3P' then
      begin
        LoadParameter(MHeader, StrPas(Dateiname), True);
        AllPresetsUp;
        OutMessage('Parameters loaded, press "Calculate 3D" to render.');
        ClearScreen;
      end
      else if s = '.M3A' then
      begin
//        AniStartLoad := True;
//        if AnimationForm.LoadAni(StrPas(Dateiname)) then
//          AnimationForm.Visible := True;
      end
      else if s = '.BIG' then
      begin
//        if TilingForm.LoadBig(StrPas(Dateiname)) then
//          TilingForm.Visible := True;
      end
      else if s = '.PNG' then
      begin
        success := False;
        try
          stream := TFileStream.Create(StrPas(Dateiname), fmOpenRead);
        //  i := stream.Size - 1500;
          if stream.Size > 2500 then
          begin
            SetLength(sa, 2502);
          //  sa := StringOfChar(' ', 1502);
            stream.Seek(-2500, soEnd);
            stream.Read(sa[1], 2500);
            i := Pos('tEXtComment', sa);
            if i > 0 then
            begin
              Inc(i, 12);
              if Copy(sa, i, 12) = 'Mandelbulb3D' then
              begin
                sa := Copy(sa, i, 2500);
                if GetHeaderFromText(sa, MHeader, st) then
                begin
                  TextParsLoadSuccess;
                  success := True;
                  Caption := st;
                end;
              end;
            end;
          end;
        finally
          stream.Free;
          if not success then OutMessage('No text params found.');
        end;
      end
      else if s = '.TXT' then
      begin
        AssignFile(tf, StrPas(Dateiname));
        try
          Reset(tf);
          Readln(tf, s);
          i := 40;
          while (i > 0) and not EOF(tf) do
          begin
            Readln(tf, st);
            s := s + st;
            Dec(i);
          end;
          if GetHeaderFromText(s, MHeader, st) then
          begin
            TextParsLoadSuccess;
            Caption := st;
          end
          else OutMessage('No text params found.');
        finally
          CloseFile(tf);
        end;
      end;
    finally
      StrDispose(Dateiname);
      DragFinish(Msg.WParam);
    end;
end;

procedure TGUI.WndProc(var Message: TMessage);
//var xLDif, yDif: Integer;
begin
    if Message.Msg = WM_Move then  //if Message.MSg = WM_EndSession or...  Query..
    begin
//      if AFormCreated then
//      begin
//        if bAniFormStick = 1 then
//         AnimationForm.SetBounds(Left, Top + Height, AnimationForm.Width,
//                                    AnimationForm.Height)
//        else if AnimationForm.Visible then
//        begin
//          yDif  := Abs(AnimationForm.Top - Top - Height);
//          if yDif < 17 then
//          begin
//            xLDif := Abs(AnimationForm.Left - Left);
//            if xLDif < 17 then bAniFormStick := 1;
//          end;
//        end;
//      end;

//      if PPFormCreated then
//      begin
//        if FormsSticky[2] = 1 then
//          PostProForm.SetBounds(Left + Width, Top, PostProForm.Width, PostProForm.Height)
//        else if FormsSticky[2] = 2 then
//          PostProForm.SetBounds(Left - PostProForm.Width, Top,
//                                   PostProForm.Width, PostProForm.Height);
//      end;

      {if LAFormCreated then
      begin
        if FormsSticky[1] = 1 then
          GUILight.SetBounds(Left + Width, Top, GUILight.Width,
                                    GUILight.Height)
        else if FormsSticky[1] = 2 then
          GUILight.SetBounds(Left - GUILight.Width, Top,
                                   GUILight.Width, GUILight.Height);
      end;}
      {if FGUIFormCreated then
      begin
        if FormsSticky[0] = 1 then
          GUIFormula.SetBounds(Left + Width, Top, GUIFormula.Width,
                                   GUIFormula.Height)
        else if FormsSticky[0] = 2 then
          GUIFormula.SetBounds(Left - GUIFormula.Width, Top,
                                   GUIFormula.Width, GUIFormula.Height);
      end;}
    end;
    inherited WndProc(Message);
end;

procedure TGUI.SendMove;
var M: TMessage;
begin
    M.Msg := WM_Move;
    M.WParam := 0;
    M.LParam := 0;
    WndProc(M);
end;
{$ENDREGION '========================================================================== > | WINDOW'}

{$REGION '============================================================================= > | FORMULA'}

{FORMULA}
//random / reset
procedure TGUI.SelectFormula(FName: String);
var i, TI: Integer; cFormula: TFormulaClass;
    s: String;
    success: LongBool;
begin
  TI := tc_frm.TabIndex;
  with HAddon.Formulas[TI] do
  begin
    s := Trim(FName);
    success := False;
    if s <> '' then
    begin
        if isInternFormula(s, i) then
        begin
          cFormula.GetHAddOnFromInternFormula(@MHeader, i, TI);   //Fo. sel
          success := True;
        end
        else
        begin
          PutStringInCustomF(CustomFname, s);         //could be in use by calc thread!
          if LoadCustomFormulaFromHeader(CustomFname, PTCustomFormula(MHeader.PHCustomF[TI])^, dOptionValue) then
          begin
            if TabControl_F_2.TabIndex <> 1 then //interpol
              if iItCount < 1 then iItCount := 1;
            CopyTypeAndOptionFromCFtoHAddon(MHeader.PHCustomF[TI], @HAddon, TI);
            success := True;
            iFnr := 20;    //for backward compatibilty reason
          end;
        end;

    end;
    if not success then  //deselect formula
    begin
      ClearFormula(TI);
      tc_frmChange(Self);
      Check4DandInfo;
    end
    else
    begin
      if TabControl_F_2.TabIndex <> 1 then
      if iItCount < 1 then iItCount := 1;
      tc_frmChange(Self);
      CalcRstop;
      Check4DandInfo;
    end;
  end;
end;

procedure TGUI.ClearFormula(nr: Integer);
begin
    with HAddon.Formulas[nr] do
    begin
      iFnr := -1;
      CustomFname[0] := 0;
      iItCount := 0;
      iOptionCount := 0;
    end;
end;

procedure TGUI.sp_resetClick(Sender: TObject);   //Reset formulas
begin       //     SpeedButton_F_3
    ResetFormulas(@HAddon);
  //  MHeader.byRepeatFrom := 0;
    MHeader.MinimumIterations := 1;  //not displayed...
    MHeader.Iterations := 60;
    MHeader.RStop := 16;
    tc_frm.TabIndex := 0;
    JCB_frm_471Click(JCB_frm_471);
    SelectFormula('Integer Power');
    TabControl_F_2.TabIndex := 0;
    HAddon.Formulas[0].iItCount := 1;
    HAddon.bOptions1 := 0;
    HAddon.bHybOpt1 := 0;     //end1, repeat1            2x 4bit
    HAddon.bHybOpt2 := $151;  //start2, end2, repeat2    3x 4bit
    tc_frm.OnChange(Self);
    UpdateFromHeader(@MHeader);
end;
//load a new formula file if already exists then load from dict and exit
procedure TGUI.sb_frm_loadClick(Sender: TObject);
var TI: Integer;
begin      //     SpeedButton_F_11
    TI := tc_frm.TabIndex;
    with HAddon.Formulas[TI] do
    if OD_M3F.Execute then begin
//    if JCB_frm_JIT then
      if LoadCustomFormula(OD_M3F.FileName, PTCustomFormula(MHeader.PHCustomF[TI])^, CustomFname, dOptionValue, True, 0, nil, False) then

      begin
        if not AnsiSameText(IncludeTrailingPathDelimiter(IniDirs[3]), IncludeTrailingPathDelimiter(ExtractFileDir(OD_M3F.FileName))) then
          CopyFile(PChar(OD_M3F.FileName) , PChar(IncludeTrailingPathDelimiter(IniDirs[3]) + ExtractFileName(OD_M3F.FileName)), True);
        CopyTypeAndOptionFromCFtoHAddon(MHeader.PHCustomF[TI], @HAddon, TI);
        if iItCount < 1 then iItCount := 1;
        LoadFormulaNames;
        cb_frm.ItemIndex := SetFormulaCBs(CustomFtoStr(CustomFname));
//        SetFormulaCBs(CustomFtoStr(GUI.HAddon.Formulas[tc_frm.TabIndex].CustomFname));
        iFnr := 20;
        tc_frmChange(Sender);
        CalcRstop;
      end;
    end;
end;


procedure TGUI.JITFormulaBtnClick(Sender: TObject);
var
  Position: TPoint;
begin
  if GetCursorPos(Position) then
    JITPopupMenu.Popup(Position.X, Position.Y);
end;


procedure TGUI.Rotate4Dvec(var vec: TVec4D);
var x, y, z: Double;
    v3b: TVec3D;
    Smatrix4: TSMatrix4;
begin
    if Panel_F_2.Enabled then //{FORMULA}
    begin
      x := StrToFloatK(XWEdit.Text) * Pid180;{FORMULA}
      y := StrToFloatK(YWEdit.Text) * Pid180;{FORMULA}
      z := StrToFloatK(ZWEdit.Text) * Pid180;{FORMULA}
      v3b := TPVec3D(@vec)^;
      BuildSMatrix4(x, y, z, Smatrix4);
      Rotate4Dex(@v3b, @vec, @Smatrix4);
    end;
end;
procedure TGUI.Check4DandInfo;         //check for 4d rotation visible
var p: TPoint;
begin
    Panel_F_2.Visible := Is4Dtype(@MHeader);
    AdjustTC1height;
    sb_frm_info.Enabled := DescrOfFName(cb_frm.Items[cb_frm.ItemIndex]) > ''; //  ComboEdit_F_1.Text
    RichEdit_F_1.Visible := False;
    btn_frm_info_close.Visible := False;
    //p := FNormalPos(HAddon.Formulas[tc_frm.TabIndex]);
    //Button_F_4.Visible := p.X >= 0;
    //if Button_F_4.Visible then Button_F_4.Top := p.Y;
end;
procedure TGUI.AdjustTC1height;
var i: Integer;    //de its /4d /decomb
begin
    if Panel_F_3.Visible then i := Panel_F_3.Height else i := 0;
    if Panel_F_2.Visible then i := i + Panel_F_2.Height;
    //GUIFormula.ClientHeight := tc_frm.Height + TabControl_F_2.Height + Panel_F_1.Height + i;
end;

procedure TGUI.UpDown_F_1Click(Sender: TObject; Button: TUDBtnType);
var i: Integer;
begin
    if bUserChangeF then
    begin
      i := Max(2, Min(6, UpDown_F_1.Position));
      if (Button = btNext) and (i < 6) then Inc(i) else
      if (Button = btPrev) and (i > 2) then Dec(i);
      Label_F_28.Caption := IntToStr(i);
      Haddon.bHybOpt2 := (Haddon.bHybOpt2 and $70) or (i - 1);
      CheckHybridOptions(@Haddon);       // bHybOpt2:    Word;   //start2, end2, repeat2    3x 4bit
    end;
end;

procedure TGUI.CalcRstop;
var i, j, n: Integer;
    d: Double;
begin
    d := 2;
    if TabControl_F_2.TabIndex <> 1 then n := 5 else n := 1;
    for i := 0 to n do with HAddon.Formulas[i] do
    begin
      if n = 5 then j := HAddon.Formulas[i].iItCount
               else j := Ord(HAddon.Formulas[i].iFnr > -1);
      if j > 0 then begin
        if iFnr in [4, 5, 6] then d := 1024 else
        if iFnr = 7  then d := Max(d, testhybridRstop) else
        if iFnr > 19 then d := Max(d, PTCustomFormula(MHeader.PHCustomF[i]).dRstop)
        else d := Max(d, 16);
        if i = 0 then tc_frm.Tabs[0] := 'Formula1 •'
                 else tc_frm.Tabs[i] := 'Fo.' + IntToStr(i + 1) + ' •';
      end
      else if i = 0 then tc_frm.Tabs[0] := 'Formula1'
                    else tc_frm.Tabs[i] := 'Fo.' + IntToStr(i + 1);
    end;
    RBailoutEdit.Text := FloatToStr(d);
end;

procedure TGUI.EditItCountChange(Sender: TObject);
begin
    if bUserChangeF then
    begin
      if TabControl_F_2.TabIndex <> 1 then
        TryStrToInt(Trim(EditItCount.Text), HAddon.Formulas[tc_frm.TabIndex].iItCount)
      else
        TryStrToFloat(Trim(EditItCount.Text), PSingle(@HAddon.Formulas[tc_frm.TabIndex].iItCount)^);
      CalcRstop;
    end;
end;

procedure TGUI.CheckBox_F_1Click(Sender: TObject);
var i: Integer;
begin
    if bUserChangeF then
    begin
      if CheckBox_F_1.Checked then i := tc_frm.TabIndex else i := 0;
      if (TabControl_F_2.TabIndex = 2) and (tc_frm.TabIndex + 1 >= UpDown_F_1.Position) then
      begin
        if i = 0 then i := UpDown_F_1.Position - 1;
        HAddon.bHybOpt2 := (HAddon.bHybOpt2 and $77) or (i shl 8);
      end
      else HAddon.bHybOpt1 := (HAddon.bHybOpt1 and $7) or (i shl 4);  //end1, repeat1            2x 4bit
    end;
end;

procedure TGUI.TabControl_F_2Change(Sender: TObject);
var i: Integer;
begin
    if not bUserChangeF then //  bOptions1:   Byte;   //type of hybrid: 0:alt  1:interpolhybrid  2:DEcombinated  3: (K/L?)IFS
      TabControl_F_2.TabIndex := HAddon.bOptions1 and 3
    else
    begin
      HAddon.bOptions1 := TabControl_F_2.TabIndex;
      CheckHybridOptions(@HAddon);
  //    if TabControl_F_2.TabIndex = 2 then
    //    HAddon.bHybOpt2 := (HAddon.bHybOpt2 and $707) or $50;//bHybOpt2: start2, end2, repeat2    3x 4bit
    end;
    if TabControl_F_2.TabIndex = 2 then Label_F_20.Caption := 'Maxits hybrid part1:'
                                   else Label_F_20.Caption := 'Max. iterations:';

    Label_F_28.Visible := TabControl_F_2.TabIndex = 2;    //show/hide start of 2nd hybrid
    UpDown_F_1.Visible := Label_F_28.Visible;
    UpDown_F_1.Position := Max(1, HAddon.bHybOpt2 and 7) + 1;
    Label_F_28.Caption := IntToStr(UpDown_F_1.Position);
 //   if UpDown_F_1.Visible then CheckHybridOptions(@Haddon);

    if TabControl_F_2.TabIndex <> 1 then  //Alt hybrid, DEcomb
    begin
      if bUserChangeF then
      begin
        if OldTab2index = 1 then for i := 0 to 1 do  //put integer counts in, were single vals
        begin
          if HAddon.Formulas[i].CustomFName[0] = 0 then HAddon.Formulas[i].iItCount := 0 else
          HAddon.Formulas[i].iItCount := Round(MinMaxCS(0, PSingle(@HAddon.Formulas[i].iItCount)^, 100));
        end;
      end
      else DECombineCmb.ItemIndex := HAddon.bOptions3 and 7;
    end
    else  // Interpol hybrid
    begin
      if bUserChangeF then
      if OldTab2index <> 1 then for i := 0 to 1 do
        PSingle(@HAddon.Formulas[i].iItCount)^ := Max(1, HAddon.Formulas[i].iItCount);
    end;
    OldTab2index := TabControl_F_2.TabIndex;
    SetTabNames;
    tc_frmChange(Sender);
    Label_F_19.Visible := TabControl_F_2.TabIndex = 2;
    MaxIterHybridPart2Edit.Visible := Label_F_19.Visible;
    AdjustTC1height;
end;
procedure TGUI.TabControl_F_2Changing(Sender: TObject; var AllowChange: Boolean);
begin
    OldTab2index := TabControl_F_2.TabIndex;
end;

procedure TGUI.ExchangeFormulaLeftBtnClick(Sender: TObject); //exchange with prev F
var t, i: Integer;
    HAF: THAformula;
    dOptionValues: array[0..15] of Double;
begin
  t := tc_frm.TabIndex;
  if t > 0  then begin
    HAF := HAddon.Formulas[t];
    HAddon.Formulas[t] := HAddon.Formulas[t - 1];
    HAddon.Formulas[t - 1] := HAF;
    for i := t downto t - 1 do begin
      if HAddon.Formulas[i].iFnr < 20 then
        ParseCFfromOld(HAddon.Formulas[i].iFnr, MHeader.PHCustomF[i], dOptionValues)
      else
        LoadCustomFormulaFromHeader(HAddon.Formulas[i].CustomFname,
           PTCustomFormula(MHeader.PHCustomF[i])^, dOptionValues);
     end;
     tc_frm.TabIndex := tc_frm.TabIndex - 1;
     tc_frmChange(Sender);
  end;
end;
procedure TGUI.ExchangeFormulaRightBtnClick(Sender: TObject);   //exchange with next F
var t, i: Integer;
    HAF: THAformula;
    dOptionValues: array[0..15] of Double;
begin
  t := tc_frm.TabIndex;
  if t < 5  then begin
    HAF := HAddon.Formulas[t];
    HAddon.Formulas[t] := HAddon.Formulas[t + 1];
    HAddon.Formulas[t + 1] := HAF;
    for i := t to t + 1 do begin
      if HAddon.Formulas[i].iFnr < 20 then
        ParseCFfromOld(HAddon.Formulas[i].iFnr, MHeader.PHCustomF[i], dOptionValues)
      else
        LoadCustomFormulaFromHeader(HAddon.Formulas[i].CustomFname,
           PTCustomFormula(MHeader.PHCustomF[i])^, dOptionValues);
     end;
     tc_frm.TabIndex := tc_frm.TabIndex + 1;
     tc_frmChange(Sender);
  end;
end;
procedure TGUI.Copythevaluesto1Click(Sender: TObject);
var SourceNr, DestNr, i: Integer;
begin
    SourceNr := tc_frm.TabIndex;
    if SourceNr = 0 then DestNr := 2 else DestNr := 1;
    DestNr := StrToIntTrim(InputBox('Copy the values', 'to formula nr:', IntToStr(DestNr))) - 1;
    if DestNr <> SourceNr then
    begin
      for i := 0 to HAddon.Formulas[SourceNr].iOptionCount - 1 do
        HAddon.Formulas[DestNr].dOptionValue[i] := HAddon.Formulas[SourceNr].dOptionValue[i];
      tc_frmChange(Sender);
    end;
end;
procedure TGUI.Copythisformulatoformulanr11Click( Sender: TObject);
var SourceNr, DestNr, i, j: Integer;
    dOptionValues: array[0..15] of Double;
begin  //copy formula to...
    DestNr := Min(5, Max(0, (Sender as TMenuItem).Tag));
    SourceNr := tc_frm.TabIndex;
    if DestNr <> SourceNr then
    begin
      HAddon.Formulas[DestNr] := HAddon.Formulas[SourceNr];
      for i := 0 to 1 do
      begin
        if i = 0 then j := SourceNr else j := DestNr;
        if HAddon.Formulas[j].iFnr < 20 then
          ParseCFfromOld(HAddon.Formulas[j].iFnr, MHeader.PHCustomF[j], dOptionValues)
        else
          LoadCustomFormulaFromHeader(HAddon.Formulas[j].CustomFname,
              PTCustomFormula(MHeader.PHCustomF[j])^, dOptionValues);
      end;
      tc_frmChange(Sender);
    end;
end;
procedure TGUI.Shiftallformulasonetotheright1Click( Sender: TObject);
var StartNr, i: Integer;
    dOptionValues: array[0..15] of Double;
begin    // shift all f's from tabnr one to right
    StartNr := tc_frm.TabIndex;
    for i := 5 downto StartNr + 1 do
    begin
      HAddon.Formulas[i] := HAddon.Formulas[i - 1];
      if HAddon.Formulas[i].iFnr < 20 then
        ParseCFfromOld(HAddon.Formulas[i].iFnr, MHeader.PHCustomF[i], dOptionValues)
      else
        LoadCustomFormulaFromHeader(HAddon.Formulas[i].CustomFname,
            PTCustomFormula(MHeader.PHCustomF[i])^, dOptionValues);
    end;
    ClearFormula(StartNr);
    i := HAddon.bHybOpt1 shr 4;
    if i >= StartNr then HAddon.bHybOpt1 := (HAddon.bHybOpt1 and 7) or ((i + 1) shl 4);  //end1, repeat1
    i := HAddon.bHybOpt2 shr 8;
    if i >= StartNr then HAddon.bHybOpt2 := (HAddon.bHybOpt2 and $77) or ((i + 1) shl 8);  //start2, end2, repeat2
    CheckHybridOptions(@HAddon);
    tc_frmChange(Sender);
end;
procedure TGUI.Shifttotheleft1Click(Sender: TObject);
var StartNr, i: Integer;
    dOptionValues: array[0..15] of Double;
begin    // shift all f's from tabnr one to left
    StartNr := Max(0, tc_frm.TabIndex - 1);
    for i := StartNr to 4 do
    begin
      HAddon.Formulas[i] := HAddon.Formulas[i + 1];
      if HAddon.Formulas[i].iFnr < 20 then
        ParseCFfromOld(HAddon.Formulas[i].iFnr, MHeader.PHCustomF[i], dOptionValues)
      else
        LoadCustomFormulaFromHeader(HAddon.Formulas[i].CustomFname,
            PTCustomFormula(MHeader.PHCustomF[i])^, dOptionValues);
    end;
    ClearFormula(5);
    i := HAddon.bHybOpt1 shr 4;
    if i >= Max(1, StartNr) then HAddon.bHybOpt1 := (HAddon.bHybOpt1 and 7) or ((i - 1) shl 4);  //end1, repeat1
    i := HAddon.bHybOpt2 shr 8;
    if i >= Max(1, StartNr) then HAddon.bHybOpt2 := (HAddon.bHybOpt2 and $77) or ((i - 1) shl 8);  //start2, end2, repeat2
    CheckHybridOptions(@HAddon);
    tc_frmChange(Sender);
end;

procedure TGUI.RadioGroup_F_1Click(Sender: TObject);
begin
    if bUserChangeF then HAddon.bOptions3 := DECombineCmb.ItemIndex;
    Label_F_18.Visible := DECombineCmb.ItemIndex > 2;
    Edit_F_23.Visible := Label_F_18.Visible;
    Edit_F_25.Visible := DECombineCmb.ItemIndex > 4;
    Label_F_27.Visible := Edit_F_25.Visible;
    if Edit_F_23.Visible then if not Edit_F_25.Visible then
    begin
      Label_F_18.Caption := 'Ds:';
      Edit_F_23.Text := FloatToStrSingle(Min0MaxCS(MHeader.sDEcombS, 100));
      Edit_F_23.Hint := 'Absolute distance of the smooth combine functions,' + #13#10 +
                     'you can use scientific notation like 3e-5 for small values.' + #13#10 +
                     'Try 1/zoom to get close to a working value.';
    end else begin
      Label_F_18.Caption := 'Co:';
      Edit_F_23.Hint := 'Color Option:' + #13#10 +
                     '0:  Average of both formulas.' + #13#10 +
                     '1:  Color of first formula.' + #13#10 +
                     '2:  Color of second formula.';
      Edit_F_23.Text := IntToStr(MHeader.DEmixColorOption); //0..2
    end;
end;

//ListBoxEx_F_15

procedure TGUI.Hidethisformula1Click(Sender: TObject);
begin //set formula status
    StoreFavouriteStatus(HighlightedFormula, (Sender as TMenuItem).Tag);
    LoadFormulaNames;
    //if ListBoxEx_F_15.Visible then sp_frm_hideClick(Sender);
end;


{$ENDREGION '========================================================================== > | FORMULA'}

{$REGION '============================================================================= > | LIGHT'}

procedure TGUI.ProofPosLight;{LIGHT}
begin
    //with GUILight do
   // begin
      if (PageControl_M_1.ActivePageIndex = 1) then
      begin
        bUserChangeM := False;
        SetPosLightTo0(TabControl_L_1.TabIndex);
        PageControl_M_1Change(Self);
        bUserChangeM := True;
      end;
   // end;
end;

//------------------------------------------------------------------------------
{LIGHT} //----------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure TGUI.Insertvolumetriclightcolor1Click(Sender: TObject);
var i: Integer;
begin   //insert vol light color in dynfogs
    i := Max(0, Min(5, StrToIntTrim(Edit_M_16.Text) - 1));
    LAtmpLight.DynFogCol2 := LAtmpLight.Lights[i].Lcolor;
    LAtmpLight.DynFogR := LAtmpLight.DynFogCol2[0];
    LAtmpLight.DynFogG := LAtmpLight.DynFogCol2[1];
    LAtmpLight.DynFogB := LAtmpLight.DynFogCol2[2];
    SetSButtonColor(4, LAtmpLight.DynFogCol2);
    SetSButtonColor(30, LAtmpLight.DynFogCol2);
    TriggerRepaint;
end;

procedure TGUI.SetSDButtonColors;
var x, xFromI, xToI, actNI: Integer;
    w1, sm: Single;
    bNoColIpol: LongBool;
begin
    actNI  := 1;
    xFromI := 0;
    sm     := 34 * s1d32767;
    with LAtmpLight do
    begin
      bNoColIpol := (Lights[3].FreeByte and 1) <> 0;
      PaintSDPreviewColors(@LAtmpLight, SpeedButton_L_2.Glyph.Canvas, SpeedButton_L_1.Glyph.Canvas, 34);
      xToI := Round(ICols[1].Position * sm);
      for x := 0 to 33 do
      begin
        if (x > xToI) and (actNI < 4) then
        begin
          Inc(actNI);
          xFromI := xToI;
          if actNI > 3 then xToI := 33 else xToI := Round(ICols[actNI].Position * sm);
          if xToI <= xFromI then xToI := xFromI + 1;
        end;
        w1 := 1 - (x - xFromI) / (xToI - xFromI);
        if bNoColIpol then SpeedButton_L_33.Glyph.Canvas.Pen.Color := ICols[actNI - 1].Color and $FFFFFF else
        SpeedButton_L_33.Glyph.Canvas.Pen.Color :=    //cuts
          InterpolateColor(ICols[actNI - 1].Color, ICols[actNI and 3].Color, w1, 1 - w1);
        SpeedButton_L_33.Glyph.Canvas.MoveTo(x + 2, 4);
        SpeedButton_L_33.Glyph.Canvas.LineTo(x + 2, 12);
        if bNoColIpol then SpeedButton_L_33.Glyph.Canvas.Pen.Color :=
          TransparencyToColor(ICols[actNI - 1].Color) else
        SpeedButton_L_33.Glyph.Canvas.Pen.Color :=    //Transp+spec
          InterpolateColor(TransparencyToColor(ICols[actNI - 1].Color),
                           TransparencyToColor(ICols[actNI and 3].Color), w1, 1 - w1);
        SpeedButton_L_33.Glyph.Canvas.MoveTo(x + 2, 1);
        SpeedButton_L_33.Glyph.Canvas.LineTo(x + 2, 4);
     end;
   end;
end;

procedure TGUI.SetSButtonColor(ButtonNr: Integer; Color: TRGB);
var SB: TSpeedButton;
begin
    SB := FindComponent('SpeedButton_L_' + IntToStr(ButtonNr)) as TSpeedButton;
    if SB <> nil then
    begin
      SB.Glyph.Canvas.Pen.Color   := clBlack;
      SB.Glyph.Canvas.Brush.Color := RGBtoCardinal(Color);
      SB.Glyph.Canvas.Rectangle(1, 0, 14, 13);
    end;
end;

procedure TGUI.SpeedButton_L_1Click(Sender: TObject);
var T: Integer;
    tmpRGB: TRGB;
begin
    T := (Sender as TSpeedButton).Tag;
    if T in [3,4,6,10,11,12,30] then
    begin
      Case T of
         3: tmpRGB := LAtmpLight.AmbCol;
         4: tmpRGB := MakeDynFogCol;
         6: tmpRGB := LAtmpLight.AmbCol2;
        10: tmpRGB := LAtmpLight.DepthCol;
        11: tmpRGB := LAtmpLight.DepthCol2;
        12: tmpRGB := LAtmpLight.Lights[TabControl_L_1.TabIndex].Lcolor;
        30: tmpRGB := LAtmpLight.DynFogCol2;
      end;
      ColorDialog_L_1.Color := RGBtoCardinal(tmpRGB);
      if ColorDialog_L_1.Execute then
      begin
        tmpRGB := CardinalToRGB(ColorToRGB(ColorDialog_L_1.Color));
        SetSButtonColor(T, tmpRGB);
        Case T of
           3: LAtmpLight.AmbCol := tmpRGB;
           4: begin
                LAtmpLight.DynFogR := tmpRGB[0];
                LAtmpLight.DynFogG := tmpRGB[1];
                LAtmpLight.DynFogB := tmpRGB[2];
              end;
           6: LAtmpLight.AmbCol2   := tmpRGB;
          10: LAtmpLight.DepthCol  := tmpRGB;
          11: LAtmpLight.DepthCol2 := tmpRGB;
          12: LAtmpLight.Lights[TabControl_L_1.TabIndex].Lcolor := tmpRGB;
          30: LAtmpLight.DynFogCol2 := tmpRGB;
        end;
        TriggerRepaint;
      end;
    end;
end;

procedure TGUI.MakeGlyph(SB: TSpeedButton; PNr: Integer);
var BMP: TBitmap;
begin
    BMP := MakeColPresetGlyph(PNr);
    SB.Glyph.Assign(BMP);
    BMP.Free;
end;

procedure TGUI.N01Click(Sender: TObject);
var t: Integer;
    P: TLpreset20;
begin
    t := (Sender as TMenuItem).Tag;
    if t in [1..15] then
    begin
      if t > 5 then P := CustomPresets[t]
               else P := ConvertColPreset164To20(Presets[t]);
      LAtmpLight.DepthCol  := CardinalToRGB(P.DepthCol);
      LAtmpLight.DepthCol2 := CardinalToRGB(P.DepthCol2);
      SetSButtonColor(10, LAtmpLight.DepthCol);
      SetSButtonColor(11, LAtmpLight.DepthCol2);
      TriggerRepaint;
    end;
end;

procedure TGUI.sb_light_loadClick(Sender: TObject);   //Load Light paras
begin      //    Button_L_1
    if OpenDialog_L_1.Execute and GetLightParaFile(OpenDialog_L_1.FileName, MHeader.Light, CheckBox_L_11.Checked) then
    begin
      LoadBackgroundPicT(@MHeader.Light);
      SetLightFromHeader(MHeader);
      TriggerRepaint;
      cb_light_preset.ItemIndex := -1;
      RepaintColorHistory;
    end;
end;

procedure TGUI.sb_light_saveClick(Sender: TObject); //Save Light paras
var f: file; //  Button_L_2
begin
    if SaveDialog_L_1.Execute then
    begin
      PutLightFInHeader(MHeader);
      AssignFile(f, ChangeFileExtSave(SaveDialog_L_1.FileName, '.m3l'));
      Rewrite(f, 1);
      BlockWrite(f, MHeader.Light, SizeOf(MHeader.Light));
      CloseFile(f);
      UpdateQuickLoadCB;
    end;
end;

procedure TGUI.TabControl_L_1Change(Sender: TObject); //Light nr tab
var i, n, n2: Integer;
    btmp: LongBool;
begin
    btmp := bUserChangeL;
    bUserChangeL := False;
    try
      i := TabControl_L_1.TabIndex;
      CheckBox_L_4.Checked := (LAtmpLight.Lights[i].Loption and 1) = 0;
      CheckBox_L_7.Checked := (LAtmpLight.Lights[i].Loption and $40) = 0;
      n := PageControl_L_1.TabIndex;
      n2 := GetPageContr1index(LAtmpLight.Lights[i].Loption);
      if (n <> 1) or (n = n2) then PageControl_L_1.SelectNextPage(n = 0);
      n := PageControl_L_1.TabIndex;
      if n <> n2 then PageControl_L_1.SelectNextPage(n < n2);
      SetSButtonColor(12, LAtmpLight.Lights[i].Lcolor);
      ComboBox_L_2.ItemIndex := LAtmpLight.Lights[i].LFunction and $07;          //spec func
      ComboBox_L_1.ItemIndex := (LAtmpLight.Lights[i].LFunction shr 4) and 3;    //amb func
      ComboBox_L_4.ItemIndex := VisFuncToIndex(LAtmpLight.Lights[i]);    //vis poslight func
      ComboBox_L_5.ItemIndex := ComboBox_L_4.ItemIndex;
    finally
      bUserChangeL := btmp;
    end;
end;

procedure TGUI.SetPresetL(nr: Integer; KeepLights: LongBool);
var P: TLpreset20;
    i: Integer;
    ba: array[0..5] of Byte;
begin
    if nr > 5 then P := CustomPresets[nr]
              else P := ConvertColPreset164To20(Presets[nr]);
    UpdatePresetFrom20(P);
    FastMove(P.AmbCol, LAtmpLight.AmbCol, 15);
    if not KeepLights then
    begin
      for i := 0 to 5 do if (P.Lights[i].Loption and 1) = 0 then  //only lights that are on, else just turn off...
      begin
        // FastMove(P.Lights[i], LAtmpLight.Lights[i], 32)
        FastMove(P.Lights[i], LAtmpLight.Lights[i], 16);  //only up to AdditionalByteEx
        LAtmpLight.Lights[i].LYpos := P.Lights[i].LYpos;
        LAtmpLight.Lights[i].LZpos := P.Lights[i].LZpos;
      end
      else LAtmpLight.Lights[i].Loption := LAtmpLight.Lights[i].Loption or 1;
    end
    else for i := 0 to 5 do ba[i] := LAtmpLight.Lights[i].LFunction and $80;
    FastMove(P.LCols, LAtmpLight.LCols, 124); //object cols out+inside
    LAtmpLight.TBoptions := (LAtmpLight.TBoptions and $FF8FFFFF) or (4 shl 20);
    UpdateLightParasAbove3(LAtmpLight);
    LAtmpLight.Lights[3].FreeByte := P.Lights[3].FreeByte; //NN col ipol
    if KeepLights then for i := 0 to 5 do
      LAtmpLight.Lights[i].LFunction := (LAtmpLight.Lights[i].LFunction and $7F) or ba[i]; //visLight nr4
    SetSButtonColor(3, LAtmpLight.AmbCol);
    SetSButtonColor(4, MakeDynFogCol);
    SetSButtonColor(6, LAtmpLight.AmbCol2);
    SetSButtonColor(10, LAtmpLight.DepthCol);
    SetSButtonColor(11, LAtmpLight.DepthCol2);
    LAtmpLight.DynFogCol2 := MakeDynFogCol;       //DFC2 is not in preset
    SetSButtonColor(30, LAtmpLight.DynFogCol2);
    bUserChangeL := False;
    CheckBox_L_22.Checked := LAtmpLight.Lights[3].FreeByte <> 0;
    SetSDButtonColors;
    TrackBar_L_7.Position := P.TB578pos[0];
    TrackBar_L_5.Position := P.TB578pos[1];
    TrackBar_L_8.Position := P.TB578pos[2];
    if ColorForm.Visible then ColorForm.RepaintImage(@LAtmpLight, False);
    if not KeepLights then
    begin
      TabControl_L_1Change(Self);
      SetLAplusPosToZero;
      for i := 0 to 5 do if (p.Lights[i].Loption and 12) > 0 then SetPosLightTo0(i);
      UpdateTabHeader(-1);
    end;
    cb_light_preset.ItemIndex := -1;
    bUserChangeL := True;
end;

procedure TGUI.GetPresetL(nr: Integer);
begin
    if nr > 5 then
    begin
      FastMove(LAtmpLight.AmbCol, CustomPresets[nr].AmbCol, 16);
      FastMove(LAtmpLight.Lights, CustomPresets[nr].Lights, 316);
      CustomPresets[nr].TB578pos[0] := TrackBar_L_7.Position;
      CustomPresets[nr].TB578pos[1] := TrackBar_L_5.Position;
      CustomPresets[nr].TB578pos[2] := TrackBar_L_8.Position;
    end;
end;

procedure TGUI.sb_light_preset_1Click(Sender: TObject); //preset pushed
var SB: TSpeedButton;    //SpeedButton_L_15
    t, i: Integer;       // load in FormShow
begin
    SB := Sender as TSpeedButton;
    t  := SB.Tag;
    if SB.Cursor = crUpArrow then
    begin
      sb_light_preset.Down := False;
      for i := 6 to 15 do
        (FindComponent('sb_light_preset_' + IntToStr(i)) as TSpeedButton).Cursor := crDefault;
      GetPresetL(t);
      SaveColPreset(t);
      MakeGlyph(SB, t);
    end else begin
      SetPresetL(t, CheckBox_L_11.Checked);
      TriggerRepaint;
    end;
end;

procedure TGUI.sb_light_presetClick(Sender: TObject);                            //SAVE LIGHT SETTINGS
var i: Integer;     //  SpeedButtonMem
begin
    if sb_light_preset_6.Cursor = crUpArrow then
    begin
      for i := 6 to 15 do
        (FindComponent('sb_light_preset_' + IntToStr(i)) as TSpeedButton).Cursor := crDefault;
      sb_light_preset.Down := False;
    end else begin
      for i := 6 to 15 do
        (FindComponent('sb_light_preset_' + IntToStr(i)) as TSpeedButton).Cursor := crUpArrow;
    end;
end;

procedure TGUI.sb_light_panel_upClick(Sender: TObject);
var b: Boolean; // SpeedButton_L_31 /32
begin
    sb_light_panel_up.Tag := 1 - sb_light_panel_up.Tag;
    b := sb_light_panel_up.Tag = 0;
    sb_light_preset_6.Visible := b;  //  SpeedButton_L_20
    sb_light_preset_7.Visible := b;
    sb_light_preset_8.Visible := b;
    sb_light_preset_9.Visible := b;
    sb_light_preset_10.Visible := b;
    sb_light_preset_11.Visible := b;
    sb_light_preset_12.Visible := b;
    sb_light_preset_13.Visible := b;
    sb_light_preset_14.Visible := b;
    sb_light_preset_15.Visible := b;
    sb_light_panel_up.Visible := b;
    sb_light_panel_down.Visible := not b;
    CheckBox_L_11.Visible := b;
    if b then
    begin
      Panel_L_3.Height := 3 * sb_light_preset_1.Height + sb_light_load.Height + 11;
      ClientHeight := ClientHeight + 2 * sb_light_preset_1.Height;
    end
    else
    begin
      Panel_L_3.Height := sb_light_preset_1.Height + sb_light_load.Height + 11;
      ClientHeight := ClientHeight - 2 * sb_light_preset_1.Height;
    end;
    sb_light_load.Top := Panel_L_3.Height - sb_light_load.Height - 5;
    sb_light_save.Top := sb_light_load.Top;
    cb_light_preset.Top := sb_light_load.Top + 4;
end;

procedure TGUI.SpeedButton_L_3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
    begin
      LAtmpLight.AmbCol := LAtmpLight.DepthCol;
      LAtmpLight.AmbCol2 := LAtmpLight.DepthCol2;
      SetSButtonColor(3, LAtmpLight.AmbCol);
      SetSButtonColor(6, LAtmpLight.AmbCol2);
      TriggerRepaint;
    end;
end;

procedure TGUI.sb_light_historyMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin       //     SpeedButton_L_9
    if Button = mbLeft then RestoreUndoLight else
    if Button = mbRight then RedoLight else Exit;
    SetLightFromHeader(MHeader);
    cb_light_preset.ItemIndex := -1;
    TriggerRepaint;
end;

procedure TGUI.cb_light_presetSelect(Sender: TObject);
begin      //   ComboBox_L_3
    if GetLightParaFile(IniDirs[7] + ChangeFileExt(cb_light_preset.Items[cb_light_preset.ItemIndex], '.m3l'),
                        MHeader.Light, CheckBox_L_11.Checked) then
    begin
      LoadBackgroundPicT(@MHeader.Light);
      SetLightFromHeader(MHeader);
      TriggerRepaint;
      cb_light_preset.Font.Color := clWindowText;
      cb_light_preset.SetFocus;
      RepaintColorHistory;
    end;
end;

procedure TGUI.cb_light_presetDropDown(Sender: TObject);
begin      //   ComboBox_L_3
    if cb_light_preset.Font.Color <> clWindowText then
    begin
      cb_light_preset.Font.Color := clWindowText;
      cb_light_preset.ItemIndex := -1;
    end;
end;

//------------------------------------------------------------------------------
//        LIGHT FUNCTIONS
//------------------------------------------------------------------------------
function TGUI.MakeDynFogCol: TRGB;
begin
    Result[0] := LAtmpLight.DynFogR;
    Result[1] := LAtmpLight.DynFogG;
    Result[2] := LAtmpLight.DynFogB;
end;

procedure TGUI.SetLAplusPosToZero;
var x, y: Integer;
begin
    for y := 0 to 5 do for x := 0 to 2 do LAposMids[y, x] := 0;
    OldTB15Pos := 0;
    OldTB16Pos := 0;
    OldTB17Pos := 0;
end;

procedure TGUI.SetPosLightTo0(tab: Integer);
begin
    TPVec3D(@LAposMids[tab])^ := DVecFromLightPos(LAtmpLight.Lights[tab]);
    OldTB15Pos := 0;
    OldTB16Pos := 0;
    OldTB17Pos := 0;
end;

procedure TGUI.SetLightFromHeader(var Header: TMandHeader10);
var i: Integer;
begin
    bUserChangeL := False;
    with Header do
    try
      sb_color_fine.Down := (Light.TBoptions and $10000) > 0;
      TBcolStartPos  := Light.TBpos[9];
      TBcolStopPos   := Light.TBpos[10];
      TrackBar_L_14.Position := Light.VarColZpos;
      TrackBar_L_3.Position  := Light.TBpos[3] and $FFFF;
      TrackBar_L_19.Position := Light.TBpos[3] shr 16;
      TrackBar_L_20.Position := Light.PicOffsetX;
      TrackBar_L_21.Position := Light.PicOffsetY;
      TrackBar_L_22.Position := Light.PicOffsetZ;
      TrackBar_L_23.Position := ShortInt((Light.TBpos[11] shr 8) and $FF) + 53;
      TrackBar_L_24.Position := Light.RoughnessFactor;
      TrackBar_L_11.Position := Light.TBpos[11] and $FF;
      TrackBar_L_32.Position := Light.Lights[3].AdditionalByteEx;
      UpDownDiffMap.Position := GetDiffMapNr(@Light);
      CheckBox_L_15.Checked  := GetDiffMapNr(@Light) <> 0;
      if CheckBox_L_15.Checked then
      begin
        TrackBar_L_30.Position := (Light.TBpos[8] shr 20) and $FF;
        TrackBar_L_29.Position := (Light.TBpos[7] shr 12) and $FF;
        TrackBar_L_28.Position := (Light.TBpos[7] shr 20) and $FF;
        TrackBar_L_31.Position := Light.Lights[2].AdditionalByteEx;
      end else begin
        TrackBar_L_30.Position := 128;
        TrackBar_L_29.Position := 128;
        TrackBar_L_28.Position := 128;
        TrackBar_L_31.Position := 30;
      end;
      for i := 4 to 10 do if not (i in [7, 8]) then
      (FindComponent('TrackBar_L_' + IntToStr(i)) as TTrackBar).Position := Light.TBpos[i];
      TrackBar_L_7.Position := Light.TBpos[7] and $FFF;
      TrackBar_L_8.Position := Light.TBpos[8] and $FFF;
      LAtmpLight := Light;
      SetSButtonColor(3, Light.AmbCol);
      SetSButtonColor(4, MakeDynFogCol);
      SetSButtonColor(6, Light.AmbCol2);
      SetSButtonColor(10, Light.DepthCol);
      SetSButtonColor(11, Light.DepthCol2);
      SetSButtonColor(30, Light.DynFogCol2);
      SetSDButtonColors;
      if (Light.TBoptions and $10000) > 0 then
      begin
        TrackBar_L_9.Position  := Integer(Light.FineColAdj1) - 30;
        TrackBar_L_10.Position := Integer(Light.FineColAdj2) - 30;
      end;
      TrackBar_L_12.Position := (Light.TBoptions and 127);
      TrackBar_L_13.Position := (Light.TBoptions shr 7) and 127;
      CheckBox_L_1.Checked   := (Light.TBoptions and $4000) <> 0;
      CheckBox_L_2.Checked   := (Light.TBoptions and $20000) <> 0;
      CheckBox_L_3.Checked   := (Light.TBoptions and $40000) <> 0;
      CheckBox_L_12.Checked  := (Light.TBoptions and $8000) = 0;
      CheckBox_L_13.Checked  := (Light.TBoptions and $80000) <> 0;     //smooth BGimage on load
      TrackBar_L_18.Position := (Light.TBoptions shr 23) and $3F;
      CheckBox_L_9.Checked   := (Light.TBoptions and $20000000) <> 0;  //BG+Amb light rel to object
      CheckBox_L_5.Checked   := (Light.AdditionalOptions and $80) <> 0;//convert to spherical on load
      CheckBox_L_10.Checked  := (Light.AdditionalOptions and 1) <> 0;  //Internal gamma of 2
      RadioGroup_L_1.ItemIndex := Light.Lights[1].FreeByte and 3;
      CheckBox_L_16.Checked  := (Light.Lights[2].FreeByte and 1) <> 0;
      CheckBox_L_17.Checked  := (Light.AdditionalOptions and 8) <> 0;  //Add BGpic light
      CheckBox_L_18.Checked  := (Light.AdditionalOptions and 4) <> 0;  //DiffMap relative to object. now: y+c comb
      CheckBox_L_19.Checked  := (Light.Lights[0].FreeByte and 1) <> 0; //Blend DynFog
      CheckBox_L_23.Checked  := (Light.Lights[0].FreeByte and 2) <> 0; //only add light
      //change on new lighting:
      CheckBox_L_20.Checked := (Light.AdditionalOptions and 16) <> 0;  //fit left+right edges in load
      CheckBox_L_21.Checked := (Light.AdditionalOptions and 32) <> 0;  //small bg image for ambient
      CheckBox_L_22.Checked := (Light.Lights[3].FreeByte and 1) <> 0;  //No color interpolation
      TrackBar_L_33.Position := Light.Lights[4].AdditionalByteEx;
      CheckBox_L_8.Checked := Light.BGbmp[0] <> 0;                    //BG picture -> try load on para load when Mid > 19!

      if (Light.TBoptions and $40000000) > 0 then SpeedButton_L_5.Down := True else
      if (Light.TBoptions and $80000000) > 0 then SpeedButton_L_8.Down := True else
                                                  SpeedButton_L_7.Down := True;

      TabControl_L_1.TabIndex := 0;
      TabControl_L_1Change(Self);

      SetLAplusPosToZero;
      for i := 0 to 5 do if (Light.Lights[i].Loption and 12) > 0 then SetPosLightTo0(i);

      UpdateTabHeader(-1);
      if ColorFormCreated and ColorForm.Visible then ColorForm.RepaintImage(@Light, False);

      if not AnsiSameText(CustomFtoStr(Light.BGbmp), CustomFtoStr(LastBGname)) then
      begin
        MakeLMPreviewImage(Image_L_5, @M3DBackGroundPic);
        FastMove(LAtmpLight.BGbmp, LastBGname, 24);
      end;

    finally
      bUserChangeL := True;
    end;
end;

procedure TGUI.PutLightFInHeader(var Header: TMandHeader10);
var i: Cardinal;
begin
    with Header do
    begin
      Light := LAtmpLight;
      for i := 3 to 11 do Light.TBpos[i] :=
                (FindComponent('TrackBar_L_' + IntToStr(i)) as TTrackBar).Position;

      Light.TBpos[3] := Light.TBpos[3] or (TrackBar_L_19.Position shl 16);  //fog far offset
      Light.TBpos[11] := Light.TBpos[11] or ((ShortInt(TrackBar_L_23.Position - 53) shl 8) and $FF00);    //ambient 2nd reflection

      if sb_color_fine.Down then
      begin
        Light.FineColAdj1 := Light.TBpos[9] + 30;
        Light.FineColAdj2 := Light.TBpos[10] + 30;
        Light.TBpos[9]  := TBcolStartPos;
        Light.TBpos[10] := TBcolStopPos;
      end
      else
      begin
        Light.FineColAdj1 := 0;
        Light.FineColAdj2 := 0;
      end;
      Light.PicOffsetX := TrackBar_L_20.Position;
      Light.PicOffsetY := TrackBar_L_21.Position;
      Light.PicOffsetZ := TrackBar_L_22.Position;
      Light.VarColZpos := TrackBar_L_14.Position;
      Light.RoughnessFactor := TrackBar_L_24.Position;
      if Panel_L_2.Visible then
      begin
        Light.bColorMap := UpDownDiffMap.Position and $FF;
        Light.Lights[1].AdditionalByteEx := UpDownDiffMap.Position shr 8;
        Light.TBpos[7] := Light.TBpos[7] or (TrackBar_L_29.Position shl 12) or (TrackBar_L_28.Position shl 20);  //diffcolormap x,y offsets
        Light.TBpos[8] := Light.TBpos[8] or (TrackBar_L_30.Position shl 20);
      end
      else
      begin
        Light.bColorMap := 0;
        Light.Lights[1].AdditionalByteEx := 0;
      end;
      Light.AdditionalOptions := (Ord(CheckBox_L_5.Checked) shl 7)
          or (Ord(CheckBox_L_10.Checked) and 1) //or (Min(1, RadioGroup_L_1.ItemIndex) shl 1)
          or ((Ord(CheckBox_L_20.Checked) and 1) shl 4) or ((Ord(CheckBox_L_17.Checked) and 1) shl 3)
          or ((Ord(CheckBox_L_18.Checked) and 1) shl 2) or ((Ord(CheckBox_L_21.Checked) and 1) shl 5);  //diffmap rel to object: now: comb map Y with diff colors!
      Light.Lights[1].FreeByte := RadioGroup_L_1.ItemIndex;
      if SpeedButton_L_5.Down then i := $40000000 else
      if SpeedButton_L_8.Down then i := $80000000 else i := 0;
      i := i or (actLightId shl 20);
      Light.Lights[0].AdditionalByteEx := actLightIdEx;
      Light.Lights[0].FreeByte := (Ord(CheckBox_L_19.Checked) and 1) or ((Ord(CheckBox_L_23.Checked) and 1) shl 1);
      Light.Lights[2].FreeByte := Ord(CheckBox_L_16.Checked) and 1;
      Light.Lights[3].FreeByte := Ord(CheckBox_L_22.Checked) and 1;
      Light.Lights[2].AdditionalByteEx := TrackBar_L_31.Position;
      Light.Lights[3].AdditionalByteEx := TrackBar_L_32.Position;
      Light.Lights[4].AdditionalByteEx := TrackBar_L_33.Position;
      Light.TBoptions := TrackBar_L_12.Position or
                         (TrackBar_L_13.Position shl 7) or
                         (Ord(CheckBox_L_1.Checked) shl 14) or
                         ((1 - Ord(CheckBox_L_12.Checked)) shl 15) or
                         (Ord(sb_color_fine.Down) shl 16) or
                         (Ord(CheckBox_L_2.Checked) shl 17) or
                         (Ord(CheckBox_L_3.Checked) shl 18) or
                         (Ord(CheckBox_L_13.Checked) shl 19) or
                         (Ord(CheckBox_L_9.Checked) shl 29) or
                         (TrackBar_L_18.Position shl 23) or i;
    end;
end;

procedure TGUI.TrackBar_L_33Change(Sender: TObject);
begin
    Label_L_45.Caption := FloatToStrSingle(Power(1.04, TrackBar_L_33.Position - 40));
    if bUserChangeL and TBChanged then TriggerRepaint;
end;

procedure TGUI.MakeDepthColList;
var i: Integer;
    P: TLpreset20;
    bmp: TBitmap;
    MI: TMenuItem;
begin
    ImageList_L_1.Clear;
    PopupMenuLightBMP.Items.Clear;
    bmp := TBitmap.Create;
    bmp.PixelFormat := pf32Bit;
    bmp.Width := 32;
    bmp.Height := 16;
    for i := 1 to 15 do
    begin
      if i > 5 then P := CustomPresets[i]
               else P := ConvertColPreset164To20(Presets[i]);
      bmp.Canvas.Brush.Color := P.DepthCol and $FFFFFF;
      bmp.Canvas.FillRect(Rect(1,1,15,15));
      bmp.Canvas.Brush.Color := P.DepthCol2 and $FFFFFF;
      bmp.Canvas.FillRect(Rect(16,1,31,15));
      ImageList_L_1.Add(bmp, nil);
      MI := TMenuItem.Create(PopupMenuLightBMP);
      MI.Caption := IntToStr(i);
      MI.Tag := i;
      MI.ImageIndex := i - 1;
      MI.OnClick := N01Click;
      PopupMenuLightBMP.Items.Add(MI);
    end;
    bmp.Free;
end;

procedure TGUI.UpdateQuickLoadCB;
var F: TSearchRec;
begin
    cb_light_preset.Items.Clear;
    if FindFirst(IniDirs[7] + '*.m3l', faAnyFile, F) = 0 then
    begin
      repeat
        cb_light_preset.Items.Add(ChangeFileExt(F.Name, ''));
      until FindNext(F) <> 0;
    end;
    FindClose(F);
end;

function TGUI.VisLightExBit(const Light: TLight8): Integer;
begin
    if (Light.Loption and 4) <> 0 then Result := (ComboBox_L_5.ItemIndex and 4) shl 5
    else Result := (ComboBox_L_4.ItemIndex and 4) shl 5;
end;

procedure TGUI.ComboBox_L_1Change(Sender: TObject);
begin
    if bUserChangeL then
    begin
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LFunction :=     // vislight source dependend on choosen light...
        ComboBox_L_2.ItemIndex or (ComboBox_L_1.ItemIndex shl 4) or
        VisLightExBit(LAtmpLight.Lights[TabControl_L_1.TabIndex]);// or ((ComboBox_L_4(5).ItemIndex and 4) shl 5 // = bit 8 of 8
      TriggerRepaint;                                             // or VisLightFuncEx(LightNr)
    end;
end;

function TGUI.GetPageContr1index(Loption: Byte): Integer;
const pc1: array[0..3] of Integer = (0, 2, 1, 0);
begin
    Result := pc1[(Loption shr 1) and 3];  //bit2: lmap bit3: poslight.. 0-0 1-2 2-1
end;

function TGUI.TBChanged: LongBool;
var i: Integer;                     //ang   pos       rot
    TB: TTrackBar;                  //1,2..15,16,17..25,26,27
const TBnr: array[0..24] of Byte = (3,4,5,6,7,8,9,10,11,12,13,14,
                                    18,19,20,21,22,23,24,
                                    28,29,30,31,32,33);
begin
    Result := False;
    for i := 0 to 24 do
    begin
      TB := FindComponent('TrackBar_L_' + IntToStr(TBnr[i])) as TTrackBar;
      if TB = nil then
        TBoldpos[i] := i
      else
      if TB.Position <> TBoldpos[i] then   //rangecheck
      begin
        Result := True;
        TBoldpos[i] := TB.Position;
      end;
    end;
end;

procedure TGUI.tbx_lightChange(Sender: TObject);
begin                //TrackBar2
    if bUserChangeL and TBChanged then TriggerRepaint;
    LastPositionDMScale[RadioGroup_L_1.ItemIndex] := TrackBar_L_31.Position; //diffmap mode
end;

procedure TGUI.TrackBar_L_11KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = '1' then (Sender as TTrackBar).Position := (Sender as TTrackBar).SelStart;
end;

procedure TGUI.tbx_light_angXChange(Sender: TObject);  //global light angles
var d7: Double7B;     //TrackBar1
begin
    if bUserChangeL then
    begin
      d7 := LAtmpLight.Lights[TabControl_L_1.TabIndex].LXpos;
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LXpos := DoubleToD7B(tbx_light_angX.Position * -Pid180);
      if not D7Bequal(d7, LAtmpLight.Lights[TabControl_L_1.TabIndex].LXpos) then TriggerRepaint;
    end;
end;

procedure TGUI.tbx_light_angYChange(Sender: TObject);
var d7: Double7B;     //TrackBarYangle
begin
    if bUserChangeL then
    begin
      d7 := LAtmpLight.Lights[TabControl_L_1.TabIndex].LYpos;
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LYpos := DoubleToD7B(tbx_light_angY.Position * Pid180);
      if not D7Bequal(d7, LAtmpLight.Lights[TabControl_L_1.TabIndex].LYpos) then TriggerRepaint;
    end;
end;

procedure TGUI.SetStartPreset;
var P: TLpreset20;
begin
    P := ConvertColPreset16To20(@StartPreset);
    P.Lights[2] := defaultLight8;  //lights[1] too..
    P.Lights[3] := defaultLight8;
    FastMove(P.AmbCol, LAtmpLight.AmbCol, 16);
    FastMove(P.Lights, LAtmpLight.Lights, 316);
    UpdateLightParasAbove3(LAtmpLight); //new
    PutLightFInHeader(MHeader);
    MHeader.Light.DynFogCol2 := MakeDynFogCol;
    SetLightFromHeader(MHeader);
    TrackBar_L_7.Position := StartPreset.TB578pos[0];
    TrackBar_L_5.Position := StartPreset.TB578pos[1];
    TrackBar_L_8.Position := StartPreset.TB578pos[2];
end;

procedure TGUI.CheckBox_L_1Click(Sender: TObject); //Color cycling
begin
    if bUserChangeL then TriggerRepaint;
end;

procedure TGUI.CheckBox_L_21Click(Sender: TObject); //use a small image as ambient color
begin
    if CheckBox_L_21.Checked then
    begin
      if CheckBox_L_8.Checked then
      begin
        MakeSmallLMimage(@M3DSmallBGpic, @M3DBackGroundPic);
        //test:
     //   MakeLMPreviewImage(Image_L_5, @M3DSmallBGpic);
      end
      else CheckBox_L_21.Checked := False;
    end;
    SpeedButton_L_3.Enabled := not CheckBox_L_21.Checked;
    SpeedButton_L_6.Enabled := not CheckBox_L_21.Checked;
    TrackBar_L_8.Enabled := not CheckBox_L_21.Checked;
    if bUserChangeL then TriggerRepaint;
end;

procedure TGUI.CheckBox_L_22Click(Sender: TObject);
begin
    LAtmpLight.Lights[3].FreeByte := Ord(CheckBox_L_22.Checked) and 1;
    if ColorFormCreated and ColorForm.Visible then ColorForm.RepaintImage(@LAtmpLight, False);
    SetSDButtonColors;
    if bUserChangeL then TriggerRepaint;
end;

procedure TGUI.CheckBox_L_2Click(Sender: TObject);
begin
    RepaintColorHistory;
    if bUserChangeL then TriggerRepaint;
end;

procedure TGUI.SpeedButton_L_2Click(Sender: TObject); //Object Colors change
begin
    ColorForm.Visible := True;
    ColorForm.BringToFront;
    if (Sender is TSpeedButton) and ((Sender as TSpeedButton).Tag = 33) then
      ColorForm.RadioGroup1.ItemIndex := 1 else ColorForm.RadioGroup1.ItemIndex := 0;
end;

procedure TGUI.UpdateTabHeader(nr: Integer);
var i, i1, i2: Integer;
begin
    i1 := nr;
    i2 := nr;
    if nr < 0 then
    begin
      i1 := 0;
      i2 := 5;
    end;
    for i := i1 to i2 do if (LAtmpLight.Lights[i].Loption and 1) = 0 then
      TabControl_L_1.Tabs[i] := 'Li.' + IntToStr(i + 1) + ' •'
    else
      TabControl_L_1.Tabs[i] := 'Li.' + IntToStr(i + 1);
end;

procedure TGUI.CheckBox_L_4Click(Sender: TObject);
begin    //light on/off
    if bUserChangeL then
    begin
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LOption := (LAtmpLight.Lights[TabControl_L_1.TabIndex].LOption and $F8)
        or (1 - (Byte(CheckBox_L_4.Checked) and 1)) or (GetPageContr1index(PageControl_L_1.TabIndex shl 1) shl 1);
      TriggerRepaint;
    end;
    UpdateTabHeader(TabControl_L_1.TabIndex);
end;

procedure TGUI.CheckBox_L_7Click(Sender: TObject);  //HS enabled = bit7, default = on = 0
begin
    if bUserChangeL then
    begin
      if CheckBox_L_7.Checked then LAtmpLight.Lights[TabControl_L_1.TabIndex].Loption :=
        LAtmpLight.Lights[TabControl_L_1.TabIndex].Loption and $BF
      else LAtmpLight.Lights[TabControl_L_1.TabIndex].Loption :=
        LAtmpLight.Lights[TabControl_L_1.TabIndex].Loption or $40;
      if CheckBox_L_4.Checked then TriggerRepaint;
    end;
end;

procedure TGUI.PageControl_L_1Change(Sender: TObject);
var i: Integer;
    b: LongBool;
begin
    i := TabControl_L_1.TabIndex;
    b := bUserChangeL;
    if b then LAtmpLight.Lights[i].Loption := (LAtmpLight.Lights[i].Loption and $F9) or
                                              (GetPageContr1index(PageControl_L_1.TabIndex shl 1) shl 1);
    SpeedButton_L_12.Visible := PageControl_L_1.TabIndex < 2;
    ComboBox_L_1.Enabled := SpeedButton_L_12.Visible;
    ComboBox_L_2.Enabled := SpeedButton_L_12.Visible;

    bUserChangeL := False;
    if PageControl_L_1.TabIndex = 0 then  //global light
    begin
      if b then
      begin
        LAtmpLight.Lights[i].LightMapNr := 0;
        tbx_light_angX.Position := 0;
        tbx_light_angY.Position := 0;
        LAtmpLight.Lights[i].LYpos := CDouble7B0;
        LAtmpLight.Lights[i].LXpos := CDouble7B0;
        LAtmpLight.Lights[i].Lamp := Word(SingleToShortFloat(1));
      end else begin
        tbx_light_angX.Position := Round(D7BtoDouble(LAtmpLight.Lights[i].LXpos) * M180dPi);
        tbx_light_angY.Position := Round(D7BtoDouble(LAtmpLight.Lights[i].LYpos) * -M180dPi);
      end;
      CheckBox_L_6.Checked := (LAtmpLight.Lights[i].Loption and $20) > 0;
    end
    else if PageControl_L_1.TabIndex = 1 then
    begin        //positional light
      if b then LAtmpLight.Lights[i].LightMapNr := 0;
      tbx_light_posX.Position := 0;
      tbx_light_posY.Position := 0;
      tbx_light_posZ.Position := 0;
      OldTB15pos := 0;
      OldTB16pos := 0;
      OldTB17pos := 0;
      if b then //new: set light amount based on zoom
        LAtmpLight.Lights[i].Lamp := Word(SingleToShortFloat(1 / MHeader.dZoom));
      Edit_L_1.Text := ShortFloatToStr(ShortFloat(LAtmpLight.Lights[i].Lamp)); //FloatToStrSingle(ShortFloatToSingle(@LAtmpLight.Lights[i].Lamp));
    end
    else  //LightMap
    begin
      if b then
      begin
        Inc(RepaintCounter);
        tbx_light_rotX.Position := 128;
        tbx_light_rotY.Position := 128;
        tbx_light_rotZ.Position := 128;
        LAtmpLight.Lights[i].LXpos[0] := 128;
        LAtmpLight.Lights[i].LYpos[0] := 128;
        LAtmpLight.Lights[i].LZpos[0] := 128;
        UpDownLight.Position := 1;
        LAtmpLight.Lights[i].LightMapNr := 1;
        LAtmpLight.Lights[i].Lamp := Word(SingleToShortFloat(1));
      end else begin
        tbx_light_rotX.Position := LAtmpLight.Lights[i].LXpos[0];
        tbx_light_rotY.Position := LAtmpLight.Lights[i].LYpos[0];
        tbx_light_rotZ.Position := LAtmpLight.Lights[i].LZpos[0];
        UpDownLight.Position := LAtmpLight.Lights[i].LightMapNr;
        if LAtmpLight.Lights[i].LightMapNr = 0 then
        begin
          LAtmpLight.Lights[i].LightMapNr := 1;
          UpDownLight.Position := 1;
          TriggerRepaint;
        end;
      end;
      CheckBox_L_14.Checked := (LAtmpLight.Lights[i].Loption and $20) > 0;
      LoadLightMapNr(UpDownLight.Position, @LightMaps[i]);
      MakeLMPreviewImage(Image_L_3, @LightMaps[TabControl_L_1.TabIndex]);
    end;
    Edit_L_1.Text := ShortFloatToStr(ShortFloat(LAtmpLight.Lights[i].Lamp));
    bUserChangeL := b;
    if b then TriggerRepaint;
end;

procedure TGUI.tbx_light_posXChange(Sender: TObject);    //posLight
var dm, d: Double;
    dv, lp, lv, cp: TVec3D;
    m: TMatrix3;
    i: Integer;
begin
    if bUserChangeL then
    begin
      i := TabControl_L_1.TabIndex;
      CalcStepWidth(@MHeader);
      m := NormaliseMatrixTo(1, @MHeader.hVGrads);

      cp := CalcCamPos(@MHeader);
      lp := DVecFromLightPos(LAtmpLight.Lights[i]);
      lv := SubtractVectors(lp, cp);  //vec from cam to light

      if MHeader.bStereoMode = 2 then d := 180 else d := MHeader.dFOVy;

   //   dm := Abs(DotOfVectors(@dv, @m[2]));      //distance from viewplane to lightpos

      dm := LengthOfVec(lv);

      dm := (MHeader.dStepWidth + dm * Sin(d * Pid180 / MHeader.Height))
            * LengthOfSize(@MHeader) * 0.0025;

      dv[0] := (tbx_light_posX.Position - OldTB16pos) * dm;   //-180..180 pos
      dv[1] := (tbx_light_posY.Position - OldTB15pos) * -dm;
      dm := (tbx_light_posZ.Position - OldTB17pos) * dm;  //new
      dv[2] := 0; //new
      OldTB16pos := tbx_light_posX.Position;
      OldTB15pos := tbx_light_posY.Position;

      //lv rotated m (like in normals calc rough) for movement?

      TranslatePos(@lp, @dv, @m);
      if tbx_light_posZ.Position <> OldTB17pos then   //new
      begin
        OldTB17pos := tbx_light_posZ.Position;
        dv := NormaliseVectorTo(1, lv);
        mAddVecWeight(@lp, @dv, dm);
      end;
      SetLightPosFromDVec(LAtmpLight.Lights[i], lp);
      LAposMids[i] := TPos3D(DVecFromLightPos(LAtmpLight.Lights[i]));
      TriggerRepaint;
    end;
end;

procedure TGUI.tbx_light_posXMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    bUserChangeL := False;
    try
      (Sender as TTrackBarEx).Position := 0;
      if Sender = tbx_light_posX then OldTB16pos := 0 else
      if Sender = tbx_light_posY then OldTB15pos := 0 else
      if Sender = tbx_light_posZ then OldTB17pos := 0;
    finally
      bUserChangeL := True;
    end;
end;

procedure TGUI.UpDownXposClick(Sender: TObject; Button: TUDBtnType); //poslight move 1 step
var t, i: Integer;
    d: Double;
    dv, lv: TVec3D;
    m: TMatrix3;
begin
    i := TabControl_L_1.TabIndex;
    CalcStepWidth(@MHeader);
    m := NormaliseMatrixTo(1, @MHeader.hVGrads);
    dv := GetRealMidPos(@MHeader);
    mAddVecWeight(@dv, @m[2], MHeader.dZstart - MHeader.dZmid); //Startpos on viewplane
    lv := DVecFromLightPos(LAtmpLight.Lights[i]);
    dv := SubtractVectors(@lv, dv);  //vec from cam to light
    d := Abs(DotOfVectors(@dv, @m[2]));                      //distance from viewplane to lightpos
    d := (MHeader.dStepWidth + d * Sin(MHeader.dFOVy * Pid180 / MHeader.Height)) * s05;
    t := (Sender as TUpDown).Tag;
    if Button <> btNext then d := -d;
    if t = 1 then d := -d;
    mAddVecWeight(@lv, @m[t], d);
    SetLightPosFromDVec(LAtmpLight.Lights[i], lv);
    mAddVecWeight(@LAposMids[i], @m[t], d);
    TriggerRepaint;
end;

procedure TGUI.UpDown_L_4Click(Sender: TObject; Button: TUDBtnType);
begin
    if Button = btPrev then SpinButton1Down else
    if Button = btNext then SpinButton1Up;
end;

procedure TGUI.Edit_L_1Change(Sender: TObject);
var d: Double;
begin
    if bUserChangeL then
    begin
      if StrToFloatKtry(Edit_L_1.Text, d) then
      begin
        LAtmpLight.Lights[TabControl_L_1.TabIndex].Lamp := Word(SingleToShortFloat(d));
        TriggerRepaint;
      end;
    end;
end;

procedure TGUI.Edit_L_2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin   //Rightclick on MapEditField will bring up opendialog for lightmap
    if Button = mbRight then
    begin
      SetDialogDirectory(OpenPictureDialog1, IniDirs[9]);
      OpenPictureDialog1.FileName := (Sender as TEdit).Text;
      if OpenPictureDialog1.Execute and (GetFirstNumberFromFilename(OpenPictureDialog1.FileName) > '') then
        (Sender as TEdit).Text := GetFirstNumberFromFilename(OpenPictureDialog1.FileName);
    end;
end;

procedure TGUI.ButtonGetPosClick(Sender: TObject);
begin
    if ButtonGetPos.Caption = 'image' then
    begin
      ButtonGetPos.Caption := 'mid';
      iGetPosFromImage := 0;
      SetImageCursor;
    end
    else
    begin
//      if PostProForm.CheckBox_P_21.Checked then PostProForm.CheckBox_P_21.Checked := False;
//      if PostProForm.CheckBox_P_25.Checked then PostProForm.CheckBox_P_25.Checked := False;
      ButtonGetPos.Caption := 'image';
      iGetPosFromImage := 2;
      MButtonsUp;
      Image_M_1.Cursor := crCross;
      bUserChangeL := False;
      SetPosLightTo0(TabControl_L_1.TabIndex);
      tbx_light_posX.Position := 0;
      tbx_light_posY.Position := 0;
      tbx_light_posZ.Position := 0;
      bUserChangeL := True;
    end;
end;

procedure TGUI.PageControl_L_1Changing(Sender: TObject; var AllowChange: Boolean);
begin
    if bUserChangeL then SetPosLightTo0(TabControl_L_1.TabIndex);
end;

procedure TGUI.TabControl_L_1Changing(Sender: TObject; var AllowChange: Boolean);
begin
    if (PageControl_L_1.ActivePageIndex = 1) then SetPosLightTo0(TabControl_L_1.TabIndex);
end;

procedure TGUI.FogResetButtonClick(Sender: TObject);
begin
    TrackBar_L_3.Position := 128;
    TrackBar_L_6.Position := 53;
    TrackBar_L_19.Position := 128;
end;

procedure TGUI.CheckBox_L_6Click(Sender: TObject);
var sv: TSVec;
    dtmp, dtmp2: Double;
    Lnr: Integer;
begin
    if bUserChangeL then   //global light / LightMap rel to object
    begin
      Lnr := TabControl_L_1.TabIndex;
      if Sender = CheckBox_L_6 then
      begin  //global light, convert angles so that lightvec stays same
        dtmp := -D7BtoDouble(LAtmpLight.Lights[Lnr].LXpos);  //-pi..pi   -180..180
        dtmp2 := D7BtoDouble(LAtmpLight.Lights[Lnr].LYpos);
        BuildViewVectorFOV(dtmp2, dTmp, @sv);
        SVectorChangeSign(@sv);
        if not CheckBox_L_6.Checked then RotateSVectorReverse(@sv, @MHeader.hVGrads);
        NormaliseSVectorVar(sv);
        if FindVecAngles(dtmp, dtmp2, @sv, @MHeader.hVGrads, CheckBox_L_6.Checked) < 1e-3 then   //Light.pas
        begin  //set sliders
          LAtmpLight.Lights[Lnr].LXpos := DoubleToD7B(-dtmp);
          LAtmpLight.Lights[Lnr].LYpos := DoubleToD7B(dtmp2);
          bUserChangeL := False;
          tbx_light_angX.Position := Round(dtmp * -M180dPi);
          tbx_light_angY.Position := Round(dtmp2 * -M180dPi);
          bUserChangeL := True;
        end;
      end;
      if (Sender as TCheckBox).Checked then
        LAtmpLight.Lights[Lnr].Loption := LAtmpLight.Lights[Lnr].Loption or $20
      else LAtmpLight.Lights[Lnr].Loption := LAtmpLight.Lights[Lnr].Loption and $DF;
      TriggerRepaint;
    end;
end;

procedure TGUI.CheckBox_L_8Click(Sender: TObject);   //background image
var bLoadSuccess: LongBool;
begin
    if bUserChangeL then
    begin
      bLoadSuccess := False;
      if CheckBox_L_8.Checked and OpenDialogPic.Execute then
      begin
        Inc(RepaintCounter);
        PutStringInLightFilename(LAtmpLight.BGbmp, ExtractFileName(OpenDialogPic.FileName));
        bLoadSuccess := LoadBackgroundPicT(@LAtmpLight);
       // if not bLoadSuccess then question: should i copy it to the bg directory?...
      end;
      if not bLoadSuccess then
      begin
        bUserChangeL := False;
        CheckBox_L_8.Checked := False;
        bUserChangeL := True;
        LAtmpLight.BGbmp[0] := 0;
        SetLength(M3DBackGroundPic.LMa, 0);
        M3DBackGroundPic.LMWidth := 0;
        M3DBackGroundPic.LMHeight := 0;
      end;
      TriggerRepaint;
    end;
    if LAtmpLight.BGbmp[0] = 0 then Image_L_5.Visible := False else
      MakeLMPreviewImage(Image_L_5, @M3DBackGroundPic);
    FastMove(LAtmpLight.BGbmp, LastBGname, 24);
    if not CheckBox_L_8.Checked then CheckBox_L_21.Checked := False;
end;

procedure TGUI.TrackBar_L_21KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = '0' then (Sender as TTrackBar).Position := (Sender as TTrackBar).SelStart;
end;

procedure TGUI.TrackBar_L_22Change(Sender: TObject);
begin
    if bUserChangeL and TBChanged then
    begin
      TriggerRepaint;
      if FNaviFormCreated and GUINav.Visible and (GUINav.NaviLightVals.iBackBMP = 1) then
      begin
        GUINav.NaviHeader.Light.PicOffsetX := TrackBar_L_20.Position;
        GUINav.NaviHeader.Light.PicOffsetY := TrackBar_L_21.Position;
        GUINav.NaviHeader.Light.PicOffsetZ := TrackBar_L_22.Position;
        GUINav.NewCalc;
      end;
    end;
end;

procedure TGUI.ComboBox_L_4Change(Sender: TObject);
var t: Integer;
begin
    if bUserChangeL then
    begin
      t := TabControl_L_1.TabIndex;
      bUserChangeL := False;
      if PageControl_L_1.TabIndex = 0 then
      begin
        LAtmpLight.Lights[t].Loption :=
          (LAtmpLight.Lights[t].Loption and $E7) or IndexToVisFunc(ComboBox_L_4.ItemIndex);
        ComboBox_L_5.ItemIndex := ComboBox_L_4.ItemIndex;
      end
      else
      begin
        LAtmpLight.Lights[t].Loption :=
         (LAtmpLight.Lights[t].Loption and $E7) or IndexToVisFunc(ComboBox_L_5.ItemIndex);
        ComboBox_L_4.ItemIndex := ComboBox_L_5.ItemIndex;
      end;
      LAtmpLight.Lights[t].LFunction :=
        (LAtmpLight.Lights[t].LFunction and $3F) or ((ComboBox_L_4.ItemIndex and 4) shl 5);
      bUserChangeL := True;
      TriggerRepaint;
    end;
end;

procedure TGUI.SpeedButton_L_4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var mp: TPoint;
begin
    if (Button = mbRight) and UpDown_M_5.Visible then
    begin
      GetCursorPos(mp);
      PopupMenuLightVolCol.Popup(mp.X, mp.Y);
    end;
end;

procedure TGUI.SpinButton1Down;  //decrease intensity
var d: Double;
begin
    if not StrToFloatKtry(Edit_L_1.Text, d) then d := 1;
    d := d * 0.707;
    LAtmpLight.Lights[TabControl_L_1.TabIndex].Lamp := Word(SingleToShortFloat(d));
    Edit_L_1.Text := ShortFloatToStr(ShortFloat(LAtmpLight.Lights[TabControl_L_1.TabIndex].Lamp));
end;

procedure TGUI.SpinButton1Up;    //increase intensity
var d: Double;
begin
    if not StrToFloatKtry(Edit_L_1.Text, d) then d := 1;
    d := d * 1.414;
    LAtmpLight.Lights[TabControl_L_1.TabIndex].Lamp := Word(SingleToShortFloat(d));
    Edit_L_1.Text := ShortFloatToStr(ShortFloat(LAtmpLight.Lights[TabControl_L_1.TabIndex].Lamp));
end;

procedure TGUI.tbx_light_rotXChange(Sender: TObject);     //Lightmap rotation x,y,z
var n: Integer;    //      TrackBar_L_26
begin
    if bUserChangeL then
    begin
      n := 0;
      if tbx_light_rotX.Position <> LAtmpLight.Lights[TabControl_L_1.TabIndex].LXpos[0] then Inc(n);
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LXpos[0] := tbx_light_rotX.Position;
      if tbx_light_rotY.Position <> LAtmpLight.Lights[TabControl_L_1.TabIndex].LYpos[0] then Inc(n);
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LYpos[0] := tbx_light_rotY.Position;
      if tbx_light_rotZ.Position <> LAtmpLight.Lights[TabControl_L_1.TabIndex].LZpos[0] then Inc(n);
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LZpos[0] := tbx_light_rotZ.Position;
      if n > 0 then TriggerRepaint;
    end;
end;

procedure TGUI.UpDownLightChange(Sender: TObject); //lightmap nr change
begin
    if bUserChangeL then
    begin
      Inc(RepaintCounter);
      LAtmpLight.Lights[TabControl_L_1.TabIndex].LightMapNr := UpDownLight.Position;
    end;
    LoadLightMapNr(UpDownLight.Position, @LightMaps[TabControl_L_1.TabIndex]);
    MakeLMPreviewImage(Image_L_3, @LightMaps[TabControl_L_1.TabIndex]);
    if bUserChangeL then TriggerRepaint;
end;

function TGUI.OverForm(p: TPoint): LongBool;
begin
    Result := (p.X >= 0) and (p.Y >= 0) and (p.X < Width) and (p.Y < Height);
end;

procedure TGUI.UpDownDiffMapChange(Sender: TObject);
begin   //diffmap nr change
    if bUserChangeL then
    begin
      Inc(RepaintCounter);
      LAtmpLight.bColorMap := UpDownDiffMap.Position and $FF;
      LAtmpLight.Lights[1].AdditionalByteEx := UpDownDiffMap.Position shr 8;
    end;
    LoadLightMapNr(UpDownDiffMap.Position, @DiffColMap);
    MakeLMPreviewImage(Image_L_4, @DiffColMap);
    if bUserChangeL then TriggerRepaint;
end;

procedure TGUI.CheckBox_L_15Click(Sender: TObject);
begin
    Panel_L_1.Visible := not CheckBox_L_15.Checked;
    Panel_L_2.Visible := CheckBox_L_15.Checked;
    if CheckBox_L_15.Checked then
    begin
      if bUserChangeL then Inc(RepaintCounter);
      LoadLightMapNr(UpDownDiffMap.Position, @DiffColMap);
      MakeLMPreviewImage(Image_L_4, @DiffColMap);
    end;
    if bUserChangeL then TriggerRepaint;
end;

procedure TGUI.CheckBox_L_16Click(Sender: TObject); //DiffMap on normals
begin
    if bUserChangeL then
    begin
      bUserChangeL := False;
      if RadioGroup_L_1.ItemIndex > 1 then
      try
        if not CompareMem(@MHeader.dZoom, @LastZoom, 8) then
        begin
          LastZoom := MHeader.dZoom;
          LastPositionDMScale[2] := Round(Log10(LastZoom) * 12 + 30);
          LastPositionDMScale[3] := LastPositionDMScale[2];
        end;
        TrackBar_L_31.Position := LastPositionDMScale[RadioGroup_L_1.ItemIndex];
      except end;
      if RadioGroup_L_1.ItemIndex = 0 then
        TrackBar_L_31.Position := LastPositionDMScale[0];
      bUserChangeL := True;
      TriggerRepaint;
    end;
  //  Label_L_38.Visible := RadioGroup_L_1.ItemIndex = 0;
 //   CheckBox_L_18.Visible := RadioGroup_L_1.ItemIndex = 1;
    case RadioGroup_L_1.ItemIndex of
    0: begin  //its+otrap
         Label_L_35.Caption := 'Offset X:';
         Label_L_36.Caption := 'Offset Y:';
         Label_L_41.Caption := 'Rotation:';
      //   Label_L_42.Visible := True;
         TrackBar_L_30.Visible := True;
         Label_L_38.Visible := True;
         TrackBar_L_31.Visible := True;  //Scale
       end;
    1: begin  //on normals
         Label_L_35.Caption := 'Rotation X:';
         Label_L_36.Caption := 'Rotation Y:';
         Label_L_41.Caption := 'Rotation Z:';
         TrackBar_L_30.Visible := True;
      //   Label_L_42.Visible := False;
         Label_L_38.Visible := False;
         TrackBar_L_31.Visible := False;
       end;
 2, 3: begin  //wrap
         Label_L_35.Caption := 'Offset X:';
         Label_L_36.Caption := 'Offset Y:';
         Label_L_41.Caption := '';
         TrackBar_L_30.Visible := False;
     //    Label_L_42.Visible := False;
         Label_L_38.Visible := True;
         TrackBar_L_31.Visible := True;
       end;
    end;
end;

procedure TGUI.sb_color_histogramClick(Sender: TObject);
var x, imin, imax, icount, n: Integer;   //SpeedButton_L_34
    dmin, dmul: Double;
    pia: PIntegerArray;
begin  // adjust color sliders to histogram
    imin := -1;
    imax := 32767;
    icount := 0;
    n := 0;
    if CheckBox_L_2.Checked then pia := @OTColHisto else pia := @LColHisto;
    for x := 0 to 32767 do Inc(icount, pia[x]);
    icount := Max(1, icount div 2000);      //use 0.05 percent at both ends...
    for x := 0 to 32767 do if pia[x] > 0 then
    begin
      Inc(n, pia[x]);
      if n >= icount then
      begin
        imin := x;
        Break;
      end;
    end;
    n := 0;
    for x := 32767 downto 0 do if pia[x] > 0 then
    begin
      Inc(n, pia[x]);
      if n >= icount then
      begin
        imax := x;
        Break;
      end;
    end;
    if imin < 0 then Exit;
    if sb_color_fine.Down then
    begin
      dmin := Sqr((TBcolStartPos + 30) / 90) * 32767 - 10900;
      dmul := MaxCD(1e-4, (Sqr((TBcolStopPos + 30) / 90) * 32767 - 10900 - dmin) * s1d32767);
      TrackBar_L_9.Position := Round(Min0MaxCD(((imin - dmin) / dmul + 16384) * 120 * d1d65535, 120)) - 30; //x3 := x * 65535 / (Width - 1)
      TrackBar_L_10.Position := Round(Min0MaxCD(((imax - dmin) / dmul + 16384) * 120 * d1d65535, 120)) - 30;
    end
    else
    begin
      TrackBar_L_9.Position := Round(Min0MaxCD(Sqrt((imin + 10900) * s1d32767) * 90, 120)) - 30;  // x3 := x * 4 / (3 * (Width - 1));
      TrackBar_L_10.Position := Round(Min0MaxCD(Sqrt((imax + 10900) * s1d32767) * 90, 120)) - 30;
    end;
    if TrackBar_L_10.Position = TrackBar_L_9.Position then
    if TrackBar_L_9.Position > 0 then TrackBar_L_9.Position := TrackBar_L_9.Position - 1
                              else TrackBar_L_10.Position := TrackBar_L_10.Position + 1;
end;

procedure TGUI.TabControl_L_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var mp: TPoint;
    i: Integer;
begin
    if Button = mbRight then
    begin
      GetCursorPos(mp);
      for i := 0 to 5 do PopupMenuCopyLight.Items[i].Enabled := i <> TabControl_L_1.TabIndex;
      PopupMenuCopyLight.Popup(mp.X, mp.Y);
    end;
end;

procedure TGUI.CopythislighttoLight11Click(Sender: TObject);
var SourceNr, DestNr, b: Integer;
    bRepaint: LongBool;
begin  //copy light to...
    DestNr := Min(5, Max(0, (Sender as TMenuItem).Tag));
    SourceNr := TabControl_L_1.TabIndex;
    if DestNr <> SourceNr then
    begin
      bRepaint := (LAtmpLight.Lights[SourceNr].Loption and LAtmpLight.Lights[DestNr].Loption and 1) = 0;
      b := LAtmpLight.Lights[DestNr].AdditionalByteEx;
      LAtmpLight.Lights[DestNr] := LAtmpLight.Lights[SourceNr];
      LAtmpLight.Lights[DestNr].AdditionalByteEx := b;
      UpdateTabHeader(DestNr);
      if bRepaint then TriggerRepaint;
    end;
end;



procedure TGUI.sb_color_fineClick(Sender: TObject);
begin          //  SBFineAdj
    if sb_color_fine.Down then
    begin
      TBcolStartPos := TrackBar_L_9.Position;
      TBcolStopPos  := TrackBar_L_10.Position;
      TrackBar_L_9.Position  := 0;
      TrackBar_L_10.Position := 60;
    end
    else
    begin
      bUserChangeL := False;
      TrackBar_L_9.Position  := TBcolStartPos;
      bUserChangeL := True;
      TrackBar_L_10.Position := TBcolStopPos;
    end;
    RepaintColorHistory;
end;

{$ENDREGION '========================================================================== > | LIGHT'}

{$REGION '============================================================================= > | P  A  N  E  L  S'}


// pagectrl

procedure TGUI.PageControl_M_1Change(Sender: TObject);
var i: Integer;
begin
    if cb_julia_mode.Checked then TabSheet_M_2.Caption := 'Calc / Julia On'
                            else TabSheet_M_2.Caption := 'Calc / Julia Off';
    if CheckBox_M_4.Checked or CheckBox_M_5.Checked or CheckBox_M_6.Checked then
      TabSheet_M_4.Caption := 'Info / Thread / Stereo / Cutting*'    //TabSheet_M_8
    else TabSheet_M_4.Caption := 'Info / Thread / Stereo / Cuts'; //TabSheet_M_8
    //i := 0;
    //case PageControl_M_1.ActivePageIndex of
    //  0: i := CheckBox_M_2.Top + CheckBox_M_2.Height + 2 - TabSheet_M_2.Height; //calculations
    //  6: i := Edit_M_16.Top + Edit_M_16.Height + 2 - TabSheet_M_3.Height;       //coloring
      //7: i := Button_M_12.Top + Button_M_12.Height + 2 - TabSheet_M_6.Height;   //stereo
    //end;
    //if i > 0 then PageControl_M_1.Height := PageControl_M_1.Height + i;
end;

//  P  A  N  E  L  S
// if cutting and pasting from form to form also paste these.
procedure TGUI.EventDummiClick(Sender: TObject); // OPEN PANEL
var p: TPanel; t: Integer; //s: String; ps: PWideChar;
begin
//PlaceHolder
  p := Sender as TPanel;
  t := p.Tag;
  if t<>0 then
    with p do begin Height:=Tag; BevelOuter:=bvNone; BorderStyle:=bsSingle; Tag:=0 end;
end;
procedure TGUI.EventDummiDblClick(Sender: TObject); // CLOSE PANEL
var p: TPanel; pt: Integer;
begin
  p := Sender as TPanel;
  pt := p.Tag;
  if pt=0 then
//    begin//save height
      with p do begin Tag:=Height; Height:=18; BevelOuter:=bvRaised; BorderStyle:=bsNone end;
//    end
//  else
//    with p do begin Height:=Tag; BevelOuter:=bvNone; BorderStyle:=bsSingle; Tag:=0 end;

end;

procedure TGUI.PageCtrlsChange(Sender: TObject);
var JvP: TJvPageControl; t: Integer;
begin
//  begin
    JvP := Sender as TJvPageControl;
    t := JvP.Tag;
    if t<>0 then  //save Width
      begin
        with JvP do begin Width:=Tag; Tag:=0 end;
      end;
    if PageCtrls.ActivePage = TabHide then
      begin
        with JvP do begin Tag:=Width; Width:=18;  end;
 // if Button1.Parent = PageCtrls then Button1.Parent := PageMain else Button1.Parent := PageCtrls;
      end;
    //PageCtrls.Width := 364 else PageCtrls.Width := 28;
//    else
//  end;

end;
procedure TGUI.Button1Click(Sender: TObject);
begin
 if Button1.Parent = PageCtrls then Button1.Parent := PageMain else Button1.Parent := PageCtrls;
end;

procedure TGUI.PageMainChange(Sender: TObject);
var
  n,TN: Integer;
  TabSheet: TTabSheet;
begin
  TN:=PageMain.PageCount-1;
  if PageMain.ActivePageIndex=TN then
  begin
    PageMain.Pages[TN].Destroy;
    TabSheet := TTabSheet.Create(PageMain);
    TabSheet.Caption := GUI.Caption;
    TabSheet.PageControl := PageMain;
    TabNew1 := TTabSheet.Create(PageMain);
    TabNew1.Caption := 'New';
    TabNew1.PageControl := PageMain;
    PageMain.ActivePage := TabSheet;
//    PageMain.Canvas.Draw(PageMain.Width-25,PageMain.Top-25,Image1.Picture.Graphic);
  end;
  n:= PageMain.ActivePageIndex;
  Panel_M_5.Parent := PageMain.Pages[n];

end;


{$ENDREGION '========================================================================== > | P  A  N  E  L  S'}

//test
procedure SaveFormulaBytes;
var s: String;
    i, c, ci: Integer;
    f: TextFile;
    P1: PByte;
    Last4: array[0..3] of Byte;
begin
    AssignFile(f, appfolder + 'Test.txt');
    Rewrite(f);
    try
      P1 := PByte(@TestHybrid); //   TestHybrid    HybridCustomIFStest
      s := '';
      c := 0;
      ci := 0;
      for i := 0 to 2000 do
      begin
        s := s + IntToHex(P1^, 2);
        Last4[ci] := P1^;
        if (P1^ = 0) and (c > 3) then //until $5DC20800
        begin
          if (Last4[(ci - 1) and 3] = 8) and (Last4[(ci - 2) and 3] = $C2) and
             (Last4[(ci - 3) and 3] = $5D) then Break;
                                       //1 remove to work
        end;
        if (P1^ = $C3) and (c > 3) then //until  $114EE0C3  (dIFS, only with apply scale+)
        begin
          if (Last4[(ci - 1) and 3] = $E0) and (Last4[(ci - 2) and 3] = $4E) and
             (Last4[(ci - 3) and 3] = $11) then Break;
        end;
        Inc(c);
        ci := (ci + 1) and 3;
        Inc(P1);
        if (i and 31) = 31 then
        begin
          Writeln(f, s);
          s := '';
        end;
      end;
      Writeln(f, s);
    finally
      CloseFile(f);
    end;
end;

{$REGION '============================================================================= > | L  O  A  D    F  O  R  M  U  L  A  S'}


//==============================================================================
//            L  O  A  D    F  O  R  M  U  L  A  S
//==============================================================================
procedure TGUI.sb_frm_infoClick(Sender: TObject);
begin       //       SpeedButton_F_2
    //if ListBoxEx_F_15.Visible then ListBoxEx_F_15.Visible := False;
    if RichEdit_F_1.Visible then
    begin
      btn_frm_info_close.Visible := False;
      RichEdit_F_1.Visible := False;
      JCTV_frm.Visible := False;
    end else begin
      RichEdit_F_1.BringToFront;
      btn_frm_info_close.BringToFront;
      RichEdit_F_1.Text := DescrOfFName(cb_frm.Items[cb_frm.ItemIndex]);  // ComboEdit_F_1.Text
      btn_frm_info_close.Visible := True;
      RichEdit_F_1.Visible := True;
      JCTV_frm.Visible := True;
    end;
end;
procedure TGUI.btn_frm_info_closeClick(Sender: TObject);
begin       //      Button_F_3
    btn_frm_info_close.Visible := False;
    RichEdit_F_1.Visible := False;
    //ListBoxEx_F_15.Visible := False;
end;
procedure TGUI.btnHeaderClick(Sender: TObject);
begin
  //if tab
  tc_frmChange(Sender);
  btn_frm_info_close.Visible := True;
  RichEdit_F_1.Width := tc_frm.Width-2;
  RichEdit_F_1.Visible := True;
  RichEdit_F_1.BringToFront;
  //RichEdit_F_1.Text:=HAddon.Formulas[tc_frm.TabIndex];
end;

//procedure TGUI.clb_frm1ClickCheck(Sender: TObject);
//begin
// //   clb_frm.ItemIndex.
//end;
//procedure TGUI.JvCheckListBox1ClickCheck(Sender: TObject);
//var i,n:Integer; JvCLB : TJvCheckListBox;
//
//
//begin
//
//  //for i := 0 to JvCheckListBox1.Items.Count-1 do JvCheckListBox1.Checked[i] := True;
//  //[0] all	[3] 3d	 [6] 4d	 [9]  ads	 [12] ifs
//  //[1] 	  [4] 3d	 [7] 4d	 [10] ads1 [13] ifsT
//  //[2] 	  [5] 3da  [8] 4da [11] ads2 [14] ifsS
//  //Checked[0] := not Checked[0]
//
//end;

procedure TGUI.JCB_frm_471Click(Sender: TObject);
  var Key,t: Integer; Enum: TPair<string, integer>;cb: TJvgCheckBox;
begin
  cb := Sender as TJvgCheckBox;
  t := cb.Tag;

//  //if cb.Checked and JCB_frm_clear.Checked then Exit;
//  if t in [0,1,2,4,5,6,11,20,21,23] then
//    if cb.Checked and JCB_frm_clear.Checked then Exit;

  if JCB_frm_clear.Checked then
  begin
    //FindComponent('JCB_frm_' + IntToStr(i));
    JCB_frm_0.Checked := False;
    JCB_frm_1.Checked := False;
    JCB_frm_2.Checked := False;
    JCB_frm_4.Checked := False;
    JCB_frm_5.Checked := False;
    JCB_frm_6.Checked := False;
    JCB_frm_11.Checked := False;
    JCB_frm_20.Checked := False;
    JCB_frm_21.Checked := False;
    JCB_frm_24.Checked := False;
    JCB_frm_25.Checked := False;
    JCB_frm_471.Checked := False;
    cb_frm.Clear;
//  end
//  else
//  begin
  end;

  with cb_frm.Items do begin
    case t of
      999: if cb.Checked then cb_frm.Clear;
      666: if cb.Checked then cb_frm.Sorted := True else cb_frm.Sorted := False;
       23: for Enum in dFormulaNames do Add(Enum.Key);
        0: for Enum in dFormulaNames do if (Enum.Value = 0) or (Enum.Value = 1)  then Add(Enum.Key);    // 3d
       24: for Enum in dFormulaNames do if Enum.Value = 24  then Add(Enum.Key);    // jit 3d
       25: for Enum in dFormulaNames do if Enum.Value = 25  then Add(Enum.Key);    // _jit ads
        2: for Enum in dFormulaNames do if Enum.Value = 2  then Add(Enum.Key);    // 3d ADE
       11: for Enum in dFormulaNames do if Enum.Value = 11 then Add(Enum.Key);    // 3d ADE ABox
        4: for Enum in dFormulaNames do if Enum.Value = 4  then Add(Enum.Key);    // 4d
        5: for Enum in dFormulaNames do if Enum.Value = 5  then Add(Enum.Key);    // 4d ADE
        6: for Enum in dFormulaNames do if Enum.Value = 6  then Add(Enum.Key);    // 4d ADE ABox
        1: for Enum in dFormulaNames do if Enum.Value = -1 then Add(Enum.Key);    // ADS
       20: for Enum in dFormulaNames do if Enum.Value = 20 then Add(Enum.Key);    // IFS  shapes
       21: for Enum in dFormulaNames do if Enum.Value = 21 then Add(Enum.Key);    // IFS  trafos
    end;
  end;
  if t in [0,1,2,4,5,6,11,20,21,23,24,25] then cb.Checked := True;
  pn_frm.Caption := IntToStr(cb_frm.GetCount);
  //if not (t = 666) or not (t = 999) then cb.Checked := True;

end;

procedure TGUI.LoadFormulaNames;
var sdir, s2, se, s3: String;
    i, df: Integer;
    sr: TSearchRec;
    b: LongBool;
    //Item: TMenuItem;
    ROOT,n: TTreeNode;
    n3d,n4d,nI,nA: TTreeNode;
    n0,n2,n11,n4,n5,n6,n20,n21,n_1: TTreeNode;
    //cFormula: TFormulaClass;
begin
//    Node:=GetNodeByText(JCTV_frm,'3d',True);
//    JCTV_frm.SetFocus;
//    Node.Selected := True;
//    JCTV_frm.Items.Add(JCTV_frm.Selected, 'HELLO');

    JCTV_frm.Items.Clear;
    with JCTV_frm.Items do begin

    ROOT   := Add(ROOT, 'Formulas');

       n3d    := AddChild(ROOT, '3');
       n4d    := AddChild(ROOT, '4');
       nI     := AddChild(ROOT, 'ifs');
       nA     := AddChild(ROOT, 'ads');
        n0     := AddChild(n3d, '3d');
        n2     := AddChild(n3d, '3da');
        n11    := AddChild(n3d, '3db');
        n4     := AddChild(n4d, '4d');
        n5     := AddChild(n4d, '4da');
        n6     := AddChild(n4d, '4db');
        n20    := AddChild(nI, 'Trans');
        n21    := AddChild(nI, 'Shapes');
        n_1    := AddChild(nA, 'ads');

          n := AddChild(n0, 'Integer Power');
          n := AddChild(n0, 'Real Power');
          n := AddChild(n4, 'Quaternion');
          n := AddChild(n0, 'Tricorn');
          n := AddChild(n0, 'Amazing Box');
          n := AddChild(n0, 'Bulbox');
          n := AddChild(n0, 'Folding Int Pow');
          n := AddChild(n0, 'Aexion C');
    end;

    with cb_frm.Items do begin
      cb_frm.Clear;
      Add(' ');
      Add(InternFormulaNames[0]); //'Integer Power', 0
      Add(InternFormulaNames[1]); //'Real Power', 0
      Add(InternFormulaNames[2]); //'Quaternion', 4   4d
      Add(InternFormulaNames[3]); //'Tricorn', 0
      Add(InternFormulaNames[4]); //'Amazing Box', 0
      Add(InternFormulaNames[5]); //'Bulbox', 0
      Add(InternFormulaNames[6]); //'Folding Int Pow', 0
      Add(InternFormulaNames[9]); //'Aexion C', 0
    end;

   //dFormulaNames := TDictionary<String, Integer>.Create;
    //dFormula := TDictionary<String, TFormulaClass>.Create;

    //cFormula.Create;
    //cFormula.FormulaName:='Integer Power';
    //dFormula.Add('Integer Power',cFormula);

    dFormulaNames.Add('Integer Power', 0);   //'Integer Power', 0
    dFormulaNames.Add('Real Power', 0);      //'Real Power', 0
    dFormulaNames.Add('Quaternion', 4);      //'Quaternion', 4   4d
    dFormulaNames.Add('Tricorn', 0);         //'Tricorn', 0
    dFormulaNames.Add('Amazing Box', 0);     //'Amazing Box', 0
    dFormulaNames.Add('Bulbox', 0);          //'Bulbox', 0
    dFormulaNames.Add('Folding Int Pow', 0); //'Folding Int Pow', 0
    //AddFormulaName('testIFS', testIFSDEoption);
    dFormulaNames.Add('Aexion C', 0);        //'Aexion C', 0


    s2 := '';
    sdir := IncludeTrailingPathDelimiter(IniDirs[3]);
    if FindFirst(sdir + '*.m3f', 0, sr) = 0 then
    repeat
      se := ChangeFileExt(sr.Name, '');
      if CanLoadCustomFormula(sdir + sr.Name, df) then // b and {-} and (not FNameIsIncluded(se) )
        begin
          if ContainsText(sr.Name,'JIT') then
            if df = -1 then dFormulaNames.Add(se, 25) else dFormulaNames.Add(se, 24)
          else dFormulaNames.Add(se, df);

          with cb_frm.Items do begin
            case df of
                 2:  cb_frm.Items.Add(se);   // 3Da  37
                11:  cb_frm.Items.Add(se);   // 3Da  13
                 4:  cb_frm.Items.Add(se);   // 4D
                 5:  cb_frm.Items.Add(se);   // 4Da
                 6:  cb_frm.Items.Add(se);   // 4Da
                -1:  cb_frm.Items.Add(se);   // Ads             //-2
                20:  cb_frm.Items.Add(se);   // dIFS  shapes
                21:  cb_frm.Items.Add(se);   // dIFS  trafos    //22
              else   cb_frm.Items.Add(se);   // 3d    87 un-DE`d
            end;
          end;
          with JCTV_frm.Items do begin
            case df of
                 2:  AddChild(n2, se);   // 3Da  37
                11:  AddChild(n11, se);   // 3Da  13
                 4:  AddChild(n4, se);   // 4D
                 5:  AddChild(n5, se);   // 4Da
                 6:  AddChild(n6, se);   // 4Da
                -1:  AddChild(n_1, se);   // Ads             //-2
                20:  AddChild(n20, se);   // dIFS  shapes
                21:  AddChild(n21, se);   // dIFS  trafos    //22
              else   AddChild(n0, se);   // 3d    87 un-DE`d
            end;
          end;

        end;
    until FindNext(sr) <> 0;
    FindClose(sr);
    s2 := sdir;
    pn_frm.Caption:=IntToStr(cb_frm.GetCount);
    //btn_frm_info_close.Visible := False;
    //RichEdit_F_1.Visible := False;
end;

function TGUI.SetFormulaCBs(S: String): Integer;
var b: LongBool;
    I: Integer;
begin
  b := bUserChangeF;
  bUserChangeM := False;
  Result := -1;
  for I := 0 to cb_frm.Items.Count-1 do
  begin
    if cb_frm.Items[i].IndexOf(S) <> -1 then
    begin
      Result := I;
      bUserChangeF := b;
      Exit;
    end;
  end;

//    for i := 0 to cb_frm.Items.Count - 1 do
//      if CompareText(s, cb_frm.Items[i]) = 1 then cb_frm.Items[i];
    //cb_frm.Items[cb_frm.ItemIndex]:=s;//ComboEdit_F_1.Text := Trim(s);
end;

procedure ComboBox_AutoWidth(const theComboBox: TCombobox);
const
  HORIZONTAL_PADDING = 4;
var
  itemsFullWidth: integer;
  idx: integer;
  itemWidth: integer;
begin
  itemsFullWidth := 0;

  // get the max needed with of the items in dropdown state
  for idx := 0 to -1 + theComboBox.Items.Count do
  begin
    itemWidth := theComboBox.Canvas.TextWidth(theComboBox.Items[idx]);
    Inc(itemWidth, 2 * HORIZONTAL_PADDING);
    if (itemWidth > itemsFullWidth) then itemsFullWidth := itemWidth;
  end;

  // set the width of drop down if needed
  if (itemsFullWidth > theComboBox.Width) then
  begin
    //check if there would be a scroll bar
    if theComboBox.DropDownCount < theComboBox.Items.Count then
      itemsFullWidth := itemsFullWidth + GetSystemMetrics(SM_CXVSCROLL);

    SendMessage(theComboBox.Handle, CB_SETDROPPEDWIDTH, itemsFullWidth, 0);
  end;
end;
procedure TGUI.cb_frmDblClick(Sender: TObject);
begin
   ClearFormula(tc_frm.TabIndex);
   SetTabNames;
end;

procedure TGUI.cb_frmDropDown(Sender: TObject);
var s: String;
    i,TI: Integer;
    cb: TComboBox;
begin
    cb := Sender as TComboBox;
    ComboBox_AutoWidth(cb);
end;

procedure TGUI.cb_frmSelect(Sender: TObject);
var s: String; cFormula: TFormulaClass; Enum: TPair<string, integer>;
    i,TI: Integer;
    cb: TComboBox;
begin
    cb := Sender as TComboBox;
    s  := cb.Items[cb.ItemIndex];
    TI := tc_frm.TabIndex;
    if s = ' ' then Exit;

    with HAddon.Formulas[TI] do
    begin
      if isInternFormula(s, i) then
      begin
        cFormula.GetHAddOnFromInternFormula(@MHeader, i, TI);   //Fo. sel
        MHeader.PCFAddon := @HAddon;
        for i := 0 to 5 do MHeader.PHCustomF[i] := @HybridCustoms[i];
{ ! }    IniCFsFromHAddon(PTHeaderCustomAddon(MHeader.PCFAddon), MHeader.PHCustomF);
      end

      else

      begin
        s := Trim(s);
        PutStringInCustomF(CustomFname, s);

//        if ContainsText(s,'JIT') = False then
//          cFormula.LoadCustomFormulaFromHeader(HAddon.Formulas[TI].CustomFname,
//           PTCustomFormula(MHeader.PHCustomF[TI])^, HAddon.Formulas[TI].dOptionValue)
//        else
          LoadCustomFormulaFromHeader(CustomFname,
            PTCustomFormula(MHeader.PHCustomF[TI])^, dOptionValue);

//        if TabControl_F_2.TabIndex <> 1 then
//          if iItCount < 1 then iItCount := 1; //interpol
        CopyTypeAndOptionFromCFtoHAddon(MHeader.PHCustomF[TI], @HAddon, TI);
        iFnr := 20;    //for backward compatibilty reason
      end;

      if iItCount < 1 then iItCount := 1;
      if Is4Dtype(@MHeader) then Panel_F_2.Visible:=True else Panel_F_2.Visible:=False;
      CalcRstop;
      //tc_frmChange(Sender);  //update has problem with spaces
      TCTI;
    end;

end;
       // SS I M P L I F Y 111
procedure TGUI.TCTI;   //duplicate of TC_frmchange for cb select
// 1. save tab #    2. save sb #     3. save lb sel #
var i, TI: Integer;
    s,r,ot,ov:String;
    EB: TEdit;
    LF: TLabel;
    bAltHybrid: LongBool;
    Formulaname: String;
begin
    SetTabNames;
    bAltHybrid := LabelItCount.Caption = 'IterationCount';
    TI := tc_frm.TabIndex;
    ExchangeFormulaRightBtn.Enabled := (TI = 0) or (bAltHybrid and (TI < 5));
    ExchangeFormulaLeftBtn.Enabled := (TI > 0);

    with HAddon.Formulas[TI] do
    begin
      bUserChangeF := False;
      if bAltHybrid then
      begin
        if iItCount < 0 then iItCount := 0;
        EditItCount.Text := IntToStr(iItCount);
      end
      else EditItCount.Text := FloatToStrSingle(PSingle(@iItCount)^);
      Formulaname := Trim(CustomFtoStr(CustomFname));
      //cb_frm.ItemIndex := SetFormulaCBs(Formulaname); //SetFormulaCBs(Formulaname);
      EditJITFormulaItm.Enabled := Pos('JIT', Formulaname) = 1;

      for i := 0 to 15 do
      begin
        EB := (FindComponent('Edit_F_' + IntToStr(i)) as TEdit);
        EB.Visible := iOptionCount > i;
        LF := (FindComponent('Label_F_' + IntToStr(i)) as TLabel);
        LF.Visible := iOptionCount > i;

        if iOptionCount > i then
        begin
          fValue[i] := dOptionValue[i];   // range check error
//          if i <> FValues then
//          begin
//            FValues := i;
            EB.Text := FloatToStr(dOptionValue[i]);
            LF.Caption := PTCustomFormula(MHeader.PHCustomF[TI]).sOptionStrings[i];
//crashes
//            if LF.Width>100 then
//            begin
//              repeat
//              LF.Font.Height := LF.Font.Height-1;
//              until (LF.Width<100) and (LF.Height<14);
//            end
//            else
//              LF.Font.Height := -9;
//          end;
        end;

      end;

      Panel_F_3.Visible := TabControl_F_2.TabIndex = 2;
      //Check4DandInfo;
      if TabControl_F_2.TabIndex = 2 then
        CheckBox_F_1.Checked := TI in [HAddon.bHybOpt1 shr 4, HAddon.bHybOpt2 shr 8]
      else CheckBox_F_1.Checked := TI = (HAddon.bHybOpt1 shr 4);
      //RichEdit_F_1.Visible := False;
      RichEdit_F_1.Text := DescrOfFName(cb_frm.Items[cb_frm.ItemIndex]);
      btn_frm_info_close.Visible := False;
      //RadioGroup_F_1Click(Sender);  //DECombineCmb
      bUserChangeF := True;
    end;
end;
procedure TGUI.tc_frmChange(Sender: TObject);
// 1. save tab #    2. save sb #     3. save lb sel #
var i, TI: Integer;
    s,r,ot,ov:String;
    //TBeX: TTrackBar;
    EB: TEdit;
    LF: TLabel;
    bAltHybrid: LongBool;
    Formulaname: String;
begin
    SetTabNames;
    bAltHybrid := LabelItCount.Caption = 'IterationCount';
    TI := tc_frm.TabIndex;
    ExchangeFormulaRightBtn.Enabled := (TI = 0) or (bAltHybrid and (TI < 5));
    ExchangeFormulaLeftBtn.Enabled := (TI > 0);

    with HAddon.Formulas[TI] do
    begin
      bUserChangeF := False;
      if bAltHybrid then
      begin
        if iItCount < 0 then iItCount := 0;
        EditItCount.Text := IntToStr(iItCount);
      end
      else EditItCount.Text := FloatToStrSingle(PSingle(@iItCount)^);
      Formulaname := Trim(CustomFtoStr(CustomFname));
      cb_frm.ItemIndex := SetFormulaCBs(Formulaname); //SetFormulaCBs(Formulaname);
      EditJITFormulaItm.Enabled := Pos('JIT', Formulaname) = 1;

      for i := 0 to 15 do
      begin
        EB := (FindComponent('Edit_F_' + IntToStr(i)) as TEdit);
        EB.Visible := iOptionCount > i;
        LF := (FindComponent('Label_F_' + IntToStr(i)) as TLabel);
        LF.Visible := iOptionCount > i;

        if iOptionCount > i then
        begin
          fValue[i] := dOptionValue[i];   // range check error
//          if i <> FValues then
//          begin
//            FValues := i;
            EB.Text := FloatToStr(dOptionValue[i]);
            LF.Caption := PTCustomFormula(MHeader.PHCustomF[TI]).sOptionStrings[i];

//crashes on certain items
//            if LF.Width>100 then
//            begin
//              repeat
//              LF.Font.Height := LF.Font.Height-1;
//              until (LF.Width<100) and (LF.Height<14);
//            end
//            else
//              LF.Font.Height := -9;

//          end;
        end;

      end;
      Panel_F_3.Visible := TabControl_F_2.TabIndex = 2;
      Check4DandInfo;
      if TabControl_F_2.TabIndex = 2 then
        CheckBox_F_1.Checked := TI in [HAddon.bHybOpt1 shr 4, HAddon.bHybOpt2 shr 8]
      else CheckBox_F_1.Checked := TI = (HAddon.bHybOpt1 shr 4);
      //RichEdit_F_1.Visible := False;
      RichEdit_F_1.Text := DescrOfFName(cb_frm.Items[cb_frm.ItemIndex]);
      btn_frm_info_close.Visible := False;
      RadioGroup_F_1Click(Sender);  //DECombineCmb

      bUserChangeF := True;

    end;
end;

procedure TGUI.SetTabNames;
var i, t, n, ti: Integer;
    ne: TNotifyEvent;
begin
    ne := tc_frm.OnChange;
    try
    tc_frm.OnChange := nil;
    if (HAddon.bOptions1 and 3) = 1 then n := 1 else n := 5;
    if tc_frm.Tabs.Count <> n + 1 then
    begin
      ti := tc_frm.TabIndex;
      tc_frm.Tabs.Clear;
      for t := 0 to n do
      begin
        if n = 5 then i := HAddon.Formulas[t].iItCount
                 else i := Ord(HAddon.Formulas[t].CustomFName[0] > 0);
        if t = 0 then
        begin
          if i < 1 then tc_frm.Tabs.Add('Formula1')
                   else tc_frm.Tabs.Add('Formula1 •');
        end
        else if i < 1 then tc_frm.Tabs.Add('Fo.' + IntToStr(t + 1))
                      else tc_frm.Tabs.Add('Fo.' + IntToStr(t + 1) + ' •');
      end;
      tc_frm.TabIndex := Min(n, ti);
    end else begin
      for t := 0 to n do
      begin
        if n = 5 then i := HAddon.Formulas[t].iItCount
                 else i := Ord(HAddon.Formulas[t].CustomFName[0] > 0);
        if t = 0 then
        begin
          if i < 1 then tc_frm.Tabs[t] := 'Formula1'
                   else tc_frm.Tabs[t] := 'Formula1 •';
        end
        else if i < 1 then tc_frm.Tabs[t] := 'Fo.' + IntToStr(t + 1)
                      else tc_frm.Tabs[t] := 'Fo.' + IntToStr(t + 1) + ' •';
      end;
    end;
    if n = 5 then LabelItCount.Caption := 'IterationCount' else LabelItCount.Caption := 'Weight';
    CheckBox_F_1.Visible := n = 5;
    finally
      tc_frm.OnChange := ne;
    end;
end;

procedure TGUI.tc_frmMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var mp: TPoint;
    i: Integer;
begin
    if Button = mbRight then
    begin
      GetCursorPos(mp);
      for i := 0 to 5 do PopupMenuCopyFormula.Items[i].Enabled := i <> tc_frm.TabIndex;
      Shiftallformulasonetotheright1.Caption := 'Shift formulas ' + IntToStr(tc_frm.TabIndex + 1) + ' to 5 a position to the right';
      Shiftallformulasonetotheright1.Visible := tc_frm.TabIndex < 5;
      Shifttotheleft1.Caption := 'Shift formulas ' + IntToStr(tc_frm.TabIndex + 1) + ' to 6 a position to the left';
      PopupMenuCopyFormula.Popup(mp.X, mp.Y);
    end;
end;

{$ENDREGION '========================================================================== > | L  O  A  D    F  O  R  M  U  L  A  S'}

{$REGION '============================================================================= > | H  E  A  D  E  R'}

//            {  H  E  A  D  E  R  }

procedure TGUI.SetEulerEditsFromHeader;
var v3: TVec3D; // Q: TQuaternion;
begin
//  MatrixToQuat(MHeader.hVGrads, Q);  // MatrixToAngles(v3);
//  v3 := GetEulerFromQuat(Q);
    if not MatrixToAngles(v3, @MHeader.hVGrads) then
    begin
      eXrot.Text := '?';
      eZrot.Text := '?';
    end
    else
    begin
      eXrot.Text := FloatToStr(v3[0] / Pid180);
      eZrot.Text := FloatToStr(v3[2] / Pid180);
    end;
    eYrot.Text := FloatToStr(v3[1] / Pid180);
end;

procedure TGUI.SetEditsFromHeader;
var TileRect: TRect;
    Crop: Integer;
begin
    bUserChangeM := False;
    with MHeader do
    try
      if (Width > 0) and (Height > 0) then InternAspect := Width / Height;
      btnCalc3D.SetFocus;
      if MHeader.TilingOptions <> 0 then
      begin
        GetTilingInfosFromHeader(@MHeader, TileRect, Crop);
        ed_width.Text := IntToStr(TileRect.Right - TileRect.Left + 1 - 2 * Crop);
        ed_height.Text := IntToStr(TileRect.Bottom - TileRect.Top + 1 - 2 * Crop);
      end else begin
        ed_width.Text := IntToStr(Width);
        ed_height.Text := IntToStr(Height);
      end;
      eZstart.Text  := FloatToStr(dZstart);
      eZend.Text  := FloatToStr(dZend);
      Edit_M_6.Text  := FloatToStrSingle(mZstepDiv);
      eXmid.Text  := FloatToStr(dXmid);
      eYmid.Text := FloatToStr(dYmid);
      eZoom.Text  := FloatToStr(dZoom);
      eFOV.Text := FloatToStr(dFOVy);
      eZmid.Text := FloatToStr(dZmid);
      Edit_M_2.Text  := FloatToStrSingle(sColorMul);
      Edit_M_8.Text  := FloatToStrSingle(sRaystepLimiter);
      Edit_M_15.Text := FloatToStrSingle(StereoScreenWidth);
      Edit_M_18.Text := FloatToStrSingle(StereoScreenDistance);
      Edit_M_13.Text := FloatToStrSingle(StereoMinDistance);
      Edit_M_25.Text := FloatToStrSingle(sDEstop);
      if Edit_M_33.Text <> Authors[0] then
      begin
        Edit_M_33.Enabled := (Authors[0] = IniVal[33]) or (Length(Authors[0]) < 2);
        Edit_M_33.Text := Authors[0];
      end;
      Edit_M_34.Text := Authors[1];

      SpinEdit_M_2.Position := (iOptions shr 6) and 15;
      SpinEdit_M_5.Position := bStepsafterDEStop;
      CheckBox_M_1.Checked := (bNormalsOnDE and 1) <> 0;
      CheckBox_M_3.Checked := (iOptions and 1) <> 0;
      CheckBox_M_8.Checked := (iOptions and 2) <> 0;
      CheckBox_M_2.Checked := (iOptions and 4) <> 0;
      Label_M_31.Caption := IntToStr(iAvrgDEsteps div 10) + '.' + IntToStr(iAvrgDEsteps mod 10);
      Label_M_32.Caption := IntToStr(iAvrgIts div 10) + '.' + IntToStr(iAvrgIts mod 10);
      if iMaxIts > 0 then Label_M_40.Caption := IntToStr(iMaxIts)
                     else Label_M_40.Caption := '?';
      Label_M_52.Caption := IntToTimeStr(iCalcTime);
      Label_M_8.Caption  := IntToTimeStr(iCalcHStime);
      Label_M_48.Caption := IntToTimeStr(iAmbCalcTime);
      Label_M_50.Caption := IntToTimeStr(iReflectsCalcTime);
      Edit_M_22.Text := FloatToStr(dCutZ);
      Edit_M_23.Text := FloatToStr(dCutX);
      Edit_M_24.Text := FloatToStr(dCutY);
      bImageScale := Max(1, Min(10, bImageScale));
      ImageScale := bImageScale;
      sb_aspect.Caption := '1:' + IntToStr(ImageScale);
      CheckBox_M_4.Checked := (bCutOption and 1) > 0;
      CheckBox_M_5.Checked := (bCutOption and 2) > 0;
      CheckBox_M_6.Checked := (bCutOption and 4) > 0;
      CheckBox_M_9.Checked := (bVaryDEstopOnFOV > 0);
      cb_julia_mode.Checked := bIsJulia > 0;
      RadioGroup_M_2.ItemIndex := bPlanarOptic;
      RadioGroup_M_1.ItemIndex := byColor2Option;
      Edit_M_28.Text := FloatToStr(dJx);
      Edit_M_29.Text := FloatToStr(dJy);
      Edit_M_30.Text := FloatToStr(dJz);
      eJW.Text := FloatToStr(dJw);
      SetEdit_M_16Text;
      Edit_M_35.Text := IntToStr(bColorOnIt - 1);
      PageControl_M_1Change(Self);

      SetEulerEditsFromHeader;

      UpdateFromHeader(@MHeader);                                               {FORMULA}

//      if PPFormCreated then
//      begin
//        PostProForm.CheckBox_P_1.Checked := (bCalcDOFtype and 1) <> 0;
//        PostProForm.RadioGroup_P_2.ItemIndex := (bCalcDOFtype shr 3) and 1;
//        PostProForm.RadioGroup_P_1.ItemIndex := (bCalcDOFtype shr 1) and 3;
//        PostProForm.Edit_P_1.Text := FloatToStrSingle(sDOFZsharp);
//        PostProForm.Edit_P_2.Text := FloatToStrSingle(sDOFclipR);
//        PostProForm.Edit_P_3.Text := FloatToStrSingle(sDOFaperture);
//        PostProForm.Edit_P_10.Text := FloatToStrSingle(sDOFZsharp2);
//        PostProForm.Edit_P_5.Text := FloatToStrSingle(HSmaxLengthMultiplier);
//        PostProForm.CheckBox_P_9.Checked := (bCalculateHardShadow and 1) <> 0;
//        PostProForm.CheckBox_P_10.Checked := (bCalculateHardShadow and 2) <> 0;
//        PostProForm.CheckBox_P_2.Checked := (bCalculateHardShadow and 4) <> 0;
//        PostProForm.CheckBox_P_3.Checked := (bCalculateHardShadow and 8) <> 0;
//        PostProForm.CheckBox_P_4.Checked := (bCalculateHardShadow and 16) <> 0;
//        PostProForm.CheckBox_P_5.Checked := (bCalculateHardShadow and 32) <> 0;
//        PostProForm.CheckBox_P_6.Checked := (bCalculateHardShadow and 64) <> 0;
//        PostProForm.CheckBox_P_7.Checked := (bCalculateHardShadow and 128) <> 0;
//        PostProForm.CheckBox_P_29.Checked := (bCalc1HSsoft and 1) <> 0;
//        PostProForm.CheckBox_P_11.Checked := (bCalcAmbShadowAutomatic and 1) <> 0;
//        PostProForm.CheckBox_P_12.Checked := (bCalcAmbShadowAutomatic and 2) <> 0;    //Thr0
//        PostProForm.CheckBox_P_22.Checked := (bCalcAmbShadowAutomatic and 128) <> 0;  //fsr
//        PostProForm.TabControl_P_1.TabIndex := (bCalcAmbShadowAutomatic shr 2) and 3;
//        PostProForm.UpDown_P_1.Position := (bCalcAmbShadowAutomatic shr 4) and 3; //and 7
//        PostProForm.RadioGroup_P_5.ItemIndex := AODEdithering;
//        PostProForm.Edit_P_34.Text := FloatToStrSingle(Abs(sAmbShadowThreshold));
//        PostProForm.CheckBox_P_23.Checked := (byCalcNsOnZBufAuto and 1) <> 0;
//        PostProForm.CheckBox_P_24.Checked := (bCalcSRautomatic and 1) <> 0;
//        PostProForm.Edit_P_6.Text := FloatToStrSingle(Min0MaxCS(SRamount, 100));
//        PostProForm.UpDown_P_2.Position := Min(8, Max(1, SRreflectioncount));
//        PostProForm.UpDown_P_3.Position := Min(9, Max(1, SSAORcount));
//        PostProForm.Edit_P_8.Text := FloatToStrSingle(MinMaxCS(s1d255, sDEAOmaxL, 100));
//        PostProForm.RadioGroup_P_3Click(Self); //to make AO components visible or not
//        PostProForm.Edit_P_9.Text := D2ByteToStr(bSSAO24BorderMirrorSize);
//        PostProForm.Edit_P_13.Text := FloatToStrSingle(MinMaxCS(s1em30, sTransmissionAbsorption, 1e10));
//        PostProForm.Edit_P_14.Text := FloatToStrSingle(MinMaxCS(0.1, sTRIndex, 10));
//        PostProForm.Edit_P_17.Text := FloatToStrSingle(Min0MaxCS(sTRscattering, s1e30));
//        PostProForm.CheckBox_P_27.Checked := (bCalcSRautomatic and 2) <> 0;
//        PostProForm.CheckBox_P_28.Checked := (bCalcSRautomatic and 4) <> 0;
//        PostProForm.Edit_P_7.Text := ShortFloatToStr(MCSoftShadowRadius);
//      end;

    finally
      bUserChangeM := True;
    end;
end;

procedure TGUI.UpdateFromHeader(Header: TPMandHeader10);
begin
    with Header^ do
    begin
      bUserChangeF := False;
      RBailoutEdit.Text := FloatToStr(RStop);
      TabControl_F_2Change(Self);
      MaxIterEdit.Text := IntToStr(Iterations);
      MaxIterHybridPart2Edit.Text := IntToStr(iMaxItsF2);
      MinIterEdit.Text := IntToStr(MinimumIterations);
      XWEdit.Text := FloatToStr(dXWrot / Pid180);
      YWEdit.Text := FloatToStr(dYWrot / Pid180);
      ZWEdit.Text := FloatToStr(dZWrot / Pid180);
      CheckBox_F_2.Checked := (PTHeaderCustomAddon(PCFAddon).bOptions2 and 1) > 0;
      ComboBox_F_1.ItemIndex := (PTHeaderCustomAddon(PCFAddon).bOptions2 and 6) shr 1;
      DECombineCmb.ItemIndex := PTHeaderCustomAddon(PCFAddon).bOptions3 and 7;
      if DECombineCmb.ItemIndex < 5 then
        Edit_F_23.Text := FloatToStrSingle(Min0MaxCS(sDEcombS, 100))
      else
      begin
        Edit_F_23.Text := IntToStr(DEmixColorOption);
        Edit_F_25.Text := FloatToStrSingle(sNotZero(MinMaxCS(-100, sFmixPow, 100)));
      end;
      bUserChangeF := True;
    end;
end;

procedure TGUI.MakeHeader;
var d: Double;
begin
    with MHeader do
    begin
      MandId := actMandId;
      if TilingOptions = 0 then
      begin
        Width  := StrToIntTrim(ed_width.Text);
        Height := StrToIntTrim(ed_height.Text);
      end;
      Iterations        := StrToIntTrim(MaxIterEdit.Text);                      {FORMULA}
      MinimumIterations := StrToIntTrim(MinIterEdit.Text);                      {FORMULA}
      iMaxItsF2         := StrToIntTrim(MaxIterHybridPart2Edit.Text);           {FORMULA}
      bNormalsOnDE      := Byte(CheckBox_M_1.Checked);
      bPlanarOptic      := RadioGroup_M_2.ItemIndex;
      bStepsafterDEStop := SpinEdit_M_5.Position;

//      if PPFormCreated then
//      begin
//        PostProForm.PutDOFparsToHeader(@MHeader);
//        PostProForm.PutAmbientParsToHeader(@MHeader);
//        PostProForm.PutReflectionParsToHeader(@MHeader);
//        HSmaxLengthMultiplier := StrToFloatK(PostProForm.Edit_P_5.Text);
//        bCalculateHardShadow := PostProForm.HSoptions and 255;
//        bCalc1HSsoft := PostProForm.HSoptions shr 8;
//        byCalcNsOnZBufAuto := Byte(PostProForm.CheckBox_P_23.Checked) and 1;
//        bSSAO24BorderMirrorSize := StrToD2Byte(PostProForm.Edit_P_9.Text);
//     //   MCSoftShadowRadius := StrToShortFloat(PostProForm.Edit_P_7.Text);
//        if not StrToFloatKtry(PostProForm.Edit_P_7.Text, d) then d := 1;
//        MCSoftShadowRadius := SingleToShortFloat(MinMaxCS(s001, d, 20));
//      end
//      else
//      begin

        bCalculateHardShadow := 0;
        bCalc1HSsoft := 0;
        bCalcAmbShadowAutomatic := 1;
        sAmbShadowThreshold := 2;
        byCalcNsOnZBufAuto := 0;
        bSSAO24BorderMirrorSize := 0;

//      end;

      iOptions := (SpinEdit_M_2.Position shl 6) or              // smooth normals            // bit7..10=smoothNs(0..8)
                  (Ord(CheckBox_M_3.Checked) and 1) or          // first random step         // bit1=FirstStepRandom
                  ((Ord(CheckBox_M_8.Checked) and 1) shl 1) or  // Shortdistance check DE:   // bit2=Shortdist check DEs
                  ((Ord(CheckBox_M_2.Checked) and 1) shl 2);    // Raystep sub DEstop:       // bit3=StepSubDEstop

      mZstepDiv := Max(0.001, Min(1, StrToFloatK(Edit_M_6.Text)));
      dZstart   := StrToFloatK(eZstart.Text);
      dZend     := StrToFloatK(eZend.Text);
      dXmid     := StrToFloatK(eXmid.Text);
      dYmid     := StrToFloatK(eYmid.Text);
      dZmid     := StrToFloatK(eZmid.Text);
      dZoom     := StrToFloatK(eZoom.Text);
      RStop     := StrToFloatK(RBailoutEdit.Text);{FORMULA}
      dXWrot    := StrToFloatK(XWEdit.Text) * Pid180;{FORMULA}
      dYWrot    := StrToFloatK(YWEdit.Text) * Pid180;{FORMULA}
      dZWrot    := StrToFloatK(ZWEdit.Text) * Pid180;{FORMULA}
      dFOVy     := StrToFloatK(eFOV.Text);
      dCutZ     := StrToFloatK(Edit_M_22.Text);
      dCutX     := StrToFloatK(Edit_M_23.Text);
      dCutY     := StrToFloatK(Edit_M_24.Text);
      bCutOption := Byte(CheckBox_M_4.Checked) or (Byte(CheckBox_M_5.Checked) shl 1)
                     or (Byte(CheckBox_M_6.Checked) shl 2);   //todo side of cuts
      sDEstop   := Max(0.001, StrToFloatK(Edit_M_25.Text));
      bImageScale := ImageScale;
      bIsJulia  := Byte(cb_julia_mode.Checked);
      dJx       := StrToFloatK(Edit_M_28.Text);
      dJy       := StrToFloatK(Edit_M_29.Text);
      dJz       := StrToFloatK(Edit_M_30.Text);
      dJw       := StrToFloatK(eJW.Text);
      sColorMul := StrToFloatK(Edit_M_2.Text);
      sRaystepLimiter := StrToFloatK(Edit_M_8.Text);
      StereoScreenWidth := StrToFloatK(Edit_M_15.Text);
      StereoScreenDistance := StrToFloatK(Edit_M_18.Text);
      StereoMinDistance := StrToFloatK(Edit_M_13.Text);
      bVaryDEstopOnFOV := Byte(CheckBox_M_9.Checked);
      byColor2Option := RadioGroup_M_1.ItemIndex;
      bColorOnIt := Max(0, Min(255, StrToIntTrim(Edit_M_35.Text) + 1));
      if ButtonVolLight.Caption = 'Dyn. fog on It.:' then
      begin
        bVolLightNr := 2 shl 4;
        bDFogIt := StrToIntTrim(Edit_M_16.Text);
      end
      else bVolLightNr := Min(6, Max(1, StrToIntTrim(Edit_M_16.Text))) or ((UpDown_M_5.Position + 2) shl 4);

      PCFAddon := @HAddon;
      PutLightFInHeader(MHeader);{LIGHT}
      HAddon.bOptions1 := (HAddon.bOptions1 and $FC) or TabControl_F_2.TabIndex;{FORMULA}
      HAddon.bOptions2 := (Ord(CheckBox_F_2.Checked) and 1) or
                          (ComboBox_F_1.ItemIndex shl 1);{FORMULA}
      HAddOn.bOptions3 := DECombineCmb.ItemIndex;{FORMULA}
      if HAddOn.bOptions3 < 5 then
        sDEcombS := Min0MaxCS(StrToFloatK(Edit_F_23.Text), 100)//{FORMULA}
      else
      begin
        DEmixColorOption := Max(0, Min(2, StrToIntTrim(Edit_F_23.Text)));{FORMULA}
        sFmixPow := sNotZero(MinMaxCS(-100, StrToFloatK(Edit_F_25.Text), 100));{FORMULA}
      end;
    end;
end;

procedure TGUI.EventEditChange(Sender: TObject);   //????????????
begin
    if bUserChangeF then
    begin
      if not StrToFloatKtry((Sender as TEdit).Text, HAddon.Formulas[tc_frm.TabIndex].dOptionValue[(Sender as TEdit).Tag]) then
        (Sender as TEdit).Font.Color := clMaroon
      else
        (Sender as TEdit).Font.Color := clWindowText;
    end
    else (Sender as TEdit).Font.Color := clWindowText;
end;

//'\Mandelbulb3D';
function GetSpecialFolderPath(folder : Integer) : String;
const SHGFP_TYPE_CURRENT = 0;
var path: array [0..MAX_PATH] of Char;
begin
    if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) then
      Result := path
    else
      Result := '';
end;

{$ENDREGION '========================================================================== > | H  E  A  D  E  R'}


Initialization

{$REGION '============================================================================= > | REGION'}

{$ENDREGION '========================================================================== > | REGION'}

    AppFolder  := ExtractFilePath(Application.ExeName);
    AppDataDir := GetSpecialFolderPath(CSIDL_LOCAL_APPDATA) + '\Mandelbulb3D';
    if not DirectoryExists(AppDataDir) then AppDataDir := AppFolder;
    AppDataDir := IncludeTrailingPathDelimiter(AppDataDir);
    M3DBackGroundPic.LMnumber := 0;
    M3DBackGroundPic.LMframe := 0;
    M3DBackGroundPic.LMWidth := 0;
    SetCosTabFunction;{LIGHT}


{$REGION '============================================================================= > | DEOption'}
(*

{DEoption: [-1,21]:    [-1] ads  [21] dIFS trafos  //no effect unless inc wiv others
           [0,1,2,11]: [0,1] 3D  [2] 3D ADE  [11] 3D ABox
           [4,5,6]:    [4] 4D    [5] 4D ADE  [6] 4D ABox
           [20]:       [20] dIFS shapes}

(3d) no deoption   88

_cylripple
_DEComb_ISph_Plane
_e_3Dtess
_IFS_tess
_MobiusTpx
_mulC3D
_quadist
_Rpow3
_SinePow2
_SphereInvC
_SquareR
Aex-Octo
Aex-TorusPow
Benesi1Pow2
Benesi2Pow2
Benesi2Pow6
Benesi3Pow2
BenesiPine1
BenesiPine2
Beth322
Beth323
Beth432
Beth651
Beth1032
Beth1522
BPine_only
BristorBrot
BT1Pine
BT1Pinegon
BT1Pinehedron
BT2Pine
BulboxP-2
CosinePow2
CosinePow8
Faehrten
Fuzzy
General
IdesFormula
Ikenagabulb
IQ_NormBulb
IQ_NormBulb_NoYZ
IQ_PineTree
IQ_PineTree_NoYZ
IQ-bulb old
IQ-bulb
JIT_AmazingSquare_02
JIT_gnj_RiemPow2_05
JIT_gnj_Tutorial1_01
JIT_gnj_TwoRealPower_02
JIT_IQ_Bulb
JITBenesiPineTree
JITTrigExample
KaliDucks
KaliLinCombSSE2sm
Kalisets1
MagVsXYZ
MagVsXYZabs
MagVsXYZabs2
MagVsXYZabs3
MagVsXYZmsw
Makin3D-1
Makin3D-2
Makin3D-3-4
Makin-NSR-tri
MandelView
ManowarBulb
Msltoe_Sym
MsltoeFoldQuat
MsltoeSym2
MsltoeSym3
MsltoeSym4
PseudoXDB
Quad3Db
Quadrat3D
QuickDudley
QuickDudleyKM
Quintic
Riemann
Riemann2
RuckerBrot1
Ruckerbulb
TalisTpx
TetraFolding Pow2
TgladDihed
TgladDihed2
TgladTetra
TgladTetra2
TrifoxComplexAngles



--------------------------------------------------------------
{3D}
--------------------------------------------------------------
GenIntPower.m3f(3):                     .DEoption = 0
--------------------------------------------------------------
{3D}
--------------------------------------------------------------
_sphereinv.m3f(4):                      .DEoption = 1
--------------------------------------------------------------
{3Da}
--------------------------------------------------------------
_AmazingBox.m3f(4):                     .DEoption = 2
_Scaling.m3f(4):                        .DEoption = 2
ABoxMod1.m3f(4):                        .DEoption = 2
ABoxMod2.m3f(4):                        .DEoption = 2
ABoxModKali.m3f(5):                     .DEoption = 2
ABoxPlatinum.m3f(4):                    .DEoption = 2
ABoxPlatinumB.m3f(4):                   .DEoption = 2
Amazing Surf 2.m3f(4):                  .DEoption = 2                   // trim
AmazingBox2.m3f(4):                     .DEoption = 2
ASurfMod1.m3f(4):                       .DEoption = 2
CantorIFS.m3f(4):                       .DEoption = 2
CrossBiFold.m3f(4):                     .DEoption = 2
DodecahedronIFS.m3f(4):                 .DEoption = 2   //platonic
DodecahedronIFSex.m3f(4):               .DEoption = 2   //platonic
genIFS.m3f(5):                          .DEoption = 2
HalfOctIFS.m3f(4):                      .DEoption = 2
IcosahedronIFS.m3f(4):                  .DEoption = 2   //platonic
JCube3.m3f(4):                          .DEoption = 2
koch_cube.m3f(3):                       .DEoption = 2
koch_oct.m3f(4):                        .DEoption = 2
koch_surf.m3f(3):                       .DEoption = 2
Mandalay-KIFS.m3f(4):                   .DEoption = 2
Mandalex.m3f(4):                        .DEoption = 2
Menger3.m3f(4):                         .DEoption = 2
MengerHyper.m3f(5):                     .DEoption = 2
MengerIFS.m3f(4):                       .DEoption = 2
MengerIFSplus.m3f(4):                   .DEoption = 2
MengerKoch.m3f(4):                      .DEoption = 2
MengerKochV2.m3f(4):                    .DEoption = 2
MengerSmt.m3f(4):                       .DEoption = 2
OctaFullIFS.m3f(4):                     .DEoption = 2
OctahedronIFS.m3f(4):                   .DEoption = 2   //platonic
OctKoch.m3f(4):                         .DEoption = 2
SierpHilbert.m3f(4):                    .DEoption = 2
Sierpinski3.m3f(4):                     .DEoption = 2
Sierpinski3alt.m3f(4):                  .DEoption = 2
SierpinskiFull.m3f(4):                  .DEoption = 2
--------------------------------------------------------------
{3Da}
--------------------------------------------------------------
_AmazingBoxSSE2.m3f(4):                 .DEoption = 11
ABoxMapSFold.m3f(4):                    .DEoption = 11
ABoxSmoothFold.m3f(4):                  .DEoption = 11
ABoxVaryScale.m3f(4):                   .DEoption = 11
ABoxVaryScale2.m3f(4):                  .DEoption = 11
ABoxVS_icen1.m3f(4):                    .DEoption = 11
ABoxVS_icen2.m3f(4):                    .DEoption = 11
ABoxVSShapes.m3f(4):                    .DEoption = 11
ABoxVSWavy.m3f(4):                      .DEoption = 11
Amazing Surf.m3f(4):                    .DEoption = 11                  // trim
ASurfSmoothFold.m3f(4):                 .DEoption = 11
ATetraVS.m3f(4):                        .DEoption = 11
ATetraVS2.m3f(4):                       .DEoption = 11
--------------------------------------------------------------

{4D}
--------------------------------------------------------------
_Atan4D.m3f(3):                         .DEoption = 4
_conj4D.m3f(3):                         .DEoption = 4
_coordvspow.m3f(3):                     .DEoption = 4
_Exp4D.m3f(3):                          .DEoption = 4
_julibrot.m3f(3):                       .DEoption = 4
_Log4D.m3f(3):                          .DEoption = 4
_Rpow3_4d.m3f(2):                       .DEoption = 4
_Scalingplus.m3f(3):                    .DEoption = 4
_setw.m3f(3):                           .DEoption = 4
_Sin4Dplus.m3f(3):                      .DEoption = 4
_SphereInvC4d.m3f(2):                   .DEoption = 4
_Tanh4D.m3f(3):                         .DEoption = 4
Aexion1.m3f(3):                         .DEoption = 4
Barnsley2_4Dc.m3f(3):                   .DEoption = 4
Barnsley2_4Dnc.m3f(4):                  .DEoption = 4
Barnsley4Dc.m3f(3):                     .DEoption = 4
Barnsley4Dc2.m3f(3):                    .DEoption = 4
Barnsley4Dnc.m3f(3):                    .DEoption = 4
Beth1241.m3f(3):                        .DEoption = 4
Beth1661dual.m3f(3):                    .DEoption = 4
Beth2422.m3f(3):                        .DEoption = 4
Beth641.m3f(3):                         .DEoption = 4
CommQuat.m3f(3):                        .DEoption = 4
CubicQuat.m3f(3):                       .DEoption = 4
GeneralQuat.m3f(3):                     .DEoption = 4
Hopf4D.m3f(3):                          .DEoption = 4
hyperd_1.m3f(3):                        .DEoption = 4
Lambda4Dc.m3f(3):                       .DEoption = 4
Lambda4Dnc.m3f(3):                      .DEoption = 4
Magnet4D.m3f(4):                        .DEoption = 4
Makin4D p2a.m3f(3):                     .DEoption = 4                   // trim
Makin4D p2b.m3f(3):                     .DEoption = 4
Makin4D p4a.m3f(3):                     .DEoption = 4
Makin4D p4b.m3f(3):                     .DEoption = 4
Makin4D p8a.m3f(3):                     .DEoption = 4
Makin4D p8b.m3f(3):                     .DEoption = 4
Mandel4DBiC.m3f(3):                     .DEoption = 4
MandyCousin.m3f(3):                     .DEoption = 4
MandyCousin2.m3f(3):                    .DEoption = 4
MandyCousin3.m3f(3):                    .DEoption = 4
PG-bulb.m3f(3):                         .DEoption = 4
QuadrayBrot.m3f(3):                     .DEoption = 4
QuatPow.m3f(4):                         .DEoption = 4
--------------------------------------------------------------
{4Da}
--------------------------------------------------------------
_ScaleC4d.m3f(4):                       .DEoption = 5
ABoxMod4d.m3f(4):                       .DEoption = 5
ABoxSphereOffset4d.m3f(4):              .DEoption = 5
ABoxVaryScale4d.m3f(4):                 .DEoption = 5
--------------------------------------------------------------
{4Da}
--------------------------------------------------------------
HalfOct4a.m3f(5):                       .DEoption = 6
HalfOct4b.m3f(5):                       .DEoption = 6
Menger4.m3f(5):                         .DEoption = 6
Menger4ex.m3f(5):                       .DEoption = 6
MixPinski4.m3f(5):                      .DEoption = 6
MixPinski4ex.m3f(5):                    .DEoption = 6
Octahedron4.m3f(5):                     .DEoption = 6
Sierpinski4.m3f(5):                     .DEoption = 6
Sierpinski4ex.m3f(5):                   .DEoption = 6
--------------------------------------------------------------
{dIFS} shapes
--------------------------------------------------------------
boardIFS.m3f(3):                        .DEoption = 20
borgIFS.m3f(3):                         .DEoption = 20
boxIFS.m3f(3):                          .DEoption = 20
cayleySurfIFS.m3f(3):                   .DEoption = 20
CitrusIFS.m3f(3):                       .DEoption = 20
columnsIFS.m3f(3):                      .DEoption = 20
CommaIFS.m3f(3):                        .DEoption = 20
cubetubeIFS.m3f(3):                     .DEoption = 20
CylinderHeightMap.m3f(3):               .DEoption = 20
CylinderHMVoid.m3f(3):                  .DEoption = 20
cylinderIFS.m3f(3):                     .DEoption = 20
DecoCubeIFS.m3f(3):                     .DEoption = 20
DevilIFS.m3f(3):                        .DEoption = 20
diniIFS.m3f(3):                         .DEoption = 20
discoballIFS.m3f(3):                    .DEoption = 20
dodecatubeIFS.m3f(3):                   .DEoption = 20
ducksIFS.m3f(3):                        .DEoption = 20
foldcut12-IFS.m3f(3):                   .DEoption = 20
foldcut8-IFS.m3f(3):                    .DEoption = 20
gear2IFS.m3f(3):                        .DEoption = 20
gearIFS.m3f(3):                         .DEoption = 20
gnarly2IFS.m3f(3):                      .DEoption = 20
gnarly3IFS.m3f(3):                      .DEoption = 20
gnarlyIFS.m3f(3):                       .DEoption = 20
greekIFS.m3f(3):                        .DEoption = 20
gumdropIFS.m3f(3):                      .DEoption = 20
gyroidIFS.m3f(3):                       .DEoption = 20
heartKluchIFS.m3f(3):                   .DEoption = 20
HeightMap2IFS.m3f(3):                   .DEoption = 20
HeightMapIFS.m3f(3):                    .DEoption = 20
helistairsIFS.m3f(3):                   .DEoption = 20
helixIFS.m3f(3):                        .DEoption = 20
hexgridIFS.m3f(3):                      .DEoption = 20
hextgrid2IFS.m3f(3):                    .DEoption = 20
hextgrid3IFS.m3f(3):                    .DEoption = 20
hextgrid4IFS.m3f(3):                    .DEoption = 20
hextgridIFS.m3f(3):                     .DEoption = 20
KleinBagelIFS.m3f(3):                   .DEoption = 20
KleinBotTIFS.m3f(3):                    .DEoption = 20
Knots2IFS.m3f(3):                       .DEoption = 20
KnotsIFS.m3f(3):                        .DEoption = 20
lidinoidIFS.m3f(3):                     .DEoption = 20
LimpetIFS.m3f(3):                       .DEoption = 20
logspIFS.m3f(3):                        .DEoption = 20
loxodrome2IFS.m3f(3):                   .DEoption = 20
loxodromeIFS.m3f(3):                    .DEoption = 20
MitreIFS.m3f(3):                        .DEoption = 20
NewFoldCutIFS.m3f(3):                   .DEoption = 20
NewMenger2IFS.m3f(3):                   .DEoption = 20
NewMengerIFS.m3f(3):                    .DEoption = 20
PenN-gonIFS.m3f(3):                     .DEoption = 20
PiriformIFS.m3f(3):                     .DEoption = 20
PolyPyraIFS.m3f(3):                     .DEoption = 20
PSphereIFS.m3f(3):                      .DEoption = 20
pyramIFS.m3f(3):                        .DEoption = 20
QCylIFS.m3f(3):                         .DEoption = 20
QuadricsIFS.m3f(3):                     .DEoption = 20
RandCubesIFS.m3f(3):                    .DEoption = 20
RiemSqrtIFS.m3f(3):                     .DEoption = 20
roomclrIFS.m3f(3):                      .DEoption = 20
RoomDoorsIFS.m3f(3):                    .DEoption = 20          ????
RoundedBox.m3f(3):                      .DEoption = 20
ScarabIFS.m3f(3):                       .DEoption = 20
ScherkFS.m3f(3):                        .DEoption = 20
schwartzIFS.m3f(3):                     .DEoption = 20
Seashell.m3f(3):                        .DEoption = 20
sliceExIFS.m3f(3):                      .DEoption = 20
sliceIFS.m3f(3):                        .DEoption = 20
SphCageIFS.m3f(3):                      .DEoption = 20
SphereHeightMap.m3f(3):                 .DEoption = 20
SphereHMVoid.m3f(3):                    .DEoption = 20
SphereIFS.m3f(3):                       .DEoption = 20
tetratubeIFS.m3f(3):                    .DEoption = 20
TorusEllipIFS.m3f(3):                   .DEoption = 20
TorusHMVoid.m3f(3):                     .DEoption = 20
TorusIFS.m3f(3):                        .DEoption = 20
toupieIFS.m3f(3):                       .DEoption = 20
trifoliumIFS.m3f(3):                    .DEoption = 20
tritgrid2IFS.m3f(3):                    .DEoption = 20
tritgridIFS.m3f(3):                     .DEoption = 20
UmbrellaIFS.m3f(3):                     .DEoption = 20
waveIFS.m3f(3):                         .DEoption = 20
wavespIFS.m3f(3):                       .DEoption = 20
WeirdCubeIFS.m3f(3):                    .DEoption = 20
YinYangIFS.m3f(3):                      .DEoption = 20
--------------------------------------------------------------
{dIFS} trafos   Transformations
--------------------------------------------------------------
amazingIFS.m3f(3):                      .DEoption = 21
Apollo2D-IFS.m3f(3):                    .DEoption = 21
Apollo3D-IFS.m3f(3):                    .DEoption = 21
cayley2IFS.m3f(3):                      .DEoption = 21
FernTransform.m3f(3):                   .DEoption = 21
foldinghexIFS.m3f(3):                   .DEoption = 21
foldinginfyIFS.m3f(3):                  .DEoption = 21
foldingoctIFS.m3f(3):                   .DEoption = 21
Menger1-IFS.m3f(3):                     .DEoption = 21
PolyFold-symIFS.m3f(3):                 .DEoption = 21
PolyFoldEx-symIFS.m3f(3):               .DEoption = 21
PolyFoldExIFS.m3f(3):                   .DEoption = 21
PolyFoldIFS.m3f(3):                     .DEoption = 21
tilingbrick2IFS.m3f(3):                 .DEoption = 21
tilingbrickIFS.m3f(3):                  .DEoption = 21
TilingIFS.m3f(3):                       .DEoption = 21
totoricalIFS.m3f(3):                    .DEoption = 21
Trans-KochIFS.m3f(3):                   .DEoption = 21
trans-qIFS.m3f(3):                      .DEoption = 21
transform2IFS.m3f(3):                   .DEoption = 21
transformIFS.m3f(3):                    .DEoption = 21
transLogSpIFS.m3f(3):                   .DEoption = 21

{ADS}   168
--------------------------------------------------------------
_Abs4d.m3f(3):                          .DEoption = -1
_AbsX.m3f(3):                           .DEoption = -1
_AbsY.m3f(3):                           .DEoption = -1
_AbsZ.m3f(3):                           .DEoption = -1
_addC.m3f(3):                           .DEoption = -1
_asdamTrans.m3f(3):                     .DEoption = -1
_BenesiSpheric.m3f(3):                  .DEoption = -1
_BenesiT1.m3f(3):                       .DEoption = -1
_BenesiT2.m3f(3):                       .DEoption = -1
_BenesiT3.m3f(3):                       .DEoption = -1
_BenesiUnSpheric.m3f(3):                .DEoption = -1
_boxtiling.m3f(3):                      .DEoption = -1
_BPolygonFromCircle.m3f(3):             .DEoption = -1
_BPolygonToCircle.m3f(3):               .DEoption = -1
_BPolyhedronFromSphere.m3f(3):          .DEoption = -1
_BPolyhedronToSphere.m3f(3):            .DEoption = -1
_BRotateFromMag.m3f(3):                 .DEoption = -1
_BRotateToMag.m3f(3):                   .DEoption = -1
_BSkewXmaxV1.m3f(3):                    .DEoption = -1
_BStellahedron_F_Sphere.m3f(3):         .DEoption = -1
_BT1_4D_clampXYZ.m3f(3):                .DEoption = -1
_BT1_4D_Transform1.m3f(3):              .DEoption = -1
_BT1_Transform1.m3f(3):                 .DEoption = -1
_BT2_Transform2.m3f(3):                 .DEoption = -1
_BT3_Transform3.m3f(3):                 .DEoption = -1
_BT4_Transform4.m3f(3):                 .DEoption = -1
_BT5b_Transform5b.m3f(3):               .DEoption = -1
_CelticMode.m3f(3):                     .DEoption = -1
_CondItcountR.m3f(3):                   .DEoption = -1
_CondItcountSwitch.m3f(3):              .DEoption = -1
_CondItcountSwX2.m3f(3):                .DEoption = -1
_CondLyapunov.m3f(3):                   .DEoption = -1
_CondLyapunovEx.m3f(3):                 .DEoption = -1
_conj.m3f(3):                           .DEoption = -1
_conj2D.m3f(3):                         .DEoption = -1
_cosmartin.m3f(3):                      .DEoption = -1
_DonutTransform.m3f(3):                 .DEoption = -1
_dynamic.m3f(3):                        .DEoption = -1
_dynamicfast.m3f(3):                    .DEoption = -1
_flipC-xyz.m3f(3):                      .DEoption = -1
_FlipXY.m3f(3):                         .DEoption = -1
_FlipXYc.m3f(3):                        .DEoption = -1
_FlipXZ.m3f(3):                         .DEoption = -1
_FlipXZc.m3f(3):                        .DEoption = -1
_FlipYZ.m3f(3):                         .DEoption = -1
_FlipYZc.m3f(3):                        .DEoption = -1
_Fold45double.m3f(3):                   .DEoption = -1
_Fold45single.m3f(3):                   .DEoption = -1
_Folding1.m3f(3):                       .DEoption = -1
_Folding2.m3f(3):                       .DEoption = -1
_FoldingCTetra3d.m3f(3):                .DEoption = -1
_FoldingIcosa.m3f(3):                   .DEoption = -1
_FoldingInfy.m3f(3):                    .DEoption = -1
_FoldingOct.m3f(3):                     .DEoption = -1
_FoldingTetra3d.m3f(3):                 .DEoption = -1
_FoldingTetraKaleid.m3f(3):             .DEoption = -1
_FoldingVar.m3f(3):                     .DEoption = -1
_GenCWarp.m3f(3):                       .DEoption = -1
_gnarl2D.m3f(3):                        .DEoption = -1
_gnarl2D_2.m3f(3):                      .DEoption = -1
_gnarl2D_2fast.m3f(3):                  .DEoption = -1
_gnarl2Dfast.m3f(3):                    .DEoption = -1
_gnarl3D.m3f(3):                        .DEoption = -1
_gnarl3Dfast.m3f(3):                    .DEoption = -1
_helispiral.m3f(3):                     .DEoption = -1
_HexaTransform.m3f(3):                  .DEoption = -1
_hopalm1.m3f(3):                        .DEoption = -1
_hopalm2.m3f(3):                        .DEoption = -1
_hopalong.m3f(3):                       .DEoption = -1
_HopSqrtX.m3f(3):                       .DEoption = -1
_HopSqrtY.m3f(3):                       .DEoption = -1
_HopSqrtZ.m3f(3):                       .DEoption = -1
_hyc3Dinv.m3f(3):                       .DEoption = -1
_IntPowRotateC.m3f(3):                  .DEoption = -1
_invbisp.m3f(3):                        .DEoption = -1
_invcylindrical.m3f(3):                 .DEoption = -1
_invspherical.m3f(3):                   .DEoption = -1
_invtorical.m3f(3):                     .DEoption = -1
_invtorical2.m3f(3):                    .DEoption = -1
_JIT_gnj_Exp_02.m3f(2):                 .DEOption = -1
_JIT_gnj_LoziExt1_02.m3f(2):            .DEOption = -1
_JIT_gnj_RiemPow2_03.m3f(2):            .DEOption = -1
_JIT_gnj_RiemPow2_04.m3f(2):            .DEOption = -1
_JIT_gnj_RiemPowRadial_01.m3f(2):       .DEOption = -1
_JIT_gnj_RiemSimple_01.m3f(2):          .DEOption = -1
_JIT_gnj_VolterraLotka_02.m3f(2):       .DEOption = -1
_JuliaSets.m3f(3):                      .DEoption = -1
_juliax2.m3f(3):                        .DEoption = -1
_kamtor.m3f(3):                         .DEoption = -1
_kamtorcut.m3f(3):                      .DEoption = -1
_LinCombineCxyz.m3f(3):                 .DEoption = -1
_LinCombineXYZ.m3f(3):                  .DEoption = -1
_LogX.m3f(3):                           .DEoption = -1
_LogY.m3f(3):                           .DEoption = -1
_LogZ.m3f(3):                           .DEoption = -1
_lorenz.m3f(3):                         .DEoption = -1
_MapTranslate.m3f(3):                   .DEoption = -1
_MaxClipping.m3f(3):                    .DEoption = -1
_NeoSqrX.m3f(3):                        .DEoption = -1
_NeoSqrY.m3f(3):                        .DEoption = -1
_NeoSqrZ.m3f(3):                        .DEoption = -1
_ngon.m3f(3):                           .DEoption = -1
_ngon2.m3f(3):                          .DEoption = -1
_PartlyJulia.m3f(3):                    .DEoption = -1
_PartlyJuliaR.m3f(3):                   .DEoption = -1
_PartlyJuliaRoff.m3f(3):                .DEoption = -1
_planeFold.m3f(3):                      .DEoption = -1
_PlusSinApp.m3f(3):                     .DEoption = -1
_poincare.m3f(3):                       .DEoption = -1
_PolyFold-sym.m3f(3):                   .DEoption = -1
_PolyFolding.m3f(3):                    .DEoption = -1
_QuadrayTransform.m3f(3):               .DEoption = -1
_QuadrayTransform2.m3f(3):              .DEoption = -1
_rabinovich-f.m3f(3):                   .DEoption = -1
_recFold.m3f(3):                        .DEoption = -1
_reciprocalX.m3f(3):                    .DEoption = -1
_reciprocalX2.m3f(3):                   .DEoption = -1
_reciprocalX3.m3f(3):                   .DEoption = -1
_reciprocalX3b.m3f(3):                  .DEoption = -1
_reciprocalY2.m3f(3):                   .DEoption = -1
_reciprocalY3.m3f(3):                   .DEoption = -1
_reciprocalY3b.m3f(3):                  .DEoption = -1
_reciprocalZ2.m3f(3):                   .DEoption = -1
_reciprocalZ3.m3f(3):                   .DEoption = -1
_reciprocalZ3b.m3f(3):                  .DEoption = -1
_rossler.m3f(3):                        .DEoption = -1
_Rotate.m3f(3):                         .DEoption = -1
_Rotate4d.m3f(3):                       .DEoption = -1
_RotateBack.m3f(3):                     .DEoption = -1
_RotateC.m3f(3):                        .DEoption = -1
_RotatedAbs.m3f(3):                     .DEoption = -1
_RotatedFolding.m3f(3):                 .DEoption = -1
_RotatePlaneOnIts.m3f(3):               .DEoption = -1
_RotateRnd.m3f(3):                      .DEoption = -1
_RotateXYonIts.m3f(3):                  .DEoption = -1
_RotateXYonItsP.m3f(3):                 .DEoption = -1
_scaleC.m3f(3):                         .DEoption = -1
_SinApprox.m3f(3):                      .DEoption = -1
_SinhX.m3f(3):                          .DEoption = -1
_SinhY.m3f(3):                          .DEoption = -1
_SinhZ.m3f(3):                          .DEoption = -1
_SinY.m3f(3):                           .DEoption = -1
_skew.m3f(3):                           .DEoption = -1
_SphereFolding1.m3f(3):                 .DEoption = -1
_SphereFolding2.m3f(3):                 .DEoption = -1
_sphereXinv.m3f(3):                     .DEoption = -1
_sphereYinv.m3f(3):                     .DEoption = -1
_sphereZinv.m3f(3):                     .DEoption = -1
_sqr_3D.m3f(3):                         .DEoption = -1
_sqr_4D.m3f(3):                         .DEoption = -1
_tocylindrical.m3f(3):                  .DEoption = -1
_toruspinv1.m3f(3):                     .DEoption = -1
_toruspinv2.m3f(3):                     .DEoption = -1
_toruspinv3.m3f(3):                     .DEoption = -1
_tospherical.m3f(3):                    .DEoption = -1
_totorical.m3f(3):                      .DEoption = -1
_totorical2.m3f(3):                     .DEoption = -1
_Transform.m3f(3):                      .DEoption = -1
_Translate.m3f(3):                      .DEoption = -1
_TranslateC4d.m3f(3):                   .DEoption = -1
_TranslateRnd.m3f(3):                   .DEoption = -1
_updateC.m3f(3):                        .DEoption = -1
_updateC2.m3f(3):                       .DEoption = -1
_updateC_4d.m3f(3):                     .DEoption = -1
_vanderpol.m3f(3):                      .DEoption = -1
_vanderpol2.m3f(3):                     .DEoption = -1
_YplusSinZ.m3f(3):                      .DEoption = -1
_YplusSinZ2.m3f(3):                     .DEoption = -1
*)
{$ENDREGION '========================================================================== > | REGION'}


{$REGION '============================================================================= > | Listbox Dilemma'}

      //s3 := UpperCase(se);
//      b := (s3 <> 'TRAFASSELQUAT') or not CanLoadF('CommQuat');
//      b := b and ((s3 <> '_FLIPXY') or not CanLoadF('_FlipXYc'));
//      b := b and ((s3 <> '_FLIPXZ') or not CanLoadF('_FlipXZc'));
//      b := b and ((s3 <> '_FLIPYZ') or not CanLoadF('_FlipYZc'));
//      b := b and ((s3 <> 'ABOXMODKALIFIXED') or not CanLoadF('ABoxModKali'));
//      b := b and (s3 <> 'SQKOCH') and (s3 <> 'DJD-QUAT') and (s3 <> '_IFS-TESS');

(*
  InternFormulaNames: array[0..9] of AnsiString = (
  0 'Integer Power',    0    ~   3D*
  1 'Real Power',       0    ~   3D*
  2 'Quaternion',       4    4D
  3 'Tricorn',          0    ~   3D*
  4 'Amazing Box',      11   3Da
  5 'Bulbox',           0    ~   3D*
  6 'Folding Int Pow',  0    ~   3D*
    ------------------
  7 'test',
  8 'testIFS',
    ------------------
  9 'Aexion C');
  InternFormulaMax: Integer = 9;
  -----------------------------------------------------------------
  InternFormulasDEfunc: array[0..6] of Integer = (0,0,4,0,11,0,0);
*)
//procedure HandlePopupItem(Sender: TObject);
//begin
//  ShowMessage(TMenuItem(Sender).Caption);
//end;



(*
procedure TGUI.sp_frm_hideClick(Sender: TObject);
var i, v: Integer;     //      SpeedButton_F_4
begin
    if ListBoxEx_F_15.Visible then
    begin
      ListBoxEx_F_15.Visible := False;
      btn_frm_info_close.Visible := False;
    end
    else
    begin
      ListBoxEx_F_15.Clear;
      ListBoxEx_F_15.BringToFront;
      btn_frm_info_close.BringToFront;
      try
        ListBoxEx_F_15.Items.LoadFromFile(IncludeTrailingPathDelimiter(IniDirs[3]) + 'FavouriteList.txt');
      except
        ListBoxEx_F_15.Clear;
      end;
      i := 0;
      while i < ListBoxEx_F_15.Items.Count do
      begin
        if (not TryStrToInt(StrFirstWord(ListBoxEx_F_15.Items[i]), v)) or (v > -2) then
        begin
          ListBoxEx_F_15.Selected[i] := True;
          ListBoxEx_F_15.DeleteSelected;
        end
        else
        begin
          ListBoxEx_F_15.Items[i] := StrLastWords(ListBoxEx_F_15.Items[i]);
          Inc(i);
        end;
      end;
      ShowListBox(ListBoxEx_F_15, True);
      btn_frm_info_close.Visible := True;
    end;
end;

procedure TGUI.ListBoxEx_F_15MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var p: TPoint;
begin
    if Button = mbRight then
    begin
      if ListBoxEx_F_15.ItemIndex >= 0 then
      begin
        HighlightedFormula := Trim(ListBoxEx_F_15.Items[ListBoxEx_F_15.ItemIndex]);
        if HighlightedFormula > '' then
        begin
          Hidethisformula1.Visible := False;
          p := ListBoxEx_F_15.ClientToScreen(Point(X, Y));
          PopupMenuRateFormula.Popup(p.X + 3, p.Y);
        end;
      end;
    end;
end;
*)

//procedure TGUI.AddFormulaName(FName: String; DEfunc: Integer);
////var stat: Integer;
//begin  // MutaGenGUI
////  stat := TFormulaNamesLoader.GetFavouriteStatus(FName);
////  if stat > -2 then
//    // saFormulaNames
//    //cb_frm.Items.Add(FName);
//    //  begin
//    //FName := IntToStr(stat) + ' ' + FName;
//    //GenIntPower.m3f(3):			.DEoption = 0
//    //_sphereinv.m3f(4):			.DEoption = 1
//                                                            //list based array cb choice
//    case DEfunc of
//         2:  cb_frm.Items.Add(FName);   // 3Da  37
//        11:  cb_frm.Items.Add(FName);   // 3Da  13
//         4:  cb_frm.Items.Add(FName);   // 4D
//         5:  cb_frm.Items.Add(FName);   // 4Da
//         6:  cb_frm.Items.Add(FName);   // 4Da
//        -1:  cb_frm.Items.Add(FName);   // Ads             //-2
//        20:  cb_frm.Items.Add(FName);   // dIFS  shapes
//        21:  cb_frm.Items.Add(FName);   // dIFS  trafos    //22
//      else   cb_frm.Items.Add(FName);   // 3d    87 un-DE`d
//    end;
////  end;
//end;

//procedure AddFormulaNameT(tv: TJvCheckTreeView; FName: String; DEfunc: Integer);
////var stat: Integer;
//begin  // MutaGenGUI
////  stat := TFormulaNamesLoader.GetFavouriteStatus(FName);
////  if stat > -2 then
//    // saFormulaNames
//    //cb_frm.Items.Add(FName);
//    //  begin
//    //FName := IntToStr(stat) + ' ' + FName;
//    //GenIntPower.m3f(3):			.DEoption = 0
//    //_sphereinv.m3f(4):			.DEoption = 1
//    //list based array cb choice
//    with tv.Items do begin
//      case DEfunc of
//           2:  AddChild(n2, FName);   // 3Da  37
//          11:  AddChild(n11, FName);   // 3Da  13
//           4:  AddChild(n4, FName);   // 4D
//           5:  AddChild(n5, FName);   // 4Da
//           6:  AddChild(n6, FName);   // 4Da
//          -1:  AddChild(n_1, FName);   // Ads             //-2
//          20:  AddChild(n20, FName);   // dIFS  shapes
//          21:  AddChild(n21, FName);   // dIFS  trafos    //22
//        else   AddChild(n0, FName);   // 3d    87 un-DE`d
//      end;
//    end;
//end;


//function GetNodeByText(tv: TTreeView; txt: String; vis: Boolean): TTreeNode;
//var
//    Node: TTreeNode;
//begin
//  Result := nil;
//  if tv.Items.Count = 0 then Exit;
//  Node := tv.Items[0];
//  while Node = nil do
//  begin
////    if UpperCase(Node.Text) = UpperCase(AValue) then
//    if Node.Text = txt then
//    begin
//      Result := Node;
//      if vis then Result.MakeVisible;
//      Break;
//    end;
//    Node := Node.GetNext;
//  end;
//end;
//function FindRootNode(ACaption: String; ATreeView: TTreeView): TTreeNode;
//var LDestNode: TTreeNode;
//    LCount: Integer;
//begin
//  result := nil;
//  LCount := 0;
//  while (LCount < ATreeView.Items.Count) and (result = nil) do
//  begin
//    if (ATreeView.Items.Item[LCount].Text = ACaption) and
//      (ATreeView.Items.Item[LCount].Parent = nil) then
//      result := ATreeView.Items.Item[LCount];
//    inc(LCount);
//  end;
////end;
////begin
//  LDestNode := FindRootNode('category', TreeView1);
//  if LDestNode <> nil then
//  begin
//    TreeView1.Items.AddChild(LDestNode, 'node1');
//    TreeView1.Items.AddChild(LDestNode, 'node2');
//  end;
//end;







{
function TGUI.FNameIsIncluded(Name: String): LongBool;
var i, l: Integer;
    LB: TListBoxEx;
begin
    Result := False;
    for l := 1 to sb_frm_type_count do
    begin
      LB := FindComponent('ListBoxEx_F_' + IntToStr(l)) as TListBoxEx;
      if LB <> nil then
      begin
        for i := 0 to LB.Items.Count - 1 do
          if CompareText(Trim(Name), StrLastWords(LB.Items[i])) = 0 then Result := True;
      end;
      if Result then Break;
    end;
end;

}
{

procedure TGUI.AddFormulaName(FName: String; DEfunc: Integer);
var stat: Integer;
begin  // MutaGenGUI
  stat := TFormulaNamesLoader.GetFavouriteStatus(FName);
  if stat > -2 then
  begin
    FName := IntToStr(stat) + ' ' + FName;
    case DEfunc of
      2,11:  ListBoxEx_F_3.Items.Add(FName); //2                                               // 3Da
         4:  ListBoxEx_F_4.Items.Add(FName); //3                                               // 4D
       5,6:  ListBoxEx_F_5.Items.Add(FName); //4                                               // 4Da
     -1,-2:  if not ListBoxIsFull(ListBoxEx_F_6) then ListBoxEx_F_6.Items.Add(FName) else   // Ads
             if not ListBoxIsFull(ListBoxEx_F_7) then ListBoxEx_F_7.Items.Add(FName) else
               ListBoxEx_F_8.Items.Add(FName);
        20:  if not ListBoxIsFull(ListBoxEx_F_9) then ListBoxEx_F_9.Items.Add(FName) else   // dIFS  shapes
               ListBoxEx_F_10.Items.Add(FName);
    21..22:  ListBoxEx_F_11.Items.Add(FName);   //12                                            // dIFS  trafos
      else                                                                                  // 3D
        if not ListBoxIsFull(ListBoxEx_F_1) then ListBoxEx_F_1.Items.Add(FName) else
          ListBoxEx_F_2.Items.Add(FName);    //7
    end;
  end;
end;

}

(*
function ScreenPosInListBox(const LB: TListBoxEx; const sp: TPoint): Boolean;
var sap: TPoint;
begin
    sap := LB.ClientToScreen(Point(0, 0));
    Result := (sp.X >= sap.X) and (sp.Y >= sap.Y - 2) and (sp.X < sap.X + LB.Width)
                              and (sp.Y < sap.Y + LB.Height);
end;

function ScreenPosInSButton(const SB: TSpeedButton; const sp: TPoint): Boolean;
var sap: TPoint;
begin
    sap := SB.ClientToScreen(Point(0, 0));
    Result := (sp.X >= sap.X) and (sp.Y >= sap.Y - 2) and (sp.X < sap.X + SB.Width)
                              and (sp.Y < sap.Y + SB.Height);
end;

procedure TGUI.sb_frm_type_1Click(Sender: TObject);
var SB: TSpeedButton;
    i: Integer;
begin
  SB := Sender as TSpeedButton;
  for i := 1 to sb_frm_type_count do
  if i <> SB.Tag then
    begin
      SB.Down:=False;
      ShowListBoxEx(i,False);
    end
  else
    begin
      SB.Down:=True;
      ShowListBoxEx(i,True);
    end

end;

procedure TGUI.ShowListBoxEx(T: Integer; const Visible: Boolean);
var LB: TListBoxEx;
    SB: TSpeedButton;
begin
  LB := FindComponent('ListBoxEx_F_' + IntToStr(T)) as TListBoxEx;
  SB := FindComponent('sb_frm_type_' + IntToStr(T)) as TSpeedButton;
  ShowScrollBar(LB.Handle, SB_VERT, False);
  LB.Visible := Visible;
  LB.Enabled := Visible;
  ShowScrollBar(LB.Handle, SB_VERT, Visible);
  LB.Left := Min(SB.Left, tc_frm.Width - LB.Width);
  LB.Top := 42;
  ShowListBox(LB, True);
  LB.BringToFront
end;


procedure TGUI.ShowListBox(LB: TListBoxEx; const Visible: Boolean);
begin
  ShowScrollBar(LB.Handle, SB_VERT, False);
  LB.Visible := Visible;
  LB.Enabled := Visible;
  ShowScrollBar(LB.Handle, SB_VERT, Visible);
end;


procedure TGUI.sb_frm_type_1MouseEnter(Sender: TObject);
var SB: TSpeedButton;
    MPos: TPoint;
    LB:   TListBoxEx;
    Zeitdif, MPYdif, tt, t, t2: Integer;
begin
//    //SB.Down:=True;
    SB := Sender as TSpeedButton;
    GetCursorPos(MPos);
    tt := (MPos.Y shl 20) or (SB.Tag shl 16) or (GetTickCount and $FFFF);
    Zeitdif := (GetTickCount and $FFFF) - (tt and $FFFF) + 1;
    if Zeitdif < 1 then Inc(Zeitdif, $FFFF);
    MPYdif := (tt shr 20) - MPos.Y;
    if abs(MPYdif * 16) div Zeitdif < 1 then   //? horizontal movements to another button popups new listbox fast
    begin
      t := (tt shr 16) and $F;
      if t = 12 then t2 := 11 else t2 := t;
      SB := FindComponent('sb_frm_type_' + IntToStr(t2)) as TSpeedButton;   //t2
      if (SB = nil) or not SB.Enabled then Exit;
      LB := FindComponent('ListBoxEx_F_' + IntToStr(t)) as TListBoxEx;
      if ScreenPosInSButton(SB, MPos) then //new check if mouse on button
      begin
        HideAll_LBxCept(t);
        if LB <> nil then ListboxPopup(LB, Point(SB.Left - 2, SB.Top + SB.Height));
        //SB.Down := True;
      end;
      //else if (LB <> nil) and (not LB.Visible) then SB.Down := False;
    end;
end;

procedure TGUI.ListboxPopup(var LB: TListBoxEx; const pos: TPoint);
var mpos: TPoint;
    i, l, c: Integer;
    SB: TSpeedButton;
begin
    if not LB.Visible then
    begin
      LB.Left := Min(pos.X, tc_frm.Width - LB.Width);
      LB.Top := pos.Y;
      ShowListBox(LB, True);
      LB.BringToFront;
    end;
    GetCursorPos(mpos);
    c := 0;
    for i := 1 to sb_frm_type_count do
    begin
      if (LB = nil) or not LB.Visible then Continue;
      Inc(c);
      if not ScreenPosInListBox(LB, mpos) then
      begin
        SB := FindComponent('sb_frm_type_' + IntToStr(i)) as TSpeedButton;
        if (SB <> nil) and ScreenPosInSButton(SB, mpos) then Continue;
        //Timer_F_1.Tag := Timer_F_1.Tag - 1;
        //if Timer_F_1.Tag <= 0 then
        //begin
        //  Timer_F_1.Tag := 5;
        //  ShowListBox(LB, False);
        //  if (SB <> nil) and SB.Down then SB.Down := False;
        //  Break;
        //end;
      end;
      //else Timer_F_1.Tag := 5;
    end;
end;

procedure TGUI.sb_frm_type_1MouseLeave(Sender: TObject);
var mpos: TPoint;
    SB: TSpeedButton;
    LB: TListBoxEx;
begin
    GetCursorPos(mpos);
    SB := Sender as TSpeedButton;
    LB := FindComponent('ListBoxEx_F_' + IntToStr(SB.Tag)) as TListBoxEx;
    if (LB <> nil) and not ScreenPosInListBox(LB, mpos) then ShowListBox(LB, False);
    //SB.Down:=False;
end;


procedure TGUI.ListBoxEx_F_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var mpos, rp: TPoint;
    i: Integer;
    LBx: TListBoxEx;
begin
//    GetCursorPos(mpos);
//    LBx := Sender as TListBoxEx;
//    rp := LBx.ScreenToClient(mpos);
//    if (rp.X >= 0) and (rp.X < LBx.Width) and
//       (rp.Y >= 0) and (rp.Y < LBx.Height) then
//    begin
//      i := LBx.ItemAtPos(rp, True);
//      if (i >= 0) and not LBx.Selected[i] then LBx.Selected[i] := True;
//    end;
end;

procedure TGUI.ListBoxEx_F_1MouseEnter(Sender: TObject);
begin
//    Timer_F_4.Enabled := False;
    HideAll_LBxCept((Sender as TListBoxEx).Tag);
end;

procedure TGUI.ListBoxEx_F_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i: Integer;
    LBx: TListBoxEx;
    p: TPoint;
begin
    if Button = mbLeft then
    begin
      LBx := Sender as TListBoxEx;
      i := LBx.ItemIndex;
      if i >= 0 then SelectFormula(StrLastWords(LBx.Items[i]));
      ShowListBox(LBx, False);
      SetFocus;
      //if LBx.Tag <> 12 then
      //  (FindComponent('sb_frm_type_' + IntToStr(LBx.Tag)) as TSpeedButton).Down := True;
    end
    else if Button = mbRight then
    begin
      LBx := Sender as TListBoxEx;
      i := LBx.ItemIndex;
      if i >= 0 then
      begin
        HighlightedFormula := StrLastWords(LBx.Items[i]);
        if HighlightedFormula > '' then
        begin
          Hidethisformula1.Visible := True;
          p := LBx.ClientToScreen(Point(X, Y));
          PopupMenuRateFormula.Popup(p.X + 3, p.Y);
        end;
      end;
    end;
end;

procedure TGUI.ListBoxEx_F_1MouseLeave(Sender: TObject); //leave triggers in XE2 also if on vertical scrollbar!
var mpos: TPoint;
    LBx: TListBoxEx;
    SB: TSpeedButton;
begin
    GetCursorPos(mpos);
    LBx := Sender as TListBoxEx;
    SB := FindComponent('sb_frm_type_' + IntToStr(LBx.Tag)) as TSpeedButton;
    if (SB <> nil) and (not ScreenPosInSButton(SB, mpos)) and not ScreenPosInListBox(LBx, mpos) //new, check if on box included scrollbar
      then HideAll_LBxCept(0);
end;

//procedure TGUI.Timer_F_4Timer(Sender: TObject);
//begin
////    HideAll_LBxCept(0);
////    Timer_F_4.Enabled := False;
//end;

procedure TGUI.HideAll_LBxCept(const n: Integer);
var i: integer;
    LBx: TListBoxEx;
    SB: TSpeedButton;
begin
    for i := 1 to sb_frm_type_count do if i <> n then
    begin
      LBx := FindComponent('ListBoxEx_F_' + IntToStr(i)) as TListBoxEx;
      if (LBx <> nil) and LBx.Visible then
      begin
        ShowListBox(LBx, False);
        SB := FindComponent('sb_frm_type_' + IntToStr(i)) as TSpeedButton;
        //if (SB <> nil) and SB.Down then SB.Down := False;
      end;
    end;
    if ListBoxEx_F_12.Visible and (n < 12) then
      ShowListBox(ListBoxEx_F_12, False);
//    begin
//      if sb_frm_type_11.Down then sb_frm_type_11.Down := False;
//    end;
end;



// ListBoxEx_F_12
procedure TGUI.MakeLB12list(text: String);
var i, j: Integer;
    LBx: TListBoxEx;
begin
    text := UpperCase(Trim(text));
    ListBoxEx_F_12.Clear;
    for j := 1 to sb_frm_type_count do
    begin
      LBx := FindComponent('ListBoxEx_F_' + IntToStr(j)) as TListBoxEx;
      if LBx <> nil then
      begin
        for i := 0 to LBx.Items.Count - 1 do
          if Pos(text, UpperCase(StrLastWords(LBx.Items[i]))) > 0 then
            ListBoxEx_F_12.Items.Add(LBx.Items[i]);
      end;
    end;
end;

procedure TGUI.ListBoxEx_F_12MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbLeft then
    begin
      ListBoxEx_F_1MouseDown(Sender, Button, Shift, X, Y);
      ShowListBox(ListBoxEx_F_12, False);
    end;
end;

procedure TGUI.ComboEdit_F_1Change(Sender: TObject);
begin
    if bUserChangeF then      //update lbex11 for all possible formulanames, including text
    begin
      if Trim(ComboEdit_F_1.Text) > '' then
      begin
        MakeLB12list(ComboEdit_F_1.Text);
        if ListBoxEx_F_12.Items.Count > 0 then
        begin
          SetListBoxWidth(ListBoxEx_F_12);
          ListboxPopup(ListBoxEx_F_12, Point(ComboEdit_F_1.Left, ComboEdit_F_1.Top + ComboEdit_F_1.Height));
        end
        else ShowListBox(ListBoxEx_F_12, False);
      end;
    end;
end;

procedure TGUI.ComboEdit_F_1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case Key of
    13: begin   //return
          if ListBoxEx_F_12.Visible and (ListBoxEx_F_12.ItemIndex >= 0) then
            SelectFormula(StrLastWords(ListBoxEx_F_12.Items[ListBoxEx_F_12.ItemIndex]))
          else SelectFormula(ComboEdit_F_1.Text);
          ShowListBox(ListBoxEx_F_12, False);
        end;
    40: if ListBoxEx_F_12.Visible then  //down
          ListBoxEx_F_12.ItemIndex := Min(ListBoxEx_F_12.Items.Count - 1, ListBoxEx_F_12.ItemIndex + 1);
    38: if ListBoxEx_F_12.Visible then  //up
          ListBoxEx_F_12.ItemIndex := Max(0, ListBoxEx_F_12.ItemIndex - 1);
    //else ListBoxEx_F_12.Visible:=True;
    end;
end;

procedure TGUI.ComboEdit_F_1Exit(Sender: TObject);
begin
    ShowListBox(ListBoxEx_F_12, False);
end;

procedure TGUI.ListBoxEx_F_1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);  //odSelected
//                   SetEdit_M_16Text
var i: Integer;
sv: TSVec;

begin
  inherited;
    //paint background on formula status, +vote: green, -vote: red
    with (Control as TListBox).Canvas do  { draw on control canvas, not on the form }
    begin
    // Does not work well themes
//
      if odSelected in State then
        sv := ColToSVecNoScale(ColorToRGB(clHighLight))
      else
        sv := ColToSVecNoScale(ColorToRGB(clWindow));
      if not TryStrToInt(StrFirstWord((Control as TListBox).Items[Index]), i) then i := 1;
      if i <> 1 then
      begin
        if LengthOfSVec(sv) > 127 then
        begin
          if i > 1 then
          begin
            sv[1] := sv[1] - 25;
            sv[2] := sv[2] - 25;
          end else begin
            sv[0] := sv[0] - 25;
            sv[2] := sv[2] - 25;
          end;
        end else begin
          if i > 1 then
            sv[0] := sv[0] + 30
          else
            sv[1] := sv[1] + 30;
        end;
      end;
      Brush.Color := SVecToColNoScale(sv);
 // theme cut
      FillRect(Rect);       { clear the rectangle }
      TextOut(Rect.Left + 10, Rect.Top, StrLastWords((Control as TListBox).Items[Index]));  { display the text }
    end;
end;

procedure TGUI.SetListBoxWidth(LB: TListBoxEx);
var i, l: Integer;
begin
    for l := 0 to LB.Items.Count - 1 do
      if LB.Items[l][1] <> ' ' then LB.Items[l] := '    ' + LB.Items[l];
    l := sb_frm_type_1.Top + sb_frm_type_1.Height;
    if LB.Tag = 11 then l := ComboEdit_F_1.Top + ComboEdit_F_1.Height;
    LB.Height := Min(LB.Items.Count * LB.ItemHeight + 4, tc_frm.Height - l);
    LB.Font.Size := 8;
    LB.Canvas.Font := LB.Font;
    LB.Repaint;
    i := 0;
    for l := 0 to LB.Items.Count - 1 do i := Max(i, LB.Canvas.TextWidth(LB.Items[l]));
    if LB.Width <> i + 28 then LB.Width := i + 28;
end;

function TGUI.ListBoxIsFull(LB: TListBoxEx): LongBool;
begin
    Result := (LB.Items.Count + 1) * LB.ItemHeight >= MaxLBheight;
end;
*)
{$ENDREGION '========================================================================== > | Listbox Dilemma'}

{$REGION 'Optional text that appears when the code block is folded'}
//To collapse code
//
//To collapse a specific code block, click the minus (-) sign to the left of the code block.
//
//To collapse the nearest code block, you can:
// Press and hold Ctrl+Shift K+E, or
// Right-click the Code Editor and select Fold > Nearest.
//
//Using the Code Editor context menu command Fold, you can collapse specific categories of code blocks: that is, regions, XML DOC comments, and so on. For more information, see Code Editor Context Menu.
//
//To expand code
//
//To expand a specific collapsed code block, click the plus (+) sign to the left of the code block.
//
//To expand the nearest collapsed code block, you can:
// Press and hold Ctrl+Shift K+U, or
// Right-click the Code Editor and select Unfold > Nearest.
//
//To expand all the collapsed blocks, you can:
// Press and hold Ctrl+Shift K+A, or
// Right-click the Code Editor and select Unfold > All.

// ...





//update slider values
//get top index
//only for loop upto top index

//     fVType: array[0..13] of Integer;  AdjustSliderValType
//     fValue: array[0..13] of Double;   AdjustSliderValues
//     fRange: array[0..13] of Double;   AdjustSliderRange
//     fVZero: array[0..13] of Double;   AdjustSliderPos0Values



//procedure TGUI.GetDatatype(var B: Byte): String;
//begin
//    if CustomFormulas.isIntType(PTCustomFormula(PHCustomF[FOwner.FFormulaIndex]).byOptionTypes[FParamIndex]) then
//      Result := ptInteger
//    else
//      Result := ptFloat;
//    end;
//end;




//tabcontrol change with richedit
{
procedure TGUI.tc_frmChange(Sender: TObject);
// 1. save tab #    2. save sb #     3. save lb sel #
var i, TI: Integer;
    s,r,ot,ov:String;
    //TBeX: TTrackBar;
    EB: TEdit;
    LF: TLabel;
    bAltHybrid: LongBool;
    Formulaname: String;
begin
    SetTabNames;
    bAltHybrid := LabelItCount.Caption = 'IterationCount';
    TI := tc_frm.TabIndex;
    ExchangeFormulaRightBtn.Enabled := (TI = 0) or (bAltHybrid and (TI < 5));
    ExchangeFormulaLeftBtn.Enabled := (TI > 0);

    with HAddon.Formulas[TI] do
    begin
      bUserChangeF := False;
      if bAltHybrid then
      begin
        if iItCount < 0 then iItCount := 0;
        EditItCount.Text := IntToStr(iItCount);
      end
      else EditItCount.Text := FloatToStrSingle(PSingle(@iItCount)^);
      Formulaname := Trim(CustomFtoStr(CustomFname));
      cb_frm.ItemIndex := SetFormulaCBs(Formulaname); //SetFormulaCBs(Formulaname);
      EditJITFormulaItm.Enabled := Pos('JIT', Formulaname) = 1;

//      r:= #13#10;
//          s:= 'THeaderCustomAddon.Formulas';
//      s:= s+r+'iItCount:        '+IntToStr(iItCount);
//      s:= s+r+'iFnr:            '+IntToStr(iFnr);  //4    intern < 20 nr of formula, extern 20 or higher: CustomFname for identification
//      s:= s+r+'iOptionCount:    '+IntToStr(iOptionCount);
//      s:= s+r+'CustomFname[32]: '+Trim(CustomFtoStr(CustomFname));
//      //-----
//      for i := 0 to 15 do ot := ot+IntToStr(HAddon.Formulas[TI].byOptionType[i])+',';
//      s:= s+r+'byOptionType(s): '+ot;
//      s:= s+r+'dOptionValue(s): ';


      for i := 0 to 15 do
      begin
        EB := (FindComponent('Edit_F_' + IntToStr(i)) as TEdit);
        EB.Visible := iOptionCount > i;
        LF := (FindComponent('Label_F_' + IntToStr(i)) as TLabel);
        LF.Visible := iOptionCount > i;

        if iOptionCount > i then
        begin
          fValue[i] := dOptionValue[i];   // range check error
          if i <> FValues then
          begin
            FValues := i;
            //sb_frm_val_inClick(Sender);
            //B.Position := FloatToStr(dOptionValue[i]);
            EB.Text := FloatToStr(dOptionValue[i]);
            LF.Caption := PTCustomFormula(MHeader.PHCustomF[TI]).sOptionStrings[i];

//            s:= s+r+ PTCustomFormula(MHeader.PHCustomF[TI]).sOptionStrings[i]
//                   +'[' + IntToStr(i) + ']: ' + FloatToStr(dOptionValue[i]);

            if LF.Width>100 then
            begin
              repeat
              LF.Font.Height := LF.Font.Height-1;
              until (LF.Width<100) and (LF.Height<14);
            end
            else
              LF.Font.Height := -9;

          end;
        end;

      end;
//
//      RichEdit_F_1.Text:=s;                                                 //
//
      Panel_F_3.Visible := TabControl_F_2.TabIndex = 2;
      Check4DandInfo;
      if TabControl_F_2.TabIndex = 2 then
        CheckBox_F_1.Checked := TI in [HAddon.bHybOpt1 shr 4, HAddon.bHybOpt2 shr 8]
      else CheckBox_F_1.Checked := TI = (HAddon.bHybOpt1 shr 4);
      RichEdit_F_1.Visible := False;
      btn_frm_info_close.Visible := False;
      RadioGroup_F_1Click(Sender);  //DECombineCmb
      bUserChangeF := True;
    end;
end;
}


//from check4dandinfo

{procedure TGUI.Button_F_4Click(Sender: TObject);
var i, n, TI: Integer;   //Button_F_4 - Push to normalise the 3d vector length to 1.
    d: Double;
begin
    TI := tc_frm.TabIndex;
    with HAddon do
    begin
      i := FNormalPos(Formulas[TI]).X;
      d := Sqrt(Sqr(Formulas[TI].dOptionValue[i]) +
                Sqr(Formulas[TI].dOptionValue[i + 1]) +
                Sqr(Formulas[TI].dOptionValue[i + 2]));
      if d > 0 then d := 1 / d;
      for n := 0 to 2 do
        Formulas[TI].dOptionValue[i + n] := Formulas[TI].dOptionValue[i + n] * d;
    end;
    tc_frmChange(Sender);
end;}
{function TGUI.FNormalPos(Formula: THAformula): TPoint;
var i: Integer;
    L: TLabel;
begin
    Result := Point(-1, 0);
    i := 0;
    repeat
      if Formula.iOptionCount <= i then Break;
      L := (FindComponent('Label_F_' + IntToStr(i)) as TLabel);
      if Pos('NORMAL', UpperCase(L.Caption)) > 0 then
      begin
        Result.X := i;
        Result.Y := L.Top;
        Break;
      end;
      Inc(i);
    until i > 12;
end;}


(*
procedure TGUI.UpdateFormulaLabels(Findex: TPoint);
var i, i2: Integer;
    LF: TLabel;
    EB: TEdit;
    TBeX: TTrackBarEx;
    b: Boolean;
begin
    for i := 0 to 15 do  //in nav while visible  0-2
    begin
      //i2 := FValues + i;
      LF := FindComponent('Label_F_' + IntToStr(i)) as TLabel;  //name
      EB := FindComponent('Edit_F_' + IntToStr(i)) as TEdit;    //value
//      TBeX := FindComponent('TrackBarEx_N_' + IntToStr(i)) as TTrackBarEx;
      if (LF <> nil) and (EB <> nil) then //  and (TBeX <> nil)
      begin   //i2
        b := ( i < HAddOn.Formulas[Findex.X].iOptionCount) and
          (((HAddOn.bOptions1 and 3) = 1) or
          (HAddOn.Formulas[Findex.X].iItCount > 0));
        LF.Visible := b;
        EB.Visible := b;
//        TBeX.Visible := b;
        if b then
        begin
//          LF.Caption := PTCustomFormula(MHeader.PHCustomF[Findex.X]).sOptionStrings[i2];

//          if isIntType(fVType[i]) then
//            begin
//            LF.Hint := 'Integer -127/+128';
//            EB.Text := IntToStr(Round(fValue[i]));
//            RX.Min:=-127;
//            RX.Max:=128;
//            end
//          else if isAngleType(fVType[i]) then
//            begin
//            LF.Hint := 'Angle -/+ 180';
//            EB.Text := IntToStr(Round(fValue[i]));
//            RX.Min:=-180;
//            RX.Max:=180;
//            end
//          else
//            begin
//            LF.Hint := 'Float -/+ 5.000';
//            EB.Text := FloatToStrSingle(fValue[i]);
//            RX.Min:=-5;
//            RX.Max:=5;
//            end;

//          if not isIntType(fVType[i]) then          // [3 + i]
//            EB.Text := FloatToStrSingle(fValue[i])  //3 + i
//          else
//            EB.Text := IntToStr(Round(fValue[i]));  // 3 + i

        end;
      end;
      //CheckFormulaImageVis;
    end;
//    CheckFocus;
end;

*)

//procedure TGUI.tbxChange(Sender: TObject);
//var t, i: Integer;
//    TBeX: TTrackBarEx;
//    EB: TEdit;
//    d, r, ph, th, sp, cp, st, ct: Double;
//    bUpdateF: LongBool;
//    s: String;
//begin
//    if bUserChangeF then
//    begin
//      TBeX := Sender as TTrackBarEx;
//      t := TBeX.Tag;
//      //x0,x1,x2,x3 adjustments   16*640 ,640, 40, 40/16     slider: -60..60
//      d := (Image_M_1.Width * 16) shr (RG_Adj.ItemIndex * 4);
//      if isIntType(fVType[t]) then d := MinMaxCD(3, d * 0.5, 50);
//
////commented below
//      if fVType[t] = -5 then
//        fValue[t] := fVZero[t] * Power(3, TBeX.Position * fRange[t] / d)
//      else fValue[t] := fVZero[t] + TBeX.Position * fRange[t] / d;
//      bUpdateF := False;
////commented below
//
//      if TBeX.Visible then
//      begin  //put new value to navi haddon
//        //FocusedSlider := t - 3;
//        EB := FindComponent('Edit_F_' + IntToStr(t)) as TEdit;      //FocusedSlider
//        if EB <> nil then
//        begin
//          s := EB.Text;
////    Result.X := Max(0, Min(5, tc_frm.TabIndex));
////    Result.Y := Max(0, Min(15, FValues + iSlider));
//
//          UpdateFormulaLabels(FormulaIndex(t));                     //FocusedSlider
//          HAddon.Formulas[FormulaIndex(t).X].dOptionValue[FormulaIndex(t).Y] := fValue[t];//FocusedSlider
//          bUpdateF := s <> EB.Text;
//        end;
//      end;
////      if bUpdateF then NewCalc;
////      CheckFocus;
//    end;
//end;

//function TGUI.FormulaIndex(iSlider: Integer): TPoint;
//begin
//    Result.X := Max(0, Min(5, tc_frm.TabIndex));
//    Result.Y := Max(0, Min(15, iSlider)); //  FValues +
//end;

//procedure TGUI.tbxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var t: Integer;
//    TBeX: TTrackBarEx;
//begin
//    bUserChangeF := False;
//    TBeX := Sender as TTrackBarEx;
//    t := TBeX.Tag;
//    {if (t < 3) and CheckBox_N_8.Checked then
//      TPVec3D(@AdjustSliderPos0Values[0])^ := TPVec3D(@AdjustSliderValues[0])^
//    else}
//      fVZero[t] := fValue[t];
//    TBeX.Position := 0;
//    bUserChangeF := True;
////    CheckFocus;
//end;







//          LF.Font.Size := 8;
//          repeat
//          LF.Font.Size := LF.Font.Size-1;
//          until (LF.Width<100) and (LF.Height<14);
//          LF.Font.Height := -9;
//          repeat
//          LF.Font.Height := LF.Font.Height-1;
//          until (LF.Width<100) and (LF.Height<14);

//          if isIntType(fVType[i]) then
//            begin
//            LF.Hint := 'Integer -127/+128';
//            EB.Text := IntToStr(Round(fValue[i]));
//            RX.Min:=-127;
//            RX.Max:=128;
//            end
//          else if isAngleType(fVType[i]) then
//            begin
//            LF.Hint := 'Angle -/+ 180';
//            EB.Text := IntToStr(Round(fValue[i]));
//            RX.Min:=-180;
//            RX.Max:=180;
//            end
//          else
//            begin
//            LF.Hint := 'Float -/+ 5.000';
//            EB.Text := FloatToStrSingle(fValue[i]);
//            RX.Min:=-5;
//            RX.Max:=5;
//            end;



            //while LF.Width>100 do LF.Font.Height := LF.Font.Height-1;
//            if isIntType(PTCustomFormula(MHeader.PHCustomF[t]).byOptionTypes[i]) then
//              begin
//              L.Hint := L.Caption+r+'Integer -127/+128';
//              B.Min:=-127;
//              B.Max:=128;
//              end
//            else if isAngleType(PTCustomFormula(MHeader.PHCustomF[t]).byOptionTypes[i]) then
//              begin
//              L.Hint := L.Caption+r+'Angle -/+ 180';
//              B.Min:=-180;
//              B.Max:=180;
//              end
//            else
//              begin
//              L.Hint := L.Caption+r+'Float -/+ 5.000';
//              B.Min:=-5;
//              B.Max:=5;
//              end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// from tbcChange
      {if (t < 3) and cb_julia_mode.Checked then //julia, sphere coords
      begin
        r := MaxCD(1e-10, LengthOfVec(TPVec3D(@fVZero[0])^));
        ph := ArcSinSafe(fVZero[2] / r);
        th := ArcTan2(fVZero[1], NonZero(fVZero[0]));

        if t = 0 then
        begin  //R scale
          if r < 1e-9 then fVZero[0] := 1e-9 else
          begin
            d := MaxCD(1e-10, r + RG_Adj.Position / d) / r;
            TPVec3D(@fValue[0])^ := ScaleVector(TPVec3D(@fVZero[0])^, d);
          end;
        end

        else if t = 1 then
        begin  //(-)  x<->y rotate
          r := Sqrt(Sqr(fVZero[0]) + Sqr(fVZero[1]));
          d := th + RG_Adj.Position * 10 / d;
          SinCosD(d, st, ct);
          fValue[0] := ct * r;
          fValue[1] := st * r;
        end else begin  //(|) sqrt(xx+yy)<->z rotate
          d := ph + RG_Adj.Position * 4 / d;
          SinCosD(d, sp, cp);
          SinCosD(th, st, ct);
          fValue[0] := cp * ct * r;
          fValue[1] := cp * st * r;
          fValue[2] := sp * r;
        end;
        TPVec3D(@MHeader.dJx)^ := TPVec3D(@fValue[0])^;
      end}
//      else if fVType[t] = -5 then



      {if t < 3 then
      begin
        TPVec3D(@MHeader.dJx)^[t] := AdjustSliderValues[t];
        UpdateJuliaLabels;
        bUpdateF := MHeader.bIsJulia > 0;
      end
      else if t in [6..8] then
      begin
        TPVec3D(@MHeader.dXWrot)^[t - 6] := AdjustSliderValues[t];
        Update4dRotLabels;
        bUpdateF := True;
      end
      else if t in [9..13] then
      begin
        FocusedSlider := t - 6;
        LV := FindComponent('Label_N_V' + IntToStr(FocusedSlider)) as TLabel;
        if LV <> nil then
        begin
          s := LV.Caption;
          if t = 9 then
          begin
            i := Round(Min0MaxCD(AdjustSliderValues[9], 255));
            if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
              MHeader.bDFogIt := i
            else
            begin
              MHeader.bColorOnIt := i;
              Dec(i);
            end;
            AdjustSliderValues[9] := i;
            LV.Caption := IntToStr(i);
          end
          else if t = 10 then
          begin
            AdjustSliderValues[10] := MaxCD(0, AdjustSliderValues[10]);
            MHeader.RStop := AdjustSliderValues[10];
            LV.Caption := FloatToStrSingle(MHeader.RStop);
          end
          else if t = 11 then
          begin
            AdjustSliderValues[11] := Min0MaxCD(AdjustSliderValues[11], 100);
            MHeader.sDEcombS := AdjustSliderValues[11];
            LV.Caption := FloatToStrSingle(MHeader.sDEcombS);
          end
          else if t = 12 then
          begin
            AdjustSliderValues[12] := MinMaxCD(0.1, AdjustSliderValues[12], 300);
            MHeader.sDEstop := AdjustSliderValues[12];
            LV.Caption := FloatToStrSingle(MHeader.sDEstop);
            DEstopChanged := True;
          end
          else if t = 13 then
          begin
            AdjustSliderValues[13] := MinMaxCD(1, AdjustSliderValues[13], 2000);
            MHeader.Iterations := Round(AdjustSliderValues[13]);
            LV.Caption := IntToStr(MHeader.Iterations);
          end;
          bUpdateF := s <> LV.Caption;
        end;
      end }
//      else if RS.Visible then

//------------------------------------------------------------------------------
//    procedure JvxSDblClick(Sender: TObject);
//    procedure EventEditClick(Sender: TObject);
//    procedure EventSciEditDblClick(Sender: TObject);
//    procedure EventSciEditMouseMove(Sender:TObject;Shift:TShiftState;X,Y:Integer);
//    procedure EventSciEditMouseLeave(Sender: TObject);
//    procedure EventSciEditMouseEnter(Sender: TObject);
//    procedure EventSciEditMouseUp(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
//    procedure EventSciEditMouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);


//    procedure JvTBChange(Sender: TObject);
//    procedure JvTBChanged(Sender: TObject);
//    procedure JvTBMouseLeave(Sender: TObject);
//    procedure JvTBMouseEnter(Sender: TObject);
//    procedure JvTBMouseUp(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
//    procedure JvTBMouseDown(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
//
//    procedure JvTClick(Sender: TObject);
//    procedure JvTChangeValue(Sender: TObject);
//    procedure JvTMouseUp(Sender: TObject;
//      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure JvTMouseDown(Sender: TObject;
//      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure cbtxt_FClick(Sender: TObject);
//------------------------------------------------------------------------------

{procedure TGUI.cbtxt_FClick(Sender: TObject);
var e:TEdit;i:Integer;
begin
  for i := 0 to 15 do
  if not cbtxt_F.Checked then
    begin
      e := (FindComponent('Edit_F_' + IntToStr(i)) as TEdit);
      e.Ctl3D:=False;
      e.BorderStyle:=bsSingle;
      e.ParentColor:=False;
      e.Alignment:=taLeftJustify;
//      JvTB.Visible:=False;
    end
  else
     begin
      e := (FindComponent('Edit_F_' + IntToStr(i)) as TEdit);
      e.Ctl3D:=True;
      e.BorderStyle:=bsNone;
      e.ParentColor:=True;
      e.Alignment:=taCenter;
//      JvTB.Visible:=False;
    end;
end;}



//Round(HAddon.Formulas[X].dOptionValue[Y]);
{procedure TGUI.EventEditClick(Sender: TObject);
var e: TEdit;
//    s: String;
    f: Integer; // formula 0-5
    o: Integer; // formula option 0-15
    d: Double;
    t: Integer;

begin  //borderstyle/parentcolor/Alignment
  e := Sender as TEdit;
//  s := e.Text;
  //x := StrToInt(s);
  f := tc_frm.TabIndex;
  o := e.Tag;
  JvTB.Tag:=e.Tag;
  d := HAddon.Formulas[f].dOptionValue[o];

 // JvTB.Visible:=False;
  e.Ctl3D:=False;
  if o < 15 then
    //with e do begin Height:=Tag; BevelKind:=bvNone/flat; BorderStyle:=bsSingle; Tag:=0 end;
    if not e.Ctl3D then
      begin

        if isIntType(PTCustomFormula(MHeader.PHCustomF[f]).byOptionTypes[o]) then
          begin        //L.Hint := 'Integer'
            JvTB.Min:=-127;
            JvTB.Max:=128;
            JvTB.Position:=Round(d);//IntToStr(s);
          end

        else if isAngleType(PTCustomFormula(MHeader.PHCustomF[f]).byOptionTypes[o]) then
          begin        //L.Hint := 'Angle'
            JvTB.Min:=-179;
            JvTB.Max:=180;
            JvTB.Position:=Round(d);//IntToStr(s);
          end

        else
          begin        //L.Hint := 'Float'
            JvTB.Min:=-10000;
            JvTB.Max:=10000;
            JvTB.Position:=Round(d);//Round(d)
          end;

        //e.Ctl3D:=False;
        //e.Alignment:=taCenter/LeftJustify/RightJustify;
//        JvTB.Visible:=True;
//        JvTB.Top:=e.Top;
        //JvTB.Left:=se.left;
        JvTB.Tag:=o ;
        //e.Ctl3D:=True;
        e.Ctl3D:=True;
      end;
end;}


{procedure TGUI.JvTBChange(Sender: TObject);
var e: TEdit;
    s: String;
    f: Integer; // formula 0-5
    o: Integer; // formula option 0-15
    t: Integer;
    d: Double;
//    B: array[0..15] of Byte;
begin
  bUserChangeF := False;

    f := tc_frm.TabIndex;
    o := JvTB.Tag;
    d := HAddon.Formulas[f].dOptionValue[o];
    e := (FindComponent('Edit_F_' + IntToStr(o)) as TEdit);
//    s := e.Text;
//    t := e.Tag;
//    B := PTCustomFormula(MHeader.PHCustomF[f]).byOptionTypes[o];
    //e := (FindComponent('Edit_F_' + IntToStr(JvTB.Tag)) as TEdit);

    if not
      isIntType(PTCustomFormula(MHeader.PHCustomF[f]).byOptionTypes[o])
    or not
      isAngleType(PTCustomFormula(MHeader.PHCustomF[f]).byOptionTypes[o]) then
//    begin
//    p:= JvTB.Position;
//    v:= p/10000;
      e.Text:= IntToStr(JvTB.Position div 10000)
//    end
    else
    e.Text:= IntToStr(JvTB.Position);
    HAddon.Formulas[f].dOptionValue[o]:=StrToFloatK(e.Text);

  bUserChangeF := True;
end;}

//------------------------------------------------------------------------------


{
procedure TGUI.ScaleRclip(s: Single);
var d: Double;
begin
//    if PPFormCreated and cb_DoF_DEstop.Checked then
//    begin
//      if StrToFloatKtry(PostProForm.Edit_P_2.Text, d) then
//        PostProForm.Edit_P_2.Text := FloatToStrSingle(d * s)
//      else
//        PostProForm.Edit_P_2.Text := FloatToStrSingle(MHeader.sDOFclipR * s);
//    end;
end;
}

{function AniFileAlreadyExists(var s: String): LongBool;
var sa: String;
begin
//    s := IntToStr(AnimationForm.AniFileIndex);
//    if AnimationForm.AniStereoMode then
//    begin
//      if AnimationForm.AniRightImage then sa := AnimationForm.AniProjectName + 'Right'
//                                     else sa := AnimationForm.AniProjectName + 'Left';
//    end
//    else sa := AnimationForm.AniProjectName;
//    s := AnimationForm.AniOutputFolder + sa + StringOfChar('0', 6 - Length(s)) + s;
//    case AnimationForm.AniOutputFormat of
//      0:  s := ChangeFileExt(s, '.bmp');
//      1:  s := ChangeFileExt(s, '.png');
//      2:  s := ChangeFileExt(s, '.jpg');
//    end;
//    Result := FileExists(s);
end;}

{procedure TGUI.FormResize(Sender: TObject);
begin
//    if LAFormCreated then
//    begin
//      if FormsSticky[1] = 1 then
//        GUILight.SetBounds(Left + Width, Top, GUILight.Width,
//                                  GUILight.Height)
//      else if FormsSticky[1] = 2 then
//        GUILight.SetBounds(Left - GUILight.Width, Top,
//                                 GUILight.Width, GUILight.Height);
//    end;

//    if FGUIFormCreated then
//    begin
//      if FormsSticky[0] = 1 then
//        GUIFormula.SetBounds(Left + Width, Top, GUIFormula.Width,
//                                  GUIFormula.Height)
//      else if FormsSticky[0] = 2 then
//        GUIFormula.SetBounds(Left - GUIFormula.Width, Top,
//                                 GUIFormula.Width, GUIFormula.Height);
//    end;

//    if AFormCreated and (bAniFormStick = 1) then
//      AnimationForm.SetBounds(Left, Top + Height, AnimationForm.Width,
//                              AnimationForm.Height);

//    if PPFormCreated then
//    begin
//      if FormsSticky[2] = 1 then
//        PostProForm.SetBounds(Left + Width, Top, PostProForm.Width,
//                                  PostProForm.Height)
//      else if FormsSticky[2] = 2 then
//        PostProForm.SetBounds(Left - PostProForm.Width, Top,
//                                 PostProForm.Width, PostProForm.Height);
//    end;

    //Memo_M_1.Height := Min(240, Max(80, Panel_M_1.Height - Memo_M_1.Top - Panel_M_4.Height - 1));
end;}

{procedure TGUI.NewJITFormulaItmClick(Sender: TObject);
//var
//  JITFormulaEditorForm: TJITFormulaEditorForm;
begin
//  JITFormulaEditorForm := TJITFormulaEditorForm.Create(Self);
//  try
//    JITFormulaEditorForm.EditMode := emNew;
//    if JITFormulaEditorForm.ShowModal = mrOK then begin
//      LoadFormulaNames;
//    end;
//  finally
//    JITFormulaEditorForm.Free;
//  end;
end;}

{procedure TGUI.EditJITFormulaItmClick(Sender: TObject);
//var
//  Formulaname: String;
//  JITFormulaEditorForm: TJITFormulaEditorForm;
begin
//  JITFormulaEditorForm := TJITFormulaEditorForm.Create(Self);
//  try
//    JITFormulaEditorForm.EditMode := emEdit;
//    Formulaname := cb_frm.Items[cb_frm.ItemIndex];
//    JITFormulaEditorForm.Formulaname := Formulaname;
//    if JITFormulaEditorForm.ShowModal = mrOk then begin
//      LoadFormulaNames;
//      SelectFormula( Formulaname );
//    end;
//  finally
//    JITFormulaEditorForm.Free;
//  end;
end;}

{procedure TGUI.DoSaveAniImage;
//var s, sa, si: String;
begin
//    SaveAniImage := False;  //do the correct scaling...
//    if ImageScale <> AnimationForm.AniScale then
//      UpdateAndScaleImageFull(AnimationForm.AniScale);
//    Image_M_1.Repaint;
//    si := IntToStrL(AnimationForm.AniFileIndex, 6);
//    if AnimationForm.AniStereoMode then
//    begin
//      if AnimationForm.AniRightImage then sa := AnimationForm.AniProjectName + 'Right'
//                                     else sa := AnimationForm.AniProjectName + 'Left';
//    end
//    else sa := AnimationForm.AniProjectName;
//    s := AnimationForm.AniOutputFolder + sa + si;
//    if Assigned(AnimationForm.AniOutFile) then
//    begin
//      case AnimationForm.AniOutputFormat of
//        0:  SaveBMP2FStream(s, Image_M_1.Picture.Bitmap, pf24bit, AnimationForm.AniOutFile);
//        1:  SavePNG2FStream(s, Image_M_1.Picture.Bitmap, AnimationForm.AniOutFile);
//        2:  SaveJPEGfromBMP2FStream(s, Image_M_1.Picture.Bitmap, StrToIntTrim(ed_jpg_qual.Text), AnimationForm.AniOutFile);
//      end;
//      AnimationForm.CloseOutPutStream;
//    end else
//    case AnimationForm.AniOutputFormat of
//      0:  SaveBMP(s, Image_M_1.Picture.Bitmap, pf24bit);
//      1:  SavePNG(s, Image_M_1.Picture.Bitmap, cb_par_in_png.Checked);
//      2:  SaveJPEGfromBMP(s, Image_M_1.Picture.Bitmap, StrToIntTrim(ed_jpg_qual.Text));
//    end;
//    if AnimationForm.CheckBox7.Checked then
//    begin
//      s := AnimationForm.AniOutputFolder + 'ZBuf ' + sa + si;
//      SaveZBuf(s, 0);
//    end;
//    AnimationForm.NextSubFrame;
end;}

{procedure TGUI.DoSaveTileImage;
//var s: String;
begin
//    SaveTileImage := False;    //do the correct scaling...
//    if ImageScale <> TilingForm.BigRenderData.brDownScale then
//      UpdateAndScaleImageFull(TilingForm.BigRenderData.brDownScale);
//    Image_M_1.Repaint;
//    with TilingForm do
//    begin
//      s := SaveDirectory + ProjectName + MakeFilePointIndizes(brActTile, 2, BigRenderData);
//      if not SysUtils.DirectoryExists(SaveDirectory) then
//        if not CreateDir(SaveDirectory) then
//          ShowMessage('The directory:' + #13#10 + SaveDirectory + #13#10 + 'could not be created!');
//
//      Label_M_23.Caption := Label_M_23.Caption; //sharpness
//      SaveImageO(BigRenderData.brOutputType, s);
//
//      if BigRenderData.brSaveM3I then SaveM3I(s, CheckBox_M_16.Checked);
//
//      if BigRenderData.brSaveZBuf then
//      begin
//        s := SaveDirectory + 'ZBuf ' + ProjectName + MakeFilePointIndizes(brActTile, 2, BigRenderData);
//        SaveZBuf(s, 0);
//      end;
//      NextTile;
//    end;
end;}

{$ENDREGION}

end.












