unit uTEST;

interface

{$REGION '============================================================================= > | USES'}
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Contnrs,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.ComCtrls,
  JvExForms,
  JvCustomItemViewer,
  JvImagesViewer,
  JvComponentBase,
  JvFormAnimatedIcon,
  JvExComCtrls,
  JvProgressBar,
  JvComCtrls,
  JvxSlider,
  JvExControls,
  JvSlider,
  JvExStdCtrls,
  JvGroupBox,
  JvOutlookBar,
  JvExExtCtrls,
  JvExtComponent,
  JvCaptionPanel,
  JvPageList,
  JvNavigationPane,
  JvClipboardMonitor,
  //
  TrackBarEx,
  //~MutaGen,
  //~MB3DFacade,
  //~PreviewRenderer,
  //~FormulaNames,
  TypeDefinitions,
  uFormula,
  CustomFormulas,
  FileHandling,
  DivUtils,
  HeaderTrafos,
  Math3D,
  Calc,
  Paint,
  ImageProcess,
  CalcHardShadow,
  CalcSR,
  DOF,
//  formulas,
  MAIN;

{$ENDREGION '========================================================================== > | USES'}

{$REGION '============================================================================= > | TYPES'}
type  // save history  // batch render in memory analyse noise for interest

{$REGION '============================================================================= > | FACADE'}

{FACADE}

  TMB3DParamsFacade = class;

  TMB3DFormulaFacade = class;

  TMB3DParamType = (ptFloat, ptInteger);

  TMB3DParamFacade = class
  private
    FOwner: TMB3DFormulaFacade;   //name collision class/member
    FParamIndex: Integer;
    function GetName: String;
    function GetDatatype: TMB3DParamType;
    function GetValue: Double;
    procedure SetValue(const Value: Double);
  public
    property Name: String read GetName;
    property Datatype: TMB3DParamType read GetDatatype;
    property Value: Double read GetValue write SetValue;
    constructor Create(const ParamIndex: Integer; const Owner: TMB3DFormulaFacade);  //moved to public?
  end;

  TMB3DFormulaFacade = class
  private
    FOwner: TMB3DParamsFacade;
    FFormulaIndex: Integer;
    FParams: TList;
    function GetFormulaName: String;
    procedure SetFormulaName(const FormulaName: String);
    function GetParam(Index: Integer): TMB3DParamFacade;
    function GetParamCount: Integer;
    procedure SetIterationCount(const IterationCount: Integer);
    function GetIterationCount: Integer;
  public
    constructor Create(const FormulaIndex: Integer; const Owner: TMB3DParamsFacade);
    destructor Destroy;override;
    procedure Clear;
    function IsEmpty: Boolean;
    property FormulaName: String read GetFormulaName write SetFormulaName;
    property ParamCount: Integer read GetParamCount;    //name change
    property Params[Index: Integer]: TMB3DParamFacade read GetParam;
    property IterationCount: Integer read GetIterationCount write SetIterationCount;
  end;

  TMB3DCoreFacade = class
  private
    FHybridCustoms: array[0..5] of TCustomFormula;
    FHeader: TMandHeader10;
    FHAddOn: THeaderCustomAddon;
    function GetHeaderPointer: TPMandHeader10;
    function GetHAddonPointer: PTHeaderCustomAddon;
  public
    constructor Create(const Header: TMandHeader10; const HAddOn: THeaderCustomAddon);
    destructor Destroy;override;
    procedure ApplyToCore(DestHeader: TMandHeader10; DestHAddOn: THeaderCustomAddon);
    property PHeader: TPMandHeader10 read GetHeaderPointer;
    property PHAddOn: PTHeaderCustomAddon read GetHAddOnPointer;
  end;

  TMB3DRootFacade = class
  private
    FOwner: TMB3DParamsFacade;
  public
    constructor Create(const Owner: TMB3DParamsFacade);
  end;

  TMB3DIterationsFacade = class (TMB3DRootFacade)
  private
    function GetMinIterations: Integer;
    procedure SetMinIterations(const MinIterations: Integer);
    function GetIterations: Integer;
    procedure SetIterations(const Iterations: Integer);
    function GetRBailout: Double;
    procedure SetRBailout(const RBailout: Double);
  public
    property MinIterations: Integer read GetMinIterations write SetMinIterations;
    property Iterations: Integer read GetIterations write SetIterations;
    property RBailout: Double read GetRBailout write SetRBailout;
  end;

  TMB3DJuliaModeFacade = class(TMB3DRootFacade)
  private
    function GetIsJulia: Boolean;
    procedure SetIsJulia(const IsJulia: Boolean);
    function GetJx: Double;
    procedure SetJx(const Jx: Double);
    function GetJy: Double;
    procedure SetJy(const Jy: Double);
    function GetJz: Double;
    procedure SetJz(const Jz: Double);
    function GetJw: Double;
    procedure SetJw(const Jw: Double);
  public
    property IsJulia: Boolean read GetIsJulia write SetIsJulia;
    property Jx: Double read GetJx write SetJx;
    property Jy: Double read GetJy write SetJy;
    property Jz: Double read GetJz write SetJz;
    property Jw: Double read GetJw write SetJw;
  end;
//------------------------------------------------------------------------------
  TMB3DParamsFacade = class
  private
    FUUID: String;
    FCore: TMB3DCoreFacade;
    FIterations: TMB3DIterationsFacade;
    FJuliaMode: TMB3DJuliaModeFacade;
    FFormulas: TList;
    function GetFormula(Index: Integer): TMB3DFormulaFacade;
    function GetFormulaCount: Integer;
  public
    constructor Create(const Header: TMandHeader10; const HAddOn: THeaderCustomAddon);
    destructor Destroy;override;
    function Clone: TMB3DParamsFacade;
    property Core: TMB3DCoreFacade read FCore;
    property Formulas[Index: Integer]: TMB3DFormulaFacade read GetFormula;
    property FormulaCount: Integer read GetFormulaCount;
    property JuliaMode: TMB3DJuliaModeFacade read FJuliaMode write FJuliaMode;
    property Iterations: TMB3DIterationsFacade read FIterations;
    property UUID: String read FUUID write FUUID;
  end;
//------------------------------------------------------------------------------
{$ENDREGION '========================================================================== > | FACADE'}

{$REGION '============================================================================= > | FORMULA'}

{FORMULA} //-?? MutaGen TMutaGenFrm  MutaGenFrm TMutation     TFormulaName  .. wont debug???

  TFormulaCategory = (fc_3D, fc_3Da, fc_4D, fc_4Da, fc_Ads, fc_dIFS, fc_dIFSa);

  TFilterUnderscore = (fuIgnore, fuWithUnderscore, fuWithoutUnderscore);

  TFormulaName=class
  private            // added for debug
    FCategory: TFormulaCategory;
    FFormulaName: String;
  public
    constructor Create(const Category: TFormulaCategory;const FormulaName: String);
    property Category: TFormulaCategory read FCategory;
    property FormulaName: String read FFormulaName;
  end;

  TFormulaNames = class
  private
    FFormulaNamesList: TList;
    function GetCount: Integer;
    function FNameIsIncluded(Name: String): Boolean;
    function GetFormulaName(Index: Integer): TFormulaName;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddFormulaName(Category: TFormulaCategory; const FormulaName: String);
    function GetFormulaNamesByCategory(const Category: TFormulaCategory): TStringList;
    function GetCategoryByFormulaName(const FormulaName: String): TFormulaCategory;
    property Count: Integer read GetCount;
    property Formulas[Index: Integer]: TFormulaName read GetFormulaName;
  end;

  TFormulaNamesLoader=class
  private
    class procedure AddFormulaName(FNames: TFormulaNames; FName: String; DEfunc: Integer);
  public
    class function GetFavouriteStatus(formulaname: String): Integer;  //-2: hide, -1: dislike, 0: normal, 1: like
    class function LoadFormulas: TFormulaNames;
  end;

{$ENDREGION '========================================================================== > | FORMULA'}

{$REGION '============================================================================= > | MUTAGEN'}
{MUTAGEN}
  TMutationIndex = (
    miP_1, miP_1_1, miP_1_1_1, miP_1_1_1_1, miP_1_1_1_2, miP_1_1_2,
    miP_1_1_2_1, miP_1_1_2_2, miP_1_2, miP_1_2_1, miP_1_2_1_1,
    miP_1_2_1_2, miP_1_2_2, miP_1_2_2_1, miP_1_2_2_2);

  TMutaGenPanel=class
  private
    FParentPanel: TMutaGenPanel;
    FXPos, FYPos: Double;
    FXSize, FYSize: Double;
    FCaption: String;
    FPanel: TPanel;
    FImage: TImage;
    FMutationIndex: TMutationIndex;
    function GetImageWidth: Integer;
    function GetImageHeight: Integer;
    procedure SetBitmap(const Image: TBitmap);
  public
    constructor Create(ParentPanel: TMutaGenPanel;const MutationIndex: TMutationIndex;const XPos, YPos, XSize, YSize: Double;const Caption: String;const Panel: TPanel;const Image: TImage);
    property ImageWidth: Integer read GetImageWidth;
    property ImageHeight: Integer read GetImageHeight;
    property ParentPanel: TMutaGenPanel read FParentPanel;
    property Caption: String read FCaption;
    property Bitmap: TBitMap write SetBitmap;
    property Panel: TPanel read FPanel;
    property Image: TImage read FImage;
    property MutationIndex: TMutationIndex read FMutationIndex;
  end;

  TPanelOrientation = (poLeft, poRight, poTop, poBottom);

  TPanelPosition=class
  private
    FPanel: TMutaGenPanel;
    FXPos, FYPos: Double;
    FOrientation: TPanelOrientation;
  public
    constructor Create(const Panel: TMutaGenPanel;const XPos, YPos: Double; const Orientation: TPanelOrientation);
    property Orientation: TPanelOrientation read FOrientation;
  end;

  TPanelLink=class
  private
    FFromPanel, FToPanel: TPanelPosition;
  public
    constructor Create(FromPanel, ToPanel: TPanelPosition);
    destructor Destroy;override;
  end;

  TPanelLinkLine=class
  private
    FX1, FY1, FX2, FY2: Integer;
  public
    constructor Create(X1, Y1, X2, Y2: Integer);
    procedure Draw(Canvas: TCanvas);
  end;

  TMutaGenPanelList=class
  private
    FRootPanel: TPanel;
    FXSize, FYSize: Double;
    FPanels: TList;
    FPanelIdxList: TStringList;
    FPanelLinkList: TList;
    FLinkLinesList: TList;
    function GetPanelPath(const Panel: TMutaGenPanel): String;
    function GetCount: Integer;
  public
    constructor Create(const RootPanel: TPanel; const XSize, YSize: Double);
    destructor Destroy;override;
    procedure AddPanel(const Panel: TMutaGenPanel);
    procedure AddPanelLink(const FromX, FromY: Double; const FromOrientation: TPanelOrientation; const FromPanel: TMutaGenPanel; const ToX, ToY: Double; const ToOrientation: TPanelOrientation;const ToPanel: TMutaGenPanel);
    function GetPanel(const Index: Integer): TMutaGenPanel;overload;
    function GetPanel(const Path: String): TMutaGenPanel;overload;
    procedure DoLayout;
    property LinkLinesList: TList read FLinkLinesList;
    property Count: Integer read GetCount;
  end;

  TRandGen = class
  public
    function NextRandomDouble: Double;overload;
    function NextRandomInt(const MaxValue: Integer): Integer;overload;
  end;

  TMutationConfig = class
  private
    FModifyFormulaWeight: Double;
    FModifyParamsWeight: Double;
    FModifyParamsStrength: Double;
    FModifyJuliaModeWeight: Double;
    FModifyJuliaModeStrength: Double;
    FModifyIterationCountWeight: Double;
    FModifyIterationCountStrength: Double;
    FProbing: Boolean;
    FProbingWidth: Integer;
    FProbingHeight: Integer;
    FProbingMaxCount: Integer;
    FProbingMinCoverage: Double;
    FProbingMinDifference: Double;
  public
    constructor Create;
    property ModifyFormulaWeight: Double read FModifyFormulaWeight write FModifyFormulaWeight;
    property ModifyParamsWeight: Double read FModifyParamsWeight write FModifyParamsWeight;
    property ModifyParamsStrength: Double read FModifyParamsStrength write FModifyParamsStrength;
    property ModifyJuliaModeWeight: Double read FModifyJuliaModeWeight write FModifyJuliaModeWeight;
    property ModifyJuliaModeStrength: Double read FModifyJuliaModeStrength write FModifyJuliaModeStrength;
    property ModifyIterationCountWeight: Double read FModifyIterationCountWeight write FModifyIterationCountWeight;
    property ModifyIterationCountStrength: Double read FModifyIterationCountStrength write FModifyIterationCountStrength;
    property Probing: Boolean read FProbing;
    property ProbingWidth: Integer read FProbingWidth;
    property ProbingHeight: Integer read FProbingHeight;
    property ProbingMaxCount: Integer read FProbingMaxCount;
    property ProbingMinCoverage: Double read FProbingMinCoverage;
    property ProbingMinDifference: Double read FProbingMinDifference;
  end;

  TMutationCreator = class
  public
    class function CreateMutations(const Config: TMutationConfig ): TList;
  end;
//1st mb3dfacade
  TMutationParams = class
  private
    FParams: TMB3DParamsFacade;
    FBitmap: TBitmap;
    FProbingBitmap: TBitmap;
    procedure SetBitmap(const Bitmap: TBitmap);
    procedure SetProbingBitmap(const ProbingBitmap: TBitmap);
  public
    destructor Destroy; override;
    property Params: TMB3DParamsFacade read FParams write FParams;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property ProbingBitmap: TBitmap read FProbingBitmap write SetProbingBitmap;
  end;

  TMutationParamsSet = class
  private
    FParams: Array [Low(TMutationIndex)..High(TMutationIndex)] of TMutationParams;
    function GetParam(Index: TMutationIndex): TMutationParams;
    procedure SetParam(Index: TMutationIndex; const Param: TMutationParams);
  public
    constructor Create;
    destructor Destroy;override;
    property Params[Index: TMutationIndex]: TMutationParams read GetParam write SetParam;
  end;

  TMutationCoverage = class
  private
    class function CalcFilteredCoverage24(const Bitmap: TBitmap): Double;
    class function CalcFilteredCoverage32(const Bitmap: TBitmap): Double;
    class function CreateFilteredImage24(const Bitmap: TBitmap): TBitmap;
    class function CreateFilteredImage32(const Bitmap: TBitmap): TBitmap;
  public
    class function CalcCoverage(const Bitmap: TBitmap): Double;
    class function CalcDiffCoverage(const Bitmap1, Bitmap2: TBitmap): Double;
    class function CalcFilteredCoverage(const Bitmap: TBitmap): Double;
    class function CreateFilteredImage(const Bitmap: TBitmap): TBitmap;
  end;

  TProbedParams = class
  private
    FParams: TMB3DParamsFacade;
    FProbingBitmap: TBitmap;
    FCoverage: Double;
    FDiffCoverage: Double;
  public
    constructor Create(const Params: TMB3DParamsFacade; const Coverage, DiffCoverage: Double; const ProbingBitmap: TBitmap);
    destructor Destroy;override;
    function ExtractParams: TMB3DParamsFacade;
    function ExtractProbingBitmap: TBitmap;
    property Coverage: Double read FCoverage;
    property DiffCoverage: Double read FDiffCoverage;
  end;

  TProbedParamsList = class
  private
    FConfig: TMutationConfig;
    FInvalidParams: TList;
    FValidParams: TList;
  public
    constructor Create(Config: TMutationConfig);
    destructor Destroy;override;
    procedure AddProbedParam(const Params: TProbedParams);
    function GetBestValidParam: TProbedParams;
    function GetBestInvalidParam: TProbedParams;
  end;

  TMutation = class
  private
    function GetNonEmptyFormulas(const Params: TMB3DParamsFacade): TStringList;
    function GetNonEmptyFormulaCount(const Params: TMB3DParamsFacade): Integer;
    function GetNonEmptyFormulasByCategory(const Params: TMB3DParamsFacade; const Category: TFormulaCategory): TStringList;
    function GetNonEmptyFormulasWithParams(const Params: TMB3DParamsFacade): TStringList;
  protected
    function ChooseRandomFormula(const Params: TMB3DParamsFacade; const OnlyFormulasWithParams: Boolean): TMB3DFormulaFacade;
    procedure RandomizeParamValue(Param: TMB3DParamFacade; const Strength: Double);
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;virtual;abstract;
  end;

  TScalableMutation = class(TMutation)
  private
    FStrength: Double;
  public
    constructor Create;
    property Strength: Double read FStrength write FStrength;
  end;

  TModifySingleParamMutation = class(TScalableMutation)
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;override;
  end;

  TAddFormulaMutation = class(TMutation)
  private
    function HasFormulaOfCategory(const Params: TMB3DParamsFacade; const Category: TFormulaCategory): Boolean;
    function GuessFormulaCategory(const FormulaIndex: Integer;const Params: TMB3DParamsFacade): TFormulaCategory;
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;override;
  end;

  TReplaceFormulaMutation = class(TMutation)
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;override;
  end;

  TRemoveFormulaMutation = class(TMutation)
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;override;
  end;

  TModifyJuliaModeMutation = class(TScalableMutation)
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;override;
  end;

  TModifyIterationCountMutation = class(TScalableMutation)
  public
    function MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;override;
  end;

{$ENDREGION '========================================================================== > | MUTAGEN'}

{$REGION '============================================================================= > | RENDERER'}
{RENDERER}
  TPreviewRenderer = class
  private
    CalcThreadStats: TCalcThreadStats;
    iActiveThreads: Integer;
    siLight5: array of TsiLight5;
    HeaderLightVals: TLightVals;
    aFSIstart: Integer;
    aFSIoffset: Integer;
    Converted: LongBool;
    bCalcStop: LongBool;
    FMB3DParamsFacade: TMB3DParamsFacade;
    FProgress: Double;
    FBlankBackground: Boolean;
  protected
  public
    constructor Create(const MB3DParamsFacade: TMB3DParamsFacade);
    destructor Destroy; override;
    procedure RenderPreview(var bmp: TBitmap; maxWidth, maxHeight: Integer; bHistory: TCheckBox; sGen: String);
    procedure SignalCancel;
    property Progress: Double read FProgress;
    property BlankBackground: Boolean read FBlankBackground write FBlankBackground;
  end;

{$ENDREGION '========================================================================== > | RENDERER'}

{$REGION '============================================================================= > | FORM'}
{MAIN}
  TCategoryPanel = class(Vcl.ExtCtrls.TCategoryPanel)
{$REGION '============================================================================= > | protected'}
  protected
    procedure DrawCollapsedPanel(ACanvas: TCanvas); override;

{$ENDREGION '========================================================================== > | protected'}
  end;

  TfTEST = class(TForm)

{$REGION '============================================================================= > | controls'}
    Panel1: TPanel;
    MainPnl: TPanel;
    Panel_1: TPanel;
    Image_1: TImage;
    Panel_1_2: TPanel;
    Image_1_2: TImage;
    Panel_1_1: TPanel;
    Image_1_1: TImage;
    Panel_1_2_2: TPanel;
    Image_1_2_2: TImage;
    Panel_1_2_1: TPanel;
    Image_1_2_1: TImage;
    Panel_1_1_2: TPanel;
    Image_1_1_2: TImage;
    Panel_1_1_1: TPanel;
    Image_1_1_1: TImage;
    Panel_1_2_2_2: TPanel;
    Image_1_2_2_2: TImage;
    Panel_1_2_2_1: TPanel;
    Image_1_2_2_1: TImage;
    Panel_1_1_2_2: TPanel;
    Image_1_1_2_2: TImage;
    Panel_1_1_2_1: TPanel;
    Image_1_1_2_1: TImage;
    Panel_1_1_1_1: TPanel;
    Image_1_1_1_1: TImage;
    Panel_1_1_1_2: TPanel;
    Image_1_1_1_2: TImage;
    Panel_1_2_1_2: TPanel;
    Image_1_2_1_2: TImage;
    Panel_1_2_1_1: TPanel;
    Image_1_2_1_1: TImage;
    PopupMenuMutaGen: TPopupMenu;
    SendtoMainItm: TMenuItem;
    ToClipboardItm: TMenuItem;
    GenerationsGrp: TJvGroupBox;
    Panel9: TPanel;
    GenerationBtn: TUpDown;
    ClearPrevGenerations: TButton;
    MutateGrp: TJvGroupBox;
    Panel8: TPanel;
    ProgressBar: TProgressBar;
    MutateBtn: TButton;
    OptionsGrp: TJvGroupBox;
    Panel7: TPanel;
    Panel5: TPanel;
    DisableAllBtn: TButton;
    GridPanel2: TGridPanel;
    MinIterLabel: TLabel;
    ModifyFormulaWeightTBar: TTrackBarEx;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    ModifyParamsWeightTBar: TTrackBarEx;
    ModifyParamsStrengthTBar: TTrackBarEx;
    Label9: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    ModifyJuliaModeWeightTBar: TTrackBarEx;
    ModifyJuliaModeStrengthTBar: TTrackBarEx;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    ModifyIterationCountWeightTBar: TTrackBarEx;
    ModifyIterationCountStrengthTBar: TTrackBarEx;
    GenerationEdit: TEdit;
    cb_history: TCheckBox;
    cb_probing: TCheckBox;
    lbl_gen: TLabel;
    procedure cb_historyClick(Sender: TObject);
    procedure MutateBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MainPnlResize(Sender: TObject);
    procedure Panel_1DblClick(Sender: TObject);
    procedure SendtoMainItmClick(Sender: TObject);
    procedure DisableAllBtnClick(Sender: TObject);
    procedure ToClipboardItmClick(Sender: TObject);
    procedure ClearPrevGenerationsClick(Sender: TObject);
    procedure GenerationBtnClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

{$ENDREGION '========================================================================== > | controls'}

{$REGION '============================================================================= > | private'}
  private
    FForceAbort: Boolean;
    FIsRunning: Boolean;
    FPanelList: TMutaGenPanelList;
    FP_1, FP_1_1, FP_1_1_1, FP_1_1_1_1, FP_1_1_1_2, FP_1_1_2, FP_1_1_2_1, FP_1_1_2_2, FP_1_2, FP_1_2_1, FP_1_2_1_1, FP_1_2_1_2, FP_1_2_2, FP_1_2_2_1, FP_1_2_2_2: TMutaGenPanel;
    FMutationHistory: TList;
    FCurrGenerationIndex: Integer;
    FPreviewImageRenderer: TPreviewRenderer;
    FProbingImageRenderer: TPreviewRenderer;
    function CreatePanelList: TMutaGenPanelList;
    procedure InitProgress;
    procedure RefreshMutateButtonCaption;
    procedure ProgressStep;
    function CreatePreviewImage(const Panel: TMutaGenPanel; const Params: TMB3DParamsFacade): TBitmap;
    function CreateProbingImage(Config: TMutationConfig; const Params: TMB3DParamsFacade): TBitmap;
    function CreateParamsCaption(const Params: TMB3DParamsFacade): String;
    function CreateMutationConfig: TMutationConfig;
    function MutateParams(Config: TMutationConfig;const Params: TMB3DParamsFacade): TMB3DParamsFacade;
    procedure InitOptionsPanel;
    procedure RefreshGenerationLabel;
    function GetInitialParams(Sender: TObject): TMutationParams;
    function AddGeneration: TMutationParamsSet;
    function CloneBitmap(const Src: TBitmap): TBitmap;
    procedure ReDisplayCurrGeneration;
    function CreateBlankBitmap(const Width, Height: Integer): TBitmap;
    procedure EnableControls;
    procedure SignalCancel;

{$ENDREGION '========================================================================== > | private'}

{$REGION '============================================================================= > | public'}
  public
    procedure RestartFromMain;
    procedure ClearPanels;
    procedure CreateInitialSet;
    procedure CreateMutation(Sender: TObject);

{$ENDREGION '========================================================================== > | public'}

{$ENDREGION '========================================================================== > | FORM'}

end;

{$ENDREGION '========================================================================== > | TYPES'}

{$REGION '============================================================================= > | VARIABLES'}
var
  fTEST: TfTEST;
  RandGen: TRandGen;//MutaGen
{ ---------------------------- AllFormulaNames ------------------------------- }
  AllFormulaNames: TFormulaNames;

{$ENDREGION '========================================================================== > | VARIABLES'}

{$REGION '============================================================================= > | CONSTANTS'}
const
  Epsilon = 1.0e-8;
  TBAR_SCALE = 1000.0;//MutaGen
  FORMULA_PARAM_COUNT = 16;//facade
  InternFormulasDEfunc: array[0..6] of Integer = (0,0,4,0,11,0,0);//FormulaNames

{$ENDREGION '========================================================================== > | CONSTANTS'}

implementation

{$R *.dfm}

{$REGION '============================================================================= > | FACADE'}
{FACADE}
{$REGION '============================================================================= > | TMB3DParamFacade'}
{ ---------------------------- TMB3DParamFacade ------------------------------ }
constructor TMB3DParamFacade.Create(const ParamIndex: Integer;const Owner: TMB3DFormulaFacade);
begin
  inherited Create;
  FParamIndex := ParamIndex;
  FOwner := Owner;
end;

function TMB3DParamFacade.GetName: String;
begin
  with FOwner.FOwner.Core.PHeader^ do begin
    Result := PTCustomFormula(PHCustomF[FOwner.FFormulaIndex]).sOptionStrings[FParamIndex];
  end;
end;

function TMB3DParamFacade.GetDatatype: TMB3DParamType;
begin
  with FOwner.FOwner.Core.PHeader^ do begin
    if CustomFormulas.isIntType(PTCustomFormula(PHCustomF[FOwner.FFormulaIndex]).byOptionTypes[FParamIndex]) then
      Result := ptInteger
    else
      Result := ptFloat;
    end;
end;

function TMB3DParamFacade.GetValue: Double;
begin
  with FOwner.FOwner.Core.PHAddon^ do begin
    Result := Formulas[FOwner.FFormulaIndex].dOptionValue[FParamIndex];
  end;
end;

procedure TMB3DParamFacade.SetValue(const Value: Double);
begin
  with FOwner.FOwner.Core.PHAddon^ do begin
    if Datatype = ptInteger then
      Formulas[FOwner.FFormulaIndex].dOptionValue[FParamIndex] := Round(Value)
    else
      Formulas[FOwner.FFormulaIndex].dOptionValue[FParamIndex] := Value;
  end;
end;
{$ENDREGION '========================================================================== > | TMB3DParamFacade'}
{$REGION '============================================================================= > | TMB3DFormulaFacade'}
{ --------------------------- TMB3DFormulaFacade ----------------------------- }
constructor TMB3DFormulaFacade.Create(const FormulaIndex: Integer;const Owner: TMB3DParamsFacade);
var
  I: Integer;
begin
  inherited Create;
  FFormulaIndex := FormulaIndex;
  FOwner := Owner;
  FParams:=TObjectList.Create;
  for I := 0 to FORMULA_PARAM_COUNT - 1  do
    FParams.Add(TMB3DParamFacade.Create(I, Self));
end;

destructor TMB3DFormulaFacade.Destroy;
begin
  FParams.Free;
  inherited Destroy;
end;

function TMB3DFormulaFacade.GetFormulaName: String;
begin
  Result := CustomFtoStr(FOwner.Core.PHAddon^.Formulas[FFormulaIndex].CustomFname);
end;

procedure TMB3DFormulaFacade.SetFormulaName(const FormulaName: String);
var
  sName: String;
  InternIndex: Integer;
  success: Boolean;
  f: PTHAformula;
  cFormula: TFormulaClass;
begin
  sName := Trim(FormulaName);
  success := False;
  if sName<>'' then begin
    if isInternFormula(sName, InternIndex) then begin
      cFormula.GetHAddOnFromInternFormula(FOwner.Core.PHeader, InternIndex, FFormulaIndex);
      success := True;
    end
    else begin
      f := @FOwner.Core.PHAddon^.Formulas[FFormulaIndex];
      PutStringInCustomF(f^.CustomFname, sName);
      if LoadCustomFormulaFromHeader(f^.CustomFname,
        PTCustomFormula(FOwner.Core.PHeader^.PHCustomF[FFormulaIndex])^,
        f^.dOptionValue) then begin
//        if TabControl2.TabIndex <> 1 then
          if f^.iItCount < 1 then
            f^.iItCount := 1;
          CopyTypeAndOptionFromCFtoHAddon(FOwner.Core.PHeader^.PHCustomF[FFormulaIndex],
            FOwner.Core.PHAddon, FFormulaIndex);
          success := True;
          f^.iFnr := 20;    //for backward compatibilty reason
//        end;

      end;
    end;
  end;
  if not success then Clear
//  else begin
//    if FOwner.Core.HAddon.Formulas[FFormulaIndex].iItCount < 1 then
//      FOwner.Core.HAddon.Formulas[FFormulaIndex].iItCount := 1;
//    TabControl1Change(Self);
//    CalcRstop;
//    Check4DandInfo;
//  end;
end;


function TMB3DFormulaFacade.GetParamCount: Integer;
begin
  Result := FOwner.Core.PHAddon^.Formulas[FFormulaIndex].iOptionCount;
end;

procedure TMB3DFormulaFacade.Clear;
begin
  with FOwner.Core.PHAddOn^.Formulas[FFormulaIndex] do begin
    iItCount := 0;
    iFnr := -1;
    iOptionCount := 0;
    CustomFname[0] := 0;
  end;
end;

function TMB3DFormulaFacade.IsEmpty: Boolean;
begin
  Result := FOwner.Core.PHAddOn^.Formulas[FFormulaIndex].iItCount = 0;
end;

function TMB3DFormulaFacade.GetParam(Index: Integer): TMB3DParamFacade;
begin
  if (Index < 0) or (Index >= FParams.Count) then
    raise Exception.Create('TMB3DFormulaFacade.GetParam: Invalid param index <'+IntToStr(Index)+'>');
  Result := TMB3DParamFacade(FParams[Index]);
end;

procedure TMB3DFormulaFacade.SetIterationCount(const IterationCount: Integer);
begin
  with FOwner.Core.PHAddOn^.Formulas[FFormulaIndex] do begin
    iItCount := IterationCount;
  end;
end;

function TMB3DFormulaFacade.GetIterationCount: Integer;
begin
  Result := FOwner.Core.PHAddOn^.Formulas[FFormulaIndex].iItCount;
end;
{$ENDREGION '========================================================================== > | TMB3DFormulaFacade'}
{$REGION '============================================================================= > | TMB3DCoreFacade'}
{ ----------------------------- TMB3DCoreFacade ------------------------------ }
constructor TMB3DCoreFacade.Create(const Header: TMandHeader10; const HAddOn: THeaderCustomAddon);
var
  I: Integer;
begin
  inherited Create;
  FastMove(Header, FHeader, SizeOf(TMandHeader10));
  FHeader.PCFAddon := @FHAddOn;
  FastMove(HAddOn, FHeader.PCFAddon^, SizeOf(THeaderCustomAddon));
  for i := 0 to 5 - 1 do
    FHeader.PHCustomF[i] := @FHybridCustoms[i];
  IniCFsFromHAddon(FHeader.PCFAddon, Header.PHCustomF);
//  PTHeaderCustomAddon(FHeader.PCFAddon)^.bHCAversion := 16;
//  StoreHistoryParsMutagen(FHeader);
end;

destructor TMB3DCoreFacade.Destroy;
var
  i: Integer;
begin
  for i := 0 to 5 do
    FreeCF(@FHybridCustoms[i]);
  inherited Destroy;
end;

procedure TMB3DCoreFacade.ApplyToCore(DestHeader: TMandHeader10; DestHAddOn: THeaderCustomAddon);
var
  AddOn: Pointer;
begin
  AddOn := DestHeader.PCFAddon;
  FastMove(FHeader, DestHeader, SizeOf(TMandHeader10));
  DestHeader.PCFAddon := AddOn;
  FastMove(FHAddOn, DestHeader.PCFAddon^, SizeOf(THeaderCustomAddon));
end;

function TMB3DCoreFacade.GetHeaderPointer: TPMandHeader10;
begin
  Result := @FHeader;
end;

function TMB3DCoreFacade.GetHAddonPointer: PTHeaderCustomAddon;
begin
  Result := @FHAddOn;
end;
{$ENDREGION '========================================================================== > | TMB3DCoreFacade'}
{$REGION '============================================================================= > | TMB3DParamsFacade'}
{ ---------------------------- TMB3DParamsFacade ----------------------------- }
constructor TMB3DParamsFacade.Create(const Header: TMandHeader10;const HAddOn: THeaderCustomAddon);
var
  I: Integer;
  NewGUID: TGUID;

  function GUIDToShortString(const Guid: TGUID): string;
  begin
    SetLength(Result, 32);
    StrLFmt(PChar(Result), 32,'%.8x%.4x%.4x%.4x%',
      [Guid.D1, Guid.D2, Guid.D3, Integer(Guid.D4[0])+Integer(Guid.D4[1])+Integer(Guid.D4[2])+Integer(Guid.D4[3])+Integer(Guid.D4[4])+Integer(Guid.D4[5])+Integer(Guid.D4[6])+Integer(Guid.D4[7])]);
  end;

begin
  inherited Create;
  FCore := TMB3DCoreFacade.Create(Header, HAddOn);
  FFormulas:=TObjectList.Create;
  for I := 0 to 5 do
    FFormulas.Add(TMB3DFormulaFacade.Create(I, Self));
  FIterations := TMB3DIterationsFacade.Create(Self);
  FJuliaMode := TMB3DJuliaModeFacade.Create(Self);
  CreateGUID(NewGUID);
  FUUID := GUIDToShortString(NewGUID);
end;

destructor TMB3DParamsFacade.Destroy;
begin
  FJuliaMode.Free;
  FIterations.Free;
  FFormulas.Free;
  FCore.Free;
  inherited Destroy;
end;

function TMB3DParamsFacade.GetFormula(Index: Integer): TMB3DFormulaFacade;
begin
  if (Index < 0) or (Index >= FFormulas.Count) then
    raise Exception.Create('TMB3DParamsFacade.GetFormula: Invalid formula index <'+IntToStr(Index)+'>');
  Result := TMB3DFormulaFacade(FFormulas[Index]);
end;

function TMB3DParamsFacade.Clone: TMB3DParamsFacade;
begin
  Result := TMB3DParamsFacade.Create( Core.PHeader^, Core.PHAddOn^ );
end;

function TMB3DParamsFacade.GetFormulaCount: Integer;
begin
  Result := FFormulas.Count;
end;
{$ENDREGION '========================================================================== > | TMB3DParamsFacade'}
{$REGION '============================================================================= > | TMB3DRootFacade'}
{ ------------------------------ TMB3DRootFacade ----------------------------- }
constructor TMB3DRootFacade.Create(const Owner: TMB3DParamsFacade);
begin
  inherited Create;
  FOwner := Owner;
end;
{$ENDREGION '========================================================================== > | TMB3DRootFacade'}
{$REGION '============================================================================= > | TMB3DIterationsFacade'}
{ -------------------------- TMB3DIterationsFacade --------------------------- }
function TMB3DIterationsFacade.GetMinIterations: Integer;
begin
  Result := FOwner.Core.PHeader^.MinimumIterations;
end;

procedure TMB3DIterationsFacade.SetMinIterations(const MinIterations: Integer);
begin
   FOwner.Core.PHeader^.MinimumIterations := MinIterations;
end;

function TMB3DIterationsFacade.GetIterations: Integer;
begin
  Result := FOwner.Core.PHeader^.Iterations;
end;

procedure TMB3DIterationsFacade.SetIterations(const Iterations: Integer);
begin
  FOwner.Core.PHeader^.Iterations := Iterations;
end;

function TMB3DIterationsFacade.GetRBailout: Double;
begin
  Result := FOwner.Core.PHeader^.RStop;
end;

procedure TMB3DIterationsFacade.SetRBailout(const RBailout: Double);
begin
  FOwner.Core.PHeader^.RStop := RBailout;
end;
{$ENDREGION '========================================================================== > | TMB3DIterationsFacade'}
{$REGION '============================================================================= > | TMB3DJuliaModeFacade'}
{ --------------------------- TMB3DJuliaModeFacade --------------------------- }
function TMB3DJuliaModeFacade.GetIsJulia: Boolean;
begin
  Result := FOwner.Core.PHeader^.bIsJulia > 0;
end;

procedure TMB3DJuliaModeFacade.SetIsJulia(const IsJulia: Boolean);
begin
  FOwner.Core.PHeader^.bIsJulia := Byte(Ord(IsJulia));
end;

function TMB3DJuliaModeFacade.GetJx: Double;
begin
  Result := FOwner.Core.PHeader^.dJx;
end;

procedure TMB3DJuliaModeFacade.SetJx(const Jx: Double);
begin
  FOwner.Core.PHeader^.dJx := Jx;
end;

function TMB3DJuliaModeFacade.GetJy: Double;
begin
  Result := FOwner.Core.PHeader^.dJy;
end;

procedure TMB3DJuliaModeFacade.SetJy(const Jy: Double);
begin
  FOwner.Core.PHeader^.dJy := Jy;
end;

function TMB3DJuliaModeFacade.GetJz: Double;
begin
  Result := FOwner.Core.PHeader^.dJz;
end;

procedure TMB3DJuliaModeFacade.SetJz(const Jz: Double);
begin
  FOwner.Core.PHeader^.dJz := Jz;
end;

function TMB3DJuliaModeFacade.GetJw: Double;
begin
  Result := FOwner.Core.PHeader^.dJw;
end;

procedure TMB3DJuliaModeFacade.SetJw(const Jw: Double);
begin
  FOwner.Core.PHeader^.dJw := Jw;
end;
{$ENDREGION '========================================================================== > | TMB3DJuliaModeFacade'}

{$ENDREGION '========================================================================== > | FACADE'}

{$REGION '============================================================================= > | FORMULA'}
{FORMULA}
{$REGION '============================================================================= > | TFormulaName'}
{ ----------------------------- TFormulaName --------------------------------- }
constructor TFormulaName.Create(const Category: TFormulaCategory;const FormulaName: String);
begin
  inherited Create;
  FCategory := Category;
  FFormulaName := FormulaName;
end;
{$ENDREGION '========================================================================== > | TFormulaName'}
{$REGION '============================================================================= > | TFormulaNames'}
{ ----------------------------- TFormulaNames -------------------------------- }
constructor TFormulaNames.Create;
begin
  inherited Create;
  FFormulaNamesList := TObjectList.Create;
end;

destructor TFormulaNames.Destroy;
begin
  FFormulaNamesList.Free;
  inherited Destroy;
end;

function TFormulaNames.GetCount: Integer;
begin
  Result := FFormulaNamesList.Count;
end;

function TFormulaNames.FNameIsIncluded(Name: String): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to FFormulaNamesList.Count - 1 do begin
    if CompareText(Trim(Name), StrLastWords( TFormulaName(FFormulaNamesList[I]).FormulaName  )) = 0 then begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TFormulaNames.AddFormulaName(Category: TFormulaCategory; const FormulaName: String);
begin
  FFormulaNamesList.Add( TFormulaName.Create(Category, FormulaName) );
end;

function TFormulaNames.GetFormulaName(Index: Integer): TFormulaName;
begin
  Result := TFormulaName(FFormulaNamesList[Index]);
end;
// TODO Caching
function TFormulaNames.GetFormulaNamesByCategory(const Category: TFormulaCategory): TStringList;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := 0 to Count-1 do begin
    if Formulas[I].Category = Category then
      Result.Add(Formulas[I].FormulaName);
  end;
end;

function TFormulaNames.GetCategoryByFormulaName(const FormulaName: String): TFormulaCategory;
var
  I: Integer;
begin
  for I := 0 to Count-1 do begin
    if Formulas[I].FormulaName = FormulaName then begin
      Result := Formulas[I].Category;
      exit;
    end;
  end;
  raise Exception.Create('TFormulaNames.GetCategoryByFormulaName: Formula <'+FormulaName+'> not found');
end;
{$ENDREGION '========================================================================== > | TFormulaNames'}
{$REGION '============================================================================= > | TFormulaNamesLoader'}
{ -------------------------- TFormulaNamesLoader ----------------------------- }
class function TFormulaNamesLoader.GetFavouriteStatus(formulaname: String): Integer;  //-2: hide, -1: dislike, 0: normal, 1: like
var M: TStringList;
    i: Integer;
 //   bNotFound: LongBool;
begin
    Result := 1;
   // if (formulaname = '') or not FileExists(AppDataDir + IncludeTrailingPathDelimiter('Formulas') + 'FavouriteList.txt') then Exit;
    if (formulaname = '') or not FileExists(IncludeTrailingPathDelimiter(IniDirs[3]) + 'FavouriteList.txt') then Exit;
    M := TStringList.Create;
    try
   //   M.LoadFromFile(AppDataDir + IncludeTrailingPathDelimiter('Formulas') + 'FavouriteList.txt');
      M.LoadFromFile(IncludeTrailingPathDelimiter(IniDirs[3]) + 'FavouriteList.txt');
    except
      M.Clear;
    end;
//    bNotFound := True;
    for i := 1 to M.Count do
      if SameText(StrLastWords(M.Strings[i - 1]), formulaname) then
      begin
        Result := StrToInt(StrFirstWord(M.Strings[i - 1]));
        Break;
      end;
    M.Clear;
    M.Free;
end;

class procedure TFormulaNamesLoader.AddFormulaName(FNames: TFormulaNames;FName: String; DEfunc: Integer);
var
  stat: Integer;
begin
  stat := GetFavouriteStatus(FName);
  if stat > -2 then begin
    //FName := IntToStr(stat) + ' ' + FName;
    case DEfunc of
      2,11: FNames.AddFormulaName(fc_3Da, FName);
         4: FNames.AddFormulaName(fc_4D, FName);
       5,6: FNames.AddFormulaName(fc_4Da, FName);
     -1,-2: FNames.AddFormulaName(fc_Ads, FName);
        20: FNames.AddFormulaName(fc_dIFS, FName);
    21..22: FNames.AddFormulaName(fc_dIFSa, FName);
      else  // 3D
        FNames.AddFormulaName(fc_3D, FName);
    end;
  end;
end;

class function TFormulaNamesLoader.LoadFormulas: TFormulaNames;
var
  I: Integer;
  sdir, s2, se, s3: String;
  df: Integer;
  sr: TSearchRec;
  b: LongBool;
begin
  Result := TFormulaNames.Create;
  try
    for I := 0 to 6 do
      AddFormulaName(Result, InternFormulaNames[i], InternFormulasDEfunc[i]);
    AddFormulaName(Result, 'Aexion C', 0);
    s2 := '';
    sdir := IncludeTrailingPathDelimiter(IniDirs[3]);
    if FindFirst(sdir + '*.m3f', 0, sr) = 0 then
    repeat
      se := ChangeFileExt(sr.Name, '');
      s3 := UpperCase(se);
      b := (s3 <> 'TRAFASSELQUAT') or not CanLoadF('CommQuat');
      b := b and ((s3 <> '_FLIPXY') or not CanLoadF('_FlipXYc'));
      b := b and ((s3 <> '_FLIPXZ') or not CanLoadF('_FlipXZc'));
      b := b and ((s3 <> '_FLIPYZ') or not CanLoadF('_FlipYZc'));
      b := b and ((s3 <> 'ABOXMODKALIFIXED') or not CanLoadF('ABoxModKali'));
      b := b and (s3 <> 'SQKOCH') and (s3 <> 'DJD-QUAT') and (s3 <> '_IFS-TESS');
      if b and CanLoadCustomFormula(sdir + sr.Name, df) and
        (not Result.FNameIsIncluded(se)) then AddFormulaName(Result, se, df);
    until FindNext(sr) <> 0;
    FindClose(sr);
    s2 := sdir;
  except
    Result.Free;
    raise;
  end;
end;
{$ENDREGION '========================================================================== > | TFormulaNamesLoader'}

{$ENDREGION '========================================================================== > | FORMULA'}

{$REGION '============================================================================= > | MUTAGEN'}
{MUTAGEN}
{$REGION '============================================================================= > | AllFormulaNames'}
function GetAllFormulaNames: TFormulaNames;
begin
  if AllFormulaNames = nil then
    AllFormulaNames := TFormulaNamesLoader.LoadFormulas;
  Result := AllFormulaNames;
end;
{$ENDREGION '========================================================================== > | AllFormulaNames'}
{$REGION '============================================================================= > | TMutaGenPanel'}
{ ------------------------------ TMutaGenPanel ------------------------------- }
constructor TMutaGenPanel.Create(ParentPanel: TMutaGenPanel;const MutationIndex: TMutationIndex;const XPos, YPos, XSize, YSize: Double;const Caption: String;const Panel: TPanel;const Image: TImage);
begin
  inherited Create;
  FParentPanel := ParentPanel;
  FMutationIndex := MutationIndex;
  FCaption := Caption;
  FXPos := XPos;
  FYPos := YPos;
  FXSize := XSize;
  FYSize := YSize;
  FPanel := Panel;
  FImage := Image;
end;

function TMutaGenPanel.GetImageWidth: Integer;
begin
  Result := FImage.Width;
end;

function TMutaGenPanel.GetImageHeight: Integer;
begin
  Result := FImage.Height;
end;

procedure TMutaGenPanel.SetBitmap(const Image: TBitmap);
begin
  FImage.Picture.Bitmap := Image;
end;
{$ENDREGION '========================================================================== > | TMutaGenPanel'}
{$REGION '============================================================================= > | TMutaGenPanelList'}
{ ---------------------------- TMutaGenPanelList ----------------------------- }
constructor TMutaGenPanelList.Create(const RootPanel: TPanel; const XSize, YSize: Double);
begin
  inherited Create;
  FRootPanel := RootPanel;
  FXSize := XSize;
  FYSize := YSize;
  FPanels := TObjectList.Create;
  FPanelLinkList := TObjectList.Create;
  FLinkLinesList := TObjectList.Create;
  FPanelIdxList := TStringList.Create;
  FPanelIdxList.Sorted := False;
end;

destructor TMutaGenPanelList.Destroy;
begin
  FPanels.Free;
  FPanelLinkList.Free;
  FPanelIdxList.Free;
  FLinkLinesList.Free;
  inherited Destroy;
end;

function TMutaGenPanelList.GetPanelPath(const Panel: TMutaGenPanel): String;
var
  CurrPanel: TMutaGenPanel;
begin
  CurrPanel := Panel;
  Result := CurrPanel.Caption;
  while(CurrPanel.ParentPanel <> nil) do begin
    CurrPanel := CurrPanel.ParentPanel;
    Result := CurrPanel.Caption + '.' + Result;
  end;
end;

procedure TMutaGenPanelList.AddPanel(const Panel: TMutaGenPanel);
var
  Path: String;
begin
  Path:= GetPanelPath(Panel);
  if FPanelIdxList.IndexOf(Path) >= 0 then
    raise Exception.Create('TMutaGenPanelList.AddPanel: A Panel with the path <'+Path+'> already exists');
  FPanels.Add(Panel);
  FPanelIdxList.Add(Path);
end;

function TMutaGenPanelList.GetPanel(const Index: Integer): TMutaGenPanel;
begin
  if (Index<0) or (Index>=FPanels.Count) then
    raise Exception.Create('TMutaGenPanelList.GetPanel: Invalid panel index <'+IntToStr(Index)+'>');
  Result := TMutaGenPanel(FPanels[Index]);
end;

function TMutaGenPanelList.GetPanel(const Path: String): TMutaGenPanel;
var
  Index: Integer;
begin
  Index := FPanelIdxList.IndexOf(Path);
  if Index < 0 then
    raise Exception.Create('TMutaGenPanelList.GetPanel: Invalid panel path <'+Path+'>');
  Result := TMutaGenPanel(FPanels[Index]);
end;

procedure TMutaGenPanelList.DoLayout;
const
  OuterBorder = 10;
var
  I: Integer;
  RootWidth, RootHeight, RootCentreX, RootCentreY: Integer;
  ScaleX, ScaleY: Double;
  Panel: TMutaGenPanel;
  Link: TPanelLink;
  X1, Y1, X2, Y2: Integer;
  XI1, YI1, XI2, YI2: Integer;
  O1, O2: TPanelOrientation;
  PanelPath: String;
begin
  RootWidth := FRootPanel.Width - 2 * OuterBorder;
  RootHeight := FRootPanel.Height - 2 * OuterBorder;
  RootCentreX := OuterBorder + RootWidth div 2;
  RootCentreY := OuterBorder + RootHeight div 2;
  ScaleX := RootWidth / FXSize;
  ScaleY := RootHeight / FYSize;
  for I := 0 to FPanels.Count - 1 do begin
    Panel := GetPanel(I);
    if Panel.ParentPanel = nil then
      Panel.FPanel.Caption := 'Root'
    else begin
      PanelPath := GetPanelPath(Panel);
      Panel.FPanel.Caption := 'Mutation '+Copy(PanelPath, 3, Length(PanelPath) - 2);
    end;
    Panel.FPanel.Width := Round( Panel.FXSize * ScaleX );
    Panel.FPanel.Height := Round( Panel.FYSize * ScaleY );
    Panel.FPanel.Left := Round( RootCentreX + Panel.FXPos * ScaleX ) - Panel.FPanel.Width div 2;
    Panel.FPanel.Top := Round( RootCentreY - Panel.FYPos * ScaleY ) - Panel.FPanel.Height div 2;
  end;

  FLinkLinesList.Clear;
  for I := 0 to FPanelLinkList.Count - 1 do begin
    Link := TPanelLink(FPanelLinkList[I]);
    X1 := Link.FFromPanel.FPanel.FPanel.Left + Round( Link.FFromPanel.FXPos * Link.FFromPanel.FPanel.FPanel.Width);
    Y1 := Link.FFromPanel.FPanel.FPanel.Top + Round( (1.0 - Link.FFromPanel.FYPos) * Link.FFromPanel.FPanel.FPanel.Height);
    O1 := Link.FFromPanel.Orientation;
    X2 := Link.FToPanel.FPanel.FPanel.Left + Round( Link.FToPanel.FXPos * Link.FToPanel.FPanel.FPanel.Width);
    Y2 := Link.FToPanel.FPanel.FPanel.Top + Round( (1.0 - Link.FToPanel.FYPos) * Link.FToPanel.FPanel.FPanel.Height);
    O2 := Link.FToPanel.Orientation;

    if ((O1 = poLeft) and (O2=poRight)) or ((O1 = poRight) and (O2=poLeft)) then begin
      XI1 := Round(X1 + (X2 - X1) * 0.5);
      YI1 := Y1;
      XI2 := XI1;
      YI2 := Y2;
      FLinkLinesList.Add(TPanelLinkLine.Create(X1, Y1, XI1, YI1));
      FLinkLinesList.Add(TPanelLinkLine.Create(XI1, YI1, XI2, YI2));
      FLinkLinesList.Add(TPanelLinkLine.Create(XI2, YI2, X2, Y2));
    end
    else if ((O1 = poTop) and (O2=poBottom)) or ((O1 = poBottom) and (O2=poTop)) then begin
      XI1 := X1;
      YI1 := Round(Y1 + (Y2 - Y1) * 0.5);
      XI2 := X2;
      YI2 := YI1;
      FLinkLinesList.Add(TPanelLinkLine.Create(X1, Y1, XI1, YI1));
      FLinkLinesList.Add(TPanelLinkLine.Create(XI1, YI1, XI2, YI2));
      FLinkLinesList.Add(TPanelLinkLine.Create(XI2, YI2, X2, Y2));
    end
    else
      FLinkLinesList.Add(TPanelLinkLine.Create(X1, Y1, X2, Y2));
  end;
end;

procedure TMutaGenPanelList.AddPanelLink(const FromX, FromY: Double; const FromOrientation: TPanelOrientation; const FromPanel: TMutaGenPanel; const ToX, ToY: Double; const ToOrientation: TPanelOrientation;const ToPanel: TMutaGenPanel);
begin
  FPanelLinkList.Add(TPanelLink.Create(TPanelPosition.Create(FromPanel, FromX, FromY, FromOrientation), TPanelPosition.Create(ToPanel, ToX, ToY, ToOrientation)));
end;

function TMutaGenPanelList.GetCount: Integer;
begin
  Result := FPanels.Count;
end;
{$ENDREGION '========================================================================== > | TMutaGenPanelList'}
{$REGION '============================================================================= > | TPanelPosition'}
{ ----------------------------- TPanelPosition ------------------------------- }
constructor TPanelPosition.Create(const Panel: TMutaGenPanel;const XPos, YPos: Double; const Orientation: TPanelOrientation);
begin
  inherited Create;
  FPanel := Panel;

  FXPos := XPos;
  if(FXPos < 0.0) then
    FXPos := 0.0
  else if (FXPos > 1.0) then
    FXPos := 1.0;

  FYPos := YPos;
  if(FYPos < 0.0) then
    FYPos := 0.0
  else if (FYPos > 1.0) then
    FYPos := 1.0;

  FOrientation := Orientation;
end;
{$ENDREGION '========================================================================== > | TPanelPosition'}
{$REGION '============================================================================= > | TPanelLink'}
{ -------------------------------- TPanelLink -------------------------------- }
constructor TPanelLink.Create(FromPanel, ToPanel: TPanelPosition);
begin
  inherited Create;
  FFromPanel := FromPanel;
  FToPanel := ToPanel;
end;

destructor TPanelLink.Destroy;
begin
  FFromPanel.Free;
  FToPanel.Free;
  inherited Destroy;
end;
{$ENDREGION '========================================================================== > | TPanelLink'}
{$REGION '============================================================================= > | TPanelLinkLine'}
{ ------------------------------ TPanelLinkLine ------------------------------ }
constructor TPanelLinkLine.Create(X1, Y1, X2, Y2: Integer);
begin
  inherited Create;
  FX1 := X1;
  FY1 := Y1;
  FX2 := X2;
  FY2 := Y2;
end;

procedure TPanelLinkLine.Draw(Canvas: TCanvas);
const
  Color = clRed;
begin
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := 1;
  Canvas.MoveTo(FX1, FY1);
  Canvas.LineTo(FX2, FY2);
end;
{$ENDREGION '========================================================================== > | TPanelLinkLine'}
{$REGION '============================================================================= > | TRandGen'}
{ -------------------------------- TRandGen ---------------------------------- }
function TRandGen.NextRandomDouble: Double;
begin
  Result := Random;
end;

function TRandGen.NextRandomInt(const MaxValue: Integer): Integer;
begin
  Result := Trunc( MaxValue * NextRandomDouble );
end;
{$ENDREGION '========================================================================== > | TRandGen'}
{$REGION '============================================================================= > | TMutationParams'}
{ ---------------------------- TMutationParams ------------------------------- }
destructor TMutationParams.Destroy;
begin
  if FParams <> nil then
    FParams.Free;
  if FBitmap <> nil then
    FBitmap.Free;
  if FProbingBitmap <>nil then
    FProbingBitmap.Free;
  inherited Destroy;
end;

procedure TMutationParams.SetBitmap(const Bitmap: TBitmap);
begin
  if FBitmap <> nil then
    FBitmap.Free;
  FBitmap :=Bitmap;
end;

procedure TMutationParams.SetProbingBitmap(const ProbingBitmap: TBitmap);
begin
  if FProbingBitmap <>nil then
    FProbingBitmap.Free;
  FProbingBitmap := ProbingBitmap;
end;
{$ENDREGION '========================================================================== > | TMutationParams'}
{$REGION '============================================================================= > | TMutationParamsSet'}
{ --------------------------- TMutationParamsSet ------------------------------ }
constructor TMutationParamsSet.Create;
var
  I: TMutationIndex;
begin
  inherited Create;
  for I:=Low(FParams) to High(FParams) do
    FParams[I] := TMutationParams.Create;
end;

destructor TMutationParamsSet.Destroy;
var
  I: TMutationIndex;
begin
  for I:=Low(FParams) to High(FParams) do begin
    if FParams[I]<>nil then
      FParams[I].Free;
  end;
  inherited Destroy;
end;

function TMutationParamsSet.GetParam(Index: TMutationIndex): TMutationParams;
begin
  Result := FParams[Index];
end;

procedure TMutationParamsSet.SetParam(Index: TMutationIndex; const Param: TMutationParams);
begin
  if FParams[Index] <>nil then
    FParams[Index].Free;
  FParams[Index] := Param;
end;
{$ENDREGION '========================================================================== > | TMutationParamsSet'}
{$REGION '============================================================================= > | TMutation'}
{ ---------------------------------- TMutation ------------------------------- }
function TMutation.GetNonEmptyFormulas(const Params: TMB3DParamsFacade): TStringList;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := 0 to Params.FormulaCount-1 do begin
    if not Params.Formulas[I].IsEmpty then
      Result.Add(IntToStr(I));
  end;
end;

function TMutation.GetNonEmptyFormulaCount(const Params: TMB3DParamsFacade): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Params.FormulaCount-1 do begin
    if not Params.Formulas[I].IsEmpty then
      Inc(Result);
  end;
end;

function TMutation.GetNonEmptyFormulasByCategory(const Params: TMB3DParamsFacade; const Category: TFormulaCategory): TStringList;
var
  I: Integer;
  FormulaNamesOfCategory: TStringList;
begin
  Result := TStringList.Create;
  FormulaNamesOfCategory := GetAllFormulaNames.GetFormulaNamesByCategory(Category);
  try
    for I := 0 to Params.FormulaCount-1 do begin
      if (not Params.Formulas[I].IsEmpty) and (FormulaNamesOfCategory.IndexOf(Params.Formulas[I].FormulaName)>=0) then
        Result.Add(IntToStr(I));
    end;
  finally
    FormulaNamesOfCategory.Free;
  end;
end;

function TMutation.GetNonEmptyFormulasWithParams(const Params: TMB3DParamsFacade): TStringList;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := 0 to Params.FormulaCount-1 do begin
    if (not Params.Formulas[I].IsEmpty) and (Params.Formulas[I].ParamCount > 0) then
      Result.Add(IntToStr(I));
  end;
end;

function TMutation.ChooseRandomFormula(const Params: TMB3DParamsFacade; const OnlyFormulasWithParams: Boolean): TMB3DFormulaFacade;
var
  Index: Integer;
  IdxList: TStringList;
begin
  Result := nil;
  if OnlyFormulasWithParams then
    IdxList := GetNonEmptyFormulasWithParams(Params)
  else
    IdxList := GetNonEmptyFormulas(Params);
  try
    if IdxList.Count > 0 then begin
      Index := StrToInt(IdxList[ RandGen.NextRandomInt(IdxList.Count) ]);
      Result := Params.Formulas[Index];
    end;
  finally
    IdxList.Free;
  end;
end;
//debugstring??
procedure TMutation.RandomizeParamValue(Param: TMB3DParamFacade; const Strength: Double);
var
  OldValue, Delta, Magnitude: Double;
begin
  OldValue := Param.Value;
  if Param.Datatype=ptInteger then begin
    Delta := (1.0+RandGen.NextRandomDouble * 1.5) * Strength;
    if RandGen.NextRandomDouble > 0.5 then
      Delta := 0.0 - Delta;
  end
  else begin
    if Abs(OldValue) > Epsilon then begin
      Magnitude := Log10(Abs(OldValue*0.1));
      Delta := Exp(Magnitude+(0.5+RandGen.NextRandomDouble))* (0.5-RandGen.NextRandomDouble) * Strength
    end
    else
      Delta := (0.5-RandGen.NextRandomDouble) * Strength;
  end;
  Param.Value := OldValue + Delta;
  //Windows.OutputDebugString(PChar(Param.Name + ': ' + FloatToStr(OldValue) + '->' + FloatToStr(Param.Value)));
end;
{$ENDREGION '========================================================================== > | TMutation'}
{$REGION '============================================================================= > | TScalableMutation'}
{ --------------------------- TScalableMutation ------------------------------ }
constructor TScalableMutation.Create;
begin
  inherited Create;
  FStrength := 1.0;
end;
{$ENDREGION '========================================================================== > | TScalableMutation'}
{$REGION '============================================================================= > | TMutationConfig'}
{ ----------------------------- TMutationConfig ------------------------------ }
constructor TMutationConfig.Create;
begin
  inherited Create;
  ModifyFormulaWeight := 0.75;
  ModifyParamsWeight := 1.0;
  ModifyParamsStrength := 1.0;
  ModifyJuliaModeWeight := 0.5;
  ModifyJuliaModeStrength := 1.0;
  ModifyIterationCountWeight := 0.5;
  ModifyIterationCountStrength := 1.0;

  FProbing := True;
  FProbingWidth := 40;
  FProbingHeight := 32;
  FProbingMaxCount := 9;
  FProbingMinCoverage := 0.32;
  FProbingMinDifference := 0.16;
end;
{$ENDREGION '========================================================================== > | TMutationConfig'}
{$REGION '============================================================================= > | TMutationCreator'}
{ ---------------------------- TMutationCreator ------------------------------ }
class function TMutationCreator.CreateMutations(const Config: TMutationConfig ): TList;
var
  Mutation: TScalableMutation;
begin
  Result := TObjectList.Create;

  if Config.ModifyFormulaWeight > RandGen.NextRandomDouble then begin
    Result.Add(TAddFormulaMutation.Create);
    Result.Add(TReplaceFormulaMutation.Create);
    Result.Add(TRemoveFormulaMutation.Create);
  end;

  if Config.ModifyParamsWeight > RandGen.NextRandomDouble then begin
    Mutation := TModifySingleParamMutation.Create;
    Mutation.Strength := Config.ModifyParamsStrength;
    Result.Add(Mutation);
  end;

  if Config.ModifyJuliaModeWeight > RandGen.NextRandomDouble then begin
    Mutation := TModifyJuliaModeMutation.Create;
    Mutation.Strength := Config.ModifyJuliaModeStrength;
    Result.Add(Mutation);
  end;

  if Config.ModifyIterationCountWeight > RandGen.NextRandomDouble then begin
    Mutation := TModifyIterationCountMutation.Create;
    Mutation.Strength := Config.ModifyIterationCountStrength;
    Result.Add(Mutation);
  end;
end;
{$ENDREGION '========================================================================== > | TMutationCreator'}
{$REGION '============================================================================= > | TModifySingleParamMutation'}
{ ------------------------ TModifySingleParamMutation ------------------------ }
function TModifySingleParamMutation.MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;
var
  ParamIndex: Integer;
  Formula: TMB3DFormulaFacade;
begin
  Result := Params.Clone;
  Formula := ChooseRandomFormula(Result, True);
  if Formula<>nil then begin
    ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
    RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    if (Formula.ParamCount > 2) and (Strength > 0.25) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
    if (Formula.ParamCount > 3) and (Strength > 0.5) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
    if (Formula.ParamCount > 4) and (Strength > 0.75) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
    if (Formula.ParamCount > 5) and (Strength > 1.0) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
    if (Formula.ParamCount > 6) and (Strength > 1.25) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
    if (Formula.ParamCount > 7) and (Strength > 1.5) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
    if (Formula.ParamCount > 8) and (Strength > 1.75) then begin
      ParamIndex := RandGen.NextRandomInt(Formula.ParamCount);
      RandomizeParamValue(Formula.Params[ParamIndex], Strength);
    end;
  end;
end;
{$ENDREGION '========================================================================== > | TModifySingleParamMutation'}
{$REGION '============================================================================= > | TAddFormulaMutation'}
{ ---------------------------- TAddFormulaMutation --------------------------- }
function TAddFormulaMutation.HasFormulaOfCategory(const Params: TMB3DParamsFacade; const Category: TFormulaCategory): Boolean;
var
  IdxList: TStringList;
begin
  IdxList := GetNonEmptyFormulasByCategory( Params, Category);
  try
    Result := IdxList.Count > 0;
  finally
    IdxList.Free;
  end;
end;

function TAddFormulaMutation.GuessFormulaCategory(const FormulaIndex: Integer;const Params: TMB3DParamsFacade): TFormulaCategory;
const
  CategoriesForDIFS: array [0..1] of TFormulaCategory=(fc_dIFS, fc_dIFSa);
  CategoriesFor4D: array [0..1] of TFormulaCategory=(fc_4D, fc_4Da);
  CategoriesFor3D: array [0..2] of TFormulaCategory=(fc_3D, fc_Ads, fc_3Da);
begin
  if HasFormulaOfCategory(Params, fc_dIFS) or HasFormulaOfCategory(Params, fc_dIFSa) then begin
    if FormulaIndex > 0 then
      Result :=  CategoriesForDIFS[RandGen.NextRandomInt(High(CategoriesForDIFS))]
    else
      Result := fc_dIFS;
  end
  else if HasFormulaOfCategory(Params, fc_4D) or HasFormulaOfCategory(Params, fc_4Da) then begin
    if FormulaIndex > 0 then
      Result := CategoriesFor4D[ RandGen.NextRandomInt(High(CategoriesFor4D))]
    else
      Result := fc_4D;
  end
  else if HasFormulaOfCategory(Params, fc_3D) or HasFormulaOfCategory(Params, fc_3Da) or HasFormulaOfCategory(Params, fc_Ads) then begin
    if FormulaIndex > 0 then
      Result := CategoriesFor3D[ RandGen.NextRandomInt(High(CategoriesFor3D))]
    else
      Result := fc_3D;
  end
  else begin
    Result := fc_3D;
  end;
end;

function TAddFormulaMutation.MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;
var
  I, Idx, Attempts: Integer;
  FormulaNames: TFormulaNames;
  FormulaNamesForCategory: TStringList;
begin
  FormulaNames := GetAllFormulaNames;
  Result := Params.Clone;
  for I := 0 to 5 do begin
    if Result.Formulas[I].IsEmpty then begin
      FormulaNamesForCategory := FormulaNames.GetFormulaNamesByCategory(GuessFormulaCategory(I, Result));
      if FormulaNamesForCategory.Count > 0 then begin
        Attempts := 0;
        while(Attempts < 25) do begin
          Idx := RandGen.NextRandomInt(FormulaNamesForCategory.Count);
          if (Pos('_', FormulaNamesForCategory[Idx]) <> 1) then begin
            Result.Formulas[I].FormulaName := FormulaNamesForCategory[Idx];
            break;
          end;
          Inc(Attempts);
        end;
      end;
      break;
    end;
  end;
end;
{$ENDREGION '========================================================================== > | TAddFormulaMutation'}
{$REGION '============================================================================= > | TReplaceFormulaMutation'}
{ -------------------------- TReplaceFormulaMutation ------------------------- }
function TReplaceFormulaMutation.MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;
var
  I, Idx, Attempts: Integer;
  FormulaNames: TFormulaNames;
  FormulaNamesOfSameCategory: TStringList;
  NewFormulaName: String;
  Category: TFormulaCategory;

  function StartsWithUnderScore(const Name: String): Boolean;
  begin
    Result := Pos('_', Name) = 1;
  end;

begin
  Result := Params.Clone;
  FormulaNames := GetAllFormulaNames;
  for I := 0 to 5 do begin
    if not Result.Formulas[I].IsEmpty then begin
      Category := FormulaNames.GetCategoryByFormulaName(Result.Formulas[I].FormulaName);
      FormulaNamesOfSameCategory := FormulaNames.GetFormulaNamesByCategory(Category);
      Attempts := 0;
      while(Attempts < 24) do begin
        Idx := RandGen.NextRandomInt(FormulaNamesOfSameCategory.Count);
        NewFormulaName := FormulaNamesOfSameCategory[Idx];
        if (NewFormulaName <> Result.Formulas[I].FormulaName) and (StartsWithUnderScore(NewFormulaName)=StartsWithUnderScore(Result.Formulas[I].FormulaName)) then begin
          Result.Formulas[I].FormulaName := NewFormulaname;
          break;
        end;
        Inc(Attempts);
      end;
      break;
    end;
  end;
end;
{$ENDREGION '========================================================================== > | TReplaceFormulaMutation'}
{$REGION '============================================================================= > | TRemoveFormulaMutation'}
{ --------------------------- TRemoveFormulaMutation ------------------------- }
function TRemoveFormulaMutation.MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;
const
  CategoriesByPriority: array [0..6] of TFormulaCategory=(fc_dIFSa, fc_4Da, fc_3Da, fc_Ads, fc_dIFS, fc_4D, fc_3D);
var
  I, J, Pass, Idx, FCount: Integer;
  IdxList: TStringList;
begin
  Result := Params.Clone;
  FCount := GetNonEmptyFormulaCount(Result);
  if (FCount > 4) or ((FCount > 3) and (RandGen.NextRandomDouble > 0.5)) then begin
    for Pass := 0 to 1 do begin
      for I := Low(CategoriesByPriority) to High(CategoriesByPriority) do begin
        IdxList := GetNonEmptyFormulasByCategory( Result, CategoriesByPriority[I]);
        if Pass = 0 then begin
          J := 0;
          while J< IdxList.Count do begin
            Idx := StrToInt(IdxList[J]);
            if Pos('_', Result.Formulas[Idx].FormulaName) <> 1 then
              IdxList.Delete(J)
            else
              Inc(J);
          end;
        end;
        try
          if IdxList.Count > 0 then begin
            Idx := StrToInt(IdxList[RandGen.NextRandomInt(IdxList.Count)]);
            Result.Formulas[Idx].FormulaName := '';
            exit;
          end;
        finally
          IdxList.Free;
        end;
      end;
    end;
  end;
end;
{$ENDREGION '========================================================================== > | TRemoveFormulaMutation'}
{$REGION '============================================================================= > | TModifyJuliaModeMutation'}
{ -------------------------- TModifyJuliaModeMutation ------------------------ }
function TModifyJuliaModeMutation.MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;
const
  JuliaScale = 1.5;
begin
  Result := Params.Clone;
  Result.JuliaMode.IsJulia := (RandGen.NextRandomDouble > 0.25);
  if (Result.JuliaMode.IsJulia) then begin
    if RandGen.NextRandomDouble > 0.5 then
      Result.JuliaMode.Jx := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale;
    if RandGen.NextRandomDouble > 0.5 then
      Result.JuliaMode.Jy := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale;
    if RandGen.NextRandomDouble > 0.5 then
      Result.JuliaMode.Jz := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale;
    if RandGen.NextRandomDouble > 0.75 then
      Result.JuliaMode.Jw := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale;
    if (Abs(Result.JuliaMode.Jx)<Epsilon) and (Abs(Result.JuliaMode.Jy)<Epsilon) and (Abs(Result.JuliaMode.Jz)<Epsilon) then begin
      if RandGen.NextRandomDouble > 0.5 then begin
        if RandGen.NextRandomDouble > 0.5 then
          Result.JuliaMode.Jx := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale
        else
          Result.JuliaMode.Jz := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale;
      end
      else begin
        if RandGen.NextRandomDouble > 0.5 then
          Result.JuliaMode.Jy := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale
        else
          Result.JuliaMode.Jw := Strength * (0.5-RandGen.NextRandomDouble) * JuliaScale;
      end;
    end;
  end
  else begin
    Result.JuliaMode.Jx := 0.0;
    Result.JuliaMode.Jy := 0.0;
    Result.JuliaMode.Jz := 0.0;
    Result.JuliaMode.Jw := 0.0;
  end;
end;
{$ENDREGION '========================================================================== > | TModifyJuliaModeMutation'}
{$REGION '============================================================================= > | TModifyIterationCountMutation'}
{ ---------------------- TModifyIterationCountMutation ----------------------- }
function TModifyIterationCountMutation.MutateParams(const Params: TMB3DParamsFacade): TMB3DParamsFacade;
var
  I, P, Idx, Passes: Integer;
  IdxList: TStringList;
begin
  Result := Params.Clone;
  IdxList := GetNonEmptyFormulas(Params);
  try
    if IdxList.Count > 1 then begin
      Passes := 1;
      if Strength > 0.5 then
        Inc(Passes);
      if Strength > 1.0 then
        Inc(Passes);
      if Strength > 1.5 then
        Inc(Passes);
      for I := 0 to IdxList.Count-1 do
        Result.Formulas[StrToInt(IdxList[I])].IterationCount := 1;
      for P := 1 to Passes do begin
        Idx := RandGen.NextRandomInt(IdxList.Count);
        Idx := StrToInt(IdxList[Idx]);
        Result.Formulas[Idx].IterationCount := 1+ RandGen.NextRandomInt(Round(2.0 + 2.0* Strength));
      end;
    end;
  finally
    IdxList.Free;
  end;
end;
{$ENDREGION '========================================================================== > | TModifyIterationCountMutation'}
{$REGION '============================================================================= > | TMutationCoverage'}
{ ----------------------------- TMutationCoverage ---------------------------- }
class function TMutationCoverage.CalcCoverage(const Bitmap: TBitmap): Double;
const
  Threshold = 10;
var
  Scanline: PRGBTriple;
  X, Y, Count: Integer;
  Lum: Double;
begin
  Count := 0;
  for Y := 0 to Bitmap.Height - 1 do begin
    Scanline := Bitmap.ScanLine[Y];
    for X := 0 to Bitmap.Width - 1 do begin
      with Scanline^ do begin
        Lum := 0.299*rgbtRed + 0.587*rgbtGreen + 0.114*rgbtBlue;
        if Lum > Threshold then
          Inc(Count);
      end;
      Inc(Scanline);
    end;
  end;
  Result := Count/(Bitmap.Height*Bitmap.Width);
end;

class function TMutationCoverage.CalcDiffCoverage(const Bitmap1, Bitmap2: TBitmap): Double;
const
  Threshold = 5.0;
  RThreshold = Threshold * 0.299;
  GThreshold = Threshold * 0.587;
  BThreshold = Threshold * 0.114;
var
  Scanline1, Scanline2: PRGBTriple;
  X, Y, Count: Integer;
begin
  if (Bitmap1.Width <> Bitmap2.Width) or (Bitmap1.Height <> Bitmap2.Height) then
    raise Exception.Create('Non-matching bitmaps');
  Count := 0;
  for Y := 0 to Bitmap1.Height - 1 do begin
    Scanline1 := Bitmap1.ScanLine[Y];
    Scanline2 := Bitmap2.ScanLine[Y];
    for X := 0 to Bitmap1.Width - 1 do begin
      if (Abs(Scanline1^.rgbtRed - Scanline2.rgbtRed) > RThreshold) or
         (Abs(Scanline1^.rgbtGreen - Scanline2.rgbtGreen) > GThreshold) or
         (Abs(Scanline1^.rgbtBlue - Scanline2.rgbtBlue) > BThreshold) then
        Inc(Count);
      Inc(Scanline1);
      Inc(Scanline2);
    end;
  end;
  Result := Count/(Bitmap1.Height*Bitmap1.Width);
end;

class function TMutationCoverage.CalcFilteredCoverage(const Bitmap: TBitmap): Double;
begin
  if Bitmap.PixelFormat = pf24bit then
    Result := CalcFilteredCoverage24(Bitmap)
  else if Bitmap.PixelFormat = pf32bit then
    Result := CalcFilteredCoverage32(Bitmap)
  else
    raise Exception.Create('Invalid Bitmap Format <'+IntToSTr(Ord(Bitmap.PixelFormat))+'>');
end;

class function TMutationCoverage.CalcFilteredCoverage24(const Bitmap: TBitmap): Double;
const
  Threshold = 20.0;
//  RThreshold = Threshold * 0.299;
//  GThreshold = Threshold * 0.587;
//  BThreshold = Threshold * 0.114;
var
  PScanline1, PScanline2, PScanline3: PRGBTriple;
  NScanline1, NScanline2, NScanline3: PRGBTriple;
  X, Y, Count: Integer;
  Lum: Double;
  FilteredRed, FilteredGreen, FilteredBlue: Double;
begin
  Count := 0;
  for Y := 1 to Bitmap.Height - 2 do begin
    PScanline1 := Bitmap.ScanLine[Y-1];
    PScanline2 := Bitmap.ScanLine[Y];
    PScanline3 := Bitmap.ScanLine[Y+1];
    NScanline1 := PScanline1; Inc(NScanline1, 2);
    NScanline2 := PScanline2; Inc(NScanline2, 2);
    NScanline3 := PScanline3; Inc(NScanline3, 2);
    for X := 1 to Bitmap.Width - 2 do begin
      FilteredRed := - PScanline1^.rgbtRed
                     + NScanline1^.rgbtRed
                     - 2 * PScanline2^.rgbtRed
                     + 2 * NScanline2^.rgbtRed
                     - PScanline3^.rgbtRed
                     + NScanline3^.rgbtRed;
      FilteredGreen := - PScanline1^.rgbtGreen
                     + NScanline1^.rgbtGreen
                     - 2 * PScanline2^.rgbtGreen
                     + 2 * NScanline2^.rgbtGreen
                     - PScanline3^.rgbtGreen
                     + NScanline3^.rgbtGreen;
      FilteredBlue := - PScanline1^.rgbtBlue
                     + NScanline1^.rgbtBlue
                     - 2 * PScanline2^.rgbtBlue
                     + 2 * NScanline2^.rgbtBlue
                     - PScanline3^.rgbtBlue
                     + NScanline3^.rgbtBlue;

      Lum := 0.299*FilteredRed + 0.587*FilteredGreen + 0.114*FilteredBlue;
      if Lum > Threshold then
        Inc(Count);
      Inc(PScanline1); Inc(PScanline2); Inc(PScanline3);
      Inc(NScanline1); Inc(NScanline2); Inc(NScanline3);
    end;
  end;
  Result := Count/((Bitmap.Height-2)*(Bitmap.Width-2));
end;

class function TMutationCoverage.CalcFilteredCoverage32(const Bitmap: TBitmap): Double;
const
  Threshold = 20.0;
  RThreshold = Threshold * 0.299;
  GThreshold = Threshold * 0.587;
  BThreshold = Threshold * 0.114;
var
  PScanline1, PScanline2, PScanline3: PRGBQuad;
  NScanline1, NScanline2, NScanline3: PRGBQuad;
  X, Y, Count: Integer;
  Lum: Double;
  FilteredRed, FilteredGreen, FilteredBlue: Double;
begin
  Count := 0;
  for Y := 1 to Bitmap.Height - 2 do begin
    PScanline1 := Bitmap.ScanLine[Y-1];
    PScanline2 := Bitmap.ScanLine[Y];
    PScanline3 := Bitmap.ScanLine[Y+1];
    NScanline1 := PScanline1; Inc(NScanline1, 2);
    NScanline2 := PScanline2; Inc(NScanline2, 2);
    NScanline3 := PScanline3; Inc(NScanline3, 2);
    for X := 1 to Bitmap.Width - 2 do begin
      FilteredRed := - PScanline1^.rgbRed
                     + NScanline1^.rgbRed
                     - 2 * PScanline2^.rgbRed
                     + 2 * NScanline2^.rgbRed
                     - PScanline3^.rgbRed
                     + NScanline3^.rgbRed;
      FilteredGreen := - PScanline1^.rgbGreen
                     + NScanline1^.rgbGreen
                     - 2 * PScanline2^.rgbGreen
                     + 2 * NScanline2^.rgbGreen
                     - PScanline3^.rgbGreen
                     + NScanline3^.rgbGreen;
      FilteredBlue := - PScanline1^.rgbBlue
                     + NScanline1^.rgbBlue
                     - 2 * PScanline2^.rgbBlue
                     + 2 * NScanline2^.rgbBlue
                     - PScanline3^.rgbBlue
                     + NScanline3^.rgbBlue;

      Lum := 0.299*FilteredRed + 0.587*FilteredGreen + 0.114*FilteredBlue;
      if Lum > Threshold then
        Inc(Count);
      Inc(PScanline1); Inc(PScanline2); Inc(PScanline3);
      Inc(NScanline1); Inc(NScanline2); Inc(NScanline3);
    end;
  end;
  Result := Count/((Bitmap.Height-2)*(Bitmap.Width-2));
end;

class function TMutationCoverage.CreateFilteredImage(const Bitmap: TBitmap): TBitmap;
begin
  if Bitmap.PixelFormat = pf24bit then
    Result := CreateFilteredImage24(Bitmap)
  else if Bitmap.PixelFormat = pf32bit then
    Result := CreateFilteredImage32(Bitmap)
  else
    raise Exception.Create('Invalid Bitmap Format <'+IntToSTr(Ord(Bitmap.PixelFormat))+'>');
end;

class function TMutationCoverage.CreateFilteredImage24(const Bitmap: TBitmap): TBitmap;
var
  PScanline1, PScanline2, PScanline3: PRGBTriple;
  NScanline1, NScanline2, NScanline3: PRGBTriple;
  DScanline: PRGBTriple;
  X, Y, Value: Integer;
  BValue: Byte;
  FilteredRed, FilteredGreen, FilteredBlue: Double;
begin
  Result := TBitmap.Create;
  Result.Assign(Bitmap);
  if Result.PixelFormat <> Bitmap.PixelFormat then
    raise Exception.Create('Invalid bitmap');
  for Y := 1 to Bitmap.Height - 2 do begin
    DScanline := Result.ScanLine[Y];
    PScanline1 := Bitmap.ScanLine[Y-1];
    PScanline2 := Bitmap.ScanLine[Y];
    PScanline3 := Bitmap.ScanLine[Y+1];
    NScanline1 := PScanline1; Inc(NScanline1, 2);
    NScanline2 := PScanline2; Inc(NScanline2, 2);
    NScanline3 := PScanline3; Inc(NScanline3, 2);
    Inc(DScanline);
    for X := 1 to Bitmap.Width - 2 do begin
      // Sobel filter
      FilteredRed := - PScanline1^.rgbtRed
                     + NScanline1^.rgbtRed
                     - 2 * PScanline2^.rgbtRed
                     + 2 * NScanline2^.rgbtRed
                     - PScanline3^.rgbtRed
                     + NScanline3^.rgbtRed;
      FilteredGreen := - PScanline1^.rgbtGreen
                     + NScanline1^.rgbtGreen
                     - 2 * PScanline2^.rgbtGreen
                     + 2 * NScanline2^.rgbtGreen
                     - PScanline3^.rgbtGreen
                     + NScanline3^.rgbtGreen;
      FilteredBlue := - PScanline1^.rgbtBlue
                     + NScanline1^.rgbtBlue
                     - 2 * PScanline2^.rgbtBlue
                     + 2 * NScanline2^.rgbtBlue
                     - PScanline3^.rgbtBlue
                     + NScanline3^.rgbtBlue;
      Value := Round(FilteredRed * 0.299 + FilteredGreen * 0.587 + FilteredBlue * 0.114);
      if Value < 0 then
        Value := 0
      else if Value > 255 then
        Value := 255;
      BValue := Byte(Value);

      DScanline^.rgbtRed := BValue;
      DScanline^.rgbtGreen := BValue;
      DScanline^.rgbtBlue := BValue;
      Inc(PScanline1); Inc(PScanline2); Inc(PScanline3);
      Inc(NScanline1); Inc(NScanline2); Inc(NScanline3);
      Inc(DScanline);
    end;
  end;
end;

class function TMutationCoverage.CreateFilteredImage32(const Bitmap: TBitmap): TBitmap;
var
  PScanline1, PScanline2, PScanline3: PRGBQuad;
  NScanline1, NScanline2, NScanline3: PRGBQuad;
  DScanline: PRGBQuad;
  X, Y, Value: Integer;
  BValue: Byte;
  FilteredRed, FilteredGreen, FilteredBlue: Double;
begin
  Result := TBitmap.Create;
  Result.Assign(Bitmap);
  if Result.PixelFormat <> Bitmap.PixelFormat then
    raise Exception.Create('Invalid bitmap');
  for Y := 1 to Bitmap.Height - 2 do begin
    DScanline := Result.ScanLine[Y];
    PScanline1 := Bitmap.ScanLine[Y-1];
    PScanline2 := Bitmap.ScanLine[Y];
    PScanline3 := Bitmap.ScanLine[Y+1];
    NScanline1 := PScanline1; Inc(NScanline1, 2);
    NScanline2 := PScanline2; Inc(NScanline2, 2);
    NScanline3 := PScanline3; Inc(NScanline3, 2);
    Inc(DScanline);
    for X := 1 to Bitmap.Width - 2 do begin
      FilteredRed := - PScanline1^.rgbRed
                     + NScanline1^.rgbRed
                     - 2 * PScanline2^.rgbRed
                     + 2 * NScanline2^.rgbRed
                     - PScanline3^.rgbRed
                     + NScanline3^.rgbRed;
      FilteredGreen := - PScanline1^.rgbGreen
                     + NScanline1^.rgbGreen
                     - 2 * PScanline2^.rgbGreen
                     + 2 * NScanline2^.rgbGreen
                     - PScanline3^.rgbGreen
                     + NScanline3^.rgbGreen;
      FilteredBlue := - PScanline1^.rgbBlue
                     + NScanline1^.rgbBlue
                     - 2 * PScanline2^.rgbBlue
                     + 2 * NScanline2^.rgbBlue
                     - PScanline3^.rgbBlue
                     + NScanline3^.rgbBlue;
      Value := Round(FilteredRed * 0.299 + FilteredGreen * 0.587 + FilteredBlue * 0.114);
      if Value < 0 then
        Value := 0
      else if Value > 255 then
        Value := 255;
      BValue := Byte(Value);

      DScanline^.rgbRed := BValue;
      DScanline^.rgbGreen := BValue;
      DScanline^.rgbBlue := BValue;
      Inc(PScanline1); Inc(PScanline2); Inc(PScanline3);
      Inc(NScanline1); Inc(NScanline2); Inc(NScanline3);
      Inc(DScanline);
    end;
  end;
end;
{$ENDREGION '========================================================================== > | TMutationCoverage'}
{$REGION '============================================================================= > | TProbedParams'}
{ ------------------------------- TProbedParams ------------------------------ }
constructor TProbedParams.Create(const Params: TMB3DParamsFacade; const Coverage, DiffCoverage: Double; const ProbingBitmap: TBitmap);
begin
  inherited Create;
  FParams := Params;
  FCoverage := Coverage;
  FDiffCoverage := DiffCoverage;
  FProbingBitmap := ProbingBitmap;
end;

destructor TProbedParams.Destroy;
begin
  if FParams <> nil then
    FParams.Free;
  if FProbingBitmap <> nil then
    FProbingBitmap.Free;
end;

function TProbedParams.ExtractParams: TMB3DParamsFacade;
begin
  Result := FParams;
  FParams := nil;
end;

function TProbedParams.ExtractProbingBitmap: TBitmap;
begin
  Result := FProbingBitmap;
  FProbingBitmap := nil;
end;
{$ENDREGION '========================================================================== > | TProbedParams'}
{$REGION '============================================================================= > | TProbedParamsList'}
{ ----------------------------- TProbedParamsList ---------------------------- }
constructor TProbedParamsList.Create(Config: TMutationConfig);
begin
  inherited Create;
  FConfig := Config;
  FValidParams := TObjectList.Create;
  FInvalidParams := TObjectList.Create;
end;

destructor TProbedParamsList.Destroy;
begin
  FValidParams.Free;
  FInvalidParams.Free;
  inherited Destroy;
end;

procedure TProbedParamsList.AddProbedParam(const Params: TProbedParams);
begin
  if Params.DiffCoverage >= FConfig.ProbingMinCoverage then
    FValidParams.Add(Params)
  else
    FInvalidParams.Add(Params);
end;

function CompareCoverage(Item1, Item2: Pointer): Integer;
var
  P1, P2: TProbedParams;
begin
  P1 := TProbedParams(Item1);
  P2 := TProbedParams(Item2);
  if P1.Coverage > P2.Coverage then
    Result := -1
  else if P1.Coverage < P2.Coverage then
    Result := 1
  else
    Result := 0;
end;

function TProbedParamsList.GetBestValidParam: TProbedParams;
begin
  if FValidParams.Count > 0 then begin
    FValidParams.Sort(CompareCoverage);
    Result := FValidParams[0];

  end
  else begin
    Result := nil;
  end;
end;

function TProbedParamsList.GetBestInvalidParam: TProbedParams;
begin
  if FInvalidParams.Count > 0 then begin
    FInvalidParams.Sort(CompareCoverage);
    Result := FInvalidParams[0];
  end
  else begin
    Result := nil;
  end;
end;
{$ENDREGION '========================================================================== > | TProbedParamsList'}

{$ENDREGION '========================================================================== > | MUTAGEN'}

{$REGION '============================================================================= > | RENDERER'}
{RENDERER}
{$REGION '============================================================================= > | TPreviewRenderer'}
{ ---------------------------- TPreviewRenderer ------------------------------ }
constructor TPreviewRenderer.Create(const MB3DParamsFacade: TMB3DParamsFacade);
begin
  FMB3DParamsFacade := MB3DParamsFacade.Clone;
end;

destructor TPreviewRenderer.Destroy;
begin
  SetLength(siLight5, 0);
  inherited Destroy;
end;

procedure TPreviewRenderer.RenderPreview(var bmp: TBitmap; maxWidth, maxHeight: Integer; bHistory: TCheckBox; sGen: String);
var      //todo called in RegisterM3Pgraphic !! preview m3p in dialog box like m3i
  d: Double;
  w, h, i, x, n, c: Integer;
  R: TRect;
  DoFrec: TDoFrec;
  PHeader: TPMandHeader10;
  MHeader: TMandHeader10;
  tmpHF,sfname,s,si: String;
  dt: TDateTime;
  f: file;

  procedure WaitForThreads(maxDeciSeconds: Integer);
  var
    i, t, n: Integer;
    RenderedRows, TotalRows: Integer;
  begin
    RenderedRows := 0;
    TotalRows := 0;
    n := maxDeciSeconds;
    if CalcThreadStats.iTotalThreadCount > 0 then begin
      repeat
        Delay(25);
        t := 0;
        for i := 1 to CalcThreadStats.iTotalThreadCount do begin
          if CalcThreadStats.CTrecords[i].isActive <> 0 then begin
            Inc(t);
            RenderedRows := RenderedRows + CalcThreadStats.CTrecords[i].iActualYpos;
          end
          else begin
            RenderedRows := RenderedRows + h;
          end;
          TotalRows := TotalRows + h;
        end;
        Dec(n);
      until (t = 0) or (n <= 0) or bCalcStop;
    end;
    FProgress := RenderedRows / TotalRows;
  end;

begin
    FProgress:=0;
    PHeader := FMB3DParamsFacade.Core.PHeader;
    PHeader^.bCalc3D := 1;
    PHeader^.bVolLightNr := 2 shl 4;
    PHeader^.mZstepDiv := 0.5;
    PHeader^.sRaystepLimiter := 1.0;

    if FBlankBackground then begin
      PHeader^.Light.BGbmp[0] := 0;
      PHeader^.Light.DepthCol := CardinalToRGB(0);
      PHeader^.Light.DepthCol2 := CardinalToRGB(0);
      PHeader^.Light.DynFogR := 0;
      PHeader^.Light.DynFogG := 0;
      PHeader^.Light.DynFogB := 0;
      PHeader^.Light.DynFogCol2 := CardinalToRGB(0);
    end;

    bCalcStop := False;
    d := MinCD(maxHeight / PHeader^.Height, maxWidth / PHeader^.Width);
    w := Round(PHeader^.Width * d);
    h := Max(2, Round(PHeader^.Height * d));
    bmp.PixelFormat := pf32Bit;
    bmp.Width  := w;
    bmp.Height := h;
    aFSIstart  := Integer(bmp.Scanline[0]);
    aFSIoffset := Integer(bmp.Scanline[1]) - aFSIstart;
    //->
    IniCFsFromHAddon(FMB3DParamsFacade.Core.PHAddOn, PHeader^.PHCustomF);
    //=>
    PHeader^.Width  := w;
    PHeader^.Height := h;
    if not Converted then
    begin
      PHeader^.sDEstop := PHeader^.sDEstop * d;
      PHeader^.sDOFclipR := PHeader^.sDOFclipR * d;
      Converted := True;
    end;
    PHeader^.bSliceCalc := 2;
    PHeader^.bHScalculated := 0;
    PHeader^.bStereoMode := 0;
    MakeLightValsFromHeaderLight(PHeader, @HeaderLightVals, 1, PHeader^.bStereoMode);

    SetLength(siLight5, w * h);
    R := Rect(0, 0, w - 1, h - 1);
    CalcThreadStats.pLBcalcStop := @bCalcStop;
    CalcThreadStats.iProcessingType := 1;
    CalcThreadStats.iAllProcessingOptions := AllAutoProcessings(PHeader);
    if not CalcMandT(PHeader, @HeaderLightVals, @CalcThreadStats, @siLight5[0], w * 18, aFSIstart, aFSIoffset, Rect(0, 0, w - 1, h - 1)) then Exit;
    iActiveThreads := CalcThreadStats.iTotalThreadCount;
    while (iActiveThreads > 0) and (not bCalcStop) do begin
      WaitForThreads(50);
      n := 0;
      for i := 1 to CalcThreadStats.iTotalThreadCount do
        if CalcThreadStats.CTrecords[i].isActive > 0 then Inc(n);
      if n = 0 then begin
        iActiveThreads := 0;
        CalcStepWidth(PHeader);
        c := CalcThreadStats.iProcessingType;
        if not bCalcStop then begin
          x := 1 shl c;
          while (x < 256) and ((CalcThreadStats.iAllProcessingOptions and x) = 0) do x := x shl 1;

          if (CalcThreadStats.iAllProcessingOptions and x) > 0 then begin  //next processing step
            CalcThreadStats.pLBcalcStop := @bCalcStop;
    //        CalcThreadStats.pMessageHwnd := Self.Handle;
            case x of // 2: NsOnZBuf, 4: hard shadow postcalc, 8: AO, 16: free, 32: reflections, 64: DOF
              2:  begin
                    CalcThreadStats.iProcessingType := 2;
                    try
                      NormalsOnZbuf(PHeader, @siLight5[0]);
                    finally
                      iActiveThreads := 1; //to go on
                      CalcThreadStats.iTotalThreadCount := 0;
                    end;
                  end;
              4:  begin
                    CalcThreadStats.iProcessingType := 3;
                    if CalcHardShadowT(PHeader, @CalcThreadStats, @siLight5[0], 18 * w, @HeaderLightVals, False, R) then
                      iActiveThreads := CalcThreadStats.iTotalThreadCount;
                  end;
              8:  begin
                    CalcThreadStats.iProcessingType := 4;
                    if CalcAmbShadowT(PHeader, @siLight5[0], 18 * w, @CalcThreadStats, @ATrousWLAni, R) then
                      iActiveThreads := CalcThreadStats.iTotalThreadCount;
                  end;
             32:  begin
                    CalcThreadStats.iProcessingType := 6;
                    PaintM(PHeader, @HeaderLightVals, @siLight5[0], aFSIstart, aFSIoffset);
                    if CalcSRT(PHeader, @HeaderLightVals, @CalcThreadStats, @siLight5[0], aFSIstart, aFSIoffset, R) then
                      iActiveThreads := CalcThreadStats.iTotalThreadCount;
                  end;
             64:  begin
                    CalcThreadStats.iProcessingType := 7;
                    try
                      if (CalcThreadStats.iAllProcessingOptions and 32) = 0 then
                        PaintM(PHeader, @HeaderLightVals, @siLight5[0], aFSIstart, aFSIoffset);
                      DoFrec.SL := @siLight5[0];
                      DoFrec.colSL := PCArdinal(aFSIstart);
                      DoFrec.MHeader := PHeader;
                      DoFrec.SLoffset := aFSIoffset;
                      DoFrec.Verbose := False;
                      for i := 0 to (PHeader^.bCalcDOFtype shr 1) and 3 do
                      begin
                        DoFrec.pass := i;
                        if ((PHeader^.bCalcDOFtype shr 3) and 1) = 1 then doDOF(DoFrec) else doDOFsort(DoFrec);
                      end;
                    except end;
                  end;
            end;
          end;
        end;
      end
    end;
    if not bCalcStop then
    begin
      if CalcThreadStats.iProcessingType < 6 then
        PaintM(PHeader, @HeaderLightVals, @siLight5[0], aFSIstart, aFSIoffset);
      bmp.Modified := True;
      if bhistory.Checked = True then
      begin
//-----------------------------------------------------------------------------------------------------------------------
      //-->
        MHeader:=PHeader^;
//      MHeader.PCFAddon := @FMB3DParamsFacade.Core.PHAddOn^;
//      for i := 0 to 5 do MHeader.PHCustomF[i] := @FMB3DParamsFacade.Core.FHybridCustoms[i];
//      StoreHistoryParsMutagen(MHeader);
//-----------------------------------------------------------------------------------------------------------------------
        try//todo: De. Duplication
          dt := Now; //create sub-folder guid
  //        tmpHF := IncludeTrailingPathDelimiter(HistoryFolder) + DateToStrHistory(dt);
          tmpHF := IncludeTrailingPathDelimiter(HistoryFolder) + DateToStrHistory(dt) + '-MutaGen';//folder
          if not DirectoryExists(tmpHF) then CreateDir(tmpHF);
          tmpHF := IncludeTrailingPathDelimiter(tmpHF) + TimeToStrHistory(dt);
          tmpHF := tmpHF + '{MutaGen-' + ChangeFileExt(sGen, '}');
          //tmpHF := ChangeFileExt('{' + '' + sGen + '}','.m3p'); ;
          //sfname := '{' + 'MutaGen-' + sGen + '}';
          //tmpHF := tmpHF + '{MutaGen-' + sGen + '}.m3p';//
          tmpHF := tmpHF + '.m3p';
          //------------------------------
          try
            MHeader:=PHeader^;
            AssignFile(f, tmpHF);
            Rewrite(f, 1);
            InsertAuthorsToPara(@MHeader, GUI.Authors);  //change author c.o. MutaGen
            try
              BlockWrite(f, MHeader, SizeOf(MHeader));
            finally
                 //GUI.IniMHeader;
                 //MHeader.PCFAddon := @HAddOn;
                 //for i := 0 to 5 do MHeader.PHCustomF[i] := @HybridCustoms[i];
              MHeader.PCFAddon := @FMB3DParamsFacade.Core.PHAddOn^;
              MHeader.Width  := 480;
              MHeader.Height := 360;
              for i := 0 to 5 do MHeader.PHCustomF[i] := @FMB3DParamsFacade.Core.FHybridCustoms[i];
            end;
            PTHeaderCustomAddon(MHeader.PCFAddon)^.bHCAversion := 16;
            BlockWrite(f, PTHeaderCustomAddon(MHeader.PCFAddon)^, SizeOf(THeaderCustomAddon));
          finally
            CloseFile(f);
          end;
          LastHisParSaveTime := Now;
        except
        end;
      end;
//-----------------------------------------------------------------------------------------------------------------------
    end;

end;

procedure TPreviewRenderer.SignalCancel;
begin
  bCalcStop := True;
end;
{$ENDREGION '========================================================================== > | TPreviewRenderer'}

{$ENDREGION '========================================================================== > | RENDERER'}

{$REGION '============================================================================= > | FORM'}
{MAIN}
procedure TfTEST.cb_historyClick(Sender: TObject);
begin
   //placeholder
end;

procedure TfTEST.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not FIsRunning;
end;

procedure TfTEST.FormCreate(Sender: TObject);
begin
  FMutationHistory := TObjectList.Create;
  FPanelList := CreatePanelList;
  FPanelList.DoLayout;
  RefreshMutateButtonCaption;
  InitProgress;
  InitOptionsPanel;
end;

procedure TfTEST.FormDestroy(Sender: TObject);
begin
  FMutationHistory.Free;
  FPanelList.Free;
  if FPreviewImageRenderer <> nil then
    FreeAndNil(FPreviewImageRenderer);
  if FProbingImageRenderer <> nil then
    FreeAndNil(FProbingImageRenderer);
end;

function TfTEST.CreatePanelList: TMutaGenPanelList;
const
  PnlXSize = 0.9;
  PnlYSize = 0.8;
  DLine = 0.05;
begin
  Result := TMutaGenPanelList.Create(MainPnl, 5.0, 4.0);
  FP_1 := TMutaGenPanel.Create(nil, miP_1, 0.0, -1.0, PnlXSize, PnlYSize, '1', Panel_1, Image_1);
  Result.AddPanel(FP_1);
    FP_1_1 := TMutaGenPanel.Create(FP_1, miP_1_1, -0.5, 0.0, PnlXSize, PnlYSize, '1', Panel_1_1, Image_1_1);
    Result.AddPanel(FP_1_1);
      FP_1_1_1 := TMutaGenPanel.Create(FP_1_1, miP_1_1_1, -1.5, -0.5, PnlXSize, PnlYSize, '1', Panel_1_1_1, Image_1_1_1);
      Result.AddPanel(FP_1_1_1);
        FP_1_1_1_1 := TMutaGenPanel.Create(FP_1_1_1, miP_1_1_1_1, -2.0, -1.5, PnlXSize, PnlYSize, '1', Panel_1_1_1_1, Image_1_1_1_1);
        Result.AddPanel(FP_1_1_1_1);
        FP_1_1_1_2 := TMutaGenPanel.Create(FP_1_1_1, miP_1_1_1_2, -1.0, -1.5, PnlXSize, PnlYSize, '2', Panel_1_1_1_2, Image_1_1_1_2);
        Result.AddPanel(FP_1_1_1_2);
      FP_1_1_2 := TMutaGenPanel.Create(FP_1_1, miP_1_1_2, -1.5, 0.5, PnlXSize, PnlYSize, '2', Panel_1_1_2, Image_1_1_2);
      Result.AddPanel(FP_1_1_2);
        FP_1_1_2_1 := TMutaGenPanel.Create(FP_1_1_2, miP_1_1_2_1, -2.0, 1.5, PnlXSize, PnlYSize, '1', Panel_1_1_2_1, Image_1_1_2_1);
        Result.AddPanel(FP_1_1_2_1);
        FP_1_1_2_2 := TMutaGenPanel.Create(FP_1_1_2, miP_1_1_2_2, -1.0, 1.5, PnlXSize, PnlYSize, '2', Panel_1_1_2_2, Image_1_1_2_2);
        Result.AddPanel(FP_1_1_2_2);
    FP_1_2 := TMutaGenPanel.Create(FP_1, miP_1_2, 0.5, 0.0, PnlXSize, PnlYSize, '2', Panel_1_2, Image_1_2);
    Result.AddPanel(FP_1_2);
      FP_1_2_1 := TMutaGenPanel.Create(FP_1_2, miP_1_2_1, 1.5, -0.5, PnlXSize, PnlYSize, '1', Panel_1_2_1, Image_1_2_1);
      Result.AddPanel(FP_1_2_1);
        FP_1_2_1_1 := TMutaGenPanel.Create(FP_1_2_1, miP_1_2_1_1, 1.0, -1.5, PnlXSize, PnlYSize, '1', Panel_1_2_1_1, Image_1_2_1_1);
        Result.AddPanel(FP_1_2_1_1);
        FP_1_2_1_2 := TMutaGenPanel.Create(FP_1_2_1, miP_1_2_1_2, 2.0, -1.5, PnlXSize, PnlYSize, '2', Panel_1_2_1_2, Image_1_2_1_2);
        Result.AddPanel(FP_1_2_1_2);
      FP_1_2_2 := TMutaGenPanel.Create(FP_1_2, miP_1_2_2, 1.5, 0.5, PnlXSize, PnlYSize, '2', Panel_1_2_2, Image_1_2_2);
      Result.AddPanel(FP_1_2_2);
        FP_1_2_2_1 := TMutaGenPanel.Create(FP_1_2_2, miP_1_2_2_1, 1.0, 1.5, PnlXSize, PnlYSize, '1', Panel_1_2_2_1, Image_1_2_2_1);
        Result.AddPanel(FP_1_2_2_1);
        FP_1_2_2_2 := TMutaGenPanel.Create(FP_1_2_2, miP_1_2_2_2, 2.0, 1.5, PnlXSize, PnlYSize, '2', Panel_1_2_2_2, Image_1_2_2_2);
        Result.AddPanel(FP_1_2_2_2);

   Result.AddPanelLink(0.5 - DLine, 1.0, poTop, FP_1, 0.5, 0.0, poBottom, FP_1_1);
     Result.AddPanelLink(0.0, 0.5 - DLine, poLeft, FP_1_1, 1.0, 0.5, poRight, FP_1_1_1);
       Result.AddPanelLink(0.5 - DLine, 0.0, poBottom, FP_1_1_1, 0.5, 1.0, poTop, FP_1_1_1_1);
       Result.AddPanelLink(0.5 + Dline, 0.0, poBottom, FP_1_1_1, 0.5, 1.0, poTop, FP_1_1_1_2);
     Result.AddPanelLink(0.0, 0.5 + DLine, poLeft, FP_1_1, 1.0, 0.5, poRight, FP_1_1_2);
       Result.AddPanelLink(0.5 - DLine, 1.0, poTop, FP_1_1_2, 0.5, 0.0, poBottom, FP_1_1_2_1);
       Result.AddPanelLink(0.5 + Dline, 1.0, poTop, FP_1_1_2, 0.5, 0.0, poBottom, FP_1_1_2_2);
   Result.AddPanelLink(0.5 + DLine, 1.0, poTop, FP_1, 0.5, 0.0, poBottom, FP_1_2);
     Result.AddPanelLink(1.0, 0.5 - DLine, poRight, FP_1_2, 0.0, 0.5, poLeft, FP_1_2_1);
       Result.AddPanelLink(0.5 - DLine, 0.0, poBottom, FP_1_2_1, 0.5, 1.0, poTop, FP_1_2_1_1);
       Result.AddPanelLink(0.5 + Dline, 0.0, poBottom, FP_1_2_1, 0.5, 1.0, poTop, FP_1_2_1_2);
     Result.AddPanelLink(1.0, 0.5 + DLine, poRight, FP_1_2, 0.0, 0.5, poLeft, FP_1_2_2);
       Result.AddPanelLink(0.5 - DLine, 1.0, poTop, FP_1_2_2, 0.5, 0.0, poBottom, FP_1_2_2_1);
       Result.AddPanelLink(0.5 + Dline, 1.0, poTop, FP_1_2_2, 0.5, 0.0, poBottom, FP_1_2_2_2);
 end;

procedure TfTEST.FormPaint(Sender: TObject);
var
  I: Integer;
begin
  if Assigned(FPanelList) then
    for I := 0 to FPanelList.LinkLinesList.Count -1 do
      TPanelLinkLine(FPanelList.LinkLinesList[I]).Draw(Canvas);
end;

procedure TfTEST.MainPnlResize(Sender: TObject);
begin
  if Assigned(FPanelList) then begin
    FPanelList.DoLayout;
    MainPnl.Invalidate;
    MainPnl.Repaint;
  end;
end;

procedure TfTEST.MutateBtnClick(Sender: TObject);
begin
  CreateMutation(Panel_1);
  lbl_gen.Caption := Panel_1.Caption;
end;

function TfTEST.GetInitialParams(Sender: TObject): TMutationParams;
var
  I: Integer;
  PrevSet: TMutationParamsSet;
  MutaGenPanel: TMutaGenPanel;
begin
  Result := nil;
  if FMutationHistory.Count > 0 then begin
    PrevSet := TMutationParamsSet(FMutationHistory[FCurrGenerationIndex]);
    for I := 0 to FPanelList.Count - 1 do begin
      MutaGenPanel := FPanelList.GetPanel(I);
      if ((Sender = MutaGenPanel.Panel) or (Sender=MutaGenPanel.Image)) and (PrevSet.Params[MutaGenPanel.MutationIndex]<>nil) then begin
        Result := PrevSet.Params[MutaGenPanel.MutationIndex];
        exit;
      end;
    end;
  end;
end;

procedure TfTEST.CreateMutation(Sender: TObject);
var
  CurrSet: TMutationParamsSet;
  InitialParams: TMutationParams;
  Config: TMutationConfig;

  function CreateInitialSet(const ToPanel, FromPanel: TMutaGenPanel): Boolean;
  var
    NewParams: TMB3DParamsFacade;
    NewBitmap: TBitmap;
  begin
    NewParams := InitialParams.Params.Clone;
    CurrSet.Params[ToPanel.MutationIndex].Params := NewParams;

    if InitialParams.Bitmap = nil then
      NewBitmap := CreatePreviewImage(ToPanel, CurrSet.Params[ToPanel.MutationIndex].Params )
    else
      NewBitmap := CloneBitmap( InitialParams.Bitmap );
    CurrSet.Params[ToPanel.MutationIndex].Bitmap := NewBitmap;

    ToPanel.Bitmap := CloneBitmap( NewBitmap );

    if Config.Probing then begin
      if InitialParams.ProbingBitmap = nil then
        NewBitmap := CreateProbingImage(Config, CurrSet.Params[ToPanel.MutationIndex].Params )
      else
        NewBitmap := CloneBitmap( InitialParams.ProbingBitmap );
      CurrSet.Params[ToPanel.MutationIndex].ProbingBitmap := NewBitmap;
    end;

    ProgressStep;
    Result := True;
  end;

  function CreateMutation(const ToPanel, FromPanel: TMutaGenPanel): Boolean;
  var
    I: Integer;
    NewParams: TMB3DParamsFacade;
    NewBitmap: TBitmap;
    ProbedParams: TProbedParamsList;
    Coverage, DiffCoverage: Double;
    BestParams: TProbedParams;
  begin
    if Config.Probing then begin
      ProbedParams := TProbedParamsList.Create(Config);
      try
        OutputDebugString(PChar('Probing...'));
        for I := 0 to Config.ProbingMaxCount -1  do begin
          NewParams := MutateParams( Config, CurrSet.Params[FromPanel.MutationIndex].Params );
          NewBitmap := CreateProbingImage(Config,  NewParams );
          if (NewBitmap = nil) or FForceAbort then begin
            Result := False;
            Exit;
          end;
          Coverage := TMutationCoverage.CalcFilteredCoverage(NewBitmap);
          DiffCoverage := TMutationCoverage.CalcDiffCoverage(NewBitmap, CurrSet.Params[FromPanel.MutationIndex].ProbingBitmap);
          ProbedParams.AddProbedParam( TProbedParams.Create(NewParams, Coverage, DiffCoverage, NewBitmap ) );

          BestParams := ProbedParams.GetBestValidParam;
          if (BestParams <> nil) and (BestParams.Coverage >= Config.ProbingMinCoverage)  then
            break;
          OutputDebugString(PChar('  '+IntToStr(I)));
        end;
        OutputDebugString(PChar('Done...'));
        BestParams := ProbedParams.GetBestValidParam;
        if BestParams = nil then
          BestParams := ProbedParams.GetBestInvalidParam;

        NewParams := BestParams.ExtractParams;
        CurrSet.Params[ToPanel.MutationIndex].Params := NewParams;
        CurrSet.Params[ToPanel.MutationIndex].ProbingBitmap := BestParams.ExtractProbingBitmap;
        //// For Debugging
        // Probing Bitmap;
        //   NewBitmap := CloneBitmap(CurrSet.Params[ToPanel.MutationIndex].ProbingBitmap);
        // Filtered Bitmap:
        //   NewBitmap := TMutationCoverage.CreateFilteredImage(CurrSet.Params[ToPanel.MutationIndex].ProbingBitmap);
        //// Regular display
        NewBitmap := CreatePreviewImage(ToPanel,  CurrSet.Params[ToPanel.MutationIndex].Params );

        CurrSet.Params[ToPanel.MutationIndex].Bitmap := NewBitmap;

        if NewBitmap = nil then begin
          Result := False;
          Exit;
        end;
        ToPanel.Bitmap := CloneBitmap( NewBitmap );
      finally
        ProbedParams.Free;
      end;
    end
    else begin
      NewParams := MutateParams( Config, CurrSet.Params[FromPanel.MutationIndex].Params );
      CurrSet.Params[ToPanel.MutationIndex].Params := NewParams;

      NewBitmap := CreatePreviewImage(ToPanel,  CurrSet.Params[ToPanel.MutationIndex].Params );
      CurrSet.Params[ToPanel.MutationIndex].Bitmap := NewBitmap;
      if NewBitmap = nil then begin
        Result := False;
        Exit;
      end;

      ToPanel.Bitmap := CloneBitmap( NewBitmap );
    end;

    ProgressStep;
    Result := not FForceAbort;
  end;

  function CreateAndRenderMutation(const ToPanel, FromPanel: TMutaGenPanel): Boolean;
  begin
    if FromPanel = nil then
      Result := CreateInitialSet( ToPanel, FromPanel )
    else
      Result := CreateMutation( ToPanel, FromPanel );
  end;

begin
  if FIsRunning then begin
    SignalCancel;
    Exit;
  end;

  InitialParams := GetInitialParams( Sender );
  if InitialParams = nil then
    exit;

  FIsRunning := True;
  try
    EnableControls;
    RefreshMutateButtonCaption;
    ClearPanels;
    FForceAbort := False;

    Config := CreateMutationConfig;
    try
      CurrSet := AddGeneration;
      InitProgress;

      if not CreateAndRenderMutation(FP_1, nil) then
        exit;
      FP_1.Panel.Caption := CurrSet.Params[miP_1].Params.UUID;

      if not CreateAndRenderMutation(FP_1_1, FP_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_2, FP_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_1_1, FP_1_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_2_1, FP_1_2) then
        exit;
      if not CreateAndRenderMutation(FP_1_1_2, FP_1_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_2_2, FP_1_2) then
        exit;
      if not CreateAndRenderMutation(FP_1_1_1_1, FP_1_1_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_1_2_1, FP_1_1_2) then
        exit;
      if not CreateAndRenderMutation(FP_1_2_1_1, FP_1_2_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_2_2_1, FP_1_2_2) then
        exit;
      if not CreateAndRenderMutation(FP_1_1_1_2, FP_1_1_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_1_2_2, FP_1_1_2) then
        exit;
      if not CreateAndRenderMutation(FP_1_2_1_2, FP_1_2_1) then
        exit;
      if not CreateAndRenderMutation(FP_1_2_2_2, FP_1_2_2) then
        exit;
    finally
      Config.Free;
    end;
  finally
    FIsRunning := False;
    RefreshMutateButtonCaption;
    InitProgress;
    EnableControls;
  end;
end;

procedure TfTEST.InitProgress;
begin
  ProgressBar.Position := 0;
end;

procedure TfTEST.Panel_1DblClick(Sender: TObject);
begin
  CreateMutation(Sender);
end;

procedure TfTEST.ProgressStep;
begin
  ProgressBar.StepIt;
  ProgressBar.Repaint;
  Application.ProcessMessages;
end;

procedure TfTEST.RefreshMutateButtonCaption;
begin
  if FIsRunning then
    MutateBtn.Caption := 'Cancel'
  else
    MutateBtn.Caption := 'Mutate!';
  MutateBtn.Repaint;
end;

procedure TfTEST.RestartFromMain;
begin
  ClearPanels;
  CreateInitialSet;
end;

procedure TfTEST.ToClipboardItmClick(Sender: TObject);
var
  Params: TMutationParams;
  Caller: TObject;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  Params := GetInitialParams( Caller );
  if Params = nil then
    raise Exception.Create('No params to send to main editor');
  CopyHeaderAsTextToClipBoard(Params.Params.Core.PHeader, CreateParamsCaption(Params.Params));
end;

procedure TfTEST.SendtoMainItmClick(Sender: TObject);
begin
  if GUI.IsCalculating then
    raise Exception.Create('The main editor is still rendering. Please stop it first or wait until it is done.');
  ToClipboardItmClick(Sender);
  GUI.sb_ClipBrd_InClick(Sender); // SpeedButton_M_8
end;

function TfTEST.CreateParamsCaption(const Params: TMB3DParamsFacade): String;
begin
  Result := 'MutaGen-' + Params.UUID;
end;

function TfTEST.MutateParams(Config: TMutationConfig;const Params: TMB3DParamsFacade): TMB3DParamsFacade;
var
  I: Integer;
  Mutations: TList;
begin
  Mutations := TMutationCreator.CreateMutations(Config);
  try
    Result := Params.Clone;
    for I := 0 to Mutations.Count-1 do begin
      Result := TMutation(Mutations[I]).MutateParams(Result);
    end;
  finally
    Mutations.Free;
  end;
end;

function TfTEST.CreateMutationConfig: TMutationConfig;
begin
  Result := TMutationConfig.Create;
  Result.ModifyFormulaWeight := ModifyFormulaWeightTBar.Position / TBAR_SCALE;
  Result.ModifyParamsWeight := ModifyParamsWeightTBar.Position / TBAR_SCALE;
  Result.ModifyParamsStrength := ModifyParamsStrengthTBar.Position / TBAR_SCALE;
  Result.ModifyJuliaModeWeight := ModifyJuliaModeWeightTBar.Position / TBAR_SCALE;
  Result.ModifyJuliaModeStrength := ModifyJuliaModeStrengthTBar.Position / TBAR_SCALE;
  Result.ModifyIterationCountWeight := ModifyIterationCountWeightTBar.Position / TBAR_SCALE;
  Result.ModifyIterationCountStrength := ModifyIterationCountStrengthTBar.Position / TBAR_SCALE;
end;

procedure TfTEST.InitOptionsPanel;
var
  Config:TMutationConfig;
begin
  Config:=TMutationConfig.Create;
  try
    ModifyFormulaWeightTBar.Position := Round(TBAR_SCALE * Config.ModifyFormulaWeight);
    ModifyParamsWeightTBar.Position := Round(TBAR_SCALE * Config.ModifyParamsWeight);
    ModifyParamsStrengthTBar.Position := Round(TBAR_SCALE * Config.ModifyParamsStrength);
    ModifyJuliaModeWeightTBar.Position := Round(TBAR_SCALE * Config.ModifyJuliaModeWeight);
    ModifyJuliaModeStrengthTBar.Position := Round(TBAR_SCALE * Config.ModifyJuliaModeStrength);
    ModifyIterationCountWeightTBar.Position := Round(TBAR_SCALE * Config.ModifyIterationCountWeight);
    ModifyIterationCountStrengthTBar.Position := Round(TBAR_SCALE * Config.ModifyIterationCountStrength);
  finally
    Config.Free;
  end;
end;

procedure TfTEST.DisableAllBtnClick(Sender: TObject);
begin
  ModifyFormulaWeightTBar.Position := 0;
  ModifyParamsWeightTBar.Position := 0;
  ModifyJuliaModeWeightTBar.Position := 0;
  ModifyIterationCountWeightTBar.Position := 0;
end;

procedure TfTEST.CreateInitialSet;
var
  CurrSet: TMutationParamsSet;
  NewBitmap: TBitmap;
begin
  CurrSet := AddGeneration;
  CurrSet.Params[miP_1].Params := TMB3DParamsFacade.Create(GUI.MHeader, GUI.HAddOn);
  NewBitmap := CreatePreviewImage(FP_1, CurrSet.Params[miP_1].Params );
  CurrSet.Params[miP_1].Bitmap := NewBitmap;
  //if True then
  FP_1.Bitmap         := CloneBitmap( NewBitmap );
  FP_1.Panel.Caption  := CurrSet.Params[miP_1].Params.UUID;

end;

function TfTEST.AddGeneration:TMutationParamsSet;
begin
  Result := TMutationParamsSet.Create;
  FCurrGenerationIndex := FMutationHistory.Count;
  FMutationHistory.Add(Result);
  RefreshGenerationLabel;
end;

procedure TfTEST.RefreshGenerationLabel;
begin
  GenerationEdit.Text := 'Generation '+IntToStr(FCurrGenerationIndex+1)+' of '+IntToStr(FMutationHistory.Count);
end;

function TfTEST.CreateBlankBitmap(const Width, Height: Integer): TBitmap;
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf32Bit;
  Result.Width  := Width;
  Result.Height := Height;
  Result.Canvas.Brush.Color := ColorToRGB(clBackground);
  Result.Canvas.FillRect(Rect(0,0, Width, Height));
end;

procedure TfTEST.ClearPanels;
var
  I: Integer;
  Panel: TMutaGenPanel;
begin
  for I := 1 to FPanelList.Count-1 do begin
    Panel := FPanelList.GetPanel(I);
    Panel.Bitmap := CreateBlankBitmap(Panel.ImageWidth, Panel.ImageHeight);
  end;
end;

function TfTEST.CloneBitmap(const Src: TBitmap): TBitmap;
begin
  Result := TBitmap.Create;
  Result.Assign(Src);
end;

procedure TfTEST.ReDisplayCurrGeneration;
var
  I: Integer;
  Panel: TMutaGenPanel;
  CurrSet: TMutationParamsSet;
  bmp: TBitmap;
begin
  if (FCurrGenerationIndex >= 0) and (FCurrGenerationIndex < FMutationHistory.Count) then begin
    CurrSet := TMutationParamsSet( FMutationHistory[FCurrGenerationIndex] );
    for I := 0 to FPanelList.Count-1 do begin
      Panel := FPanelList.GetPanel(I);
      bmp := CurrSet.Params[Panel.MutationIndex].Bitmap;
      if bmp = nil then
        bmp := CreateBlankBitmap(Panel.ImageWidth, Panel.ImageHeight);
      Panel.Bitmap := bmp;
      if Panel.MutationIndex = miP_1 then begin
        Panel.Panel.Caption := CurrSet.Params[Panel.MutationIndex].Params.UUID;
      end;
    end;
  end;
end;

procedure TfTEST.GenerationBtnClick(Sender: TObject; Button: TUDBtnType);
begin
  if (Button = btNext) and (FCurrGenerationIndex < FMutationHistory.Count - 1) then begin
    FCurrGenerationIndex := FCurrGenerationIndex + 1;
    ReDisplayCurrGeneration;
    RefreshGenerationLabel;
  end
  else if (Button = btPrev) and (FCurrGenerationIndex > 0) then begin
    FCurrGenerationIndex := FCurrGenerationIndex - 1;
    ReDisplayCurrGeneration;
    RefreshGenerationLabel;
  end;
end;

procedure TfTEST.EnableControls;
begin
  GenerationBtn.Enabled := not FIsRunning;
  ClearPrevGenerations.Enabled := not FIsRunning;
  DisableAllBtn.Enabled := not FIsRunning;
end;

procedure TfTEST.ClearPrevGenerationsClick(Sender: TObject);
var
  I, DeleteTo: Integer;
begin
  if (FCurrGenerationIndex > 0) and (FCurrGenerationIndex < FMutationHistory.Count) then begin
    if MessageDlg('Do you really want to clear all previous generations?', mtConfirmation, mbYesNo, 0) = mrYes then begin
      DeleteTo := FCurrGenerationIndex - 1;
      FCurrGenerationIndex := 0;
      try
        for I := 0 to DeleteTo do
          FMutationHistory.Delete(0);
      finally
        RefreshGenerationLabel;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TfTEST.CreatePreviewImage(const Panel: TMutaGenPanel; const Params: TMB3DParamsFacade): TBitmap;
begin
  if FPreviewImageRenderer <> nil then FreeAndNil(FPreviewImageRenderer);
  Result := TBitmap.Create;
  try
    FPreviewImageRenderer := TPreviewRenderer.Create(Params);
    try
      FPreviewImageRenderer.RenderPreview(Result, Panel.ImageWidth, Panel.ImageHeight, cb_history, Panel_1.Caption ); //Params.UUID FP_1.Panel.Caption
    finally
      FreeAndNil( FPreviewImageRenderer );
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TfTEST.CreateProbingImage(Config: TMutationConfig; const Params: TMB3DParamsFacade): TBitmap;
begin
  if FProbingImageRenderer <> nil then FreeAndNil(FProbingImageRenderer);
  Result := TBitmap.Create;
  try
    FProbingImageRenderer := TPreviewRenderer.Create(Params);
    try
      FProbingImageRenderer.BlankBackground := True;
      FProbingImageRenderer.RenderPreview(Result, Config.ProbingWidth, Config.ProbingHeight, cb_probing, Panel_1.Caption );
    finally
      FreeAndNil( FProbingImageRenderer );
    end;
  except
    Result.Free;
    raise;
  end;
end;
//------------------------------------------------------------------------------
procedure TfTEST.SignalCancel;
begin
  FForceAbort := True;
  if FPreviewImageRenderer<>nil then
    FPreviewImageRenderer.SignalCancel;
  if FProbingImageRenderer<>nil then
    FProbingImageRenderer.SignalCancel;
end;

procedure TCategoryPanel.DrawCollapsedPanel(ACanvas: TCanvas);
var
  LRect: TRect;
begin
  LRect := ClientRect;
  LRect.Top := HeaderHeight;
  LRect.Bottom := GetCollapsedHeight;
  ACanvas.Brush.Color := Color;
  ACanvas.FillRect(LRect);
end;

{$ENDREGION '========================================================================== > | FORM'}

{MUTAGEN}
{ ----------------------------------- Main ----------------------------------- }
initialization
  AllFormulaNames := nil;
  RandGen := TRandGen.Create;
finalization
  if AllFormulaNames<>nil then
    AllFormulaNames.Free;
  RandGen.Free;
end.

