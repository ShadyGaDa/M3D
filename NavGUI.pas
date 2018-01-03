unit NavGUI;

interface

{$REGION '============================================================================= > | WIKI'}


{     Characteristics
        Fractal dimensions
          Assouad Box-counting,
          Correlation
          Hausdorff Packing
          Topological
        Recursion
        Self-similarity
}

{     Iterated function system
        In mathematics, iterated function systems (IFSs) are a method of constructing fractals;
         the resulting fractals are often self-similar.

        IFS fractals, as they are normally called, can be of any number of dimensions,
         but are commonly computed and drawn in 2D.
        The fractal is made up of the union of several copies of itself,
         each copy being transformed by a function (hence "function system").
        The canonical example is the Sierpinski gasket, also called the Sierpinski triangle.
        The functions are normally contractive,
         which means they bring points closer together and make shapes smaller.
        Hence, the shape of an IFS fractal is made up of several possibly-overlapping smaller copies of itself,
         each of which is also made up of copies of itself, ad infinitum.
        This is the source of its self-similar fractal nature.

     Iterated function system
        Barnsley fern,
        Cantor set,
        Dragon curve,
        Koch snowflake,
        Menger sponge,
        Sierpinski carpet,
        Sierpinski triangle,
        Space-filling curve, (L-System)
        T-square.
}

{     Escape-time fractals
        Burning Ship fractal,
        Julia set (Filled),
        Lyapunov fractal,
        Mandelbrot set,
        Newton fractal.
}

{     Random fractals
        Brownian motion,
        Brownian tree,
        Diffusion-limited aggregation,
        Fractal landscape,
        Lévy flight,
        Percolation theory,
        Self-avoiding walk.
}

{$ENDREGION '========================================================================== > | WIKI'}

{$REGION '============================================================================= > | USES'}

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.Generics.Collections,
  System.ImageList,
  //------------------
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.Tabs,
  Vcl.DockTabSet,
  Vcl.Mask,
  //-------------------
  JvgLabel,
  JvExControls,
  JvExExtCtrls,
  JvRadioGroup,
  JvExComCtrls,
  JvComCtrls,
  JvLabel,
  JvTracker,
  JvExMask,
  JvSpin,
  //------------------
  TrackBarEx,
  //SciEdit,
  Math3D,
//FormulaClass,
//formulas,
  TypeDefinitions;

{$ENDREGION '========================================================================== > | USES'}

  procedure FlipI(var i1, i2: Integer);
  procedure ModRotPoint(var Header: TMandHeader10);

{$REGION '============================================================================= > | ThreadUtils'}
{ThreadUtils}
//public
  function GetNewThreadStatRecord(var CTSid: Integer; Count, HandleTyp: Integer; MessageHwnd: HWND): TPCalcThreadStats;
  function GetActiveThreadCount(CTSid: Integer): Integer;
//private
  procedure GetMinY(CTSid: Integer; var yy: Double; var yimi, ymin, Tcount: Integer);
  function GetPCTSfromID(CTSid: Integer): TPCalcThreadStats;
  function GetNextFreeIndex(var FreeCI: Integer): LongBool;
  function CTSarrayIsFree(CTSai: Integer): LongBool;
  function GetIndexFromID(CTSid: Integer): Integer;

{$ENDREGION '========================================================================== > | ThreadUtils'}

type

  TNaviCalcThread = class(TThread)

{$REGION '============================================================================= > | TNaviCalcThread'}

  private
    Iteration3Dext: TIteration3Dext;
    Light3rec: TsiLight3;   //12bytes
    MCTparas: TMCTparameter;
    NaviLightVals: TLightValsNavi;
    procedure DoBinSearchS(var DE, RLastStepWidth, LastDE: Single);
    procedure CalculateNormals(var NN: Single);
    procedure CalcNanglesForCut(CutPlane: Integer; Zdif: Double);
    procedure DoColor;
    procedure CalcPixelColorNavi(SL: PCardinal; Npix, SLwidMNpix: Integer);
  //  procedure maxLengthToCutPlane(var dLength: Double; var itmp: Integer; vPos: TPPos3D);
  public
  protected
    procedure Execute; override;

{$ENDREGION '========================================================================== > | TNaviCalcThread'}

end;

  TGUINav = class(TForm)

{$REGION '============================================================================= > | TGUINav'}

{$REGION '============================================================================= > | CONTROLS'}

    Bevel1: TBevel;
    btn_min_dist: TButton;
    cb_zoom: TCheckBox;
    cb_azerty: TCheckBox;
    cb_HiQ: TCheckBox;
    cb_ani_key: TCheckBox;
    cb_coords: TCheckBox;
    ChooseOption1: TMenuItem;
    Doubleclicktochangethenavimode1: TMenuItem;
    Edit_N_1: TEdit;
    Edit_N_2: TEdit;
    eFOV: TEdit;
    eFarPlane: TEdit;
    Edit_N_6: TEdit;
    Image_N_1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image_N_6: TImage;
    ImageList_N_1: TImageList;
    Label_N_1: TLabel;
    Label_N_10: TLabel;
    Label_N_11: TLabel;
    Label_N_12: TLabel;
    Label_N_13: TLabel;
    Label_N_14: TLabel;
    Label_N_15: TLabel;
    Label_N_16: TLabel;
    Label_N_17: TLabel;
    Label_N_18: TLabel;
    Label_N_19: TLabel;
    Label_N_2: TLabel;
    Label_N_20: TLabel;
    Label_N_21: TLabel;
    Label_N_22: TLabel;
    Label_N_23: TLabel;
    Label_N_24: TLabel;
    Label_N_26: TLabel;
    Label_N_27: TLabel;
    Label_N_28: TLabel;
    Label_N_29: TLabel;
    Label_N_3: TLabel;
    Label_N_30: TLabel;
    Label_N_31: TLabel;
    Label_N_32: TLabel;
    Label_N_33: TLabel;
    Label_N_34: TLabel;
    Label_N_35: TLabel;
    Label_N_36: TLabel;
    Label_N_37: TLabel;
    //lmd: TLabel;
    Label_N_4: TLabel;
    Label_N_5: TLabel;
    Label_N_6: TLabel;
    Label_N_7: TLabel;
    Label_N_8: TLabel;
    Label_N_9: TLabel;
    N1: TMenuItem;
    pn_main: TPanel;
    pn_bottom: TPanel;
    PopupMenuNav: TPopupMenu;
    rg_cam: TRadioGroup;
    Singleclicktochangethenavimode1: TMenuItem;
    SpeedButton_N_1: TSpeedButton;
    SpeedButton_N_10: TSpeedButton;
    SpeedButton_N_12: TSpeedButton;
    SpeedButton_N_13: TSpeedButton;
    sb_light_in: TSpeedButton;
    sb_frm_in: TSpeedButton;
    sb_bottom: TSpeedButton;
    sb_ani_key: TSpeedButton;
    sb_light_preset_1: TSpeedButton;
    SpeedButton_N_2: TSpeedButton;
    sb_light_preset_2: TSpeedButton;
    sb_light_preset_3: TSpeedButton;
    sb_light_preset: TSpeedButton;
    sb_right: TSpeedButton;
    SpeedButton_N_3: TSpeedButton;
    SpeedButton_N_4: TSpeedButton;
    SpeedButton_N_5: TSpeedButton;
    SpeedButton_N_6: TSpeedButton;
    SpeedButton_N_7: TSpeedButton;
    SpeedButton_N_8: TSpeedButton;
    SpeedButton_N_9: TSpeedButton;
    sb_par_in: TSpeedButton;
    sb_par_out: TSpeedButton;
    Timer_N_1: TTimer;
    tb_light: TTrackBar;
    UpDown3: TUpDown;
    nav: TPanel;
    cb_polarity: TCheckBox;
    sb_save_JPG: TSpeedButton;
    SaveDialog_N_4: TSaveDialog;
    SaveDialog_N_2: TSaveDialog;
    sb_save_M3P: TSpeedButton;
    OpenDialog_N_1: TOpenDialog;
    sb_load_M3P: TSpeedButton;
    lbl_Active: TLabel;
    btn_STOP: TButton;
    EventEdit: TEdit;
    pn_tmp: TPanel;
    pn_frm_mid2: TPanel;
    lb_fv_0: TJvLabel;
    lb_fn_0: TJvgLabel;
    lb_fn_1: TJvgLabel;
    lb_fv_1: TJvLabel;
    lb_fn_2: TJvgLabel;
    lb_fv_2: TJvLabel;
    lb_fn_3: TJvgLabel;
    lb_fv_3: TJvLabel;
    lb_fn_4: TJvgLabel;
    lb_fv_4: TJvLabel;
    lb_fv_5: TJvLabel;
    lb_fn_5: TJvgLabel;
    lb_fn_6: TJvgLabel;
    lb_fv_6: TJvLabel;
    lb_fn_7: TJvgLabel;
    lb_fv_7: TJvLabel;
    lb_fn_8: TJvgLabel;
    lb_fv_8: TJvLabel;
    lb_fn_9: TJvgLabel;
    lb_fv_9: TJvLabel;
    lb_fv_10: TJvLabel;
    lb_fn_10: TJvgLabel;
    lb_fn_11: TJvgLabel;
    lb_fv_11: TJvLabel;
    lb_fn_12: TJvgLabel;
    lb_fv_12: TJvLabel;
    lb_fn_13: TJvgLabel;
    lb_fv_13: TJvLabel;
    lb_fn_14: TJvgLabel;
    lb_fv_14: TJvLabel;
    lb_fn_15: TJvgLabel;
    lb_fv_15: TJvLabel;
    tb_fv_0: TJvTracker;
    tb_fv_1: TJvTracker;
    tb_fv_2: TJvTracker;
    tb_fv_3: TJvTracker;
    tb_fv_4: TJvTracker;
    tb_fv_5: TJvTracker;
    tb_fv_6: TJvTracker;
    tb_fv_7: TJvTracker;
    tb_fv_8: TJvTracker;
    tb_fv_9: TJvTracker;
    tb_fv_10: TJvTracker;
    tb_fv_11: TJvTracker;
    tb_fv_12: TJvTracker;
    tb_fv_13: TJvTracker;
    tb_fv_14: TJvTracker;
    tb_fv_15: TJvTracker;
    sbsl2t: TSpeedButton;
    sb_light_preset_4: TSpeedButton;
    sb_light_preset_5: TSpeedButton;
    sb_light_preset_6: TSpeedButton;
    btn_kill: TButton;
    EventDummi: TPanel;
    sb_fp_fov: TSpeedButton;
    pn_misc_old: TPanel;
    Label_N_V0: TLabel;
    Label_N_V1: TLabel;
    Label_N_48: TLabel;
    Label_N_V2: TLabel;
    Label_N_53: TLabel;
    Label_N_V3: TLabel;
    Label_N_46: TLabel;
    Label_N_V4: TLabel;
    Label_N_55: TLabel;
    TrackBarEx_N_10: TTrackBarEx;
    TrackBarEx_N_11: TTrackBarEx;
    TrackBarEx_N_12: TTrackBarEx;
    TrackBarEx_N_13: TTrackBarEx;
    TrackBarEx_N_14: TTrackBarEx;
    pn_rot: TPanel;
    Label_M_53: TLabel;
    Label_M_54: TLabel;
    Label_M_55: TLabel;
    Label_M_56: TLabel;
    btn_SetRotation: TButton;
    btn_ResetRotation: TButton;
    eXrot: TEdit;
    eYrot: TEdit;
    eZrot: TEdit;
    scb_right: TScrollBox;
    gb_SizeGroup: TGroupBox;
    DecreaseNaviSizeBtn: TSpeedButton;
    IncreaseNaviSizeBtn: TSpeedButton;
    NaviSizeCmb: TComboBox;
    rg_Adj: TRadioGroup;
    pn_julia: TPanel;
    Label_N_41: TLabel;
    Label_N_39: TLabel;
    Label_N_40: TLabel;
    sb_julia_in: TSpeedButton;
    sb_julia_out: TSpeedButton;
    Image5: TImage;
    cb_julia_mode_sphere: TCheckBox;
    cb_julia_mode: TCheckBox;
    TrackBarEx_N_2: TTrackBarEx;
    TrackBarEx_N_3: TTrackBarEx;
    TrackBarEx_N_1: TTrackBarEx;
    pn_formula: TPanel;
    pn_frm_top: TPanel;
    jvrg_ftype: TJvRadioGroup;
    pn_frm_top2: TPanel;
    sb_frm_up: TSpeedButton;
    sb_frm_dn: TSpeedButton;
    lb_fname: TLabel;
    lb_frm_design: TLabel;
    lb_frm_it: TLabel;
    cb_frm: TComboBox;
    ud_frm_it: TUpDown;
    pn_frm_btm: TPanel;
    sb_frm_val_in: TSpeedButton;
    sb_frm_val_out: TSpeedButton;
    sb_frm_out: TSpeedButton;
    pn_frm_mid: TPanel;
    tc_frm: TTabControl;
    lb_frm_tc: TLabel;
    pn_4d: TPanel;
    Label_N_52: TLabel;
    Label_N_50: TLabel;
    Label_N_51: TLabel;
    sb_4d_in: TSpeedButton;
    sb_4d_out: TSpeedButton;
    TrackBarEx_N_7: TTrackBarEx;
    TrackBarEx_N_8: TTrackBarEx;
    TrackBarEx_N_9: TTrackBarEx;
    pn_pos: TPanel;
    Label_M_9: TLabel;
    Label_M_10: TLabel;
    SpeedButton_M_32: TSpeedButton;
    SpeedButton_M_33: TSpeedButton;
    SpeedButton_M_34: TSpeedButton;
    sb_midpoint: TSpeedButton;
    sb_reset_pos: TSpeedButton;
    Label_M_5: TLabel;
    eXmid: TEdit;
    eYmid: TEdit;
    eZmid: TEdit;
    eZstart: TEdit;
    eZend: TEdit;
    eZoom: TJvSpinEdit;
    lmdf: TJvLabel;
    tb: TJvTracker;
    tbm_old: TTrackBarEx;
    lmdm_old: TLabel;
    lmd4d: TLabel;
    tb4d: TTrackBarEx;
    lmd: TLabel;
    tbx: TTrackBarEx;
    pn_misc: TPanel;
    sb_misc_in: TSpeedButton;
    sb_misc_out: TSpeedButton;
    lb_misc4: TJvgLabel;
    tb_mi_4: TJvTracker;
    lb_mi_4: TJvLabel;
    Label_N_38: TLabel;
    sb_fog_or_color: TSpeedButton;
    ud_fog: TUpDown;
    tb_mi_0: TJvTracker;
    lb_mi_0: TJvLabel;
    tb_mi_1: TJvTracker;
    lb_misc1: TJvgLabel;
    lb_mi_1: TJvLabel;
    tb_mi_2: TJvTracker;
    lb_misc2: TJvgLabel;
    lb_mi_2: TJvLabel;
    tb_mi_3: TJvTracker;
    lb_misc3: TJvgLabel;
    lb_mi_3: TJvLabel;
    tbm: TJvTracker;
    lmdm: TJvLabel;

{$ENDREGION '========================================================================== > | CONTROLS'}

{$REGION '============================================================================= > | CONTROL PROCEDURES'}

    procedure navClick(Sender: TObject);
    procedure btn_min_distClick(Sender: TObject);
//    procedure Button_N_2Click(Sender: TObject);
//    procedure Button_N_3Click(Sender: TObject);
//    procedure Button_N_4Click(Sender: TObject);
//    procedure Button_N_5Click(Sender: TObject);
    procedure cb_zoomClick(Sender: TObject);
    procedure cb_azertyClick(Sender: TObject);
    procedure cb_HiQClick(Sender: TObject);
    procedure cb_ani_keyClick(Sender: TObject);
    procedure cb_coordsClick(Sender: TObject);
    procedure cb_julia_modeClick(Sender: TObject);
    procedure DecreaseNaviSizeBtnClick(Sender: TObject);
    procedure Doubleclicktochangethenavimode1Click(Sender: TObject);
    procedure EventEditChange(Sender: TObject);  //  Edit_N_1
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Image_N_1Click(Sender: TObject);
    procedure Image_N_1DblClick(Sender: TObject);
    procedure Image_N_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image_N_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure IncreaseNaviSizeBtnClick(Sender: TObject);
    procedure lmdMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NaviSizeCmbChange(Sender: TObject);
    procedure pn_mainClick(Sender: TObject);
//    procedure Panel_N_6Click(Sender: TObject);
    procedure rg_camClick(Sender: TObject);
    procedure tbxChange(Sender: TObject);
    procedure tbxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    //procedure scr_frmChange(Sender: TObject);
    procedure Singleclicktochangethenavimode1Click(Sender: TObject);
    procedure sb_light_inClick(Sender: TObject);
    procedure sb_frm_inClick(Sender: TObject);
    procedure sb_bottomClick(Sender: TObject);
    procedure sb_ani_keyClick(Sender: TObject);
    procedure sb_light_preset_1Click(Sender: TObject);
//    procedure SpeedButton_N_1Click(Sender: TObject);
    procedure sb_light_presetClick(Sender: TObject);
    procedure sb_rightClick(Sender: TObject);
    procedure sb_julia_inClick(Sender: TObject);
    procedure sb_julia_outClick(Sender: TObject);
    //procedure sb_frm_val_inClick(Sender: TObject);
    //procedure sb_frm_val_outClick(Sender: TObject);
    //procedure sb_frm_outClick(Sender: TObject);
    procedure sb_4d_inClick(Sender: TObject);
    procedure sb_4d_outClick(Sender: TObject);
    procedure sb_misc_inClick(Sender: TObject);
    procedure sb_misc_outClick(Sender: TObject);
    procedure sb_fog_or_colorClick(Sender: TObject);
    procedure sb_par_inClick(Sender: TObject);
    procedure sb_par_outClick(Sender: TObject);
    procedure SpinButton1Down;
    procedure SpinButton1Up;
    //procedure ud_frmClick(Sender: TObject; Button: TUDBtnType);
    procedure Timer_N_1Timer(Sender: TObject);
    procedure tb_lightChange(Sender: TObject);
    procedure ud_fogClick(Sender: TObject; Button: TUDBtnType);
    //procedure ud_frm_itClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure EventDummiClick(Sender: TObject);    // OPEN PANEL
    procedure EventDummiDblClick(Sender: TObject); // CLOSE PANEL
    procedure sb_save_JPGClick(Sender: TObject);
    procedure SaveJpg(OutputType: Integer; FileNam: String);
    procedure sb_save_M3PClick(Sender: TObject);
    procedure sb_load_M3PClick(Sender: TObject);  // open parameter
    procedure btn_STOPClick(Sender: TObject);

    procedure cb_julia_mode_sphereClick(Sender: TObject);

//    procedure sb_frm_moveClick(Sender: TObject);
//    procedure tbxfChange(Sender: TObject);
    procedure sb_frm_outClick(Sender: TObject);
    procedure sb_frm_val_inClick(Sender: TObject);
//    procedure tbxfMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sb_frm_val_outClick(Sender: TObject);

//    procedure ud_frm2Click(Sender: TObject; Button: TUDBtnType);

    procedure ud_frm_itClick(Sender: TObject; Button: TUDBtnType);
    procedure lmdfMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure tbChangedValue(Sender: TObject; NewValue: Integer);
    procedure tbMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EventDummiDragDrop(Sender, Source: TObject; X, Y: Integer);
    //procedure cb_frmSelect(Sender: TObject);
    procedure cb_frmChange(Sender: TObject);
    procedure sbsl2tClick(Sender: TObject);
    procedure jvrg_ftypeClick(Sender: TObject);
    procedure btn_killClick(Sender: TObject);
    procedure cb_frmSelect(Sender: TObject);
    procedure sb_fp_fovClick(Sender: TObject);
//    procedure ts_frmMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure ts_frmChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure tc_frmChange(Sender: TObject);
    procedure eZoomChange(Sender: TObject);
    procedure eZoomTopClick(Sender: TObject);
    procedure eZoomBottomClick(Sender: TObject);
    procedure eZoomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eZoomKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sb_reset_posClick(Sender: TObject);
    procedure tbmChangedValue(Sender: TObject; NewValue: Integer);
    procedure tbmMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lmdmMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lmd4dMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tb4dChange(Sender: TObject);
    procedure tb4dMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure lb_frm_tcClick(Sender: TObject);
//    procedure lb_frm_tcDblClick(Sender: TObject);
//    procedure JvSpinEdit1BottomClick(Sender: TObject);



{$ENDREGION '========================================================================== > | CONTROL PROCEDURES'}

{$REGION '============================================================================= > | private'}

  private
    actStepWidth, iActiveThreads: Integer;
    AdjustPanelFirstShow: LongBool;

    //fZero, fValue, fRange: array[0..13] of Double;
    //fType: array[0..13] of Integer;

    fZeroM, fValueM, fRangeM: array[0..4] of Double;     // 5 misc
    fTypeM: array[0..4] of Integer;

    fZeroJ, fValueJ, fRangeJ: array[0..2] of Double;     // 3 julia
    fTypeJ: array[0..2] of Integer;

    fZero4d, fValue4d, fRange4d: array[0..2] of Double;  // 3 4D rotation
    fType4d: array[0..2] of Integer;

    fZerof, fValuef, fRangef: array[0..15] of Double;    // 16 formula vals
    fTypef: array[0..15] of Integer;

 //   ColOnItsChanged: LongBool;
    CalcThreadStatusID: Integer;
    CurrentFindex: TPoint;
    DEstopChanged: LongBool;
    DFogChanged: LongBool;
    DynFogAmountChanged: LongBool;
    FirstStart: LongBool;
    //----
    FocusedSliderF: Integer;
    FocusedSliderM: Integer;
    //----
    FSubIndexTopF: Integer;
    //----
    LightStoring: LongBool;
    MCTparas: Array [0..64] of TMCTparameter;
    Moving: LongBool;
    OriginalSize: TPoint;
    tmpBMP: TBitmap;
    tmpBMPc: TBitmap;
    fp,fov:String;
    i_fp_fov : Integer ;
    //    procedure AdjustPanel3positions;
    procedure Calc(Nstep: Integer);
    //----
    procedure CheckFocusF;
    procedure CheckFocusM;
    //----
    //procedure CheckFormulaImageVis;
    procedure CheckLabel18;
    function CopyFormulaNameFromMain(Findex: Integer): AnsiString;
    procedure CopyFormulaValueFromMain(Findex: TPoint);
    procedure DisableLightStoring;
    procedure EnableButtons;
    //function FormulaIndex(iSlider: Integer): TPoint;
    function FormulaIndexF(iSlider: Integer): TPoint;
    function GetFormulaValType(Findex: TPoint): Integer;
    function GetFormulaValue(Findex: TPoint): Double;
    function GetLocalAbsoluteDE(out NotValid: LongBool): Double;
    procedure Input4dRotVals;
    procedure InputJuliaVals;
    function LoadLightPreset(i: Integer): Boolean;
    procedure LoadLightPresets;
    procedure maxLengthToCutPlane(out dLength: Double; var itmp: Integer; vPos: TPVec3D; MCTpar: PMCTparameter);
    procedure PaintCoord;
    procedure PaintZeroVec;
    procedure Reset4dRotVals;
    procedure ResetJuliaPos0Vals;
    procedure RoundFvals(var NaviHAddon: THeaderCustomAddon);
    procedure SetHeaderSize;
    procedure SetWindowSize(pn_bottomvisible: LongBool);
    procedure SetZoom;
    procedure StopCalc;
    procedure TransformNHeader;
    procedure Update4dRotLabels;
    procedure UpdateMiscLabels;
//    procedure UpdateFormulaLabels(Findex: TPoint);
    procedure UpdateFormulaLabelsF(Findex: TPoint);
    procedure UpdateJuliaLabels;
    procedure WaitForCalcToStop(millisec: Integer);
    procedure MakeNaviHeader;
    function LoadParameterNavi(var Para10: TMandHeader10; FileName: String; Verbose: LongBool): Boolean;
    procedure SetEditsFromHeaderNavi;
    procedure SetEulerEditsFromHeader;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;

    procedure LoadFormulaNames;
//    procedure AddFormulaName(FName: String; DEfunc: Integer);
//    function FNameIsIncluded(Name: String): LongBool;
    procedure cb_frm_change(s: String);
    procedure formula_value_update_Click(Sender: TObject);
    procedure SetTabNames;
    function SetFormulaCBs(S: String): Integer;


{$ENDREGION '========================================================================== > | private'}

{$REGION '============================================================================= > | protected'}

  protected
    procedure WmThreadReady(var Msg: TMessage); message WM_ThreadReady;
    procedure WmThreadStat(var Msg: TMessage); message WM_ThreadStat;

{$ENDREGION '========================================================================== > | protected'}

{$REGION '============================================================================= > | public'}

  public
    Authors: AuthorStrings;
    bDoubleClick: LongBool;
    BGpicRotMatrix: TSMatrix3;
    bUserChangeN: LongBool;
    HybridCustoms: array[0..5] of TCustomFormula;
    NaviHAddon: THeaderCustomAddon;
    NaviHeader: TMandHeader10;
    NaviLightness: Single;
    NaviLightPresets: array[0..5] of TLightingParas9;
    NaviLightVals: TLightValsNavi;
    NDEmultiplier: Single;
    NLPavailable: array[0..5] of LongBool;
    NMouseStartPos: TPoint;
    InternAspectNavi: Double;

    procedure ChangeNaviMode;
    function isCalculating: LongBool;
 //   NaviNewLightVals: TLightVals;
    procedure NewCalc;
    procedure set_ani_key(Disabled: Boolean);

{$ENDREGION '========================================================================== > | public'}

{$ENDREGION '========================================================================== > | TGUINav'}

end;

var
  GUINav: TGUINav;
  FNaviFormCreated: LongBool = False;
  NglobalCounter: Integer = 0;
  NminDEcorrection: Single = 1000;
  errorstring: array[1..4] of string;
  b_Active: Boolean;
{ThreadUtils}
  CTSa: array[0..63] of TPCalcThreadStats;
  CTStmpi: Integer;
  CTSglobalId: Integer = 0;

implementation

{$REGION '============================================================================= > | USES'}

uses
  System.Math,
  System.Character,
  System.UITypes,
  System.Types,
  //~NaviCalcThread,
  //~ThreadUtils,
  MAIN,
  uFormula,
  DivUtils,
  HeaderTrafos,
  CustomFormulas,
  FileHandling,
//  Undo,
  ImageProcess,
  Calc,
//  MapSequences,
  //  formulas,
  uLight,
  uM2T;

//Animation,
//FormulaGUI
//LightGUI

{$ENDREGION '========================================================================== > | USES'}

{$R *.dfm}

{$REGION '============================================================================= > | TNaviCalcThread'}

procedure TNaviCalcThread.CalcPixelColorNavi(SL: PCardinal; Npix, SLwidMNpix: Integer);    //Npix: square pixel array to be filled
var dTmp, dCtmp, dCtmp4, dTmp3: Single;
    ir, ig, ib, iL1, iL2: Integer;
    iDif, iSpe, sLiDif, sLiSpe, DepC: TSVec;
    sDep, sAmb: Single;
begin
  with NaviLightVals do
  begin
    DepC := LinInterpolate2SVecs(PLValignedNavi.sDepthCol2, PLValignedNavi.sDepthCol, sYpos);
    if Light3rec.Zpos > 32767 then dTmp3 := Max0S(1 - 28000 * sDepth)
                              else dTmp3 := Max0S((Integer(Light3rec.Zpos) - 28000) * sDepth + 1);
    if bFarFog then
    begin
      if dTmp3 > 1 then sDep := 0 else
      begin
        sDep := Sqr(1 - dTmp3);
        dTmp3 := 1 - sDep;
      end;
    end
    else sDep := Max0S(1 - dTmp3);

    if Light3rec.Zpos < 32768 then
    begin
      if Light3rec.SIgradient > 32767 then
        dTmp := (Light3rec.SIgradient - sCiStart) * sCimul
      else dTmp := (Light3rec.SIgradient - sCStart) * sCmul;
      if bColCycling then  //Color cycling
      begin
        dTmp := MinMaxCS(-99999, dTmp, 99999);
        if dTmp < 0 then iL1 := Trunc(dTmp) - 1 else iL1 := Trunc(dTmp);
        dTmp := dTmp - il1;
        iL2 := (iL1 + 1) and 3;
        iL1 := iL1 and 3;
      end
      else
      begin
        dTmp := Min0MaxCS(dTmp, 3.999);
        iL1 := Trunc(dTmp);
        dTmp := dTmp - iL1;
        iL2 := (iL1 + 1) and 3;
      end;
      if Light3rec.SIgradient > 32767 then
      begin
        iSpe := LinInterpolate2SVecs(PLValignedNavi.ColInt[iL2], PLValignedNavi.ColInt[iL1], dTmp);
        iDif := iSpe;
      end else begin
        iSpe := LinInterpolate2SVecs(PLValignedNavi.ColSpe[iL2], PLValignedNavi.ColSpe[iL1], dTmp);
        iDif := LinInterpolate2SVecs(PLValignedNavi.ColDif[iL2], PLValignedNavi.ColDif[iL1], dTmp);
      end;
      ClearSVec(sLiDif);
      ClearSVec(sLiSpe);
      dTmp := Light3rec.ambShadow * 0.71429e-4  - 0.55;
      dCtmp4 := Max0S(dTmp);
      dTmp :=  Max0S(dTmp * s05 + s05);
      dCtmp := sDiffuse * dTmp;
      sAmb := dTmp * 0.25;
      for ir := 0 to 2 do if bLightOption[ir] = 0 then
      begin                     //NormalAngle
        iL1 := (Integer(Light3rec.LightAngleX) + iXangle[ir] div 2) and $7FFF;
        iL2 := (Integer(Light3rec.LightAngleY) + iYangle[ir] div 2) and $7FFF;   //Int overflow with shr 1, div2 -> sar 1
        if iL1 > 16383 then iL1 := 32767 - iL1;
        if iL2 > 16383 then iL2 := 32767 - iL2;
        iL1 := Round(sLightFuncSpec[ir] * iL1);
        iL2 := Round(sLightFuncSpec[ir] * iL2);
        if (iL1 or iL2) < 16384 then
          sLiSpe := AddSVectors(sLiSpe, ScaleSVector(PLValignedNavi.sLCols[ir], GetGaussFuncNavi(iL1, iL2) * dCtmp4));
        sLiDif := AddSVectors(sLiDif, ScaleSVector(PLValignedNavi.sLCols[ir],
          GetCosTabValNavi(iLightFuncDiff[ir], Light3rec.LightAngleX + iXangle[ir], Light3rec.LightAngleY + iYangle[ir]) * dCtmp));
      end; //if poslight then... light zpos,
     //   PoslightAmount := DotOfVectors(ViewVec, (LightPos - CamPos)) * shape..
     //   AddObjectLight
     //   /DotOfVectors() 1 / (Stepwidth + LengthOfVec(SubtractVectors(LightPos[ir], TPVec3D(@Iteration3D.C1));

      DepC := Add2SVecsWeight(AddSVectors(MultiplySVectors(iDif, Add2SVecsWeight2(sLiDif, PLValignedNavi.sAmbCol, sAmb)),
                MultiplySVectors(iSpe, sLiSpe)), DepC, dTmp3, sDep);
    end
    else if iBackBMP = 3 then
      DepC := Add2SVecsWeight(DepC, GetLightMapPixelNN(sXpos, sYpos, BGLightMap, False, 0), sDep, dTmp3 * s255)
    else if iBackBMP = 1 then
      DepC := Add2SVecsWeight(DepC, GetLightMapPixelSphereNN(DVecToSVec(MCTparas.mVgradsFOV), pBGRotMatrix, BGLightMap, False), sDep, dTmp3 * s255);

    dTmp := (Light3rec.Shadow - sShad) * sShadGr;   //DEcount dynfog
    if bBlendDFog then
    begin
      Clamp01Svar(dTmp);
      DepC := ScaleSVector(DepC, 1 - dTmp);
    end;
    DepC := Add2SVecsWeight2(DepC, PLValignedNavi.sDynFogCol, dTmp);
    iL1 := SVecToColNoScaleFlipXZ(DepC);
    for ig := 1 to Npix do
    begin
      for ib := 1 to Npix do
      begin
        SL^ := iL1;   // crash ???    if image bmp sized or contained     nav  color presets !?
        Inc(SL);
      end;
      Inc(SL, SLwidMNpix);
    end;
  end;
end;

procedure TNaviCalcThread.DoBinSearchS(var DE, RLastStepWidth, LastDE: Single);
var dT1, MaxStep: Single;
    itmp, itst: Integer;
begin
    with MCTparas do
    begin
      MaxStep := Abs(RLastStepWidth);
      itst := iMaxit;
      if FormulaType = 0 then iMaxIt := pIt3Dext.ItResultI;
      itmp := iDEAddSteps;
      while (itmp > 0) and (Abs(DE - msDEstop) > s001) do
      begin
        MaxStep := MaxStep * s05;
        if Abs(LastDE - DE) < s001 then
        begin
          dT1 := Abs(RLastStepWidth) * s05;
          if DE < msDEstop then dT1 := -dT1;
        end
        else
        begin
          dT1 := (DE - msDEstop) * RLastStepWidth / (LastDE - DE);
          if Abs(dT1) > MaxStep then dT1 := Sign(dT1) * MaxStep;
        end;
        RLastStepWidth := dT1;
        LastDE := DE;
        mZZ := mZZ + dT1;
        mAddVecWeight(@pIt3Dext.C1, @mVgradsFOV, dT1);
        msDEstop := DEstop * (1 + mZZ * mctDEstopFactor);
        DE := CalcDE(pIt3Dext, @MCTparas);
        Dec(itmp);
      end;
      iMaxIt := itst;
    end;
end;

procedure TNaviCalcThread.CalcNanglesForCut(CutPlane: Integer; Zdif: Double);
var NN, Nx, Ny: Double;
begin
    with MCTparas do
    begin
      if CutPlane > 0 then
      begin
        Dec(CutPlane);
        if Abs(Vgrads[2, CutPlane]) < 1e-40 then NN := 1e40 else NN := 1 / Vgrads[2, CutPlane];
        Nx := Vgrads[0, CutPlane] * NN;
        Ny := Vgrads[1, CutPlane] * NN;
        NN := -1 / Sqrt(1 + Sqr(Nx) + Sqr(Ny));
        Light3rec.LightAngleX := Round((ArcSinSafe(Nx * NN) - CAFX) * 5215.1891752352) and $7FFF;
        Light3rec.LightAngleY := Round((ArcSinSafe(Ny * NN) + CAFY) * 5215.1891752352) and $7FFF;
        Light3rec.Zpos := Max(0, 32767 - Round(ZcMul * (Sqrt(Zdif * Zcorr + 1) - 1)));
      end else begin
        Light3rec.LightAngleX := 0;
        Light3rec.LightAngleY := 0;
        Light3rec.Zpos := 32767;
      end;
      Light3rec.Shadow := 32767;
    end;
end;

procedure TNaviCalcThread.CalculateNormals(var NN: Single);
var CT1: TVec3D;
    N3, N2, N1, NT, Noffset: Double;
begin
    with MCTparas do
    begin
      Noffset := MinCS(1, DEstop) * (1 + mZZ * mctDEstopFactor) * 0.15;
      mCopyVec(@CT1, @Iteration3Dext.C1);
      if FormulaType > 0 then
      begin
        Iteration3Dext.CalcSIT := True;
        NT := CalcDE(@Iteration3Dext, @MCTparas);
        NN := Iteration3Dext.SmoothItD;
        Iteration3Dext.CalcSIT := False;
        mAddVecWeight(@Iteration3Dext.C1, @Vgrads[2], -Noffset);
        N3 := CalcDE(@Iteration3Dext, @MCTparas) - NT;     //Zgradient
        mCopyAddVecWeight(@Iteration3Dext.C1, @CT1, @Vgrads[0], Noffset);
        N1 := CalcDE(@Iteration3Dext, @MCTparas) - NT;     //Xgradient
        mCopyAddVecWeight(@Iteration3Dext.C1, @CT1, @Vgrads[1], Noffset);
        N2 := CalcDE(@Iteration3Dext, @MCTparas) - NT;     //Ygradient
      end
      else if IsCustomDE then
      begin
        Iteration3Dext.CalcSIT := ColorOption > 8;
        NT := mMandFunctionDE(@Iteration3Dext.C1);
        if Iteration3Dext.CalcSIT then
        begin
          Iteration3Dext.CalcSIT := False;
          NN := Iteration3Dext.SmoothItD;   //for coloring
        end;
        mAddVecWeight(@Iteration3Dext.C1, @Vgrads[2], -Noffset);
        N3 := mMandFunctionDE(@Iteration3Dext.C1) - NT;     //Zgradient
        mCopyAddVecWeight(@Iteration3Dext.C1, @CT1, @Vgrads[0], Noffset);
        N1 := mMandFunctionDE(@Iteration3Dext.C1) - NT;     //Xgradient
        mCopyAddVecWeight(@Iteration3Dext.C1, @CT1, @Vgrads[1], Noffset);
        N2 := mMandFunctionDE(@Iteration3Dext.C1) - NT;     //Ygradient
      end else begin
        Iteration3Dext.CalcSIT := True;
        mMandFunction(@Iteration3Dext.C1);
        NN := Iteration3Dext.SmoothItD;
        mAddVecWeight(@Iteration3Dext.C1, @Vgrads[2], -Noffset);
        mMandFunction(@Iteration3Dext.C1);
        N3 := NN - Iteration3Dext.SmoothItD;     //Zgradient
        mCopyAddVecWeight(@Iteration3Dext.C1, @CT1, @Vgrads[0], Noffset);
        mMandFunction(@Iteration3Dext.C1);
        N1 := NN - Iteration3Dext.SmoothItD;     //Xgradient
        mCopyAddVecWeight(@Iteration3Dext.C1, @CT1, @Vgrads[1], Noffset);
        mMandFunction(@Iteration3Dext.C1);
        N2 := NN - Iteration3Dext.SmoothItD;     //Ygradient
      end;
      N3 := 1 / Sqrt(N1 * N1 + N2 * N2 + N3 * N3 + d1em40);   //recip. length of 3Dgradient
      Light3rec.LightAngleY := Round((ArcSinSafe(N2 * N3) + CAFY) * 5215.1891752352) and $7FFF;
      Light3rec.LightAngleX := Round((ArcSinSafe(N1 * N3) - CAFX) * 5215.1891752352) and $7FFF;
      mCopyVec(@Iteration3Dext.C1, @CT1);
    end;
end;

procedure TNaviCalcThread.DoColor;
var s{, s2}: Single;
  //  dv: TVec3D;
begin
    with MCTparas.pIt3Dext^ do
    begin
      case MCTparas.ColorOption of
        1:  s := Ln(Rout / (Rold + 1)) * MCTparas.mctColorMul;
        2:  s := (ArcTan2(y - C2, x - C1) + Pi) * 5200;
        3:  s := (ArcTan2(z - C3, x - C1) + Pi) * 5200;
        4:  s := (ArcTan2(z - C3, y - C2) + Pi) * 5200;
      5,6:  s := (ArcTan2(x, y) + Pi) * 5215;    //output vec
       //       s2 := (Pi + ArcSinSafe(dv[2]) * 2) * 5215;
         //     MinMaxClip15bit(s2, pLi3.SIgradient);
        else s := OTrap * 4096;
      end;
      MinMaxClip15bit(s, Light3rec.SIgradient);
    end;
end;

procedure TNaviCalcThread.Execute;
var itmp, x, y, pctsid: Integer;
    SL: PCardinal;
    bIsLargeStep, bIsLowStep, bInsideTmp: LongBool;
    RLastDE, RLastStepWidth, RSFmul, stmp: Single;
    dTmp, dT1: Double;
    LastDEs: array[0..15] of Single;
    LastZpos: array[0..15] of Single;
    TabIndex, TabCount, DEcount, DFogC: Integer;
begin
    with MCTparas do
    try
      IniIt3D(@MCTparas, @Iteration3Dext);
 //timetest
  //  PInt64(@dJUx)^ := RdTsc;
      pctsid := PCalcThreadStats.CTSid;
    //  DEstop := msDEstop;
      bIsLowStep := sZstepDiv < s05;
      bInsideTmp := bInsideRendering;
      y := NaviStep * (iThreadId - 1);
      if NaviStep < 8 then y := y shl 1;
      while y < iMandHeight do
      begin
        CAFY := (y - s05 * iMandHeight) * FOVy / iMandHeight;
        bIsLargeStep := (NaviStep < 8) and (y and ((NaviStep shl 1) - 1) = 0);
        if bIsLargeStep then x := NaviStep else x := 0;
        SL := PCardinal(FSIstart + FSIoffset * y + x * 4);
 //       mCopyAddVecWeight(@CC, @Ystart, @Vgrads[1], y);

        while x < iMandWidth do // = iMandWidth - NaviStep do
        begin
          bInsideRendering := bInsideTmp;
          bCalcInside := bInsideTmp;
          RMCalculateVgradsFOV(@MCTparas, x);
          RMCalculateStartPos(@MCTparas, x, y);
          Light3rec.Zpos      := 32768;    //write of.. when not done Zcalc if stopped at minZ in Navi
          Light3rec.AmbShadow := 10000;
          Iteration3Dext.CalcSIT := False;
          msDEstop := DEstop;
          itmp     := 0;
          mZZ      := 0;
          DEcount  := 0;
          DFogC    := 0;
          if iCutOptions > 0 then   // move to begin of cutting planes
          begin
            RMmaxLengthToCutPlane(@MCTparas, dT1, itmp, @Iteration3Dext.C1);
            if dT1 > (Zend - mZZ) then
            begin
              Iteration3Dext.ItResultI := 0;
              sTmp := msDEstop + 5;
              mZZ  := Zend + 1;
            end else begin
              mZZ := dT1;
              mAddVecWeight(@Iteration3Dext.C1, @mVgradsFOV, dT1);
              msDEstop := DEstop * (1 + mZZ * mctDEstopFactor);
              sTmp := CalcDE(@Iteration3Dext, @MCTparas);
            end;
          end
          else sTmp := CalcDE(@Iteration3Dext, @MCTparas);

          if bInAndOutside and (sTmp < msDEstop) then
          begin
            bInsideRendering := False;
            bCalcInside := False;
            sTmp := CalcDE(@Iteration3Dext, @MCTparas);
          end;

          if (Iteration3Dext.ItResultI >= MaxItsResult) or (sTmp < msDEstop) then   // already in the set
          begin
            CalcNanglesForCut(itmp, mZZ);
            if bInsideRendering then          //doColor?
            begin
              Iteration3Dext.CalcSIT := True;
              CalcDE(@Iteration3Dext, @MCTparas);
              Light3rec.SIgradient := 32768 + Round(Min0MaxCD(Iteration3Dext.SmoothItD * mctsM, d32767));
            end
            else
              Light3rec.SIgradient := 32768 + Round(Min0MaxCD(32767 / dRStop * Iteration3Dext.Rout, d32767));
          end
          else
          begin
            TabIndex := 15;
            TabCount := -1;
            RLastStepWidth := sTmp * sZstepDiv;
            RLastDE := sTmp + RLastStepWidth;
            RSFmul := 1;
            repeat
              if (Iteration3Dext.ItResultI < iMinIt) or
                ((Iteration3Dext.ItResultI < MaxItsResult) and (sTmp >= msDEstop)) then    //##### next step ######
              begin
                if Iteration3Dext.ItResultI = DFogOnIt then Inc(DFogC);
                Inc(DEcount);
                if (not bIsLowStep) or ((DEcount and 1) <> 0) then
                begin
                  TabIndex := (TabIndex + 1) and 15;
                  LastDEs[TabIndex] := sTmp;        // AO on last x DE steps
                  LastZpos[TabIndex] := mZZ;
                  Inc(TabCount);
                end;
                RLastDE := sTmp;
                sTmp := MinCS(sTmp * sZstepDiv * RSFmul, MaxCS(msDEstop, 0.4) * mctMH04ZSD);
           //causes hangs?:
            //    sTmp := MinCS((sTmp - msDEsub * msDEstop) * sZstepDiv * RStepFactorDiff, MaxCS(msDEstop, 0.4) * mctMH04ZSD);
                RLastStepWidth := sTmp;

                mZZ := mZZ + sTmp;
                mAddVecWeight(@Iteration3Dext.C1, @mVgradsFOV, sTmp);
                with mctparas do msDEstop := DEstop * (1 + mZZ * mctDEstopFactor);

                sTmp := CalcDE(@Iteration3Dext, @MCTparas);
            //    if Abs(dtmp) > 1e30 then
              //    PostMessage(PCalcThreadStats.pMessageHwnd, WM_ThreadStat, iThreadID, 505);
               // stmp := dtmp;

          //      if sTmp > RLastDE + RLastStepWidth then sTmp := RLastDE + RLastStepWidth; //Test

                if RLastDE > sTmp + s1em30 then
                begin
                  dT1 := RLastStepWidth / (RLastDE - sTmp);
                  if dT1 < 1 then
                    RSFmul := maxCS(0.6, dT1)
                  else
                    RSFmul := 1;
                end
                else RSFmul := 1;
               { dT1 := (RLastDE - sTmp) / (RLastStepWidth + 1e-30);
                if dT1 > 1 then RSFmul := maxCS(0.6, 1 / dT1)
                           else RSFmul := 1; }
              end
              else     // ##### set found #####
              begin
                if Iteration3Dext.ItResultI < MaxItsResult then //or (sTmp < msDEstop) then  //
                  DoBinSearchS(sTmp, RLastStepWidth, RLastDE);
                CalculateNormals(stmp);
                if ColorOption > 8 then
                begin
                  RLastDE := 32767 - (stmp + dColPlus + mctColVarDEstopMul * ln(msDEstop * StepWidth)) * mctsM;
                  MinMaxClip15bit(RLastDE, Light3rec.SIgradient);
                end
                else
                begin
                  if MCTparas.ColorOnIt <> 0 then RMdoColorOnIt(@MCTparas);
                  DoColor;
                end;
                sTmp := 32767 - ZcMul * (Sqrt(mZZ * Zcorr + 1) - 1);
                MinMaxClip15bit(sTmp, Light3rec.Zpos);

                dTmp := LengthOfVec(SubtractVectors(@Iteration3Dext.C1, TPVec3D(@Xmit)^));// / (StepWidth * iMandWidth);  //correction of the localDE
                if dTmp < NminDEcorrection then NminDEcorrection := MaxCS(s1em30, dTmp);  //global val, not very good

                if bInsideRendering then TabCount := Min(TabCount, 4) else TabCount := Min(TabCount, 15);
                msDEstop := msDEstop * 0.8;
                dTmp := 1;
                for itmp := 1 to TabCount do          // AO on Last max 16 DEs
                begin
                  dTmp := MinCD(dTmp, Clamp0D((LastDEs[TabIndex] - msDEstop) / (mZZ - LastZpos[TabIndex])));
                  TabIndex := (TabIndex - 1) and 15;
                end;
                Light3rec.AmbShadow := Round(dTmp * 32767);
                Break;
              end;
            until (mZZ > Zend) or (pctsid <> NglobalCounter);
          end;
          if (pctsid <> NglobalCounter) then Break;
          if DFogOnIt <> 0 then DEcount := DFogC * 4;
          if bInsideRendering then DEcount := DEcount div 20;
          Light3rec.Shadow := Min(DEcount, 1023);
          if (NaviLightVals.iBackBMP <> 0) and (Light3rec.Zpos = 32768) then
            NaviLightVals.AbsViewVec := DVecToSVec(mVgradsFOV);
          NaviLightVals.sXpos := x / iMandWidth;
          NaviLightVals.sYpos := y / iMandHeight;
          CalcPixelcolorNavi(SL, NaviStep, SLwidMNpix);

          if bIsLargeStep then itmp := NaviStep * 2 else itmp := NaviStep;
          Inc(x, itmp);
          Inc(SL, itmp);
        end;
        if (pctsid <> NglobalCounter) then Break;
        if bIsLargeStep then itmp := NaviStep else
        if NaviStep = 8 then itmp := NaviStep * iThreadCount
                        else itmp := NaviStep * (2 * iThreadCount - 1);
        Inc(y, itmp);
      end;

    finally
      PCalcThreadStats.CTrecords[iThreadID].isActive := 0;
      PostMessage(PCalcThreadStats.pMessageHwnd, WM_ThreadReady, 0, 0);
    end;
end;

{$ENDREGION '========================================================================== > | TNaviCalcThread'}

{$REGION '============================================================================= > | ThreadUtils'}
{ThreadUtils}
function GetNewThreadStatRecord(var CTSid: Integer; Count, HandleTyp: Integer; MessageHwnd: HWND): TPCalcThreadStats;
var FreeCIndex, i: Integer;
begin
    Result := nil;
    CTSid := 0;
    CTSglobalId := (CTSglobalId and $3FFFFFFF) + 1;
    if GetNextFreeIndex(FreeCIndex) then
    begin
      if CTSa[FreeCIndex] <> nil then
      begin
        Dispose(CTSa[FreeCIndex]);
        CTSa[FreeCIndex] := nil;
      end;
      New(CTSa[FreeCIndex]);
      CTSa[FreeCIndex].iTotalThreadCount := Count;
      CTSa[FreeCIndex].CTSid := CTSglobalId;
      CTSa[FreeCIndex].pMessageHwnd := MessageHwnd;
      CTSa[FreeCIndex].HandleType := HandleTyp;
      for i := 1 to Count do CTSa[FreeCIndex].CTrecords[i].isActive := 1;
      CTSid := CTSglobalId;
      Result := CTSa[FreeCIndex];
    end;
end;
function GetActiveThreadCount(CTSid: Integer): Integer;
var i, ci: Integer;
begin
    Result := 0;
    ci := GetIndexFromID(CTSid);
    if ci >= 0 then
      for i := 1 to CTSa[ci].iTotalThreadCount do
        if CTSa[ci].CTrecords[i].isActive > 0 then Inc(Result);
end;
function CTSarrayIsFree(CTSai: Integer): LongBool;
var i: Integer;
begin
    Result := True;
    if CTSa[CTSai] <> nil then
    begin
      for i := 1 to CTSa[CTSai].iTotalThreadCount do
      if CTSa[CTSai].CTrecords[i].isActive > 0 then
      begin
        Result := False;
        Break;
      end;
    end;
end;
function GetNextFreeIndex(var FreeCI: Integer): LongBool;
var i, c, f, n, tries: Integer;
begin
    Result := False;
    tries := 3;
    repeat
      c := 0;
      for i := 0 to 63 do
      begin
        if CTSarrayIsFree(i) then
        begin
          if not Result then
          begin
            Result := True;
            FreeCI := i;
          end;
          Inc(c);
          if c > 3 then Break;
        end;
      end;
      if c <= 3 then
      try
        for n := 1 to 3 do
        begin
          c := CTSglobalId;
          f := -1;
          for i := 0 to 63 do if (CTSa[i] <> nil) and (CTSa[i].CTSid < c) then
          begin
            c := CTSa[i].CTSid;
            f := i;
          end;
          if f >= 0 then
          begin
            for i := 1 to 64 do if CTSa[f].CTrecords[i].isActive <> 0 then
            try // thread.Terminate;
              TerminateThread((TObject(CTSa[f].CThandles[i]) as TThread).Handle, 0);
            except
              //TODO 5 -oCrystalSkull -cEmpty Code Block: GetNextFreeIndex (except/end in function)???
            end;
        {  try    // suspend threads?
            for i := 1 to 64 do if CTSa[f].CTrecords[i].isActive <> 0 then
              (TObject(CTSa[f].CThandles[i]) as TThread).Suspend;
          except end;   }
            Dispose(CTSa[f]);
          end;
        end;
      except
        //TODO 5 -oCrystalSkull -cEmpty Code Block: GetNextFreeIndex (except/end in function)
      end;
      Dec(tries);
    until Result or (tries <= 0);
end;
function GetIndexFromID(CTSid: Integer): Integer;
var i: Integer;
begin
    Result := -1;
    if CTSid = 0 then Exit;
    for i := 0 to 63 do if (CTSa[i] <> nil) and (CTSa[i].CTSid = CTSid) then
    begin
      Result := i;
      Break;
    end;
end;
function GetPCTSfromID(CTSid: Integer): TPCalcThreadStats;
var i: Integer;
begin
    i := GetIndexFromID(CTSid);
    if i < 0 then Result := nil else Result := CTSa[i];
end;
procedure GetMinY(CTSid: Integer; var yy: Double; var yimi, ymin, Tcount: Integer);
var xx, ymax: Double;
    ci, y: Integer;
begin
    yy := 0;
    yimi := 0;
    ymin := 0;
    Tcount := 0;
    ci := GetIndexFromID(CTSid);
    if ci < 0 then Exit;
    ymin := 999999;
    with CTSa[ci]^ do
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
          Inc(Tcount);
          yy := yy + Min(ymax, Max(0, iActualYpos - ctCalcRect.Top - y + 1) / iTotalThreadCount +
                               Max(0, iActualXpos - ctCalcRect.Left) * xx);
        end
        else yy := yy + ymax;
      end;
    end;
end;
{$ENDREGION '========================================================================== > | ThreadUtils'}


//------------------------------------------------------------------------------
{
procedure xtbxChange(Sender: TObject);

//      d := (Image_N_1.Width * 16) shr (rg_Adj.ItemIndex * 4);   //def:= 640*16 bitshift (2)*4 := 40
//      if isIntType(fType[t]) then d := MinMaxCD(3, d * 0.5, 50);

      else if fType[t] = -5 then fValue[t] := fZero[t] * Power(3, RS.Position * fRange[t] / d)
      else fValue[t] := fZero[t] + RS.Position * fRange[t] / d;

      bUpdate := False;


      end

      if bUpdate then NewCalc;
      CheckFocus;
    //end;
end;
}

{$REGION '============================================================================= > | EXTERNALIZE'}


procedure ModRotPoint(var Header: TMandHeader10);
var l, ds, de: Double;
begin
    with Header do
    begin
      NormVGrads(@Header);
      ds := dZstart - dZmid;
      de := dZend - dZmid;
      l := MinCD((dZend - dZmid) / dStepWidth, LengthOfSize(@Header) * 1.5);  //new midpoint for rotations, must be limited  to Zend!
      mAddVecWeight(@dXmid, @hVGrads[2], l);
      dZstart := dZmid + ds - dStepWidth * l;
      dZend := dZmid + de - dStepWidth * l;
    end;
end;
procedure FlipI(var i1, i2: Integer);
var itmp: Integer;
begin
    itmp := i1;
    i1 := i2;
    i2 := itmp;
end;

procedure TGUINav.RoundFvals(var NaviHAddon: THeaderCustomAddon);
var i, j: Integer;
begin
    with NaviHAddon do
    begin
    if (bOptions1 and 3) = 1 then
    begin
      for j := 0 to 1 do
      for i := 0 to Formulas[j].iOptionCount - 1 do
        if isIntType(Formulas[j].byOptionType[i]) then
          Formulas[j].dOptionValue[i] := Round(Formulas[j].dOptionValue[i]);
    end
    else
    for j := 0 to 5 do if Formulas[j].iItCount > 0 then
      for i := 0 to Formulas[j].iOptionCount - 1 do
        if isIntType(Formulas[j].byOptionType[i]) then
          Formulas[j].dOptionValue[i] := Round(Formulas[j].dOptionValue[i]);
    end;
end;
function TGUINav.GetLocalAbsoluteDE(out NotValid: LongBool): Double;
var ct: TVec3D;
    i, c: Integer;
    dTmp, dTmp2, dmul: Double;
    MedianList: array of Double;
    Iteration3Dext: TIteration3Dext;
    lMCTparas: TMCTparameter;
begin
    with lMCTparas do
    begin
      NotValid := False;
      Result := iMandWidth * StepWidth;
      NormVGrads(@NaviHeader);
      NaviHeader.bCalc3D := 1;
      bGetMCTPverbose := False;
      lMCTparas := GetMCTparasFromHeader(NaviHeader, True);  //{False} todo: function to get only formula relevant paras for calc DE
      if not bMCTisValid then
      begin
        NotValid := True;
        Exit;
      end;
      bGetMCTPverbose := True;
      IniIt3D(@lMCTparas, @Iteration3Dext);
      mCopyVec(@Iteration3Dext.C1, @Xmit);
      i := 0;
      mCopyVec(@ct, @Iteration3Dext.C1);
      Iteration3Dext.CalcSIT := False;
      if bInAndOutside then bInsideRendering := False;
      bCalcInside := bInsideRendering;
      if iCutOptions <> 0 then
      begin
        maxLengthToCutPlane(dTmp, i, @Iteration3Dext.C1, @lMCTparas);
        if i <> 0 then
        with Iteration3Dext do  // move to cutplane and calcDE...
        begin
          mCopyAddVecWeight(@C1, @ct, @Vgrads[2], dTmp);
          dTmp2 := CalcDE(@Iteration3Dext, @lMCTparas);
          if bInAndOutside then
          begin
            bInsideRendering := dTmp2 < DEstop;
            bCalcInside := bInsideRendering;
            if bInsideRendering then
              dTmp2 := CalcDE(@Iteration3Dext, @lMCTparas);
          end;
          Result := dTmp + dTmp2;
        end;
      end;
      if i = 0 then
      with Iteration3Dext do
      begin
        if bInAndOutside then
        begin
          dTmp2 := CalcDE(@Iteration3Dext, @lMCTparas);
          bInsideRendering := dTmp2 < DEstop;
          bCalcInside := bInsideRendering;
        end;
        if bInsideRendering then
        begin
          CalcDE(@Iteration3Dext, @lMCTparas);
          NotValid := DEoptionResult <> 20;
          if NotValid then Exit;
        end;
        dmul := 1;
        c := 0;
        SetLength(MedianList, 12);
        repeat
          for i := 0 to 8 do
          begin
            if i = 8 then mCopyVec(@C1, @ct) else
            begin
              mCopyAddVecWeight(@C1, @ct, @Vgrads[0], ((i and 1) * 32 - 16) * dmul);
              mAddVecWeight(@C1, @Vgrads[1], ((i and 2) * 16 - 16) * dmul);
              mAddVecWeight(@C1, @Vgrads[2], ((i and 4) * 8 - 16) * dmul);
            end;
            try
              MedianList[c] := CalcDE(@Iteration3Dext, @lMCTparas);
              if (MedianList[c] > 0) and (MedianList[c] < 1e15) and (c < 11) then Inc(c);
            except
              //TODO 5 -oCrystalSkull -cEmpty Code Block: TGUINav.GetLocalAbsoluteDE (except/end in function)
            end;
          end;
          dmul := dmul * 2;
        until (c > 3) or (dmul > 40);
        if c = 0 then
        begin
          NotValid := True;
          Result := LengthOfVec(ct) * s05 / StepWidth;
        end
        else Result := aMedian(c, MedianList, 0.6);
      end;
      Result := MinMaxCD(3, Result, 20000) * StepWidth;
      Result := MinCD(Result, MaxCD(2, LengthOfVec(ct)));
    end;
end;

procedure TGUINav.Calc(Nstep: Integer);
var I, x, nThreadCount: Integer;
    bAllOK: LongBool;
    CalcThread: array of TNaviCalcThread;
    v3: TVec3D; t3:TMatrix3;
begin
  GUI.bHideMessages := True;
  bAllOK := False;
  try
    nThreadCount := Min(GUI.UpDownThread.Position, NaviHeader.Height);
    if Nstep = 8 then
    begin
      with NaviHeader do
      begin
        Label_N_24.Caption := FloatToStrF(dZoom, ffGeneral, 4, 1);
        if dZoom > 1e13 then Label_N_24.Font.Color := clRed else Label_N_24.Font.Color := clWindowText;

        SetWindowSize(pn_bottom.Visible);
        if Moving then   //if objectparts are nearer than DE..
          NDEmultiplier := NDEmultiplier * MinMaxCD(0.5, NminDEcorrection * (dZoom * Width) / (LengthOfSize(@NaviHeader) * 2), 1);
          //  LengthOfSize(@NaviHeader) * 2 / (dZoom * Width) :=  AbsDE;
        NminDEcorrection            := 1000;
        mZstepDiv        := 0.7 - 0.35 * (Byte(cb_HiQ.Checked) and 1);
        sRaystepLimiter  := MaxCS(sRaystepLimiter, mZstepDiv * 0.5);
        bCalc3D          := 1;
        dFOVy            := StrToFloatK(eFOV.Text);
        bPlanarOptic     := rg_cam.ItemIndex;
//
//        eXrot.Text    := FloatToStr(v3[0] / Pid180);
//        eYrot.Text    := FloatToStr(v3[1] / Pid180);
//        eZrot.Text    := FloatToStr(v3[2] / Pid180);
//

        if cb_zoom.Checked then eZoom.Value:=dZoom;

        eXmid.Text    := FloatToStr(dXmid);
        eYmid.Text    := FloatToStr(dYmid);
        eZmid.Text    := FloatToStr(dZmid);
        eZstart.Text  := FloatToStr(dZstart);
        eZend.Text    := FloatToStr(dZend);

        bGetMCTPverbose             := False;
      end;
      for I := 0 to nThreadCount - 1 do begin
        MCTparas[I]               := getMCTparasFromHeader(NaviHeader, True);
        bGetMCTPverbose           := I = 0;
        if MCTparas[I].DEoption = 20 then MCTparas[I].iDEAddSteps := 7 else MCTparas[I].iDEAddSteps := 4;
        MakeLightValsFromHeaderLightNavi(@NaviHeader, @NaviLightVals, 1);
        MCTparas[I].ZcMul        := MCTparas[I].ZcMul * 0.00390625;   //because navi uses old light paras
        MCTparas[I].PLValsNavi   := @NaviLightVals;
        MCTparas[I].msDEsub      := 0;
        if (NaviHeader.Light.TBoptions and $20000) = 0 then MCTparas[I].ColorOption := 9; //smoothits, else 2nd choice functions
      end;
      //tests:
     // Label_N_18.Caption := 'Correction: ' + FloatToStr(NDEmultiplier);

    end;

    for I := 0 to nThreadCount - 1 do begin
      MCTparas[I].FSIstart      := Integer(Image_N_1.Picture.Bitmap.ScanLine[0]);
      MCTparas[I].FSIoffset     := Integer(Image_N_1.Picture.Bitmap.ScanLine[1]) - MCTparas[I].FSIstart;
      MCTparas[I].NaviStep      := Nstep;
      MCTparas[I].SLwidMNpix    := MCTparas[I].FSIoffset div 4 - Nstep;
      SetLength(CalcThread, nThreadCount);
      for x := 0 to 5 do if MCTparas[I].nHybrid[x] > 0 then bAllOK := True;
    end;

  finally
    GUI.bHideMessages := False;
  end;
  if bAllOK then
  begin
    for x := 0 to nThreadCount - 1 do
    begin
      MCTparas[x].iThreadId := x + 1;
      try
        CalcThread[x]                 := TNaviCalcThread.Create(True);          //-=-=-> TNaviCalcThread
        CalcThread[x].FreeOnTerminate := True;
        CalcThread[x].MCTparas        := MCTparas[x];
        CalcThread[x].NaviLightVals   := NaviLightVals;
        CalcThread[x].NaviLightVals.PLValignedNavi := TPLValignedNavi((Integer(@CalcThread[x].NaviLightVals.LColSbuf[0]) + 15) and $FFFFFFF0);
        FastMove(NaviLightVals.PLValignedNavi^, CalcThread[x].NaviLightVals.PLValignedNavi^, SizeOf(TLValignedNavi));
        CalcThread[x].Priority        := cTPrio[GUI.ComboBoxThread.ItemIndex];
      except
        nThreadCount := x;
        Break;
      end;
    end;
    iActiveThreads := nThreadCount;
    MCTparas[0].PCalcThreadStats := GetNewThreadStatRecord(CalcThreadStatusID, nThreadCount, 0, Self.Handle);
    NglobalCounter := CalcThreadStatusID;
    if (CalcThreadStatusID = 0) or (MCTparas[0].PCalcThreadStats = nil) then
    begin
      GUI.OutMessage('Failed to create ThreadStats');
      for x := 0 to nThreadCount - 1 do CalcThread[x].Free;
      Exit;
    end;
    for x := 1 to nThreadCount do
    begin
      CalcThread[x - 1].MCTparas.iThreadCount := nThreadCount;
      CalcThread[x - 1].MCTparas.PCalcThreadStats := MCTparas[0].PCalcThreadStats;
    end;
    for x := 0 to nThreadCount - 1 do CalcThread[x].Start;
  end;
end;

procedure TGUINav.maxLengthToCutPlane(out dLength: Double; var itmp: Integer; vPos: TPVec3D; MCTpar: PMCTparameter);
var dTmp: Double;
begin
    if MCTpar.iCutOptions <> 0 then
    with MCTpar^ do
    begin
      dLength := 0;
      if ((iCutOptions and 1) <> 0) and (Abs(Vgrads[2,0]) > 1e-20) then
      begin
        dTmp := (dCOX - vPos^[0]) / Vgrads[2,0];
        if dTmp > dLength then
        begin
          dLength := dTmp;
          itmp := 1;
        end;
      end;
      if ((iCutOptions and 2) <> 0) and (Abs(Vgrads[2,1]) > 1e-20) then
      begin
        dTmp := (dCOY - vPos^[1]) / Vgrads[2,1];
        if dTmp > dLength then
        begin
          dLength := dTmp;
          itmp := 2;
        end;
      end;
      if ((iCutOptions and 4) <> 0) and (Abs(Vgrads[2,2]) > 1e-20) then
      begin
        dTmp := (dCOZ - vPos^[2]) / Vgrads[2,2];
        if dTmp > dLength then
        begin
          dLength := dTmp;
          itmp := 3;
        end;
      end;
    end;
end;

procedure TGUINav.PaintZeroVec;
var v: TVec3D;
    m: TMatrix3;
    s, sx, sy, sx2, sy2: Single;
    i: Integer;
begin
    with tmpBMP.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(ClipRect);
      m := NormaliseMatrixTo(1, @NaviHeader.hVGrads);
      mCopyVec(@v, @NaviHeader.dXmid);
      RotateVector(@v, @m);
      NormaliseVectorVar(v);
      if v[2] > 0 then Pen.Color := $50A0 else Pen.Color := $A000;
      Brush.Color := Pen.Color;
      s := 0.666666 * (3 + v[2]);
      MoveTo(40, 38);
      sx := 40 - v[0] * 18 * s;
      sy := 38 - v[1] * 18 * s;
      Pen.Width := 3;
      LineTo(Round(sx), Round(sy));
      Pen.Width := 2;
      for i := 1 to 4 do
      begin
        sx2 := sx + v[0] * s * i * 2;
        sy2 := sy + v[1] * s * i * 2;
        Ellipse(Round(sx2 - s * i), Round(sy2 - s * i),
                Round(sx2 + s * i), Round(sy2 + s * i));
      end;
    end;
    SetStretchBltMode(Image2.Canvas.Handle, HALFTONE);
    StretchBlt(Image2.Canvas.Handle, 0, 0, 40, 38,
               tmpBMP.Canvas.Handle, 0, 0, 80, 76, SRCCOPY);
    Image2.Invalidate;
end;

procedure TGUINav.PaintCoord;  //direct to bmp
var m: TMatrix3;
    sx, sy, sx2, sy2, tipsize: Single;
    i, i2: Integer;
    sorta: array[0..2] of Integer;
const ca: array[0..2] of Cardinal = ($50FF,$40F030,$FFB000);
begin
  if not cb_coords.Checked then Image_N_6.Visible := False else
  with Image_N_6.Picture.Bitmap.Canvas do
  begin
    Image_N_6.Transparent := False;
    Font.Style := [fsBold];
    Brush.Color := clBlack;
    FillRect(ClipRect);
    SetBkMode(Handle, TRANSPARENT);
    m := NormaliseMatrixTo(1, @NaviHeader.hVGrads);
    for i := 0 to 2 do sorta[i] := i;
    if m[2, 0] < m[2, 1] then FlipI(sorta[0], sorta[1]);
    if m[2, sorta[1]] < m[2, 2] then FlipI(sorta[1], sorta[2]);
    if m[2, sorta[0]] < m[2, sorta[1]] then FlipI(sorta[0], sorta[1]);
    for i := 0 to 2 do
    begin
      i2 := sorta[i];
      Pen.Width := 2;
      Pen.Color := ca[i2];
      MoveTo(60, 60);
      sx := 60 + m[0, i2] * 38;
      sy := 60 + m[1, i2] * 38;
      LineTo(Round(sx), Round(sy));
      //tip:
      tipsize := (2 - m[2, i2]) * 2 / MaxCS(0.1, Sqrt(Sqr(m[0, i2]) + (Sqr(m[1, i2]))));
      sx2 := sx - m[0, i2] * 8 - m[1, i2] * tipsize;
      sy2 := sy - m[1, i2] * 8 + m[0, i2] * tipsize;
      LineTo(Round(sx2), Round(sy2));
      MoveTo(Round(sx), Round(sy));
      sx2 := sx - m[0, i2] * 8 + m[1, i2] * tipsize;
      sy2 := sy - m[1, i2] * 8 - m[0, i2] * tipsize;
      LineTo(Round(sx2), Round(sy2));
      tipsize := (3 - m[2, i2]) * 4;
      Font.Color := Pen.Color;
      Font.Size := Round(-tipsize);
      sx := sx + m[0, i2] * tipsize * 0.8;
      sy := sy + m[1, i2] * tipsize * 0.8;
      TextOut(Round(sx) - Round(tipsize * 0.35), Round(sy) - Round(tipsize * 0.7), Chr(Ord('X') + i2));
    end;
    Image_N_6.Transparent := True;
    if not Image_N_6.Visible then Image_N_6.Visible := True;
  end;
end;

procedure TGUINav.TransformNHeader;
var notValid: LongBool;
    d: Double;
begin
    with NaviHeader do
    begin
      OriginalSize      := Point(Width, Height);
      SetHeaderSize;
      bStepsafterDEStop := Min(7, bStepsafterDEStop);
      sDEstop           := MaxCS(0.01, sDEstop);
      bUserChangeN      := False;
      eFOV.Text         := FloatToStr(dFOVy);
      rg_cam.ItemIndex  := bPlanarOptic;
      //set cam position when zstart<zmid
      d := LengthOfVec(TPVec3D(@hVGrads[2])^);
      CalcStepWidth(@NaviHeader);
      mAddVecWeight(@dXmid, @hVGrads[2], (dZstart - dZmid) / d);  //step back so that midpoint becomes startpoint
      dZend             := dZend - dZstart + dZmid;
      dZstart           := dZmid;
      NDEmultiplier     := 1;
      Moving            := False;
      try //Set FarPlane according to (Zend - Zstart) distance       10000
        eFarPlane.Text   := FloatToStrF(Max(1, Min(99999, (dZend - dZstart) / GetLocalAbsoluteDE(notValid))), ffFixed, 5, 1);
       // Edit_*N_4.Text := FloatToStrF(MinMaxCD(1, (dZend - dZstart) / (LengthOfSize(@NaviHeader) * dStepWidth), 90000), ffFixed, 5, 1);       //^^ might be critical here?
      finally
        bUserChangeN := True;
      end;
      //plus set zoom according to local DE  (and move further back or fore to give nearly the same view..todo)
   //   SetZoom;  //uses also GetLocalAbsoluteDE if not fixedSteps
    end;
end;

procedure TGUINav.MakeNaviHeader;
var d: Double;
begin
    with NaviHeader do
    begin
      MandId := actMandId;
      if TilingOptions = 0 then
      begin
        Width  := Image_N_1.Width;  //StrToIntTrim(ed_width.Text);
        Height := Image_N_1.Height; //StrToIntTrim(ed_height.Text);
      end;

      iOptions := (GUI.SpinEdit_M_2.Position shl 6) or              // smooth normals            // bit7..10=smoothNs(0..8)
                  (Ord(GUI.CheckBox_M_3.Checked) and 1) or          // first random step         // bit1=FirstStepRandom
                  ((Ord(GUI.CheckBox_M_8.Checked) and 1) shl 1) or  // Shortdistance check DE:   // bit2=Shortdist check DEs
                  ((Ord(GUI.CheckBox_M_2.Checked) and 1) shl 2);    // Raystep sub DEstop:       // bit3=StepSubDEstop


      Iterations        := StrToIntTrim(lb_mi_4.Caption); // GUI.MaxIterEdit     //FORMULA// 60
      MinimumIterations := StrToIntTrim(GUI.MinIterEdit.Text);                      //FORMULA// 1
      iMaxItsF2         := StrToIntTrim(GUI.MaxIterHybridPart2Edit.Text);           //FORMULA//
      bNormalsOnDE      := Byte(GUI.CheckBox_M_1.Checked);   //                     Normals on DE:
      bPlanarOptic      := rg_cam.ItemIndex;         // GUI.RadioGroup_M_2  FOVy Camera lense: Norm,Rect,360pan
      bStepsafterDEStop := GUI.SpinEdit_M_5.Position;        //                     Stepcount for binary search:

      // The bailout value for escapetime formulas.
      // If the 3d value exceeds this value while iterating,
      // the current point does not belong to the object.
      RStop             := StrToFloatK(lb_mi_1.Caption);  // GUI.RBailoutEdit.Text//FORMULA//

      // Defines the distance to the objects surface where raymarching stops.
      // Lower values gives more object details, but can also lead to undersampling.
      // The value is related to the width of a pixel.
      sDEstop := Max(0.001, StrToFloatK(lb_mi_3.Caption));// GUI.Edit_M_25.Text

      // The distance estimates are downscaled by this factor to avoid overstepping.
      // Reduce the value if overstepping occurs (black pixels, noisy image).
      // Too low values slows the rendering down.
      mZstepDiv := Max(0.001, Min(1, StrToFloatK(GUI.Edit_M_6.Text)));  //Raystep multiplier:

      //Use values lower than 1 to reduce overstepping.
      sRaystepLimiter := StrToFloatK(GUI.Edit_M_8.Text);                //Stepwidth limiter:


//------------------------------------------------------------------------------
//          POSITION / ROTATION (Euler angles: (xw,yw,zw):)
//------------------------------------------------------------------------------
      dXmid     := StrToFloatK(GUI.eXmid.Text);  //GUI.Edit_M_9  X midpoint
      dYmid     := StrToFloatK(GUI.eYmid.Text);  //GUI.Edit_M_10 Y midpoint

      dZmid     := StrToFloatK(GUI.eZmid.Text);    //GUI.Edit_M_17 render the 2d plane at the midpoint.
      dZstart   := StrToFloatK(GUI.eZstart.Text);  //GUI.Edit_M_1  render the 2d startplane.
      dZend     := StrToFloatK(GUI.eZend.Text);    //GUI.Edit_M_3  render the Z endplane.
      // Size of the Zstart viewplane. Set auto in nav, change if objects are cut at the image borders.
      dZoom     := StrToFloatK(GUI.eZoom.Text);    //GUI.Edit_M_5


      //4D ROTATION
      dXWrot    := StrToFloatK(Label_N_50.Caption) * Pid180; //GUI.XWEdit.Text//FORMULA//
      dYWrot    := StrToFloatK(Label_N_51.Caption) * Pid180; //GUI.YWEdit.Text//FORMULA//
      dZWrot    := StrToFloatK(Label_N_52.Caption) * Pid180; //GUI.ZWEdit.Text//FORMULA//

      // Field Of Vision
      dFOVy     := StrToFloatK(eFOV.Text);               //GUI.Edit_M_14.Text

//------------------------------------------------------------------------------
//          STEREO / CUTTING
//------------------------------------------------------------------------------
      dCutZ      := StrToFloatK(GUI.Edit_M_22.Text);
      dCutX      := StrToFloatK(GUI.Edit_M_23.Text);
      dCutY      := StrToFloatK(GUI.Edit_M_24.Text);
      bCutOption := Byte(GUI.CheckBox_M_4.Checked) or (Byte(GUI.CheckBox_M_5.Checked) shl 1) or (Byte(GUI.CheckBox_M_6.Checked) shl 2);   //todo side of cuts
      // bCutOption := Byte(False) or (Byte(False) shl 1) or (False) shl 2);   //todo side of cuts
      StereoScreenWidth    := StrToFloatK(GUI.Edit_M_15.Text);
      StereoScreenDistance := StrToFloatK(GUI.Edit_M_18.Text);
      StereoMinDistance    := StrToFloatK(GUI.Edit_M_13.Text);
//------------------------------------------------------------------------------

      bImageScale := ImageScale;

//------------------------------------------------------------------------------
//          JULIA
//------------------------------------------------------------------------------
      bIsJulia  := Byte(cb_julia_mode.Checked);        //GUI.CheckBox_M_7
      dJx       := StrToFloatK(Label_N_39.Caption);    //GUI.Edit_M_28.Text
      dJy       := StrToFloatK(Label_N_40.Caption);    //GUI.Edit_M_29.Text
      dJz       := StrToFloatK(Label_N_41.Caption);    //GUI.Edit_M_30.Text
      dJw       := StrToFloatK(GUI.eJW.Text);          // ! put trackbar


      //Multiplier for the 'Last length increase' option.
      //Decrease the value on high powers, increase on formulas with low scales.
      sColorMul := StrToFloatK(GUI.Edit_M_2.Text);

      //The distance to the objects surface, the raymarching stops,
      //will get bigger with the distance to the viewer.
      //This leads to a homogen object appearence, so it is normally choosen.
      bVaryDEstopOnFOV := Byte(GUI.CheckBox_M_9.Checked);

      //The map options calculates x,y coordinates from the specific
      //vector for spherical maps, this changes also the first color choice
      //that is usually based on smooth iterations.
      //You have to recalculate the image to see the result of this option change.
      byColor2Option := GUI.RadioGroup_M_1.ItemIndex;

      //Does the coloring after this number of iterations and not from bailout (-1,  disabled)
      //Click to change between Dynfog on its and Color on its
      if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
        //Label_N_38.Visible := True; ud_fog.Visible := True;
        //Label_N_V3.Caption := IntToStr(Round(fValue[9]));
        bDFogIt := StrToIntTrim(lb_mi_0.Caption)
      else
      //if sb_fog_or_color.Caption := 'Color on its:' then
        //Label_N_38.Visible := False; ud_fog.Visible := False;
        //Label_N_V3.Caption := IntToStr(Round(fValue[9]));
        bColorOnIt := Max(0, Min(255, StrToIntTrim(lb_mi_0.Caption) + 1));

      //bColorOnIt := Max(0, Min(255, StrToIntTrim(Edit_M_35.Text) + 1));
      //Press to switch between dynamic fog on iterations and volumetric light on light nr
      if GUI.ButtonVolLight.Caption = 'Dyn. fog on It.:' then
      begin
        bVolLightNr := 2 shl 4;
        //dynamic fog on iterations and volumetric light on light nr
        //bDFogIt := StrToIntTrim(Edit_M_16.Text);
      end
      //Tune the size of the volumetric map in 20% steps
      else bVolLightNr := Min(6, Max(1, StrToIntTrim(GUI.Edit_M_16.Text))) or ((GUI.UpDown_M_5.Position + 2) shl 4);


//------------------------------------------------------------------------------
//          AMBIENCE
//------------------------------------------------------------------------------
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
        // PostProForm
      bCalculateHardShadow    := 0;
      bCalc1HSsoft            := 0;
      bCalcAmbShadowAutomatic := 1;
      sAmbShadowThreshold     := 2;
      byCalcNsOnZBufAuto      := 0;
      bSSAO24BorderMirrorSize := 0;
//      end;
//------------------------------------------------------------------------------

      PCFAddon := @NaviHAddOn;

      GUI.PutLightFInHeader(NaviHeader);                                            //LIGHT//

//------------------------------------------------------------------------------
//          DE.combinate / interpolate
//------------------------------------------------------------------------------
      NaviHAddOn.bOptions1 := (NaviHAddOn.bOptions1 and $FC) or GUI.TabControl_F_2.TabIndex;//FORMULA//
      NaviHAddOn.bOptions2 := (Ord(GUI.CheckBox_F_2.Checked) and 1) or  (GUI.ComboBox_F_1.ItemIndex shl 1);//FORMULA//
      NaviHAddOn.bOptions3 := GUI.DECombineCmb.ItemIndex;                           //FORMULA//
      if NaviHAddOn.bOptions3 < 5 then
        //Absolute distance of the smooth combine functions,
        //you can use scientific notation like 3e-5 for small values.
        //Try 1/zoom to get close to a working value.
        sDEcombS := Min0MaxCS(StrToFloatK(GUI.Edit_F_23.Text), 100)                 //FORMULA//
      else
      begin
        DEmixColorOption := Max(0, Min(2, StrToIntTrim(GUI.Edit_F_23.Text)));       //FORMULA//
        //Scale value of the beginning formula, affects the DE accuracy
        sFmixPow := sNotZero(MinMaxCS(-100, StrToFloatK(GUI.Edit_F_25.Text), 100)); //FORMULA//
      end;
    end;
end;

procedure TGUINav.SetEditsFromHeaderNavi;
//var TileRect: TRect;
//    Crop: Integer;
begin
    bUserChangeN := False;
    with NaviHeader do
    try
      if (Width > 0) and (Height > 0) then InternAspectNavi := Width / Height;

      //btnCalc3D.SetFocus;

//      if NaviHeader.TilingOptions <> 0 then
//      begin
//        GetTilingInfosFromHeader(@NaviHeader, TileRect, Crop);
//        ed_width.Text := IntToStr(TileRect.Right - TileRect.Left + 1 - 2 * Crop);
//        ed_height.Text := IntToStr(TileRect.Bottom - TileRect.Top + 1 - 2 * Crop);
//      end else begin
//        ed_width.Text := IntToStr(Width);
//        ed_height.Text := IntToStr(Height);
//      end;

//      Edit_M_6.Text  := FloatToStrSingle(mZstepDiv);
//      Edit_M_9.Text  := FloatToStr(dXmid);
//      Edit_M_10.Text := FloatToStr(dYmid);
//      Edit_M_17.Text := FloatToStr(dZmid);
//      Edit_M_1.Text  := FloatToStr(dZstart);
//      Edit_M_3.Text  := FloatToStr(dZend);
//      Edit_M_5.Text  := FloatToStr(dZoom);

//      Edit_M_14.Text := FloatToStr(dFOVy);

//      Edit_M_2.Text  := FloatToStrSingle(sColorMul);
//      Edit_M_8.Text  := FloatToStrSingle(sRaystepLimiter);
//      Edit_M_15.Text := FloatToStrSingle(StereoScreenWidth);
//      Edit_M_18.Text := FloatToStrSingle(StereoScreenDistance);
//      Edit_M_13.Text := FloatToStrSingle(StereoMinDistance);
//      Edit_M_25.Text := FloatToStrSingle(sDEstop);

//      if Edit_M_33.Text <> Authors[0] then
//      begin
//        Edit_M_33.Enabled := (Authors[0] = IniVal[33]) or (Length(Authors[0]) < 2);
//        Edit_M_33.Text := Authors[0];
//      end;
//      Edit_M_34.Text := Authors[1];

//      SpinEdit_M_2.Position := (iOptions shr 6) and 15;
//      SpinEdit_M_5.Position := bStepsafterDEStop;
//      CheckBox_M_1.Checked := (bNormalsOnDE and 1) <> 0;
//      CheckBox_M_3.Checked := (iOptions and 1) <> 0;
//      CheckBox_M_8.Checked := (iOptions and 2) <> 0;
//      CheckBox_M_2.Checked := (iOptions and 4) <> 0;
//      Label_M_31.Caption := IntToStr(iAvrgDEsteps div 10) + '.' + IntToStr(iAvrgDEsteps mod 10);
//      Label_M_32.Caption := IntToStr(iAvrgIts div 10) + '.' + IntToStr(iAvrgIts mod 10);
//      if iMaxIts > 0 then Label_M_40.Caption := IntToStr(iMaxIts)
//                     else Label_M_40.Caption := '?';
//      Label_M_52.Caption := IntToTimeStr(iCalcTime);
//      Label_M_8.Caption  := IntToTimeStr(iCalcHStime);
//      Label_M_48.Caption := IntToTimeStr(iAmbCalcTime);
//      Label_M_50.Caption := IntToTimeStr(iReflectsCalcTime);
//      Edit_M_22.Text := FloatToStr(dCutZ);
//      Edit_M_23.Text := FloatToStr(dCutX);
//      Edit_M_24.Text := FloatToStr(dCutY);

      bImageScale := Max(1, Min(10, bImageScale));
      ImageScale := bImageScale;

//      SpeedButton_M_35.Caption := '1:' + IntToStr(ImageScale);
//      CheckBox_M_4.Checked := (bCutOption and 1) > 0;
//      CheckBox_M_5.Checked := (bCutOption and 2) > 0;
//      CheckBox_M_6.Checked := (bCutOption and 4) > 0;
//      CheckBox_M_9.Checked := (bVaryDEstopOnFOV > 0);
      cb_julia_mode.Checked := bIsJulia > 0;//CheckBox_M_7.Checked := bIsJulia > 0;
//      RadioGroup_M_2.ItemIndex := bPlanarOptic;
//      RadioGroup_M_1.ItemIndex := byColor2Option;
      Label_N_39.Caption := FloatToStr(dJx);//Edit_M_28.Text := FloatToStr(dJx);
      Label_N_40.Caption := FloatToStr(dJy);//Edit_M_29.Text := FloatToStr(dJy);
      Label_N_41.Caption := FloatToStr(dJz);//Edit_M_30.Text := FloatToStr(dJz);
//      Edit_M_7.Text := FloatToStr(dJw);
//      SetEdit_M_16Text;
//      Edit_M_35.Text := IntToStr(bColorOnIt - 1);
//      PageControl_M_1Change(Self);

      SetEulerEditsFromHeader; // none on board

      //UpdateFromHeader(@NaviHeader); {FORMULA}

    finally
      bUserChangeN := True;
    end;
end;
procedure TGUINav.SetEulerEditsFromHeader;
var v3: TVec3D; // Q: TQuaternion;
begin
//  MatrixToQuat(MHeader.hVGrads, Q);  // MatrixToAngles(v3);
//  v3 := GetEulerFromQuat(Q);
    if not MatrixToAngles(v3, @NaviHeader.hVGrads) then
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

//procedure TGUINav.UpdateFromHeader(Header: TPMandHeader10);
//begin
//    with Header^ do
//    begin
//      bUserChangeN := False;
//      RBailoutEdit.Text := FloatToStr(RStop);
//      TabControl_F_2Change(Self);
//      MaxIterEdit.Text := IntToStr(Iterations);
//      MaxIterHybridPart2Edit.Text := IntToStr(iMaxItsF2);
//      MinIterEdit.Text := IntToStr(MinimumIterations);
//      XWEdit.Text := FloatToStr(dXWrot / Pid180);
//      YWEdit.Text := FloatToStr(dYWrot / Pid180);
//      ZWEdit.Text := FloatToStr(dZWrot / Pid180);
//      CheckBox_F_2.Checked := (PTHeaderCustomAddon(PCFAddon).bOptions2 and 1) > 0;
//      ComboBox_F_1.ItemIndex := (PTHeaderCustomAddon(PCFAddon).bOptions2 and 6) shr 1;
//      DECombineCmb.ItemIndex := PTHeaderCustomAddon(PCFAddon).bOptions3 and 7;
//      if DECombineCmb.ItemIndex < 5 then
//        Edit_F_23.Text := FloatToStrSingle(Min0MaxCS(sDEcombS, 100))
//      else
//      begin
//        Edit_F_23.Text := IntToStr(DEmixColorOption);
//        Edit_F_25.Text := FloatToStrSingle(sNotZero(MinMaxCS(-100, sFmixPow, 100)));
//      end;
//      bUserChangeN := True;
//    end;
//end;

{$ENDREGION '========================================================================== > | EXTERNALIZE'}

{$REGION '============================================================================= > | TRACKBAR'}

procedure TGUINav.tbxChange(Sender: TObject);
var t, i: Integer; s: String; bUpdate: LongBool;
    RS: TTrackBarEx; LV: TLabel;
    d, r, ph, th, sp, cp, st, ct: Double;
begin
    if cb_julia_mode.Checked then begin
      if bUserChangeN then begin
        RS := Sender as TTrackBarEx;
        t := RS.Tag;
        //x0,x1,x2,x3 adjustments   16*640 ,640, 40, 40/16     slider: -60..60
        d := (Image_N_1.Width * 16) shr (rg_Adj.ItemIndex * 4);   //def:= 640*16 bitshift (2)*4 := 40

        if cb_julia_mode_sphere.Checked then
        begin //julia, sphere coords
          r := MaxCD(1e-10, LengthOfVec(TPVec3D(@fZeroJ[0])^));
          ph := ArcSinSafe(fZeroJ[2] / r);
          th := ArcTan2(fZeroJ[1], NonZero(fZeroJ[0]));

          if t = 0 then begin  //R scale
            if r < 1e-9 then fZeroJ[0] := 1e-9 else begin
              d := MaxCD(1e-10, r + RS.Position / d) / r;
              TPVec3D(@fValueJ[0])^ := ScaleVector(TPVec3D(@fZeroJ[0])^, d);
            end;
          end

          else if t = 1 then begin  //(-)  x<->y rotate
            r := Sqrt(Sqr(fZeroJ[0]) + Sqr(fZeroJ[1]));
            d := th + RS.Position * 10 / d;
            SinCosD(d, st, ct);
            fValueJ[0] := ct * r;
            fValueJ[1] := st * r;
          end else begin  //(|) sqrt(xx+yy)<->z rotate
            d := ph + RS.Position * 4 / d;
            SinCosD(d, sp, cp);
            SinCosD(th, st, ct);
            fValueJ[0] := cp * ct * r;
            fValueJ[1] := cp * st * r;
            fValueJ[2] := sp * r;
          end;
          TPVec3D(@NaviHeader.dJx)^ := TPVec3D(@fValueJ[0])^;
        end

        else if fTypeJ[t] = -5 then fValueJ[t] := fZeroJ[t] * Power(3, RS.Position * fRangeJ[t] / d)
        else fValueJ[t] := fZeroJ[t] + RS.Position * fRangeJ[t] / d;
        bUpdate := False;
        TPVec3D(@NaviHeader.dJx)^[t] := fValueJ[t];
        UpdateJuliaLabels;
        bUpdate := NaviHeader.bIsJulia > 0;
  //    end;
        if bUpdate then NewCalc;
      end;
    end;
end;
procedure TGUINav.tbxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t: Integer;
    RS: TTrackBarEx;
begin
    bUserChangeN := False;
    RS := Sender as TTrackBarEx;
    t := RS.Tag;
    if cb_julia_mode_sphere.Checked then TPVec3D(@fZeroJ[0])^ := TPVec3D(@fValueJ[0])^
    else fZeroJ[t] := fValueJ[t]; //NEW
    RS.Position := 0;
    bUserChangeN := True;
end;
procedure TGUINav.lmdMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t, i: Integer; s: String;
    L: TLabel;
    d: Double;
    bUpdate: LongBool;
begin                        //inputBox popup
    L := Sender as TLabel;
    t := L.Tag;
    d := fValueJ[t];
    s := FloatToStr(d);
    if not InputQuery('Input', 'New value:', s) then Exit;
    d := StrToFloatK(s);

    fValueJ[t] := d;

    TPVec3D(@NaviHeader.dJx)^[t] := fValueJ[t];
    UpdateJuliaLabels;
    bUpdate := NaviHeader.bIsJulia > 0;
    fZeroJ[t] := fValueJ[t];

    if bUpdate then NewCalc;

end;
procedure TGUINav.sb_julia_inClick(Sender: TObject);
begin       //        SpeedButton_N_24
    InputJuliaVals;
    if NaviHeader.bIsJulia > 0 then Newcalc;
end;
procedure TGUINav.sb_julia_outClick(Sender: TObject);
begin  //send julia values to main  SpeedButton_N_25
    GUI.Edit_M_28.Text := FloatToStr(NaviHeader.dJx);
    GUI.Edit_M_29.Text := FloatToStr(NaviHeader.dJy);
    GUI.Edit_M_30.Text := FloatToStr(NaviHeader.dJz);
    GUI.cb_julia_mode.Checked := NaviHeader.bIsJulia > 0;
end;
procedure TGUINav.UpdateJuliaLabels;
begin
    //lmd.Caption := FloatToStrSingle(fValueJ[0]);
    Label_N_39.Caption := FloatToStrSingle(fValueJ[0]);
    Label_N_40.Caption := FloatToStrSingle(fValueJ[1]);
    Label_N_41.Caption := FloatToStrSingle(fValueJ[2]);
end;
procedure TGUINav.ResetJuliaPos0Vals;
begin
    TPVec3D(@fZeroJ[0])^ := TPVec3D(@GUINav.NaviHeader.dJx)^;
    TPVec3D(@fValueJ[0])^ := TPVec3D(@fZeroJ[0])^;
    UpdateJuliaLabels;
    cb_julia_mode.Checked := NaviHeader.bIsJulia > 0;
end;
procedure TGUINav.InputJuliaVals;
begin
    NaviHeader.bIsJulia := GUI.MHeader.bIsJulia;
    TPVec3D(@NaviHeader.dJx)^ := TPVec3D(@GUI.MHeader.dJx)^;
    ResetJuliaPos0Vals;
end;

//---->

procedure TGUINav.tb4dChange(Sender: TObject);
var t, i: Integer; s: String; bUpdate: LongBool;
    RS: TTrackBarEx; LV: TLabel;
    d, r, ph, th, sp, cp, st, ct: Double;
begin
    if bUserChangeN then begin
      RS := Sender as TTrackBarEx;
      t := RS.Tag;
      //x0,x1,x2,x3 adjustments   16*640 ,640, 40, 40/16     slider: -60..60
      d := (Image_N_1.Width * 16) shr (rg_Adj.ItemIndex * 4);   //def:= 640*16 bitshift (2)*4 := 40
      //?
      //if isIntType(fType4d[t]) then d := MinMaxCD(3, d * 0.5, 50);
      //else if fType4d[t] = -5 then
      //fValue4d[t] := fZero4d[t] * Power(3, RS.Position * fRange4d[t] / d);
      //else >>>
      fValue4d[t] := fZero4d[t] + RS.Position * fRange4d[t] / d;

      bUpdate := False;

//      else if t in [6..8] then begin
      TPVec3D(@NaviHeader.dXWrot)^[t] := fValue4d[t];
      Update4dRotLabels;
      bUpdate := True;
//      end;

      if bUpdate then NewCalc;
    end;
end;
procedure TGUINav.tb4dMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t: Integer;
    RS: TTrackBarEx;
begin
    bUserChangeN := False;
    RS := Sender as TTrackBarEx;
    t := RS.Tag;
    //if (t < 3) and cb_julia_mode_sphere.Checked then TPVec3D(@fZeroJ[0])^ := TPVec3D(@fValueJ[0])^;

    //?
    //else
    fZero4d[t] := fValue4d[t]; //NEW

    RS.Position := 0;
    bUserChangeN := True;
end;
procedure TGUINav.lmd4dMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t, i: Integer; s: String;
    L: TLabel;
    d: Double;
    bUpdate: LongBool;
begin                        //inputBox popup
    L := Sender as TLabel;
    t := L.Tag;
    d := fValue4d[t];
    s := FloatToStr(d / Pid180); //else

    if not InputQuery('Input', 'New value:', s) then Exit;
    d := StrToFloatK(s) * Pid180;

    fValue4d[t] := d;

    TPVec3D(@NaviHeader.dXWrot)^[t] := fValue4d[t];
    Update4dRotLabels;
    bUpdate := True;

    fZero4d[t] := fValue4d[t];  //NEW

    if bUpdate then NewCalc;

end;
procedure TGUINav.sb_4d_inClick(Sender: TObject);
begin         //      SpeedButton_N_29
    Input4dRotVals;
    Newcalc;
end;
procedure TGUINav.sb_4d_outClick(Sender: TObject);
begin         //      SpeedButton_N_30
    GUI.XWEdit.Text := FloatToStr(NaviHeader.dXWrot / Pid180);{FORMULA}
    GUI.YWEdit.Text := FloatToStr(NaviHeader.dYWrot / Pid180);{FORMULA}
    GUI.ZWEdit.Text := FloatToStr(NaviHeader.dZWrot / Pid180);{FORMULA}
end;
procedure TGUINav.Update4dRotLabels;
begin
    Label_N_50.Caption := FloatToStrSingle(fValue4d[0] / Pid180);
    Label_N_51.Caption := FloatToStrSingle(fValue4d[1] / Pid180);
    Label_N_52.Caption := FloatToStrSingle(fValue4d[2] / Pid180);
end;
procedure TGUINav.Reset4dRotVals;
begin
    TPVec3D(@fZero4d[0])^ := TPVec3D(@GUINav.NaviHeader.dXWrot)^;
    TPVec3D(@fValue4d[0])^ := TPVec3D(@fZero4d[0])^;
    Update4dRotLabels;
end;
procedure TGUINav.Input4dRotVals;
begin
    TPVec3D(@NaviHeader.dXWrot)^ := TPVec3D(@GUI.MHeader.dXWrot)^;
    Reset4dRotVals;
end;

//---->

procedure TGUINav.CheckFocusM;  //misc vals
begin
    FocusedSliderM := -1;
    //MISC
    if tb_mi_0.Focused then FocusedSliderM := 0 else
    if tb_mi_1.Focused then FocusedSliderM := 1 else
    if tb_mi_2.Focused then FocusedSliderM := 2 else
    if tb_mi_3.Focused then FocusedSliderM := 3 else
    if tb_mi_4.Focused then FocusedSliderM := 4;

    sb_misc_in.Enabled := FocusedSliderM in [0..4];
    sb_misc_out.Enabled := sb_misc_in.Enabled;
    FocusedSliderM := Max(0, FocusedSliderM);
end;
procedure TGUINav.tbmChangedValue(Sender: TObject; NewValue: Integer);
var t, i: Integer; s: String; bUpdate: LongBool;
    JT: TJvTracker; JL: TJvLabel;
    d, r, ph, th, sp, cp, st, ct: Double;
begin
    if bUserChangeN then begin
      JT := Sender as TJvTracker;
      t := JT.Tag;
      //x0,x1,x2,x3 adjustments   16*640 ,640, 40, 40/16     slider: -60..60
      d := (Image_N_1.Width * 16) shr (rg_Adj.ItemIndex * 4);   //def:= 640*16 bitshift (2)*4 := 40

      if isIntType(fTypeM[t]) then d := MinMaxCD(3, d * 0.5, 50)
      //else fValueM[t] := fZeroM[t] + RS.Position * fRangeM[t] / d;
      else if fTypeM[t] = -5 then fValueM[t] := fZeroM[t] * Power(3, JT.Value * fRangeM[t] / d)
      else fValueM[t] := fZeroM[t] + JT.Value * fRangeM[t] / d;

      bUpdate := False;
      //------------------------------------------------------------------------
      JL := FindComponent('lb_mi_' + IntToStr(t)) as TJvLabel;
      if JL <> nil then begin
        s := JL.Caption;
        if t = 0 then begin
          i := Round(Min0MaxCD(fValueM[0], 255));
          if sb_fog_or_color.Caption = 'Dyn Fog on its:' then NaviHeader.bDFogIt := i
          else begin
            NaviHeader.bColorOnIt := i;
            Dec(i);
          end;
          fValueM[0] := i;
          JL.Caption := IntToStr(i);
        end

        else if t = 1 then begin
          fValueM[1] := MaxCD(0, fValueM[1]);
          NaviHeader.RStop := fValueM[1];
          JL.Caption := FloatToStrSingle(NaviHeader.RStop);
        end

        else if t = 2 then begin
          fValueM[2] := Min0MaxCD(fValueM[2], 100);
          NaviHeader.sDEcombS := fValueM[2];
          JL.Caption := FloatToStrSingle(NaviHeader.sDEcombS);
        end

        else if t = 3 then begin
          fValueM[3] := MinMaxCD(0.1, fValueM[3], 300);
          NaviHeader.sDEstop := fValueM[3];
          JL.Caption := FloatToStrSingle(NaviHeader.sDEstop);
          DEstopChanged := True;
        end

        else if t = 4 then begin
          fValueM[4] := MinMaxCD(1, fValueM[4], 2000);
          NaviHeader.Iterations := Round(fValueM[4]);
          JL.Caption := IntToStr(NaviHeader.Iterations);
        end;

        bUpdate := s <> JL.Caption;
      end;
      CheckFocusM;
      if bUpdate then NewCalc;
    end;
end;
procedure TGUINav.tbmMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t: Integer;
    JT: TJvTracker;
begin
    bUserChangeN := False;
    JT := Sender as TJvTracker;
    t := JT.Tag;
    fZeroM[t] := fValueM[t];
    JT.Value := 0;
    bUserChangeN := True;
    CheckFocusM;
end;
procedure TGUINav.lmdmMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t, i: Integer; s: String;
    JL: TJvLabel;
    d: Double;
    bUpdate: LongBool;
begin                        //inputBox popup
    JL := Sender as TJvLabel;
    t := JL.Tag;
    d := fValueM[t];
    if t = 4 then s := IntToStr(Round(d)) else s := FloatToStrSingle(d);    //misc    Iterations
    if not InputQuery('Input', 'New value:', s) then Exit;
    if t = 4 then fValueM[t] := StrToInt(s) else fValueM[t] := StrToFloatK(s);

    //MISC
    if t = 0 then begin
      fValueM[0] := Min0MaxCD(255, fValueM[0]);
      i := Round(fValueM[0]);
      if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
        NaviHeader.bDFogIt := i
      else begin
        NaviHeader.bColorOnIt := i;
        Dec(i);
      end;
      JL.Caption := IntToStr(i);
    end
    else if t = 1 then begin
      fValueM[1] := MaxCD(0, fValueM[1]);
      NaviHeader.RStop := fValueM[1];
      JL.Caption := FloatToStrSingle(NaviHeader.RStop);
    end
    else if t = 2 then begin
      fValueM[2] := Min0MaxCD(fValueM[2], 100);
      NaviHeader.sDEcombS := fValueM[2];
      JL.Caption := FloatToStrSingle(NaviHeader.sDEcombS);
    end
    else if t = 3 then begin
      fValueM[3] := MinMaxCD(0.1, fValueM[3], 300);
      NaviHeader.sDEstop := fValueM[3];
      JL.Caption := FloatToStrSingle(NaviHeader.sDEstop);
      DEstopChanged := True;
    end
    else if t = 4 then begin
      fValueM[4] := MinMaxCD(1, fValueM[4], 5000);
      NaviHeader.Iterations := Round(fValueM[4]);
      JL.Caption := IntToStr(NaviHeader.Iterations);
    end;
    bUpdate := s <> JL.Caption;

    //fZeroM[t] := fValueM[t];

    if bUpdate then NewCalc;
    CheckFocusM;
end;
procedure TGUINav.sb_misc_inClick(Sender: TObject);
begin  //reset a divers value   SpeedButton_N_31
    CheckFocusM;
    case FocusedSliderM of
    0: begin
         if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
         begin
           NaviHeader.bDFogIt := GUI.MHeader.bDFogIt;
           fZeroM[0] := NaviHeader.bDFogIt;
         end
         else
         begin
           NaviHeader.bColorOnIt := GUI.MHeader.bColorOnIt;
           fZeroM[0] := NaviHeader.bColorOnIt - 1;
         end;
         fZeroM[0] := NaviHeader.bDFogIt;
       end;
    1: begin
         NaviHeader.RStop := GUI.MHeader.RStop;
         fZeroM[1] := NaviHeader.RStop;
       end;
    2: begin
         NaviHeader.sDEcombS := GUI.MHeader.sDEcombS;
         fZeroM[2] := NaviHeader.sDEcombS;
       end;
    3: begin
         NaviHeader.sDEstop := GUI.MHeader.sDEstop;   //correction
         fZeroM[3] := NaviHeader.sDEstop;
       end;
    4: begin
         NaviHeader.Iterations := GUI.MHeader.Iterations;
         fZeroM[4] := NaviHeader.Iterations;
       end;
    else Exit;
    end;
    fValueM[FocusedSliderM] := fZeroM[FocusedSliderM];
    UpdateMiscLabels;
    Newcalc;
end;
procedure TGUINav.sb_misc_outClick(Sender: TObject);
begin   //send a misc value     SpeedButton_N_32
    CheckFocusM;
    case FocusedSliderM of
    0:  if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
          GUI.Edit_M_16.Text    := IntToStr(NaviHeader.bDFogIt)
        else GUI.Edit_M_35.Text := IntToStr(NaviHeader.bColorOnIt - 1);
    1:  GUI.RBailoutEdit.Text   := FloatToStrSingle(NaviHeader.RStop);{FORMULA}
    2:  GUI.Edit_F_23.Text      := FloatToStrSingle(NaviHeader.sDEcombS);{FORMULA}
    3:  GUI.Edit_M_25.Text      := FloatToStrSingle(NaviHeader.sDEstop);
    4:  GUI.MaxIterEdit.Text    := IntToStr(NaviHeader.Iterations);{FORMULA}
    end;
end;
procedure TGUINav.UpdateMiscLabels;
begin
    if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
      lb_mi_0.Caption    := IntToStr(NaviHeader.bDFogIt)
    else lb_mi_0.Caption := IntToStr(NaviHeader.bColorOnIt - 1);
    lb_mi_1.Caption      := FloatToStrSingle(NaviHeader.RStop);
    lb_mi_2.Caption      := FloatToStrSingle(NaviHeader.sDEcombS);
    lb_mi_3.Caption      := FloatToStrSingle(NaviHeader.sDEstop);
    lb_mi_4.Caption      := IntToStr(NaviHeader.Iterations);
end;
procedure TGUINav.sb_fog_or_colorClick(Sender: TObject);
begin       //      SpeedButton_N_33
    if sb_fog_or_color.Caption = 'Dyn Fog on its:' then
    begin
      sb_fog_or_color.Caption  := 'Color on its:';
      Label_N_38.Visible       := False;
      ud_fog.Visible           := False;
      fValueM[0]               := NaviHeader.bColorOnIt - 1;
    end else begin
      sb_fog_or_color.Caption  := 'Dyn Fog on its:';
      Label_N_38.Visible       := True;
      ud_fog.Visible           := True;
      fValueM[0]               := NaviHeader.bDFogIt;
    end;
    fZeroM[0]                  := fValueM[0];
    lb_mi_0.Caption            := IntToStr(Round(fValueM[0]));
end;

//---->  #

procedure TGUINav.CheckFocusF;
var i:integer; JT:TJvTracker;
begin
    FocusedSliderF := -1;
    //FORMULA
    for i := 0 to 15 do
    begin
      JT := FindComponent('tb_fv_' + IntToStr(i)) as TJvTracker;
      if JT.Focused then FocusedSliderF := i ;
    end;

    sb_frm_val_in.Enabled := FocusedSliderF in [0..15];
    sb_frm_val_out.Enabled := sb_frm_val_in.Enabled;
    FocusedSliderF := Max(0, FocusedSliderF);
end;
procedure TGUINav.formula_value_update_Click(Sender: TObject);
var i : Integer;
begin
 // 1. Params  in from main  <>
 // 2. formula in from main  <>
 // 3. values changed  <>
 // 4. formula add from here
 // 5. formula tab is changed update view

    //if FocusedSlider2 > 15 then FocusedSlider2 := 0;

    //if Sender = sb_frm_val_in then CopyFormulaValueFromMain(FormulaIndexF(FocusedSliderF))
    if Sender = tc_frm then begin  //  ud_frm2
      FocusedSliderF := 0;
      FSubIndexTopF  := 0;
    end;

    CurrentFindex := FormulaIndexF(FocusedSliderF);
    lb_fname.Caption := CopyFormulaNameFromMain(CurrentFindex.X); //Fname
    if (NaviHAddon.bOptions1 and 3) = 1 then begin  //interpol hybrid has single values in itcount:
      lb_frm_it.Caption := FloatToStrSingle(PSingle(@NaviHAddOn.Formulas[CurrentFindex.X].iItCount)^);
      lb_frm_design.Caption := 'Weight:';
    end
    else begin
      lb_frm_it.Caption := IntToStr(NaviHAddOn.Formulas[CurrentFindex.X].iItCount);
      lb_frm_design.Caption := 'Iterations:';
    end;

    for i := 0 to 15 do begin //update all slider
      fValuef[i]   := GetFormulaValue(FormulaIndexF(i)); //from naviHaddon
      fZerof[i]    := fValuef[i];
      fTypef[i]    := GetFormulaValType(FormulaIndexF(i));
      if isAngleType(fTypef[i]) then fRangef[i] := 15 else fRangef[i] := 1;
    end;
    UpdateMiscLabels;
    UpdateFormulaLabelsF(CurrentFindex);
    if (Sender = sb_frm_val_in) or (Sender = ud_frm_it) then Newcalc;

end;

procedure TGUINav.tbChangedValue(Sender: TObject; NewValue: Integer);
var t, i: Integer;s: String;
    JT: TJvTracker; JL: TJvLabel;
    d, r, ph, th, sp, cp, st, ct: Double;
    bUpdate: LongBool;
begin
    if bUserChangeN then
    begin
      JT := Sender as TJvTracker;
      t := JT.Tag;
      //x0,x1,x2,x3 adjustments   16*640 ,640, 40, 40/16     slider: -60..60
      d := (Image_N_1.Width * 16) shr (rg_Adj.ItemIndex * 4);   //def:= 640*16 bitshift (2)*4 := 40
      if isIntType(fTypef[t]) then d := MinMaxCD(3, d * 0.5, 50);
      if fTypef[t] = -5 then fValuef[t] := fZerof[t] * Power(3, JT.Value * fRangef[t] / d)
      else fValuef[t] := fZerof[t] + JT.Value * fRangef[t] / d;
      bUpdate := False;
      //if RS.Visible then begin  //put new value to navi haddon
      FocusedSliderF := t;
      JL := FindComponent('lb_mi_' + IntToStr(FocusedSliderF)) as TJvLabel;
      if JL <> nil then begin
        s := JL.Caption;
        UpdateFormulaLabelsF(FormulaIndexF(FocusedSliderF));
        NaviHAddon.Formulas[FormulaIndexF(FocusedSliderF).X].dOptionValue[FormulaIndexF(FocusedSliderF).Y] := fValuef[t];
        bUpdate := s <> JL.Caption;
      end;
      //end;
      if bUpdate then NewCalc;
      CheckFocusF;
    end;
end;
procedure TGUINav.tbMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t: Integer;
    JT: TJvTracker;
begin
    bUserChangeN := False;
    JT := Sender as TJvTracker;
    t := JT.Tag;
    fZerof[t] := fValuef[t];
    JT.Value := 0;
    bUserChangeN := True;
    CheckFocusF;
end;
procedure TGUINav.lmdfMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var t, i: Integer;
    L: TJvLabel;
    d: Double;
    bUpdate: LongBool;
    s: String;
begin                        //inputBox popup
    L := Sender as TJvLabel;
    t := L.Tag;
    d := fValuef[t];

    if isIntType(fTypef[t]) then s := IntToStr(Round(d)) else s := FloatToStr(d);
    if not InputQuery('Input', 'New value:', s) then Exit;
    if isIntType(fTypef[t]) then fValuef[t] := StrToInt(s) else fValuef[t] := StrToFloatK(s);

    s := L.Caption;
    UpdateFormulaLabelsF(FormulaIndexF(t));
    NaviHAddon.Formulas[FormulaIndexF(t).X].dOptionValue[FormulaIndexF(t).Y] := fValuef[t];
    bUpdate := s <> L.Caption;

    //end;

    fZerof[t] := fValuef[t];
    if bUpdate then NewCalc;
    CheckFocusF;
end;

//big update
procedure TGUINav.sb_frm_val_inClick(Sender: TObject);
var i: Integer;
begin          //reset value ..from focused slider
    i:=FocusedSliderF;
    CheckFocusF;
    //if FocusedSlider2 > 15 then FocusedSlider2 := 0;
    CopyFormulaValueFromMain(FormulaIndexF(i));
    CurrentFindex := FormulaIndexF(i);

    //for i := 0 to 15 do begin //update all slider
    fValuef[i]   := GetFormulaValue(FormulaIndexF(i)); //from naviHaddon
    fZerof[i]    := fValuef[i];
    fTypef[i]    := GetFormulaValType(FormulaIndexF(i));
    if isAngleType(fTypef[i]) then fRangef[i] := 15 else fRangef[i] := 1;
    //end;

    UpdateFormulaLabelsF(CurrentFindex);
    Newcalc;
end;
procedure TGUINav.sb_frm_val_outClick(Sender: TObject);
var E: TEdit;    //   SpeedButton_N_27
begin  //send formula value to main
    CurrentFindex := FormulaIndexF(FocusedSliderF);
    GUI.HAddOn.Formulas[CurrentFindex.X].dOptionValue[CurrentFindex.Y] := fValuef[FocusedSliderF];
    if GUI.tc_frm.TabIndex = CurrentFindex.X then//{FORMULA}
    begin
      E := (GUI.FindComponent('Edit_F_' + IntToStr(CurrentFindex.Y)) as TEdit);{FORMULA}
      if isIntType(fTypef[FocusedSliderF]) then
        E.Text := IntToStr(Round(fValuef[FocusedSliderF]))
      else
        E.Text := FloatToStr(fValuef[FocusedSliderF]);
    end;
end;

procedure TGUINav.ud_frm_itClick(Sender: TObject; Button: TUDBtnType);
begin
    with NaviHAddOn.Formulas[CurrentFindex.X] do begin
      if Button = btPrev then begin //ipol hybrid
        if (NaviHAddon.bOptions1 and 3) = 1 then PSingle(@iItCount)^ := Max0S(PSingle(@iItCount)^ - 0.1)
        else iItCount := Max(0, StrToIntTrim(lb_frm_it.Caption) - 1);
      end
      else if Button = btNext then begin
        if (NaviHAddon.bOptions1 and 3) = 1 then PSingle(@iItCount)^ := PSingle(@iItCount)^ + 0.1
        else iItCount := StrToIntTrim(lb_frm_it.Caption) + 1;
      end;
    end;
    formula_value_update_Click(Sender);//sb_frm_val_inClick;
end;

procedure TGUINav.CopyFormulaValueFromMain(Findex: TPoint);
begin
    NaviHAddon.Formulas[Findex.X].dOptionValue[Findex.Y] := GUI.HAddon.Formulas[Findex.X].dOptionValue[Findex.Y];
end;
function TGUINav.CopyFormulaNameFromMain(Findex: Integer): AnsiString;
begin
    Result := CustomFtoStr(GUI.HAddon.Formulas[Min(5, Max(0, Findex))].CustomFname);
end;
function TGUINav.GetFormulaValType(Findex: TPoint): Integer;
begin
    Result := NaviHAddon.Formulas[Findex.X].byOptionType[Findex.Y];
end;
function TGUINav.GetFormulaValue(Findex: TPoint): Double;
begin
    Result := NaviHAddon.Formulas[Findex.X].dOptionValue[Findex.Y];
end;
function TGUINav.FormulaIndexF(iSlider: Integer): TPoint;
begin
    Result.X := Max(0, Min(5, tc_frm.TabIndex));
    Result.Y := Max(0, Min(15, FSubIndexTopF + iSlider));
end;
procedure TGUINav.UpdateFormulaLabelsF(Findex: TPoint);
var i, i2, h: Integer; b: Boolean;
    LF: TJvgLabel; LV: TJvLabel; RX: TJvTracker;
begin
    for i := 0 to 15 do begin
      i2 := FSubIndexTopF + i;
      LF := FindComponent('lb_fn_' + IntToStr(i)) as TJvgLabel;
      LV := FindComponent('lb_fv_' + IntToStr(i)) as TJvLabel;
      RX := FindComponent('tb_fv_' + IntToStr(i)) as TJvTracker;
      if (LF <> nil) and (LV <> nil) and (RX <> nil) then begin
        b := (i2 < NaviHAddOn.Formulas[Findex.X].iOptionCount) and
         (((NaviHAddOn.bOptions1 and 3) = 1) or (NaviHAddOn.Formulas[Findex.X].iItCount > 0));
        LF.Visible := b; LV.Visible := b; RX.Visible := b;
        if b then begin
          LF.Caption := PTCustomFormula(NaviHeader.PHCustomF[Findex.X]).sOptionStrings[i2];
          if not isIntType(fTypef[i]) then LV.Caption := FloatToStrSingle(fValuef[i])
          else LV.Caption := IntToStr(Round(fValuef[i]));
        end;
      end;
      //CheckFormulaImageVis;
    end;
    if NaviHAddOn.Formulas[Findex.X].iOptionCount = 0 then
    begin
      pn_frm_mid2.Caption := 'No Options';
      pn_frm_mid.Height:=18;
    end
    else
    begin
      pn_frm_mid2.Caption := '';
      h:=lb_fn_0.Height+tb_fv_0.Height;
      pn_frm_mid.Height:=(NaviHAddOn.Formulas[Findex.X].iOptionCount*h)+8;
      //pn_frm_mid.Height:=iOptionCount*h;
    end;
    //CheckFocusF;
end;

// --->

procedure TGUINav.sb_frm_inClick(Sender: TObject); //insert formula from main
begin       //     SpeedButton_N_16
    WaitForCalcToStop(1000);
    GUI.MakeHeader;
    NaviHAddon                    := GUI.HAddOn;
    NaviHeader.Iterations         := GUI.MHeader.Iterations;
    NaviHeader.MinimumIterations  := GUI.MHeader.MinimumIterations;
    NaviHeader.iMaxItsF2          := GUI.MHeader.iMaxItsF2;
    NaviHeader.RStop              := GUI.MHeader.RStop;
    NaviHeader.sDEcombS           := GUI.MHeader.sDEcombS;
    NaviHeader.sDEstop            := GUI.MHeader.sDEstop; //*width/naviheader.width
    DEstopChanged                 := False;
    bUserChangeN                  := False;
    formula_value_update_Click(Sender);//sb_frm_val_inClick; //update adjust panel
    bUserChangeN                  := True;
    //AdjustPanel3positions;
    NewCalc;
end;
procedure TGUINav.sb_frm_outClick(Sender: TObject);
begin   //send all fvals to main     SpeedButton_N_28
    RoundFvals(NaviHAddon);
    GUI.HAddOn := NaviHAddon;
    GUI.tc_frmChange(Sender);{FORMULA}
end;

procedure TGUINav.sb_par_inClick(Sender: TObject); //insert main paras
begin            // SpeedButton_N_P_FROM_M_11
    GUI.PropagateCurrFrameNumber;
    WaitForCalcToStop(1000);
    GUI.MakeHeader;                            //TRANSFER CURRENT VALS TO GUI.HEADER
    AssignHeader(@NaviHeader, @GUI.MHeader);
    Authors             := GUI.Authors;
    bUserChangeN        := False;
    TransformNHeader;
    ResetJuliaPos0Vals;
    formula_value_update_Click(Sender);//sb_frm_val_inClick; //update adjust panel
    PaintZeroVec;
    PaintCoord;
    //AdjustPanel3positions;
    DynFogAmountChanged := False;
    DEstopChanged       := False;
    ud_fog.Position     := NaviHeader.Light.TBpos[6];
    Label_N_38.Caption  := IntToStr(ud_fog.Position - 53);
//    if Copy(GUI.Caption, 1, 13) = 'Mandelbulb 3D' then
//      Caption := 'main paras' else
    Caption             := GUI.Caption;
    bUserChangeN        := True;
    NewCalc;
end;
procedure TGUINav.sb_par_outClick(Sender: TObject);  //copy view to main
begin          // SpeedButton_N_P_TO_MAIN_14
    //GUI.PageCtrls.ActivePage := TabImage;
    with GUI.MHeader do
    begin
      FastMove(NaviHeader.dZstart, dZstart, 80);  // dZstart up to RStop
      FastMove(NaviHeader.hVGrads, hVGrads, 72);  // hVGrads only
      dFOVy                         := NaviHeader.dFOVy;
      if DynFogAmountChanged then
      begin
        Light.TBpos[6]              := NaviHeader.Light.TBpos[6];
        GUI.LAtmpLight.TBpos[6]     := Light.TBpos[6];{LIGHT}
      end;
      sNaviMinDist                  := StrToFloatK(Edit_N_6.Text);
      bPlanarOptic                  := NaviHeader.bPlanarOptic;
      bStereoMode                   := 0;
      Iterations                    := NaviHeader.Iterations;
      dFOVy                         := NaviHeader.dFOVy;
      ModRotPoint(GUI.MHeader);   //translate midPoint in front of camera
      bIsJulia                      := NaviHeader.bIsJulia;     //new: also julia vals + formula
      if bIsJulia <> 0 then FastMove(NaviHeader.dJx, dJx, 32);
      bDFogIt                       := NaviHeader.bDFogIt;
      RStop                         := NaviHeader.RStop;
      sDEcombS                      := NaviHeader.sDEcombS;
      if DEstopChanged then sDEstop := NaviHeader.sDEstop;
      bColorOnIt                    := NaviHeader.bColorOnIt;
      RoundFvals(NaviHAddon);
      GUI.HAddOn                    := NaviHAddon;
      GUI.MHeader.bImageScale       := ImageScale;
      GUI.Authors                   := Authors;
      GUI.SetEditsFromHeader;
      GUI.SetLightFromHeader(GUI.MHeader);{LIGHT}
      if Length(Caption) = 0 then GUI.Caption := 'Mandelbulb 3D' else
      begin
        if Caption[Length(Caption)] = '~' then GUI.Caption := Caption
                                          else GUI.Caption := Caption + '~';
        SetSaveDialogNames(GUI.Caption);
      end;
      GUI.ParasChanged;
    end;
    SetFocus;
end;

procedure TGUINav.sb_fp_fovClick(Sender: TObject);
begin

  //if (edit_n_4.Text<>'99999') or (edit_n_4.Text<>'1') then fp := edit_n_4.Text;
  //if (edit_n_3.Text<>'1') or (edit_n_3.Text<>'360') then fov := edit_n_3.Text;

  if i_fp_fov = 0 then
  begin
    eFarPlane.Text := '99999';
    eFOV.Text := '1';
    i_fp_fov   := 1;
  end

  else if i_fp_fov = 1 then
  begin
    eFarPlane.Text := '1';
    eFOV.Text := '360';
    i_fp_fov   := 2;
  end

  else if i_fp_fov = 2 then
  begin
    eFarPlane.Text := '50';//fp;
    eFOV.Text := '30';//fov;
    i_fp_fov   := 0;
  end;

end;

{$ENDREGION '========================================================================== > | TRACKBAR'}

{$REGION '============================================================================= > | NAVIGATION'}

//------------------------------------------------------------------------------
//              N  A  V  I  G  A  T  I  O  N
//   procedure TGUINav.SpeedButton_N_1Click(Sender: TObject);  <> navClick
//------------------------------------------------------------------------------

procedure TGUINav.navClick(Sender: TObject);//SpeedButton_N_1
  //ShowMessage('nav');
  //    SpeedButton_N_1: TSpeedButton;// NAV MOVE      sliding  up        (e)     tag(1)
  //    SpeedButton_N_2: TSpeedButton;//               sliding -down      (c,q)   tag(2)
  //    SpeedButton_N_3: TSpeedButton;//               sliding -left      (a)     tag(3)
  //    SpeedButton_N_4: TSpeedButton;//               sliding  right     (d)     tag(4)
  //    SpeedButton_N_5: TSpeedButton;//               looking  up        (i)     tag(7)
  //    SpeedButton_N_6: TSpeedButton;//               looking -down      (k)     tag(8)
  //    SpeedButton_N_7: TSpeedButton;//               looking -left      (j)     tag(9)
  //    SpeedButton_N_8: TSpeedButton;//               looking  right     (l)     tag(10)
  //    SpeedButton_N_9: TSpeedButton;//               walking  up        (w)     tag(5)
  //    SpeedButton_N_10: TSpeedButton;//              walking -down      (s)     tag(6)
  //    SpeedButton_N_P_FROM_M_11: TSpeedButton;// params from main
  //    SpeedButton_N_12: TSpeedButton;//              rolling -left aclk (u)     tag(11)
  //    SpeedButton_N_13: TSpeedButton;// NAV MOVE     rolling  rite clk  (o)     tag(12)
  //    SpeedButton_N_P_TO_MAIN_14: TSpeedButton;// params to main
var
  t, i, n, ip: Integer;
  BackStep, notValid: LongBool;
  M: TMatrix3;
  d, dZmidO, de, dM, dMinD, minDE, maxDE, de2, ds, dZstartO: Double;
  V: TVec3D;
  lVGrads: TMatrix3;
  begin
    de:=0.0;
    //nav.Color:=clRed;

    with NaviHeader do
    begin
      if (GetAsyncKeyState(VK_SHIFT) and $8001) > 0 then dM := 0.125 else dM := 1;
      ActiveControl := (Sender as TSpeedButton).Parent;
      t := (Sender as TSpeedButton).Tag;
      NormVGrads(@NaviHeader);
      lVGrads := NormaliseMatrixTo(1, @hVGrads); //for absolute distance estimates
      dZmidO := dZmid;
      dMinD := StrToFloatK(Edit_N_6.Text);
      if cb_polarity.Checked = false then //Reverse Polarity
        BackStep := t in [1,3,5] else
        BackStep := t in [2,4,6]; // swap 1 <> 2  3 <> 4  5 <> 6  FOR APPARENT MOVEMENT
      Moving := (t < 7); // sliding l/r/u/d  walking u/d     7 <> 13
//------------------------------------------------------------------------------
      if Moving then
      begin
        notValid := cb_zoom.Checked;   //CheckBox_N_FixedZoom
        i := Min(90, StrToIntTrim(Edit_N_1.Text)); //stepsize in%
        if not notValid then de := GetLocalAbsoluteDE(notValid) * NDEmultiplier;
        if notValid then de := LengthOfSize(@NaviHeader) * dStepWidth;
        mCopyVec(@V, @dXmid);
        dZstartO := dZStart;
        d := 0.01 * i * de;
        if BackStep then d := -d;
        if t < 3 then n := 1 else          // sliding up / down
        if t < 5 then n := 0 else n := 2;  // sliding up / down / left / right
        mAddVecWeight(@dXmid, @lVGrads[n], d * dM); //transform also dZstart!!!
        dZStart := dZStartO + dZmid - dZmidO;
        if not notValid then //not fixed zoom and steps
        begin
          d := GetLocalAbsoluteDE(notValid) * NDEmultiplier;
          if (not notValid) and (d < dMinD) then  // min distance
          begin
            mCopyVec(@dXmid, @V);
            dZStart := dZstartO;
            if de > dMinD then
            begin
              de := de * (de - dMinD) / (de - d);
              d := 0.01 * i * de;
              if BackStep then d := -d;
              mAddVecWeight(@dXmid, @lVGrads[n], d * dM);
              dZStart := dZStartO + dZmid - dZmidO;
            end;
          end else begin
            minDE := MaxCD(1e-13, de * (100 - i) * 0.008);
            maxDE := MaxCD(minDE * 1.1, de * (100 + i) * 0.0125);
            ds := 1.25;
            ip := 200;
            repeat
              ds := ds * 0.8;
              de2 := 0.5 * (de + d);           //another DE in move direction + average
              d := 0.01 * i * de2 * ds;
              if BackStep then d := -d;
              mCopyAddVecWeight(@dXmid, @V, @lVGrads[n], d * dM);
              dZStart := dZStartO + dZmid - dZmidO;
              d := GetLocalAbsoluteDE(notValid) * NDEmultiplier;
              Inc(ip);
            until ((not notValid) and (d > minDE) and (d < maxDE) and
                  (MaxCD(Abs(dXmid), MaxCD(Abs(dYmid), Abs(dZmid))) < ip)) or (ip > 300);
          end;
          if notValid then
          begin
            mCopyVec(@dXmid, @V);
            dZStart := dZstartO;
            dZmid := dZmidO;
          end;
        end;
        d := dZmid - dZmidO;
        dZstart := dZstartO + d;
        dZend := dZend + d;
        SetZoom;
      end
//------------------------------------------------------------------------------
      else   //rotating / looking
      //    SpeedButton_N_5: TSpeedButton;//               looking  up        (i)     tag(7)
      //    SpeedButton_N_6: TSpeedButton;//               looking -down      (k)     tag(8)
      //    SpeedButton_N_7: TSpeedButton;//               looking -left      (j)     tag(9)
      //    SpeedButton_N_8: TSpeedButton;//               looking  right     (l)     tag(10)
      //    SpeedButton_N_12: TSpeedButton;//              rolling -left aclk (u)     tag(11)
      //    SpeedButton_N_13: TSpeedButton;// NAV MOVE     rolling  rite clk  (o)     tag(12)
      begin
        d := StrToFloatK(Edit_N_2.Text) * MPid180 * dM; //Looking+Rolling angle:  = 5 (default)
        if not cb_polarity.Checked then  //Reverse Polarity
        begin
            if t in [8,9,11] then d := - d;
            case t of
             7, 8: BuildRotMatrix(d, 0, 0, @M);// looking up / down
             9,10: BuildRotMatrix(0, d, 0, @M);// looking left / right
              else BuildRotMatrix(0, 0, d, @M);
            end;
         end
         else
            if t in [7,10,12] then d := - d; // swap FOR APPARENT MOVEMENT
            case t of
             7, 8: BuildRotMatrix(d, 0, 0, @M);// looking up / down
             9,10: BuildRotMatrix(0, d, 0, @M);// looking left / right
              else BuildRotMatrix(0, 0, d, @M);
            end;
        Multiply2Matrix(@M, @hVGrads);
        hVgrads := M;
      end;

    PaintZeroVec;
    PaintCoord;
    NewCalc;

    //nav.Color:=clBlack;
    end;

end;

procedure TGUINav.Image_N_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var p: TPoint;
    M: TMatrix3;
    h, v: Double;
begin
    if Screen.Cursor = crNone then
    begin
      GetCursorPos(p);
      if Abs(p.X - NMouseStartPos.X) + Abs(p.Y - NMouseStartPos.Y) > 1 then
      begin
        if NaviHeader.bStereoMode = 2 then h := 1.8 * Pi / Image_N_1.Height else
        begin
          h := NaviHeader.dFOVy;
          if Abs(h) < 15 then if h < 0 then h := -15 else h := 15;
          h := MinMaxCD(-180, h, 180) * Pid180 * 2 / Image_N_1.Height;
        end;
        if ssRight in Shift then //roll
        begin
          v := h * (p.X - NMouseStartPos.X - p.Y + NMouseStartPos.Y);
          BuildRotMatrix(0, 0, v, @M);
        end else begin  //view direction
          v := h * (p.Y - NMouseStartPos.Y);
          h := -h * (p.X - NMouseStartPos.X);
          BuildRotMatrix(v, h, 0, @M);
        end;
        Multiply2Matrix(@M, @NaviHeader.hVgrads);

        NaviHeader.hVgrads := M;
        NormVGrads(@NaviHeader);

        Image_N_1.OnMouseMove := nil;
        Image_N_6.OnMouseMove := nil;
        SetCursorPos(NMouseStartPos.X, NMouseStartPos.Y);
        Image_N_1.OnMouseMove := Image_N_1MouseMove;
        Image_N_6.OnMouseMove := Image_N_1MouseMove;

        Moving := False;
        PaintZeroVec;
        PaintCoord;  //test
        NewCalc;
      end;
    end;
end;

//procedure TGUINav.sbsl2tClick(Sender: TObject);
//begin
//   fM2T.MH2Txt(MHeader);//proc of form from form
//   fM2T.caption := 'Convert Mand10 to text';
//   fM2T.Visible := True;
//end;

procedure TGUINav.btn_min_distClick(Sender: TObject);
var notValid: LongBool;   //    btn_min_N_1
begin
    CalcStepWidth(@NaviHeader);
    NaviHeader.sNaviMinDist := GetLocalAbsoluteDE(notValid) * NDEmultiplier;
    Edit_N_6.Text := FloatToStrSingle(NaviHeader.sNaviMinDist);
end;

procedure TGUINav.cb_azertyClick(Sender: TObject);
begin       //        CheckBox_N_2
    if cb_azerty.Checked then
    begin
      Label_N_6.Caption := '(q)';
      Label_N_5.Caption := '(c,a)';
      Label_N_12.Caption := '(z)';
    end else begin
      Label_N_6.Caption := '(a)';
      Label_N_5.Caption := '(c,q)';
      Label_N_12.Caption := '(w)';
    end;
end;

procedure TGUINav.cb_HiQClick(Sender: TObject);
begin                   //CheckBox3    CheckBox_N_4
    NewCalc; //light paras has also to be changed (dyn fog offset..)
end;

procedure TGUINav.cb_coordsClick(Sender: TObject);
begin       //         CheckBox_N_6
    PaintCoord;
end;

procedure TGUINav.cb_julia_modeClick(Sender: TObject);
begin //Julia mode on/off    CheckBox_N_7
    if cb_julia_mode.Checked = True then cb_HiQ.Checked := True;
    if cb_julia_mode.Checked = False then cb_julia_mode_sphere.Checked := False;
    NaviHeader.bIsJulia := Byte(cb_julia_mode.Checked);
    Newcalc;
end;

procedure TGUINav.cb_julia_mode_sphereClick(Sender: TObject);
begin //Julia spherical mode on/off      CheckBox_N_8
    Newcalc;
end;

procedure TGUINav.EventEditChange(Sender: TObject);
var d: Double;       // Edit_N_1 Edit_N_2 eFOV eFarPlane Edit_N_6
    s: String;
begin
    if bUserChangeN then
    begin
      s := (Sender as TEdit).Text;
      if not TryStrToFloat(s, d) then
        (Sender as TEdit).Text := StrOnlyNumbers(s)
      else
      if Sender = eFarPlane then SetZoom;          // farplane change
      if (Sender as TEdit).Tag = 1 then NewCalc;  // FOVy + farplane change
    end;
end;


{$ENDREGION '========================================================================== > | NAVIGATION'}

{$REGION '============================================================================= > | PANELS/FORM'}

procedure TGUINav.pn_mainClick(Sender: TObject);
begin
    ActiveControl := Image2.Parent;
end;

procedure TGUINav.IncreaseNaviSizeBtnClick(Sender: TObject);
begin
  if NaviSizeCmb.ItemIndex < NaviSizeCmb.Items.Count - 1 then begin
    NaviSizeCmb.ItemIndex := NaviSizeCmb.ItemIndex + 1;
    NaviSizeCmbChange(Sender);
  end;
end;
procedure TGUINav.DecreaseNaviSizeBtnClick(Sender: TObject);
begin
  if NaviSizeCmb.ItemIndex > 0 then begin
    NaviSizeCmb.ItemIndex := NaviSizeCmb.ItemIndex - 1;
    NaviSizeCmbChange(Sender);
  end;
end;
// SetWindowSize(if pn_bottom.Visible);
procedure TGUINav.NaviSizeCmbChange(Sender: TObject);
var
  Height: Integer;
begin
  if NaviSizeCmb.ItemIndex >= 0 then IniVal[36] := NaviSizeCmb.Items[NaviSizeCmb.ItemIndex];
  EnableButtons;
  Height := NaviHeader.Height;
  SetWindowSize(pn_bottom.Visible);
  if Height <> NaviHeader.Height then begin
    if iActiveThreads > 0 then WaitForCalcToStop(2000);
    NewCalc;
  end;
end;
procedure TGUINav.EnableButtons;
begin
  DecreaseNaviSizeBtn.Enabled := NaviSizeCmb.ItemIndex > 0;
  IncreaseNaviSizeBtn.Enabled := NaviSizeCmb.ItemIndex < NaviSizeCmb.Items.Count - 1;
end;

procedure TGUINav.rg_camClick(Sender: TObject);
begin        //      RadioGroup_Nx_2
    if bUserChangeN then NewCalc;
end;

procedure TGUINav.Singleclicktochangethenavimode1Click(Sender: TObject);
begin
    bDoubleClick := False;
    IniVal[20] := 'No';
end;
procedure TGUINav.Doubleclicktochangethenavimode1Click(Sender: TObject);
begin
    bDoubleClick := True;
    IniVal[20] := 'Yes';
end;
procedure TGUINav.Image_N_1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var p1: TPoint;
begin
    if (Button = mbRight) and (Screen.Cursor <> crNone) then
    begin
      Singleclicktochangethenavimode1.Checked := not bDoubleClick;
      Doubleclicktochangethenavimode1.Checked := bDoubleClick;
      p1 := ClientToScreen(Point(X, Y));
      PopupMenuNav.Popup(p1.X, p1.Y);
    end;
end;
procedure TGUINav.ChangeNaviMode;
var TestRect: TRect;
    P0, P1: TPoint;
begin
    if Screen.Cursor = crDefault then
    begin
      P0 := Image_N_1.ClientToScreen(Point(0, 0));
      P1 := Image_N_1.ClientToScreen(Point(Image_N_1.Width, Image_N_1.Height));
      TestRect := Rect(P0.X, P0.Y, P1.X, P1.Y);
      ClipCursor(@TestRect);
      NMouseStartPos := Point((P0.X + P1.X) div 2, (P0.Y + P1.Y) div 2);
      SetCursorPos(NMouseStartPos.X, NMouseStartPos.Y);
      Screen.Cursor := crNone;
    end else begin
      Screen.Cursor := crDefault;
      ClipCursor(nil);
    end;
    CheckLabel18;
end;

// if cutting and pasting from form to form also paste these.
procedure TGUINav.EventDummiClick(Sender: TObject); // OPEN PANEL
var p: TPanel; t: Integer; //s: String; ps: PWideChar;
begin
//PlaceHolder
  p := Sender as TPanel;
  t := p.Tag;
  if t<>0 then
    //with p do begin Height:=Tag; BevelOuter:=bvNone; BorderStyle:=bsSingle; Tag:=0 end;
    with p do begin Height:=Tag; BorderStyle:=bsNone; Tag:=0 end;
end;
procedure TGUINav.EventDummiDblClick(Sender: TObject); // CLOSE PANEL
var p: TPanel; t: Integer;
begin
  p := Sender as TPanel;
  t := p.Tag;
  if t=0 then
//    begin//save height
//      with p do begin Tag:=Height; Height:=18; BevelOuter:=bvRaised; BorderStyle:=bsNone end;
      with p do begin Tag:=Height; Height:=18; BorderStyle:=bsSingle end;
//    end
//  else
//    with p do begin Height:=Tag; BevelOuter:=bvNone; BorderStyle:=bsSingle; Tag:=0 end;

end;

procedure TGUINav.EventDummiDragDrop(Sender, Source: TObject; X, Y: Integer);
//var p: TPanel; t: Integer;
begin
//   p := Sender as TPanel;
//   with p do begin Top := Top - Height - 1; end;
   //p(Sender).Top := p(Sender).Top - p(Sender).Height - 2;
end;

{$ENDREGION '========================================================================== > | PANELS/FORM'}

{$REGION '============================================================================= > | I/O'}

procedure TGUINav.sb_load_M3PClick(Sender: TObject);  // open parameter
begin          //   Button_N_5
//    PageCtrls.ActivePage := TabImage;
    if OpenDialog_N_1.Execute and LoadParameterNavi(NaviHeader, OpenDialog_N_1.FileName, True) then
    begin
//      AllPresetsUp;
//      OutMessage('Parameters loaded, press "Calculate 3D" to render.');
//      ClearScreen;
      Image_N_1.Picture.Bitmap.Canvas.FillRect(Image_N_1.Picture.Bitmap.Canvas.ClipRect);
      SetSaveDialogNames(OpenDialog_N_1.FileName);
      NewCalc;

    end;
end;

function TGUINav.LoadParameterNavi(var Para10: TMandHeader10; FileName: String; Verbose: LongBool): Boolean;
var f: file;          // from FileHandling
    d: Double;
    MId, i: Integer;
    p: TP6;
    MandHeader4: TMandHeader4;
    para9: TMandHeader9;
    TileSize: TPoint;
begin
    SaveHeaderPointers(@para10, p);
    Result := False;
    LastHisParSaveTime := Now;
    if FileExists(FileName) then
    try
      //if Verbose then
      GUINav.Caption:= '' + ChangeFileExtSave(ExtractFileName(FileName), '');
      AssignFile(f, FileName);
      Reset(f, 1);
      BlockRead(f, MId, 4);
      if (MId < 0) or (MId > 250) or (FileSize(f) < 100) then Exit;
      Seek(f, 0);
      if MId < 4 then
      begin
        BlockRead(f, MandHeader4, SizeOf(TMandHeaderOld));
        FillChar(MandHeader4.dFOVy, 72, 0);
      end
      else if MId < 7 then BlockRead(f, MandHeader4, SizeOf(TMandHeader4))
      else if MId < 8 then BlockRead(f, Para9, SizeOf(TMandHeader9) - 124)
      else if MId < 20 then BlockRead(f, Para9, SizeOf(TMandHeader9))
      else BlockRead(f, Para10, SizeOf(TMandHeader10));
      if (MId < 5) and (MandHeader4.dZstart > MandHeader4.dZend) then
      begin
        MandHeader4.dZstart       := - MandHeader4.dZstart;
        MandHeader4.dZend         := - MandHeader4.dZend;
        d                         :=   MandHeader4.dXrot;
        MandHeader4.dXrot         :=   MandHeader4.dYrot * Pid180;
        MandHeader4.dYrot         :=   d * Pid180;
        MandHeader4.Light.Cols[7] :=   MandHeader4.Light.Cols[4];
        MandHeader4.Light.Cols[8] :=   MandHeader4.Light.Cols[5];
        MandHeader4.Light.Cols[9] :=   MandHeader4.Light.Cols[6];
      end;
      if MId < 5 then MandHeader4.dZmid := (MandHeader4.dZstart + MandHeader4.dZend) * 0.5
      else if (MId = 5) and ((MandHeader4.iOptions and 15) = 10) then
      begin
        MandHeader4.dPow := (MandHeader4.iOptions shr 18) and 3;
        i := (MandHeader4.iOPtions and $38000) shr 1;
        MandHeader4.iOptions := (MandHeader4.iOptions and $7FFC3FFF) or i;
      end;
      if MId < 7 then
      begin
        if MId < 6 then MandHeader4.bHScalculated := 1;
        MandHeader4.Light.TBoptions := MandHeader4.Light.TBoptions or (43 shl 11);
        Convert4to7paras(MandHeader4, TMandHeader8(Para9));
      end
      else if MId < 8 then ConvertFromOldLightParas(Para9.Light, 148);

      para10.MandId := MId;
      GUI.Authors := ExtractAuthorsFromPara(@para10);   //if MId > 40
      InsertHeaderPointers(@para10, p);

      if MId < 20 then
      begin
        for i := 0 to 5 do para9.PHCustomF[i] := p[i];
        Para9.PCFAddon := p[6];
        Result := ConvertHeaderFromOldParas(TMandHeader8(Para9), True);
        FastMove(Para9, Para10, SizeOf(TMandHeader9));
        ConvertLight8to9(Para9.Light, Para10.Light);
      end
      else
      begin
        Result := True;
        if Verbose then LoadBackgroundPicT(@Para10.Light);
      end;
      if Result and Verbose then  //not verbose only for canload test
      begin
        if MId > 15 then       //Load HAddon
        begin
          if MId > 17 then
          begin
            if MId > 18 then
            begin
              if MId < 35 then para10.TilingOptions := 0;
              TileSize := GetTileSize(@para10);
              i := TileSize.X * TileSize.Y * SizeOf(TsiLight5);
            end
            else
              i := Para10.Width * Para10.Height * SizeOf(TsiLight4);
          end
          else i := Para10.Width * Para10.Height * SizeOf(TsiLight3);
          if FileSize(f) >= FilePos(f) + i + SizeOf(THeaderCustomAddonOld) then
            Seek(f, FilePos(f) + i);
          LoadHAddon(f, PTHeaderCustomAddon(Para10.PCFAddon));
        end;
        if MId < 20 then UpdateFormulaOptionTo20(PTHeaderCustomAddon(Para10.PCFAddon));
        UpdateFormulaOptionAbove20(para10);
        UpdateLightParasAbove3(para10.Light);
        IniCFsFromHAddon(PTHeaderCustomAddon(Para10.PCFAddon), Para10.PHCustomF);
      //  GUI.HAddOn.bHCAversion := 16;//test
        bSRVolLightMapCalculated := False;

        SetEditsFromHeaderNavi;
        //GUI.allPreSetsUp;
        //GUI.MButtonsUp;
        InternAspectNavi := para10.Width / Max(1, para10.Height);
        //FastMove(GUI.MHeader.Light, LHPSLight, SizeOf(TLightingParas9));
        //GUI.bUserChangeL := False;{LIGHT}
        //GUI.CheckBox_L_21.Checked := False;{LIGHT}
        //GUI.SetLightFromHeader(Para10);{LIGHT}

        //StoreUndoLight;

        //if Para10.Light.BGbmp[0] = 0 then GUI.Image_L_5.Visible := False else
        //  MakeLMPreviewImage(GUI.Image_L_5, @M3DBackGroundPic);{LIGHT}
        SetSaveDialogNames(FileName);
  //      GUI.Caption := ExtractFileName(FileName);
        //GUI.Label_M_1.Caption := '';
      end;
    finally
      CloseFile(f);
    end;
end;

procedure TGUINav.sbsl2tClick(Sender: TObject);
begin
   fM2T.MH2Txt(NaviHeader,NaviHAddon);//proc of form from form
   fM2T.caption := 'Convert Mand10 to text';
   fM2T.Visible := True;
end;

procedure TGUINav.sb_save_JPGClick(Sender: TObject);
//var s: String;
begin
    if SaveDialog_N_4.Execute then
    begin
      SaveJpg(1, SaveDialog_N_4.FileName);
      SetSaveDialogNames(SaveDialog_N_4.FileName);
      SetSaveDialogNames(SaveDialog_N_2.FileName);
    end;
end;
procedure TGUINav.SaveJpg(OutputType: Integer; FileNam: String);
var TileRect: TRect;
    Crop: Integer;
    bmp: TBitmap;
begin
    SdoAA;
    case OutputType of
      0:  SavePNG(FileNam, Image_N_1.Picture.Bitmap, True);
      1:  SaveJPEGfromBMP(FileNam, Image_N_1.Picture.Bitmap, 95);
      2:  SaveBMP(FileNam, Image_N_1.Picture.Bitmap, pf24bit);
    end;
end;
procedure TGUINav.sb_save_M3PClick(Sender: TObject);  // save parameter
var f: file; i: Integer;   //  Button_N_4
begin
    if SaveDialog_N_2.Execute then
    begin
      MakeNaviHeader;
      AssignFile(f, ChangeFileExtSave(SaveDialog_N_2.FileName, '.m3p'));
      Rewrite(f, 1);
      InsertAuthorsToPara(@NaviHeader, Authors);
      try
        BlockWrite(f, NaviHeader, SizeOf(NaviHeader));
      finally
        //IniMHeader; //to get pointers back
        NaviHeader.PCFAddon := @NaviHAddOn;
        for i := 0 to 5 do NaviHeader.PHCustomF[i] := @HybridCustoms[i];
      end;
      NaviHAddOn.bHCAversion := 16;
      BlockWrite(f, NaviHAddOn, SizeOf(THeaderCustomAddon));
      CloseFile(f);
      SetSaveDialogNames(SaveDialog_N_2.FileName);
      SetSaveDialogNames(SaveDialog_N_4.FileName);
    end;
end;

procedure TGUINav.cb_ani_keyClick(Sender: TObject);
begin //Disable f-key    CheckBox_Nx_5
    set_ani_key(cb_ani_key.Checked);
end;
procedure TGUINav.set_ani_key(Disabled: Boolean);
begin
    if Disabled then sb_ani_key.Caption := 'Ani keyframe'
                else sb_ani_key.Caption := 'Ani keyfr. (f)';
end;
procedure TGUINav.sb_ani_keyClick(Sender: TObject);   // "f" insert paras to animation keyframe
var tmpHeader: TMandHeader10;
    i: Integer;                //  SpeedButton_N_18
    CurrNaviFrame: Integer;
begin
//    if AnimationForm.SpeedButton1.Enabled then begin
//      if iActiveThreads > 0 then WaitForCalcToStop(2000);
//      CurrNaviFrame := TMapSequenceFrameNumberHolder.GetCurrFrameNumber;
//      try
//        tmpHeader                 := GUI.MHeader;
//        tmpHeader.PCFAddon        := @NaviHAddon;
//        FastMove(NaviHeader.dZstart, tmpHeader.dZstart, 96);  // dZstart up to dFOVy
//        FastMove(NaviHeader.hVGrads, tmpHeader.hVGrads, 72);  // hVGrads only
//        FastMove(NaviHeader.dXWrot, tmpHeader.dXWrot, 24);
//        FastMove(NaviHeader.dJX, tmpHeader.dJX, 24);
//        tmpHeader.bDFogIt         := NaviHeader.bDFogIt;
//        tmpHeader.RStop           := NaviHeader.RStop;
//        tmpHeader.sDEcombS        := NaviHeader.sDEcombS;
//        tmpHeader.sNaviMinDist    := StrToFloatK(Edit_N_6.Text);
//        tmpHeader.bPlanarOptic    := NaviHeader.bPlanarOptic;
//        tmpHeader.Iterations      := NaviHeader.Iterations;
//        if DEstopChanged then tmpHeader.sDEstop := NaviHeader.sDEstop;
//        ModRotPoint(tmpHeader);
//        tmpHeader.Light.TBpos[6]  := ud_fog.Position;
//        for i := 0 to 5 do tmpHeader.PHCustomF[i] := @HybridCustoms[i];
//        AnimationForm.Visible     := True;
//        AnimationForm.InsertFromHeader(@tmpHeader);  //Assigned, HAddon pointer must be set
//        SetFocus;
//      finally
//        Sleep(250);
//        TMapSequenceFrameNumberHolder.SetCurrFrameNumber(CurrNaviFrame);
//      end;
//    end;
end;

procedure TGUINav.Image_N_1Click(Sender: TObject);
begin
    if not bDoubleClick then ChangeNaviMode;
end;
procedure TGUINav.Image_N_1DblClick(Sender: TObject);
begin
    if bDoubleClick then ChangeNaviMode;
end;

{$ENDREGION '========================================================================== > | I/O'}

{$REGION '============================================================================= > | ZOOM'}


procedure TGUINav.SpinButton1Up;
begin
    NaviHeader.dZoom := NaviHeader.dZoom * 1.414;
    SetZoom;
    NewCalc;
end;
procedure TGUINav.SpinButton1Down;
begin
    NaviHeader.dZoom := NaviHeader.dZoom * 0.707;
    SetZoom;
    NewCalc;
end;

procedure TGUINav.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
    if Button = btPrev then SpinButton1Down else
    if Button = btNext then SpinButton1Up;
end;

procedure TGUINav.eZoomBottomClick(Sender: TObject);
begin
    NaviHeader.dZoom := NaviHeader.dZoom * 0.707;
    SetZoom;
    NewCalc;

end;
procedure TGUINav.eZoomTopClick(Sender: TObject);
begin
    NaviHeader.dZoom := NaviHeader.dZoom * 1.414;
    SetZoom;
    NewCalc;

end;
procedure TGUINav.eZoomChange(Sender: TObject);
begin
//    if Sender = JvSpinEdit1.OnTopClick(Sender) then NaviHeader.dZoom := NaviHeader.dZoom * 0.707;
//    if Sender = JvSpinEdit1.OnBottomClick(Sender) then NaviHeader.dZoom := NaviHeader.dZoom * 1.414;
    //NaviHeader.dZoom:=JvSpinEdit1.Value;
    SetZoom;
    NewCalc;
end;

procedure TGUINav.eZoomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    NaviHeader.dZoom := NaviHeader.dZoom * 1.414;
    SetZoom;
    NewCalc;

end;

procedure TGUINav.eZoomKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    NaviHeader.dZoom := NaviHeader.dZoom * 0.707;
    SetZoom;
    NewCalc;

end;

procedure TGUINav.SetZoom;
var de: Double;
    notValid: LongBool;
begin
    with NaviHeader do
    begin
      NormVGrads(@NaviHeader);
      notValid := True;
      if not cb_zoom.Checked then  //not fixed zoom+steps
      begin    //vv critical?
        de := GetLocalAbsoluteDE(notValid) * NDEmultiplier;
        if not notValid then dZoom := LengthOfSize(@NaviHeader) * 2 / (de * Width);
      end;
      if notValid then
      begin
        CalcStepWidth(@NaviHeader);
        de := dStepWidth * LengthOfSize(@NaviHeader);  // = Sqrt(Sqr(Width) + Sqr(Height));
      end;
      NormVGrads(@NaviHeader);
      dZend := dZstart + de * MinMaxCD(1, StrToFloatK(eFarPlane.Text), 99999); //Farplane  90000
      if dZend - dZstart > 9999 then dZend := dZstart + 9999;
      NDEmultiplier := (NDEmultiplier - 1) * 0.8 + 1;
      CheckLabel18;
//      JvSpinEdit1.Value:=NaviHeader.dZoom;
    end;
end;
procedure TGUINav.CheckLabel18;
begin
    Label_N_18.Visible := UpDown3.Visible and (Screen.Cursor = crNone);
    Label_N_31.Visible := not Label_N_18.Visible;   //Mousewheel  (or mouse wheel)
end;

procedure TGUINav.cb_zoomClick(Sender: TObject);
begin      //         CheckBox_N_1
    UpDown3.Visible := cb_zoom.Checked;
    CheckLabel18;
end;

procedure TGUINav.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var C   : TControl;
    MPos: TPoint;
    h, v: Double;
    M:    TMatrix3;
begin
    if (Screen.Cursor = crNone) and UpDown3.Visible then
    begin
      if WheelDelta < 0 then SpinButton1Down else SpinButton1Up;
      Handled := True;
      Exit;
    end;
    C := ControlAtPos(ScreenToClient(MousePos), False, True);
    if C <> nil then
    begin
      if (C = Image_N_1) or (C = Image_N_6) then    //only if mouse is over navi.image1+6
      begin
        if WheelDelta < 0 then  //Wheel down
          SpeedButton_N_10.Click   //s
        else
        begin
          if Screen.Cursor = crDefault then
          begin   // get mousecursorpos over image and steer in that direction...(zoom in)
            MPos := Image_N_1.ScreenToClient(MousePos);
            h := Sin(NaviHeader.dFOVy * Pid180);   //rotate in that drection
            v := h * (MPos.Y - Image_N_1.Height shr 1) / Image_N_1.Height;
            h := -h * (MPos.X - Image_N_1.Width shr 1) / Image_N_1.Height;
            BuildRotMatrix(v, h, 0, @M);
            Multiply2Matrix(@M, @NaviHeader.hVgrads);
            NaviHeader.hVgrads := M;
          end;
          SpeedButton_N_9.Click;  //w/z   step forward
        end;
      end;
    end;
    Handled := True;
end;


{$ENDREGION '========================================================================== > | ZOOM'}

{$REGION '============================================================================= > | LIGHT'}
procedure TGUINav.ud_fogClick(Sender: TObject; Button: TUDBtnType);
begin         //     UpDown1
    if Button = btPrev then NaviHeader.Light.TBpos[6] := Max(0, ud_fog.Position - 1)
    else if Button = btNext then NaviHeader.Light.TBpos[6] := Min(153, ud_fog.Position + 1);
    DynFogAmountChanged := True;
    Label_N_38.Caption := IntToStr(NaviHeader.Light.TBpos[6] - 53);
    NewCalc;
end;
procedure TGUINav.tb_lightChange(Sender: TObject);
begin        //       TrackBar1
    NaviLightness := Sqr(tb_light.Position * -0.05 + 0.85) + 0.2775;
    NewCalc;
end;
procedure TGUINav.sb_light_presetClick(Sender: TObject);
begin
    LightStoring := not LightStoring;
    if LightStoring then
    begin
      sb_light_preset_1.Cursor := crUpArrow;
      sb_light_preset_2.Cursor := crUpArrow;
      sb_light_preset_3.Cursor := crUpArrow;
      sb_light_preset_4.Cursor := crUpArrow;
      sb_light_preset_5.Cursor := crUpArrow;
      sb_light_preset_6.Cursor := crUpArrow;
      sb_light_preset_1.Enabled := True;
      sb_light_preset_2.Enabled := True;
      sb_light_preset_3.Enabled := True;
      sb_light_preset_4.Enabled := True;
      sb_light_preset_5.Enabled := True;
      sb_light_preset_6.Enabled := True;
    end
    else DisableLightStoring;
end;
procedure TGUINav.sb_light_inClick(Sender: TObject);
begin          //  SpeedButton_N_15
    GUI.PutLightFInHeader(NaviHeader);{LIGHT}
    ud_fog.Position := NaviHeader.Light.TBpos[6];
    DynFogAmountChanged := False;
    Label_N_38.Caption := IntToStr(ud_fog.Position - 53);
    NewCalc;
end;
procedure TGUINav.sb_light_preset_1Click(Sender: TObject);
var t: Integer; //  SpeedButton_N_19
    f: file;
begin
    t := (Sender as TSpeedButton).Tag - 1;
    if (Sender as TSpeedButton).Cursor = crUpArrow then
    begin //store navilight
      AssignFile(f, AppDataDir + 'NaviLightPreset' + IntToStr(t + 1) + '.m3l');
      Rewrite(f, 1);
      BlockWrite(f, NaviHeader.Light, SizeOf(NaviHeader.Light));
      CloseFile(f);
      NaviLightPresets[t] := NaviHeader.Light;
      NLPavailable[t] := True;
      DisableLightStoring;
    end
    else if (t in [0..5]) and NLPavailable[t] then   //Set navilight
    begin
      NaviHeader.Light := NaviLightPresets[t];
      ud_fog.Position := NaviHeader.Light.TBpos[6];
      Label_N_38.Caption := IntToStr(ud_fog.Position - 53);
      tb_light.Position := 0;
      DynFogAmountChanged := False;
      NewCalc;
    end;
end;
function TGUINav.LoadLightPreset(i: Integer): Boolean;
var s: String;
begin
    s := AppDataDir + 'NaviLightPreset' + IntToStr(i) + '.m3l';
    Result := GetLightParaFile(s, NaviLightPresets[i - 1], False);
end;
procedure TGUINav.LoadLightPresets;
var i: Integer;
begin
    for i := 0 to 5 do NLPavailable[i] := LoadLightPreset(i + 1);
end;
procedure TGUINav.DisableLightStoring;
begin
    sb_light_preset_1.Cursor := crDefault;
    sb_light_preset_2.Cursor := crDefault;
    sb_light_preset_3.Cursor := crDefault;
    sb_light_preset_4.Cursor := crDefault;
    sb_light_preset_5.Cursor := crDefault;
    sb_light_preset_6.Cursor := crDefault;
    LightStoring := False;
    sb_light_preset_1.Enabled := NLPavailable[0];
    sb_light_preset_2.Enabled := NLPavailable[1];
    sb_light_preset_3.Enabled := NLPavailable[2];
    sb_light_preset_4.Enabled := NLPavailable[3];
    sb_light_preset_5.Enabled := NLPavailable[4];
    sb_light_preset_6.Enabled := NLPavailable[5];
end;
{$ENDREGION '========================================================================== > | LIGHT'}

{$REGION '============================================================================= > | FORM/PANELS'}

procedure TGUINav.FormCreate(Sender: TObject);
var i: Integer;
begin
// precaution
    GUINav.Width      := 644;
    GUINav.Height     := 573;
    Image_N_1.Left    := 0;
    Image_N_1.Top     := 0;
    Image_N_1.Width   := 640;
    Image_N_1.Height  := 400;

    pn_main.Height    := 114;
    pn_main.Left      := 0;
    pn_main.Top       := 400;

    pn_bottom.Height  := 73;
    pn_bottom.Left    := 0;
    pn_bottom.Top     := Image_N_1.Height+pn_main.Height;//514;

//    pn_right.Left     := Image_N_1.Width;
//    pn_right.Top      := 0;
    scb_right.Left     := Image_N_1.Width;
    scb_right.Top      := 0;

//------------------------------------------------------------------------------
    DragAcceptFiles(Self.Handle, True);
    Image_N_1.Parent.ControlStyle := [csOpaque];
    FirstStart        := True;
    bUserChangeN      := False;
    NglobalCounter    := 0;
    FocusedSliderM    := 0;
    FocusedSliderF    := 0;
    NaviLightness     := 1;
    DoubleBuffered    := True;
    NaviHeader.PCFAddon := @NaviHAddon;
    for i := 0 to 5 do NaviHeader.PHCustomF[i] := @HybridCustoms[i];
    for i := 0 to 5 do IniCustomF(@HybridCustoms[i]);
    for i := 0 to 2 do NLPavailable[i] := False;
    tmpBMP := TBitmap.Create;
    tmpBMP.PixelFormat := pf32Bit;
    tmpBMP.SetSize(80, 76);
    tmpBMPc := TBitmap.Create;
    tmpBMPc.PixelFormat := pf32Bit;
    tmpBMPc.SetSize(240, 240);
    pn_main.DoubleBuffered := True;

    FNaviFormCreated := True;

    NaviSizeCmb.ItemIndex := NaviSizeCmb.Items.IndexOf(IniVal[36]); // FileHandling

end;

procedure TGUINav.FormShow(Sender: TObject);
var h: Integer;
begin
    with NaviHeader do
    begin
      if FirstStart then
      begin
        GUI.PropagateCurrFrameNumber;
        if not Assigned(Image_N_1.Picture.Bitmap) then Image_N_1.Picture.Bitmap := TBitmap.Create;
        Image_N_1.Picture.Bitmap.PixelFormat := pf32Bit;
        FirstStart           := False;
        bUserChangeN         := False;
        // bug fix ini val becomes txt after ini reset
        if IsNumber(StrToInt(IniVal[2])) then Edit_N_1.Text := IniVal[2] else Edit_N_1.Text := '20';
        if IsNumber(StrToInt(IniVal[3])) then Edit_N_2.Text := IniVal[3] else Edit_N_2.Text := '5';
        //Edit_N_1.Text := IniVal[2];
        //Edit_N_2.Text := IniVal[3];
        //eFarPlane.Text := IniVal[4];
        eFOV.Text            := IniVal[5];
        cb_azerty.Checked    := IniVal[10] = '1';
        cb_ani_key.Checked   := IniVal[14] = '0';
        cb_HiQ.Checked       := IniVal[19] <> 'No';
        bDoubleClick         := IniVal[20] <> 'No';
        Image2.Picture.Bitmap.PixelFormat := pf32bit;
        Image2.Picture.Bitmap.SetSize(40, 38);
        Image_N_6.Picture.Bitmap.PixelFormat := pf32bit;
        Image_N_6.Picture.Bitmap.SetSize(120, 120);
        LoadLightPresets;
        FSubIndexTopF        := 0;
        AdjustPanelFirstShow := True;
        //-> load para
        SetTabNames;
        sb_par_inClick(Sender); //insert main paras
//------------------------------------------------------------------------------
//        if IniVal[34]         = '1' then
//        begin
//        pn_right.Align        := alRight;
//        pn_right.Left         := Image_N_1.Width;

        scb_right.AutoSize    := True;
        pn_frm_mid2.Parent    := pn_frm_mid;
        pn_misc.Parent        := scb_right;//pn_right;

        gb_SizeGroup.Align    := alTop;
        rg_Adj.Align          := alTop;
        pn_julia.Align        := alTop;
        pn_formula.Align      := alTop;
        pn_4d.Align           := alTop;
        pn_pos.Align          := alTop;
        pn_misc.Align         := alTop;

        scb_right.Align       := alRight;
        scb_right.Left        := Image_N_1.Width;

        //pn_frm_mid.Height  := 56;
        h:=lb_fn_0.Height+tb_fv_0.Height;
        pn_frm_mid.Height     := (NaviHAddon.Formulas[0].iOptionCount*h) + 8;
        //pn_formula.Left := Image_N_1.Width;
//        sb_bottomClick(Sender);
        sb_rightClick(Sender);
        sb_bottomClick(Sender);
//        end
//        else
//        begin
//        GUINav.Width      := 644;//sb_bottomClick(Sender);
//        end;
        EventDummiDblClick(pn_pos);
        EventDummiDblClick(pn_julia);
        EventDummiDblClick(pn_4d);
        EventDummiDblClick(pn_misc);
        //EventDummiDblClick(pn_formula);
//------------------------------------------------------------------------------
      end;
      DisableLightStoring;
    end;
    bUserChangeN := True;
    EnableButtons;

    tc_frmChange(Sender);

    LoadFormulaNames;
    //JvSpinEdit1.Value:=NaviHeader.dZoom;
end;

procedure TGUINav.sb_reset_posClick(Sender: TObject);  //reset pos
var d: Double; //    Button_M_14Click    //SpeedButton31
begin
    eXmid.Text := '0.0';     //x   Edit_*M_9
    eYmid.Text := '0.0';     //y   Edit_*M_10
    eZmid.Text := '0.0';     //z   Edit_*M_17

    eZstart.Text := '-2.0';    //z start Edit_*M_1
    eZend.Text := '30.0';      //z end   Edit_*M_3

    eZoom.Text := '0.8';     //zoom     Edit_*M_5
    eFOV.Text := '30';       //FOV      Edit_*M_14
    BuildRotMatrix(0.0001, -0.0001, 0, @NaviHeader.hVgrads);
    if TryStrToFloat(lb_mi_1.Caption, d) and (d > 500) then //{FORMULA}    bailout
    begin
      eZstart.Text := '-8.0';     //z start    Edit_*M_1
      eZmid.Text   := '0.0';      //z          Edit_*M_17
      eZend.Text   := '120.0';    //z end      Edit_*M_3
      eZoom.Text   := '0.18';     //zoom       Edit_*M_5
    end;
    //ParasChanged;
    SetEulerEditsFromHeader;
end;

procedure TGUINav.sb_rightClick(Sender: TObject);
var i: Integer;  //   SpeedButton_N_23
begin  //adjustment panel open/close
    sb_right.Glyph.Canvas.FillRect(sb_right.Glyph.Canvas.ClipRect);
    if scb_right.Visible then   //   pn_right
    begin
      scb_right.Visible := False;  //   pn_right
      //pn_frm_mid2.Parent:=pn_frm_mid;
      //pn_formula2.Visible := False;
      ClientWidth := ClientWidth - scb_right.Width; //  pn_right
      ImageList_N_1.GetBitmap(2, sb_right.Glyph);
      IniVal[34] := '0';
    end
    else
    begin
      //pn_right.Left := Image_N_1.Width;
      //pn_formula2.Visible := True;
      scb_right.Visible := True;   //        pn_right
      //pn_right.BringToFront;
      ClientWidth := ClientWidth + scb_right.Width; //   pn_right
      ImageList_N_1.GetBitmap(3, sb_right.Glyph);
      IniVal[34] := '1';

      if AdjustPanelFirstShow then
      begin
        AdjustPanelFirstShow := False;
        CurrentFindex := Point(0, 0);
        ResetJuliaPos0Vals;
        Reset4dRotVals;

        for i := 0 to 2 do
        begin
          fRangeJ[i]  := 1;
          fTypeJ[i]   := 0;
          fRange4d[i] := 1;
          fType4d[i]  := 0;
        end;

        //FORMULA
        for i := 0 to 15 do
        begin
          fRangef[i] := 1;
          fTypef[i] := 0;
        end;

        //MISC
        fTypeM[0]  := 2;   //int
        fRangeM[0] := 5;   //dFogOnIts
//?        fTypeM[13] := 2;   //MaxIts
    //    fRange[13] := 5;
        for i := 1 to 4 do fTypeM[i] := -5;  //log   ar ythmic
        if NaviHeader.bIsJulia <> 0 then EventDummiDblClick(pn_julia);
        //AdjustPanel3positions;
        formula_value_update_Click(Sender);//sb_frm_val_inClick;
      end;
    end;
end;
procedure TGUINav.sb_bottomClick(Sender: TObject);
var i: Integer;        //  SpeedButton_N_17
begin    //expand/shrink panel2
    sb_bottom.Glyph.Canvas.FillRect(sb_bottom.Glyph.Canvas.ClipRect);
    if pn_bottom.Visible then ImageList_N_1.GetBitmap(0, sb_bottom.Glyph)
    else ImageList_N_1.GetBitmap(1, sb_bottom.Glyph);
    i := NaviHeader.Height;
    SetWindowSize(not pn_bottom.Visible);
    if i <> NaviHeader.Height then NewCalc;
end;

//SetWindowSize(if pn_bottom.Visible);
procedure TGUINav.SetWindowSize(pn_bottomvisible: LongBool); //todo: modify also maxwidth if too high
var p2h, i, j: Integer;
begin
    pn_bottom.Visible := pn_bottomvisible;
    SetHeaderSize;
    if pn_bottomvisible then p2h := pn_bottom.Height else p2h := 0;

    if Screen.WorkAreaHeight > 810 then i := 660 else i := 580;
    ClientHeight := Max(i, NaviHeader.Height + pn_main.Height + p2h);
    j := 646;

    if scb_right.Visible then Inc(j, scb_right.Width);
    ClientWidth := Max(j, NaviHeader.Width + scb_right.Width);
    //pn_right.Left := Image_N_1.Width;
    pn_main.Top := ClientHeight - p2h - pn_main.Height;
    pn_bottom.Top := ClientHeight - p2h;
    if (Image_N_1.Picture.Bitmap.Width <> NaviHeader.Width) or
       (Image_N_1.Picture.Bitmap.Height <> NaviHeader.Height) then
    begin
      if iActiveThreads > 0 then WaitForCalcToStop(2000);
      Image_N_1.Picture.Bitmap.SetSize(NaviHeader.Width, NaviHeader.Height);
      if( NaviHeader.Width > 640) then Image_N_1.SetBounds(0,0, NaviHeader.Width, NaviHeader.Height)
      else
        Image_N_1.SetBounds((640 - NaviHeader.Width) div 2, (pn_main.Top - NaviHeader.Height) div 2,
             NaviHeader.Width, NaviHeader.Height);
    end
    else Image_N_1.Top := (pn_main.Top - NaviHeader.Height) div 2;
    Image_N_6.Top := Image_N_1.Top + NaviHeader.Height div 2 - 60;  //onclick disabled when visible!
    Image_N_6.Left := Image_N_1.Left + NaviHeader.Width div 2 - 60;
    //if Image_N_1.Width >= pn_main.Width then scb_right.Left := Image_N_1.Width;
end;

procedure TGUINav.SetHeaderSize;
var
  hmax, p2h: Integer;
  NaviScale: Double;
  s: String;
begin
    if NaviSizeCmb.ItemIndex >= 0 then begin
      s := NaviSizeCmb.Items[NaviSizeCmb.ItemIndex];
      NaviScale := StrToFloat(Copy(s, 1, Length(s) - 1)) / 100;
      if NaviScale < 0.2 then NaviScale := 0.2
      else if NaviScale > 2.0 then NaviScale := 2.0;
    end
    else NaviScale := 1.0;

    if pn_bottom.Visible then p2h := pn_bottom.Height else p2h := 0;
    hmax := Screen.WorkAreaHeight - 20 - GUINav.Height + ClientHeight - pn_main.Height - p2h;
    if hmax < 200 then hmax := 200;

    with NaviHeader do
    begin
      if (OriginalSize.Y * 640) div OriginalSize.X > hmax then
      begin
        Height := (hmax + 7) and $FF8;
        Width := ((Height * OriginalSize.X) div OriginalSize.Y + 4) and $FF8;
        if Width > 640 then Width := 640 else if Width < 8 then Width := 8;
      end
      else
      begin
        Width := 640;
        Height := Min(hmax, (OriginalSize.Y * 640) div OriginalSize.X + 4) and $FF8;
        if Height < 8 then Height := 8;
      end;
      Width := Round(Width * NaviScale);
      Height := Round(Height * NaviScale);
 //     ClientHeight := Height + pn_main.Height + p2h;
    end;
end;

procedure TGUINav.FormHide(Sender: TObject);
begin
    IniVal[2] := Edit_N_1.Text;
    IniVal[3] := Edit_N_2.Text;
 //   IniVal[4] := eFarPlane.Text;
    IniVal[5] := eFOV.Text;
    if cb_azerty.Checked then IniVal[10] := '1' else IniVal[10] := '0';
    if cb_ani_key.Checked then IniVal[14] := '0' else IniVal[14] := '1';
    if cb_HiQ.Checked then IniVal[19] := 'Yes' else IniVal[19] := 'No';
    DisableLightStoring;
    if Screen.Cursor = crNone then Screen.Cursor := crDefault;
end;
procedure TGUINav.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var k: Word;
    d: Double;
begin
    k := Key;
    if (k = 27) and (Screen.Cursor = crNone) then ChangeNaviMode;  //esc
    if (k in [112, 113]) and TryStrToFloat(eFarPlane.Text, d) then //F1,F2 - farplane
    begin
      if k = 112 then d := d * 0.8 else d := d * 1.25;
      eFarPlane.Text := FloatToStrF(Max(1, Min(10000, d)), ffFixed, 5, 1);
    end;
    if (k in [114, 115]) and TryStrToFloat(eFOV.Text, d) then //F3,F4 - fov
    begin
      if k = 114 then d := d * 0.8 else d := d * 1.25;
      eFOV.Text := FloatToStrF(Max(1, Min(360, d)), ffFixed, 5, 1);
    end;
    if k = 116 then rg_cam.ItemIndex := (rg_cam.ItemIndex + 1) mod 3;
    if k = 117 then cb_zoom.Checked := not cb_zoom.Checked;

    if cb_azerty.Checked then
    case Key of
      90:  k := 87;
      65:  k := 81;
      81:  k := 65;
      87:  k := 0;
    end;
    case k of
      69:  SpeedButton_N_1.Click;  //e
   67,81:  SpeedButton_N_2.Click;  //c,q
      65:  SpeedButton_N_3.Click;  //a
      68:  SpeedButton_N_4.Click;  //d
      70:  if not cb_ani_key.Checked then sb_ani_key.Click; //f - Ani Keyframe
      73:  SpeedButton_N_5.Click;  //i
      75:  SpeedButton_N_6.Click;  //k
      74:  SpeedButton_N_7.Click;  //j
      76:  SpeedButton_N_8.Click;  //l
      87:  SpeedButton_N_9.Click;  //w/z
      83:  SpeedButton_N_10.Click; //s
      85:  SpeedButton_N_12.Click; //u
      79:  SpeedButton_N_13.Click; //o
    end;
end;
// FormMouseWheel ...ZOOM
procedure TGUINav.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    StopCalc;
    CanClose := (not isCalculating) or ((NglobalCounter - CalcThreadStatusID) > 3);
    Timer_N_1.Enabled := not CanClose;
end;
procedure TGUINav.FormDestroy(Sender: TObject);
begin
    tmpBMP.Free;
    tmpBMPc.Free;
end;
procedure TGUINav.FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := True;
end;

{$ENDREGION '========================================================================== > | FORM/PANELS'}

{$REGION '============================================================================= > | FORMULAS'}
// hard code existing non JIT
// dropdown listbox with push to fav(listbox)/hide(listbox)
// formula alteration/adj -> saved to new versions

function TGUINav.SetFormulaCBs(S: String): Integer;
var b: LongBool;
    I: Integer;
begin
  b := bUserChangeN;
  Result := -1;
  for I := 0 to cb_frm.Items.Count-1 do
  begin
    if cb_frm.Items[i].IndexOf(S) <> -1 then
    begin
      Result := I;
      bUserChangeN := b;
      Exit;
    end;
  end;

//    for i := 0 to cb_frm.Items.Count - 1 do
//      if CompareText(s, cb_frm.Items[i]) = 1 then cb_frm.Items[i];
    //cb_frm.Items[cb_frm.ItemIndex]:=s;//ComboEdit_F_1.Text := Trim(s);
end;

procedure TGUINav.tc_frmChange(Sender: TObject);
// 1. save tab #    2. save sb #     3. save lb sel #
var i, TI: Integer;
    s,r,ot,ov:String;
//    EB: TEdit;
//    LF: TLabel;
    bAltHybrid: LongBool;
    FormulaName: String;
    Enum: TPair<string,integer>;
begin

//SetTabNames;

    bAltHybrid := lb_frm_design.Caption = 'Iterations:';
    TI := tc_frm.TabIndex;
//    ExchangeFormulaRightBtn.Enabled := (TI = 0) or (bAltHybrid and (TI < 5));
//    ExchangeFormulaLeftBtn.Enabled := (TI > 0);

    with NaviHAddon.Formulas[TI] do
    begin
      bUserChangeN := False;
      if bAltHybrid then
      begin
        if iItCount < 0 then iItCount := 0;
        lb_frm_it.Caption := IntToStr(iItCount);
      end
      else lb_frm_it.Caption := FloatToStrSingle(PSingle(@iItCount)^);
      FormulaName := Trim(CustomFtoStr(CustomFname));
      lb_fname.Caption := FormulaName;

      //for Enum in dFormulaNames do if Enum.Key <> FormulaName then
      //  cb_frm.Items.Text:=FormulaName; //cb_frm.Items.Add(FormulaName);

      cb_frm.ItemIndex := SetFormulaCBs(FormulaName); //SetFormulaCBs(FormulaName);

      if cb_frm.Items[cb_frm.ItemIndex] = '' then
      begin
        //cb_frm.Clear;
        for Enum in dFormulaNames do cb_frm.Items.Add(Enum.Key);
        cb_frm.ItemIndex := SetFormulaCBs(FormulaName);
      end;
      //EditJITFormulaItm.Enabled := Pos('JIT', FormulaName) = 1;

    if bUserChangeN then begin
      i := Max(0, Min(15, NaviHAddon.Formulas[CurrentFindex.X].iOptionCount));
      if i <> FSubIndexTopF then FSubIndexTopF := i;
    end;

      CurrentFindex := FormulaIndexF(0);
      UpdateFormulaLabelsF(CurrentFindex);

      formula_value_update_Click(Sender);//sb_frm_val_inClick; //update adjust panel

//      for i := 0 to 15 do
//      begin
//        EB := (FindComponent('lb_fv__' + IntToStr(i)) as TEdit);
//        EB.Visible := iOptionCount > i;
//        LF := (FindComponent('lb_fn_' + IntToStr(i)) as TLabel);
//        LF.Visible := iOptionCount > i;
//
//        if iOptionCount > i then
//        begin
//          fValuef[i] := dOptionValue[i];   // range check error
////          if i <> FValues then
////          begin
////            FValues := i;
//            EB.Text := FloatToStr(dOptionValue[i]);
//            LF.Caption := PTCustomFormula(MHeader.PHCustomF[TI]).sOptionStrings[i];
////          end;
//        end;
//
//      end;

      //Panel_F_3.Visible := TabControl_F_2.TabIndex = 2;
//      if Is4Dtype(@NaviHeader) then EventDummiClick(pn_4d) else EventDummiDblClick(pn_4d);
//      if NaviHeader.bIsJulia=1 then EventDummiClick(pn_julia) else EventDummiDblClick(pn_julia);

//      if TabControl_F_2.TabIndex = 2 then
//        CheckBox_F_1.Checked := TI in [HAddon.bHybOpt1 shr 4, HAddon.bHybOpt2 shr 8]
//      else CheckBox_F_1.Checked := TI = (HAddon.bHybOpt1 shr 4);

      //RichEdit_F_1.Visible := False;
      //RichEdit_F_1.Text := DescrOfFName(cb_frm.Items[cb_frm.ItemIndex]);
      //btn_frm_info_close.Visible := False;
      //RadioGroup_F_1Click(Sender);  //DECombineCmb

      bUserChangeN := True;

    end;
end;

procedure TGUINav.SetTabNames;
var i, t, n, ti: Integer;
    ne: TNotifyEvent;
begin
    ne := tc_frm.OnChange;
    try
      tc_frm.OnChange := nil;
      if (NaviHAddon.bOptions1 and 3) = 1 then n := 1 else n := 5;
      if tc_frm.Tabs.Count <> n + 1 then
      begin
        ti := tc_frm.TabIndex;
        tc_frm.Tabs.Clear;
        for t := 0 to n do
        begin
          if n = 5 then i := NaviHAddon.Formulas[t].iItCount
                   else i := Ord(NaviHAddon.Formulas[t].CustomFName[0] > 0);
          if t = 0 then
          begin
            if i < 1 then tc_frm.Tabs.Add(' 1')
                     else tc_frm.Tabs.Add(' 1·');
          end
          else if i < 1 then tc_frm.Tabs.Add(IntToStr(t + 1))
                        else tc_frm.Tabs.Add(IntToStr(t + 1) + '·');
        end;
        tc_frm.TabIndex := Min(n, ti);
      end else begin
        for t := 0 to n do
        begin
          if n = 5 then i := NaviHAddon.Formulas[t].iItCount
                   else i := Ord(NaviHAddon.Formulas[t].CustomFName[0] > 0);
          if t = 0 then
          begin
            if i < 1 then tc_frm.Tabs[t] := ' 1'
                     else tc_frm.Tabs[t] := ' 1·';
          end
          else if i < 1 then tc_frm.Tabs[t] := IntToStr(t + 1)
                        else tc_frm.Tabs[t] := IntToStr(t + 1) + '·';
        end;
      end;
      if n = 5 then lb_frm_design.Caption := 'Iterations:' else lb_frm_design.Caption := 'Weight:';
      //CheckBox_F_1.Visible := n = 5;
    finally
      tc_frm.OnChange := ne;
    end;
end;

//select new formula
procedure TGUINav.cb_frmChange(Sender: TObject);
var s: String;  //sent by speedbutton to change combo
    SB : TSpeedButton;
begin
    SB := Sender as TSpeedButton;
    if SB.Caption='<' then cb_frm.ItemIndex:=cb_frm.ItemIndex-1;
    if SB.Caption='>' then cb_frm.ItemIndex:=cb_frm.ItemIndex+1;
    s := cb_frm.Items[cb_frm.ItemIndex];
    cb_frm_change(s);
//   cb_frm.ItemIndex  cb_frm.Items[cb_frm.ItemIndex])
end;
procedure TGUINav.cb_frmSelect(Sender: TObject);
var s: String;
begin
    s := cb_frm.Items[cb_frm.ItemIndex];
    cb_frm_change(s);
end;

//helper procedure
procedure TGUINav.cb_frm_change(s: String);
var Sender: TObject; Button: TUDBtnType ;
    i,f,h: Integer;
    cFormula: TFormulaClass;
    //obj:TObject;
begin
  bUserChangeN := False;
  //tc_frmChange(Sender);
  f := tc_frm.TabIndex;//   ud_frm2.Position;

  with NaviHAddon.Formulas[f] do
  begin
    if isInternFormula(s, i) then
      begin
      cFormula.GetHAddOnFromInternFormula(@NaviHeader, i, f);   //Fo. sel
      NaviHeader.PCFAddon := @NaviHAddon;
      for i := 0 to 5 do NaviHeader.PHCustomF[i] := @HybridCustoms[i];
{!}   IniCFsFromHAddon(PTHeaderCustomAddon(NaviHeader.PCFAddon), NaviHeader.PHCustomF);
      end
    else
      begin
        s := Trim(s);
        PutStringInCustomF(CustomFname, s);
//        if ContainsText(s,'JIT') = False then  //needs work not loading without JIT parse  as in MAIN
//            cFormula.LoadCustomFormulaFromHeader(NaviHAddon.Formulas[f].CustomFname,
//              PTCustomFormula(NaviHeader.PHCustomF[f])^, NaviHAddon.Formulas[f].dOptionValue)
//          else
            LoadCustomFormulaFromHeader(CustomFname,
              PTCustomFormula(NaviHeader.PHCustomF[f])^, dOptionValue);

        CopyTypeAndOptionFromCFtoHAddon(NaviHeader.PHCustomF[f], @NaviHAddon, f);
        iFnr := 20;    //for backward compatibilty reason
      end;
      if iItCount < 1 then iItCount := 1;


      lb_frm_it.Caption := '0';
      ud_frm_it.Position  := 0;
      ud_frm_itClick(Sender,btNext);

      lb_fname.Caption := S;

      if iOptionCount = 0 then
      begin
        pn_frm_mid2.Caption := 'No Options';
        pn_frm_mid.Height:=18;
      end
      else
      begin
        pn_frm_mid2.Caption := '';
        h:=lb_fn_0.Height+tb_fv_0.Height;
        pn_frm_mid.Height:=(iOptionCount*h)+8;
        //pn_frm_mid.Height:=iOptionCount*h;
      end;

      //sb_frm_val_inClick(Sender);//ud_frm2Click(Self);
      //CalcRstop;
      if Is4Dtype(@NaviHeader) then EventDummiClick(pn_4d) else EventDummiDblClick(pn_4d);
      if NaviHeader.bIsJulia=1 then EventDummiClick(pn_julia) else EventDummiDblClick(pn_julia);

      SetTabNames;//tc_frmChange(Sender);
      bUserChangeN := True;
      NewCalc;
  end;
end;

procedure TGUINav.jvrg_ftypeClick(Sender: TObject);
var Enum: TPair<string, integer>;
begin
    cb_frm.Clear;
    with cb_frm.Items do begin
      case jvrg_ftype.ItemIndex of
//        999: if cb.Checked then cb_frm.Clear;
//        666: if cb.Checked then cb_frm.Sorted := True else cb_frm.Sorted := False;
        0 {23}: for Enum in dFormulaNames do Add(Enum.Key);
        1 {24}: for Enum in dFormulaNames do if Enum.Value = 24 then Add(Enum.Key);    // JIT
        2 { 0}: for Enum in dFormulaNames do if (Enum.Value = 0) or (Enum.Value = 1)  then Add(Enum.Key);    // 3d
        3 { 2}: for Enum in dFormulaNames do if Enum.Value = 2  then Add(Enum.Key);    // 3d ADE
        4 {11}: for Enum in dFormulaNames do if Enum.Value = 11 then Add(Enum.Key);    // 3d ADE ABox
        5 { 4}: for Enum in dFormulaNames do if Enum.Value = 4  then Add(Enum.Key);    // 4d
        6 { 5}: for Enum in dFormulaNames do if Enum.Value = 5  then Add(Enum.Key);    // 4d ADE
        7 { 6}: for Enum in dFormulaNames do if Enum.Value = 6  then Add(Enum.Key);    // 4d ADE ABox
        8 {20}: for Enum in dFormulaNames do if Enum.Value = 20 then Add(Enum.Key);    // IFS  shapes
        //----------------------------------------------------------------------
        9 {21}: for Enum in dFormulaNames do if Enum.Value = 21 then Add(Enum.Key);    // IFS  trafos
        10 {1}: for Enum in dFormulaNames do if Enum.Value = -1 then Add(Enum.Key);    // ADS
        11{25}: for Enum in dFormulaNames do if Enum.Value = 25 then Add(Enum.Key);    // _JIT
      end;
    end;
end;

procedure TGUINav.LoadFormulaNames;
var Enum: TPair<string, integer>;
begin
    cb_frm.Clear;
    for Enum in dFormulaNames do cb_frm.Items.Add(Enum.Key);
end;


{$ENDREGION '========================================================================== > | FORMULAS'}

{$REGION '============================================================================= > | TIMER'}

procedure TGUINav.NewCalc;
begin
    Inc(NglobalCounter);
    actStepWidth   := 16;
    Timer_N_1.Enabled := True;
end;

function TGUINav.isCalculating: LongBool;
begin
    Result := GetActiveThreadCount(CalcThreadStatusID) > 0;
end;

procedure TGUINav.Timer_N_1Timer(Sender: TObject);
//var b_Active: Boolean;
begin
    if b_Active then b_Active:=False else b_Active:=True;
    //if b_Active then lbl_Active.Color := clRed else lbl_Active.Color := clLime;
    //with lbl_Active do begin if b_Active then Color := clRed else Color := clLime; end;
    with lbl_Active do begin if b_Active then Caption := '\/\/\/\/' else Caption := '/\/\/\/\'; end;
    btn_STOP.Enabled:=True;
    btn_STOP.Caption:='STOP';
    Timer_N_1.Interval := 100;
    Image_N_1.Repaint;
    if not isCalculating then
    begin
      lbl_Active.Color := clBtnFace;
      lbl_Active.Caption := '--------';
      iActiveThreads := 0;
      actStepWidth := actStepWidth shr 1;
      if actStepWidth = 0 then
        begin
        btn_STOP.Enabled:=False;
        Timer_N_1.Enabled := False;
        end
      else Calc(actStepWidth);

    end;
end;

procedure TGUINav.btn_STOPClick(Sender: TObject);
begin
    if Timer_N_1.Enabled then
    begin
    Timer_N_1.Enabled := False;
    btn_STOP.Caption:='PAUSED';
    end
    else
    begin
    Timer_N_1.Enabled := True;
    btn_STOP.Caption:='STOP';
    end;
end;

procedure TGUINav.btn_killClick(Sender: TObject);
begin

   FNaviFormCreated:= False;
   StopCalc;
   Timer_N_1.Enabled := False;
   FormHide(Sender);
   //tmpBMP.Free;
   //tmpBMPc.Free;
end;

procedure TGUINav.WaitForCalcToStop(millisec: Integer);
var i: Integer;
begin
    StopCalc;
    i := millisec div 50;
    while (i >= 0) and isCalculating do
    begin
      Delay(50);
      Dec(i);
    end;
end;
procedure TGUINav.StopCalc;
begin
    Inc(NglobalCounter);
    actStepWidth := 1;
end;

procedure TGUINav.WmThreadReady(var Msg: TMessage);
begin
    Dec(iActiveThreads);
    if iActiveThreads = 0 then Timer_N_1.Interval := 5;
end;
procedure TGUINav.WmThreadStat(var Msg: TMessage);
begin
 {   case Msg.WParam of
      1:  begin Label_N_27.Caption := errorstring[1]; Label_N_27.Visible := True; end;
      2:  begin Label_N_28.Caption := errorstring[2]; Label_N_28.Visible := True; end;
      3:  begin Label_N_29.Caption := errorstring[3]; Label_N_29.Visible := True; end;
      4:  begin Label_N_30.Caption := errorstring[4]; Label_N_30.Visible := True; end;
    end; }
    case Msg.WParam of
      1:  begin Label_N_27.Caption := IntToStr(Msg.LParam); Label_N_27.Visible := True; end;
      2:  begin Label_N_28.Caption := IntToStr(Msg.LParam); Label_N_28.Visible := True; end;
      3:  begin Label_N_29.Caption := IntToStr(Msg.LParam); Label_N_29.Visible := True; end;
      4:  begin Label_N_30.Caption := IntToStr(Msg.LParam); Label_N_30.Visible := True; end;
    end;
end;
procedure TGUINav.WMDROPFILES(var Msg: TMessage);
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
      if s = '.M3P' then
      begin
        LoadParameterNavi(NaviHeader, StrPas(Dateiname), True);
        //AllPresetsUp;
        //OutMessage('Parameters loaded, press "Calculate 3D" to render.');
        //ClearScreen;
        Image_N_1.Picture.Bitmap.Canvas.FillRect(Image_N_1.Picture.Bitmap.Canvas.ClipRect);
        //SetSaveDialogNames(OpenDialog_N_1.FileName);
        NewCalc;
      end;
//      else if s = '.PNG' then
//      begin
//        success := False;
//        try
//          stream := TFileStream.Create(StrPas(Dateiname), fmOpenRead);
//        //  i := stream.Size - 1500;
//          if stream.Size > 2500 then
//          begin
//            SetLength(sa, 2502);
//          //  sa := StringOfChar(' ', 1502);
//            stream.Seek(-2500, soEnd);
//            stream.Read(sa[1], 2500);
//            i := Pos('tEXtComment', sa);
//            if i > 0 then
//            begin
//              Inc(i, 12);
//              if Copy(sa, i, 12) = 'Mandelbulb3D' then
//              begin
//                sa := Copy(sa, i, 2500);
//                if GetHeaderFromText(sa, MHeader, st) then
//                begin
//                  TextParsLoadSuccess;
//                  success := True;
//                  Caption := st;
//                end;
//              end;
//            end;
//          end;
//        finally
//          stream.Free;
//          if not success then OutMessage('No text params found.');
//        end;
//      end
//      else if s = '.TXT' then
//      begin
//        AssignFile(tf, StrPas(Dateiname));
//        try
//          Reset(tf);
//          Readln(tf, s);
//          i := 40;
//          while (i > 0) and not EOF(tf) do
//          begin
//            Readln(tf, st);
//            s := s + st;
//            Dec(i);
//          end;
//          if GetHeaderFromText(s, MHeader, st) then
//          begin
//            TextParsLoadSuccess;
//            Caption := st;
//          end
//          else OutMessage('No text params found.');
//        finally
//          CloseFile(tf);
//        end;
//      end;
    finally
      StrDispose(Dateiname);
      DragFinish(Msg.WParam);
    end;
end;


{$ENDREGION '========================================================================== > | TIMER'}

{ThreadUtils}
initialization

  for CTStmpi := 0 to 63 do CTSa[CTStmpi] := nil;


{$REGION '============================================================================= > | commented'}

{
procedure TGUINav.UpdateFormulaLabels(Findex: TPoint);
var i, i2: Integer; b: Boolean;
    LF, LV: TLabel; RX: TTrackBarEx;
begin
    for i := 0 to 2 do begin
      i2 := FSubIndexTop + i;
      LF := FindComponent('Label_N_F' + IntToStr(i)) as TLabel;
      LV := FindComponent('Label_N_V' + IntToStr(i)) as TLabel;
      RX := FindComponent('TrackBarEx_N_' + IntToStr(i + 4)) as TTrackBarEx;
      if (LF <> nil) and (LV <> nil) and (RX <> nil) then begin
        b := (i2 < NaviHAddOn.Formulas[Findex.X].iOptionCount) and
         (((NaviHAddOn.bOptions1 and 3) = 1) or (NaviHAddOn.Formulas[Findex.X].iItCount > 0));
        LF.Visible := b; LV.Visible := b; RX.Visible := b;
        if b then begin
          LF.Caption := PTCustomFormula(GUI.MHeader.PHCustomF[Findex.X]).sOptionStrings[i2];
          if not isIntType(fType[3 + i]) then LV.Caption := FloatToStrSingle(fValue[3 + i])
          else LV.Caption := IntToStr(Round(fValue[3 + i]));
        end;
      end;
      //CheckFormulaImageVis;
    end;
    CheckFocus;
end;
}

//procedure TGUINav.ud_frm2Click(Sender: TObject; Button: TUDBtnType);
//var i: Integer;    //get formula name
//begin
//
////    if Button = btPrev then begin
////      if lbl_frm2.Caption <> '1' then lbl_frm2.Caption := IntToStr(StrToInt(lbl_frm2.Caption) - 1);
////    end
////    else if Button = btNext then begin
////      if lbl_frm2.Caption <> '6' then lbl_frm2.Caption := IntToStr(StrToInt(lbl_frm2.Caption) + 1);
////    end;
//
////    if bUserChangeN then begin
////      i := Max(0, Min(15, NaviHAddon.Formulas[CurrentFindex.X].iOptionCount));
////      if i <> FSubIndexTop2 then FSubIndexTop2 := i;
////    end;
//
////    if Is4Dtype(@NaviHeader) then EventDummiClick(pn_4d) else EventDummiDblClick(pn_4d);
////    if NaviHeader.bIsJulia=1 then EventDummiClick(pn_julia) else EventDummiDblClick(pn_julia);
////    sb_frm_val_in2Click(Sender);
//    //pn_formula2.Height := 200+(i*27);
//end;

{
procedure TGUINav.tc_frmMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
}
//------------------------------------------------------------------------------
//the search for spock

//function CanLoadCustomFormula(FileName: String; var DEfunction: Integer): Boolean;
//var n, iVersion, SIMDlevel: Integer;
//    f: TextFile;
//    s: String;
//const
//    cOptions: String = '.SSE2.DESC.SIPO.RSTO.SSE3.SSSE.SSE4.VERS.DEOPTION';
//    procedure LoadNextStr;
//    begin
//        repeat
//          Readln(f, s);
//          s := Trim(s);
//        until EOF(f) or (s > '');
//    end;
//begin
//    Result := False;
//    AssignFile(f, FileName);
//    try
//      SIMDlevel := 0;
//      iVersion  := 0;
//      DEfunction := 0;
//      Reset(f);
//      LoadNextStr;
//      if s = '[OPTIONS]' then
//      begin
//        repeat
//          LoadNextStr;
//          n := Pos(UpCaseN(s, 5), cOPtions);
//          case n of
//            1:   SIMDlevel := SIMDlevel or 1;
//            21:  SIMDlevel := SIMDlevel or 2;
//            26:  SIMDlevel := SIMDlevel or 4;
//            31:  SIMDlevel := SIMDlevel or 8;
//            36:  iVersion  := StrToInt(StrLastWord(s));
//            41:  DEfunction := StrToInt(StrLastWord(s));
//          end;
//        until EOF(f) or (s[1] = '[');
//      end;
//      Result := ((hasSIMDlevel and SIMDlevel) = SIMDlevel) and (iVersion in [2..actFormulaId]);
//    finally
//      CloseFile(f);
//    end;
//end;

//function CanLoadF(FormulaName: String): Boolean;
//var df: Integer;
//begin
//    Result := CanLoadCustomFormula(IncludeTrailingPathDelimiter(IniDirs[3]) + FormulaName + '.m3f', df);
//end;


//procedure SelectFormula(FName: String);
//var i: Integer;
//    s: String;
//    success: LongBool;
//begin
//    if ListBoxEx_F_15.Visible then ShowListBox(ListBoxEx_F_15, False);
//    s := Trim(FName);
//    success := False;
//    if s <> '' then
//
//
//    begin
//      if isInternFormula(s, i) then
//      begin
//        GetHAddOnFromInternFormula(@MHeader, i, tc_frm.TabIndex);   //Fo. sel
//        success := True;
//      end else begin
//        PutStringInCustomF(HAddon.Formulas[tc_frm.TabIndex].CustomFname, s);
//        if LoadCustomFormulaFromHeader(HAddon.Formulas[tc_frm.TabIndex].CustomFname,
//           PTCustomFormula(MHeader.PHCustomF[tc_frm.TabIndex])^,    //could be in use by calc thread!
//           HAddon.Formulas[tc_frm.TabIndex].dOptionValue) then
//        begin
//          if TabControl_F_2.TabIndex <> 1 then
//            if HAddon.Formulas[tc_frm.TabIndex].iItCount < 1 then
//              HAddon.Formulas[tc_frm.TabIndex].iItCount := 1;
//          CopyTypeAndOptionFromCFtoHAddon(MHeader.PHCustomF[tc_frm.TabIndex],
//            @HAddon, tc_frm.TabIndex);
//          success := True;
//          HAddon.Formulas[tc_frm.TabIndex].iFnr := 20;    //for backward compatibilty reason
//        end;
//      end;
//    end;
//
//
//    if not success then  //deselect formula
//    begin
//      ClearFormula(tc_frm.TabIndex);
//      tc_frmChange(Self);
//      Check4DandInfo;
//    end else begin
//      if TabControl_F_2.TabIndex <> 1 then
//      if HAddon.Formulas[tc_frm.TabIndex].iItCount < 1 then
//        HAddon.Formulas[tc_frm.TabIndex].iItCount := 1;
//      tc_frmChange(Self);
//      CalcRstop;
//      Check4DandInfo;
//    end;
//end;

//------------------------------------------------------------------------------

{
procedure TGUINav.AddFormulaName(FName: String; DEfunc: Integer);
var stat: Integer;
begin  // MutaGenGUI
//  stat := TFormulaNamesLoader.GetFavouriteStatus(FName);
//  if stat > -2 then
  begin
    //FName := IntToStr(stat) + ' ' + FName;   //    numerical # prefix order
    case DEfunc of
      2,11:  cb_frm.Items.Add(FName);                                           // 3Da
         4:  cb_frm.Items.Add(FName);                                           // 4D
       5,6:  cb_frm.Items.Add(FName);                                           // 4Da
     -1,-2:  cb_frm.Items.Add(FName);                                           // Ads
        20:  cb_frm.Items.Add(FName); // Iterated function system               // dIFS  shapes
    21..22:  cb_frm.Items.Add(FName);                                           // dIFS  trafos
      else                                                                      // 3D
        cb_frm.Items.Add(FName);                                                //
    end;
  end;

  //~7
//-1,-2=ADS
//2,11=3da
//4=4d
//5,6=4da
//20=difs sha
//21,22=difs tra
//~=3d
end;
}


{
function TGUINav.FNameIsIncluded(Name: String): LongBool;
var i : Integer;
begin
    Result := False;
    if cb_frm <> nil then
      for i := 0 to cb_frm.Items.Count - 1 do
        begin
          if CompareText(Trim(Name), StrLastWords(cb_frm.Items[i])) = 0 then Result := True;
          if Result then Break;
        end;
end;
}

{procedure TGUINav.WndProc(var Message: TMessage);
begin
    inherited WndProc(Message);
end;  }

{procedure TGUINav.AdjustPanel3positions;
var i: Integer;
begin
    i := RadioGroup1.Height + 1 + SizeGroup.Height;
    Button_N_2.Top := i;
    Inc(i, Button_N_2.Height);
    Panel_N_4.Top := i;

    if Panel_N_4.Visible then Inc(i, Panel_N_4.Height);
    Inc(i);
    Button_N_3.Top := i;
    Inc(i, Button_N_3.Height);
    Panel_N_5.Top := i;

    if Panel_N_5.Visible then Inc(i, Panel_N_5.Height);
    Inc(i);
    Button_N_4.Top := i;
    Button_N_4.Enabled := GUI.Panel_F_2.Visible;//FORMULA

    if not Button_N_4.Enabled then Panel_N_6.Visible := False;
    Inc(i, Button_N_4.Height);
    Panel_N_6.Top := i;

    if Panel_N_6.Visible then Inc(i, Panel_N_6.Height);
    Inc(i);
    Button_N_5.Top := i;
    Inc(i, Button_N_5.Height);
    Panel_N_7.Top := i;
end;

procedure TGUINav.Button_N_2Click(Sender: TObject);
begin
    Panel_N_4.Visible := not Panel_N_4.Visible;
    AdjustPanel3positions;
end;

procedure TGUINav.Button_N_3Click(Sender: TObject);
begin
    Panel_N_5.Visible := not Panel_N_5.Visible;
    AdjustPanel3positions;
end;

procedure TGUINav.Button_N_4Click(Sender: TObject);
begin
    Panel_N_6.Visible := not Panel_N_6.Visible;
    AdjustPanel3positions;
end;

procedure TGUINav.Button_N_5Click(Sender: TObject);
begin
    Panel_N_7.Visible := not Panel_N_7.Visible;
    if Panel_N_4.Visible and Panel_N_5.Visible and Panel_N_7.Visible then Panel_N_4.Visible := False;
    AdjustPanel3positions;
end;}

(*
function TGUINav.GetLocalAbsoluteDE(out NotValid: LongBool): Double;
var ct: TVec3D;    before:- with lMCTparas do
    i, c: Integer;
    dTmp, dTmp2, dmul: Double;
    MedianList: array of Double;
    Iteration3Dext: TIteration3Dext;
    lMCTparas: TMCTparameter;
begin
    NotValid := False;
    Result := lMCTparas.iMandWidth * lMCTparas.StepWidth;
    NormVGrads(@NaviHeader);
    NaviHeader.bCalc3D := 1;
    bGetMCTPverbose := False;
    lMCTparas := GetMCTparasFromHeader(NaviHeader, True {False});  //todo: function to get only formula relevant paras for calc DE
    if not lMCTparas.bMCTisValid then
    begin
      NotValid := True;
      Exit;
    end;
    bGetMCTPverbose := True;
    IniIt3D(@lMCTparas, @Iteration3Dext);
    mCopyVec(@Iteration3Dext.C1, @lMCTparas.Xmit);
    i := 0;
    mCopyVec(@ct, @Iteration3Dext.C1);
    Iteration3Dext.CalcSIT := False;
    if lMCTparas.bInAndOutside then lMCTparas.bInsideRendering := False;
    lMCTparas.bCalcInside := lMCTparas.bInsideRendering;
    if lMCTparas.iCutOptions <> 0 then
    begin
      maxLengthToCutPlane(dTmp, i, @Iteration3Dext.C1, @lMCTparas);
      if i <> 0 then
      with Iteration3Dext do  // move to cutplane and calcDE...
      begin
        mCopyAddVecWeight(@C1, @ct, @lMCTparas.Vgrads[2], dTmp);
        dTmp2 := lMCTparas.CalcDE(@Iteration3Dext, @lMCTparas);
        if lMCTparas.bInAndOutside then
        begin
          lMCTparas.bInsideRendering := dTmp2 < lMCTparas.DEstop;
          lMCTparas.bCalcInside := lMCTparas.bInsideRendering;
          if lMCTparas.bInsideRendering then
            dTmp2 := lMCTparas.CalcDE(@Iteration3Dext, @lMCTparas);
        end;
        Result := dTmp + dTmp2;
      end;
    end;
    if i = 0 then
    with Iteration3Dext do
    begin
      if lMCTparas.bInAndOutside then
      begin
        dTmp2 := lMCTparas.CalcDE(@Iteration3Dext, @lMCTparas);
        lMCTparas.bInsideRendering := dTmp2 < lMCTparas.DEstop;
        lMCTparas.bCalcInside := lMCTparas.bInsideRendering;
      end;
      if lMCTparas.bInsideRendering then
      begin
        lMCTparas.CalcDE(@Iteration3Dext, @lMCTparas);
        NotValid := lMCTparas.DEoptionResult <> 20;
        if NotValid then Exit;
      end;
      dmul := 1;
      c := 0;
      SetLength(MedianList, 12);
      repeat
        for i := 0 to 8 do
        begin
          if i = 8 then mCopyVec(@C1, @ct) else
          begin
            mCopyAddVecWeight(@C1, @ct, @lMCTparas.Vgrads[0], ((i and 1) * 32 - 16) * dmul);
            mAddVecWeight(@C1, @lMCTparas.Vgrads[1], ((i and 2) * 16 - 16) * dmul);
            mAddVecWeight(@C1, @lMCTparas.Vgrads[2], ((i and 4) * 8 - 16) * dmul);
          end;
          try
            MedianList[c] := lMCTparas.CalcDE(@Iteration3Dext, @lMCTparas);
            if (MedianList[c] > 0) and (MedianList[c] < 1e15) and (c < 11) then Inc(c);
          except
          end;
        end;
        dmul := dmul * 2;
      until (c > 3) or (dmul > 40);
      if c = 0 then
      begin
        NotValid := True;
        Result := LengthOfVec(ct) * s05 / lMCTparas.StepWidth;
      end
      else Result := aMedian(c, MedianList, 0.6);
    end;
    Result := MinMaxCD(3, Result, 20000) * lMCTparas.StepWidth;
    Result := MinCD(Result, MaxCD(2, LengthOfVec(ct)));
end;
*)


//from thread

  {function RdTsc: int64;
  asm
     db $0f, $31 // RdTsc
  end;}


    //timetest
  //    if NaviStep = 1 then PostMessage(PCalcThreadStats.pMessageHwnd, WM_ThreadStat, iThreadID, (RdTsc - PInt64(@dJUx)^) shr 16);
   { except
      on E: Exception do
      begin
        errorstring[iThreadID] := E.Message;
        PostMessage(PCalcThreadStats.pMessageHwnd, WM_ThreadStat, iThreadID, 0);
      end;
    end;      }


 { TNaviCalcThreadNewLight = class(TThread)
  private
    // Private-Deklarationen
    Iteration3Dext: TIteration3Dext;
    VgradsFOV: TVec3D;
    procedure CalculateVgradsFOV(ix: Integer);
    procedure CalculateNormals(var NN: Double; mPsiLight: TPsiLight3);
    procedure CalcNanglesForCut(CutPlane: Integer; PSL: TPsiLight3; Zdif: Double);
    procedure maxLengthToCutPlane(var dLength: Double; var itmp: Integer; vPos: TPPos3D);
  public
    // Public-Deklarationen
    MCTparas: TMCTparameter;
  protected
    procedure Execute; override;
  end;   }





(*
procedure TGUINav.ud_frm_itClick(Sender: TObject; Button: TUDBtnType);
begin   //F iterations, weight
 //   CurrentFindex := FormulaIndex(FocusedSlider);
    with NaviHAddOn.Formulas[CurrentFindex.X] do begin
      if Button = btPrev then begin  //ipol hybrid
        if (NaviHAddon.bOptions1 and 3) = 1 then PSingle(@iItCount)^ := Max0S(PSingle(@iItCount)^ - 0.1)
        else iItCount := Max(0, StrToIntTrim(lbl_frm_its.Caption) - 1);
      end
      else if Button = btNext then begin
        if (NaviHAddon.bOptions1 and 3) = 1 then PSingle(@iItCount)^ := PSingle(@iItCount)^ + 0.1
        else iItCount := StrToIntTrim(lbl_frm_its.Caption) + 1;
      end;
    end;
    sb_frm_val_inClick(Sender);
end;
procedure TGUINav.ud_frmClick(Sender: TObject; Button: TUDBtnType);
begin    //formula nr           SpinEdit_N_2
    if Button = btPrev then begin
      if lbl_frm.Caption <> '1' then lbl_frm.Caption := IntToStr(StrToInt(lbl_frm.Caption) - 1);
    end
    else if Button = btNext then begin
      if lbl_frm.Caption <> '6' then lbl_frm.Caption := IntToStr(StrToInt(lbl_frm.Caption) + 1);
    end;
    if Is4Dtype(@NaviHeader) then EventDummiClick(pn_4d) else EventDummiDblClick(pn_4d);
    if NaviHeader.bIsJulia=1 then EventDummiClick(pn_julia) else EventDummiDblClick(pn_julia);

    sb_frm_val_inClick(Sender);
end;
function TGUINav.FormulaIndex(iSlider: Integer): TPoint;
begin
    Result.X := Max(0, Min(5, StrToIntTrim(lbl_frm.Caption) - 1));
    Result.Y := Max(0, Min(15, FSubIndexTop + iSlider));
end;
procedure TGUINav.sb_frm_val_inClick(Sender: TObject); //also as general update
var i: Integer;    //  SpeedButton_N_26
begin              //  reset value ..from focused slider
    if FocusedSlider > 2 then FocusedSlider := 0;
    if Sender = sb_frm_val_in then CopyFormulaValueFromMain(FormulaIndex(FocusedSlider))
    else if Sender = ud_frm then begin
      FocusedSlider := 0;
      FSubIndexTop  := 0;
    end;
    CurrentFindex := FormulaIndex(FocusedSlider);
    lb_fname.Caption := CopyFormulaNameFromMain(CurrentFindex.X); //Fname
    if (NaviHAddon.bOptions1 and 3) = 1 then begin  //interpol hybrid has single values in itcount:
      lbl_frm_its.Caption := FloatToStrSingle(PSingle(@NaviHAddOn.Formulas[CurrentFindex.X].iItCount)^);
      lbl_frm_design.Caption := 'Weight:';
    end
    else begin
      lbl_frm_its.Caption := IntToStr(NaviHAddOn.Formulas[CurrentFindex.X].iItCount);
      lbl_frm_design.Caption := 'Iterations:';
    end;
    for i := 3 to 5 do begin //update all slider
      fValue[i]   := GetFormulaValue(FormulaIndex(i - 3)); //from naviHaddon
      fZero[i]    := fValue[i];
      fType[i]    := GetFormulaValType(FormulaIndex(i - 3));
      if isAngleType(fType[i]) then fRange[i] := 15 else fRange[i] := 1;
    end;
    UpdateFormulaLabels(CurrentFindex);
    if sb_fog_or_color.Caption = 'Dyn Fog on its:' then i := NaviHeader.bDFogIt
    else i := NaviHeader.bColorOnIt - 1;
    fZero[9]    := i;
    fZero[10]   := NaviHeader.RStop;
    fZero[11]   := NaviHeader.sDEcombS;
    fZero[12]   := NaviHeader.sDEstop;
    fZero[13]   := NaviHeader.Iterations;
    for i       := 9 to 13 do fValue[i] := fZero[i];
    UpdateMiscLabels;
    if (Sender = sb_frm_val_in) or (Sender = ud_frm_it) then Newcalc;
end;
procedure TGUINav.sb_frm_val_outClick(Sender: TObject);
var E: TEdit;    //   SpeedButton_N_27
begin  //send formula value to main
    CurrentFindex := FormulaIndex(FocusedSlider);
    GUI.HAddOn.Formulas[CurrentFindex.X].dOptionValue[CurrentFindex.Y] := fValue[3 + FocusedSlider];
    if GUI.tc_frm.TabIndex = CurrentFindex.X then//{FORMULA}
    begin
      E := (GUI.FindComponent('Edit_F_' + IntToStr(CurrentFindex.Y)) as TEdit);{FORMULA}
      if isIntType(fType[3 + FocusedSlider]) then
        E.Text := IntToStr(Round(fValue[3 + FocusedSlider]))
      else
        E.Text := FloatToStr(fValue[3 + FocusedSlider]);
    end;
end;
procedure TGUINav.scr_frmChange(Sender: TObject);
var i: Integer;
begin  //mov FSubIndexTop      ScrollBar1
    if bUserChangeN then
    begin
      i := Max(0, Min(15, NaviHAddon.Formulas[CurrentFindex.X].iOptionCount));
      i := Max(0, Min(i - 2, scr_frm.Position));
      if i <> FSubIndexTop then
      begin
        FSubIndexTop := i;
        sb_frm_val_inClick(Sender);
      end;
    end;
end;
procedure TGUINav.CheckFormulaImageVis;
begin
    Image4.Visible := FSubIndexTop > 0;
    Image5.Visible := NaviHAddOn.Formulas[Max(0, Min(5, StrToInt(lbl_frm.Caption) - 1))].iOptionCount > FSubIndexTop + 3;
end;


procedure TGUINav.sb_frm_moveClick(Sender: TObject);
begin
  EventDummiDblClick(pn_formula2);
  EventDummiDblClick(pn_formula);
  EventDummiDblClick(pn_julia);
  EventDummiDblClick(pn_4d);
  EventDummiDblClick(pn_misc);
//
  if sb_frm_move.Parent = pn_formula then
    begin
      sb_frm_move.Parent := pn_formula2;

      pn_formula.Visible := False;
      pn_formula2.Visible := True;
      pn_formula2.Parent := pn_right;

      EventDummiClick(pn_formula2);
      sb_frm_move.Caption := '<';
      f2_active:=True;
    end
  else
    begin
      sb_frm_move.Parent := pn_formula;
      pn_formula2.Visible := False;
      pn_formula.Visible := True;

      EventDummiClick(pn_formula);
      sb_frm_move.Caption := '>';
      f2_active:=False;
    end;
end;

*)


(*
  InternFormulaNames: array[0..9] of AnsiString = (
    'Integer Power',    0    ~   3D*
    'Real Power',       0    ~   3D*
    'Quaternion',       4    4D
    'Tricorn',          0    ~   3D*
    'Amazing Box',      11   3Da
    'Bulbox',           0    ~   3D*
    'Folding Int Pow',  0    ~   3D*
    ------------------
    'test',
    'testIFS',
    ------------------
    'Aexion C');
  InternFormulaMax: Integer = 9;
  -----------------------------------------------------------------
  InternFormulasDEfunc: array[0..6] of Integer = (0,0,4,0,11,0,0);
*)

//if (obj is TComboBox) and (TComboBox(obj).Items[TComboBox(obj).ItemIndex]) then
//    //if (obj is TComboBox) and (TComboBox(obj).OnSelect(obj)) then
//    if (obj is TSpeedButton) and (TSpeedButton(obj).Caption='<') then cb_frm.ItemIndex:=cb_frm.ItemIndex-1;
//    if (obj is TSpeedButton) and (TSpeedButton(obj).Caption='>') then cb_frm.ItemIndex:=cb_frm.ItemIndex+1;

//procedure TGUINav.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//var MPos: TPoint;
//    b: Boolean;
//    i: Integer;
//begin
//    if pn_formula.Visible then
//    begin
//      GetCursorPos(MPos);
//      Mpos := pn_formula.ScreenToClient(Mpos);
//      b := (Mpos.Y >= scr_frm.Top) and
//           (Mpos.Y <= scr_frm.Top + scr_frm.Height) and
//           (Mpos.X >= pn_formula.Width - scr_frm.Width) and (Mpos.X <= pn_formula.Width);
//      b := b and (Image4.Visible or Image5.Visible);
//      if b and not scr_frm.Visible then
//      begin
//        bUserChangeN := False;
//        i := Max(0, Min(15, NaviHAddon.Formulas[CurrentFindex.X].iOptionCount));
//        scr_frm.Max := Max(FSubIndexTop, i - 2);
//        scr_frm.Min := 0;
//        scr_frm.Position := FSubIndexTop;
//        bUserChangeN := True;
//        Image4.Visible := False;
//        Image5.Visible := False;
//        scr_frm.Visible := True;
//      end
//      else if scr_frm.Visible then
//      begin
//        scr_frm.Visible := False;
//        CheckFormulaImageVis;
//      end;
//    end;
//end;


{$ENDREGION '========================================================================== > | commented'}



end.

















