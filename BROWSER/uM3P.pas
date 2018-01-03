unit uM3P;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  JvDriveCtrls, JvExStdCtrls, JvListBox, Vcl.Mask, JvExMask, JvToolEdit,
  JvBaseDlg, JvFindFiles, Vcl.FileCtrl, Vcl.ExtDlgs, JvCombobox, JvExControls, JvgImage,
  System.Contnrs,
  FileHandling,
  TypeDefinitions,
  DivUtils,
  Math3D;


type
  TfM3P = class(TForm)
    sb_start: TSpeedButton;
    ctrlPanel: TPanel;
    Edit_N_3: TEdit;
    HiQ: TCheckBox;
    Label_N_27: TLabel;
    Label_N_28: TLabel;
    Label_N_29: TLabel;
    Label_N_30: TLabel;
    Label_N_8: TLabel;
    lbl_Active: TLabel;
    MainPnl: TPanel;
    OpenDialog_P_1: TOpenDialog;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Panel_1: TPanel;
    RadioGroup_N_2: TRadioGroup;
    SaveTextFileDialog1: TSaveTextFileDialog;
    ScrollBox1: TScrollBox;
    SpeedButton_N_P_TO_MAIN_14: TSpeedButton;
    Timer_P_1: TTimer;
    JvDirectoryListBox1: TJvDirectoryListBox;
    JvDriveCombo1: TJvDriveCombo;
    JvFilenameEdit1: TJvFilenameEdit;
    JvFindFilesDialog1: TJvFindFilesDialog;
    JvFileListBox1: TJvFileListBox;
    Image_1: TImage;
    JvgBitmapImage1: TJvgBitmapImage;
    Label1: TLabel;
    procedure JvDriveCombo1Change(Sender: TObject);
    procedure JvDirectoryListBox1Change(Sender: TObject);
    procedure JvFileListBox1Change(Sender: TObject);
    procedure sb_startClick(Sender: TObject);

  private
    Authors: AuthorStrings;

    CalcThreadStats: TCalcThreadStats;
    bCalcStop: LongBool;
    FProgress: Double;
    FBlankBackground: Boolean;
    aFSIstart: Integer;
    aFSIoffset: Integer;
    Converted: LongBool;
    HeaderLightVals: TLightVals;
    siLight5: array of TsiLight5;
    iActiveThreads: Integer;
    procedure change;
    function LoadParameterM3P(var Para10: TMandHeader10; FileName: String; Verbose: LongBool): Boolean;
    procedure RenderPreview(var bmp: TBitmap;  maxWidth, maxHeight: Integer; Header: TMandHeader10);
//    procedure Calc;
  public

  end;

var
  fM3P: TfM3P;
  Header: TMandHeader10;
  HAddOn: THeaderCustomAddon;
  //MCTparas: Array [0..64] of TMCTparameter;

implementation
//uses Calc ?? rename ??;

uses
  MAIN,
  HeaderTrafos,
  System.Math,
  Interpolation,
  CustomFormulas,
  DOF,
  Calc,
  ImageProcess,
  CalcHardShadow,
  Paint,
  CalcSR;

{$R *.dfm}

procedure TfM3P.sb_startClick(Sender: TObject);
begin
  change;
end;


procedure TfM3P.change;
var bmp: TBitmap;
begin
   LoadParameterM3P(Header, JvFilenameEdit1.FileName, True);
   bmp := TBitmap.Create;
//  RenderPreview(bmp, JvgBitmapImage1.Width, JvgBitmapImage1.Height, Header );
   RenderPreview(bmp, Image_1.Width, Image_1.Height, Header )
end;

procedure TfM3P.JvDirectoryListBox1Change(Sender: TObject);
begin
  JvFileListBox1.Directory := JvDirectoryListBox1.Directory;
end;
//
procedure TfM3P.JvDriveCombo1Change(Sender: TObject);
begin
  JvDirectoryListBox1.Drive := JvDriveCombo1.Drive;
  JvFileListBox1.Drive := JvDriveCombo1.Drive;
  JvFileListBox1.Directory := JvDirectoryListBox1.Directory;
end;
//
procedure TfM3P.JvFileListBox1Change(Sender: TObject);
begin
   JvFilenameEdit1.FileName := JvFileListBox1.FileName;
end;

procedure TfM3P.RenderPreview(var bmp: TBitmap;  maxWidth, maxHeight: Integer; Header: TMandHeader10);
var      //todo called in RegisterM3Pgraphic !! preview m3p in dialog box like m3i
  d: Double;
  w, h, i, x, n, c: Integer;
  R: TRect;
  DoFrec: TDoFrec;
  //MHeader: TMandHeader10;
  PHeader: TPMandHeader10;
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
    FProgress                   := 0;
    PHeader                     := @Header;//FMB3DParamsFacade.Core.PHeader;
    PHeader^.bCalc3D            := 1;
    PHeader^.bVolLightNr        := 2 shl 4;
    PHeader^.mZstepDiv          := 0.5;
    PHeader^.sRaystepLimiter    := 1.0;

    if FBlankBackground then begin
      PHeader^.Light.BGbmp[0]   := 0;
      PHeader^.Light.DepthCol   := CardinalToRGB(0);
      PHeader^.Light.DepthCol2  := CardinalToRGB(0);
      PHeader^.Light.DynFogR    := 0;
      PHeader^.Light.DynFogG    := 0;
      PHeader^.Light.DynFogB    := 0;
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
    //IniCFsFromHAddon(FMB3DParamsFacade.Core.PHAddOn, PHeader^.PHCustomF);
    IniCFsFromHAddon(PHeader.PCFAddon, PHeader^.PHCustomF);
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
                    if CalcHardShadowT(PHeader, @CalcThreadStats, @siLight5[0], 18 * w, @HeaderLightVals, False, R) then iActiveThreads := CalcThreadStats.iTotalThreadCount;
                  end;
              8:  begin
                    CalcThreadStats.iProcessingType := 4;
                    if CalcAmbShadowT(PHeader, @siLight5[0], 18 * w, @CalcThreadStats, @ATrousWLAni, R) then iActiveThreads := CalcThreadStats.iTotalThreadCount;
                  end;
             32:  begin
                    CalcThreadStats.iProcessingType := 6;
                    PaintM(PHeader, @HeaderLightVals, @siLight5[0], aFSIstart, aFSIoffset);
                    if CalcSRT(PHeader, @HeaderLightVals, @CalcThreadStats, @siLight5[0], aFSIstart, aFSIoffset, R) then iActiveThreads := CalcThreadStats.iTotalThreadCount;
                  end;
             64:  begin
                    CalcThreadStats.iProcessingType := 7;
                    try
                      if (CalcThreadStats.iAllProcessingOptions and 32) = 0 then PaintM(PHeader, @HeaderLightVals, @siLight5[0], aFSIstart, aFSIoffset);
                      DoFrec.SL := @siLight5[0];
                      DoFrec.colSL := PCArdinal(aFSIstart);
                      DoFrec.MHeader := PHeader; //xchange pointer to header
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
      if CalcThreadStats.iProcessingType < 6 then PaintM(PHeader, @HeaderLightVals, @siLight5[0], aFSIstart, aFSIoffset);
      bmp.Modified := True;
//-----------------------------------------------------------------------------------------------------------------------
    end;

end;


function TfM3P.LoadParameterM3P(var Para10: TMandHeader10; FileName: String; Verbose: LongBool): Boolean;
var f: file;
    d: Double;
    MId, i: Integer;
    p: TP6;
    MandHeader4: TMandHeader4;
    para9: TMandHeader9;
    TileSize: TPoint;
begin
    SaveHeaderPointers(@para10, p);
    Result := False;
    //LastHisParSaveTime := Now;
    if FileExists(FileName) then
    try
      //if Verbose then GUI.OutMessage('Loading: ' + ChangeFileExtSave(ExtractFileName(FileName), ''));
      AssignFile(f, FileName);
      Reset(f, 1);
      BlockRead(f, MId, 4);
      if (MId < 0) or (MId > 250) or (FileSize(f) < 100) then Exit;
      Seek(f, 0);
      if MId < 4 then begin
        BlockRead(f, MandHeader4, SizeOf(TMandHeaderOld));
        FillChar(MandHeader4.dFOVy, 72, 0);
      end
      else if MId < 7 then BlockRead(f, MandHeader4, SizeOf(TMandHeader4))
      else if MId < 8 then BlockRead(f, Para9, SizeOf(TMandHeader9) - 124)
      else if MId < 20 then BlockRead(f, Para9, SizeOf(TMandHeader9))
      else BlockRead(f, Para10, SizeOf(TMandHeader10));
      //BlockRead(f, Para10, SizeOf(TMandHeader10));
      if (MId < 5) and (MandHeader4.dZstart > MandHeader4.dZend) then begin
        MandHeader4.dZstart := - MandHeader4.dZstart;
        MandHeader4.dZend   := - MandHeader4.dZend;
        d                   := MandHeader4.dXrot;
        MandHeader4.dXrot   := MandHeader4.dYrot * Pid180;
        MandHeader4.dYrot   := d * Pid180;
        MandHeader4.Light.Cols[7] := MandHeader4.Light.Cols[4];
        MandHeader4.Light.Cols[8] := MandHeader4.Light.Cols[5];
        MandHeader4.Light.Cols[9] := MandHeader4.Light.Cols[6];
      end;
      if MId < 5 then MandHeader4.dZmid := (MandHeader4.dZstart + MandHeader4.dZend) * 0.5
      else if (MId = 5) and ((MandHeader4.iOptions and 15) = 10) then begin
        MandHeader4.dPow := (MandHeader4.iOptions shr 18) and 3;
        i := (MandHeader4.iOPtions and $38000) shr 1;
        MandHeader4.iOptions := (MandHeader4.iOptions and $7FFC3FFF) or i;
      end;
      if MId < 7 then begin
        if MId < 6 then MandHeader4.bHScalculated := 1;
        MandHeader4.Light.TBoptions := MandHeader4.Light.TBoptions or (43 shl 11);
        Convert4to7paras(MandHeader4, TMandHeader8(Para9));
      end
      else if MId < 8 then ConvertFromOldLightParas(Para9.Light, 148);
      para10.MandId := MId;
      Authors := ExtractAuthorsFromPara(@para10);   //if MId > 40
      InsertHeaderPointers(@para10, p);
      if MId < 20 then begin
        for i := 0 to 5 do para9.PHCustomF[i] := p[i];
        Para9.PCFAddon := p[6];
        Result := ConvertHeaderFromOldParas(TMandHeader8(Para9), True);
        FastMove(Para9, Para10, SizeOf(TMandHeader9));
        ConvertLight8to9(Para9.Light, Para10.Light);
      end
      else begin
        Result := True;
        if Verbose then LoadBackgroundPicT(@Para10.Light);
      end;
      if Result and Verbose then begin  //not verbose only for canload test
        if MId > 15 then begin //Load HAddon
          if MId > 17 then begin
            if MId > 18 then begin
              if MId < 35 then para10.TilingOptions := 0;
              TileSize := GetTileSize(@para10);
              i := TileSize.X * TileSize.Y * SizeOf(TsiLight5);
            end
            else i := Para10.Width * Para10.Height * SizeOf(TsiLight4);
          end
          else i := Para10.Width * Para10.Height * SizeOf(TsiLight3);

        //i := Para10.Width * Para10.Height * SizeOf(TsiLight3);
        if FileSize(f) >= FilePos(f) + i + SizeOf(THeaderCustomAddonOld) then Seek(f, FilePos(f) + i);
        LoadHAddon(f, PTHeaderCustomAddon(Para10.PCFAddon));

        end;
        if MId < 20 then UpdateFormulaOptionTo20(PTHeaderCustomAddon(Para10.PCFAddon));
        UpdateFormulaOptionAbove20(para10);
        UpdateLightParasAbove3(para10.Light);
        IniCFsFromHAddon(PTHeaderCustomAddon(Para10.PCFAddon), Para10.PHCustomF);
        HAddOn.bHCAversion := 16;//test
        bSRVolLightMapCalculated := False;

        //GUI.SetEditsFromHeader; //scale
        //GUI.allPreSetsUp;
        //GUI.MButtonsUp;
        //GUI.InternAspect := para10.Width / Max(1, para10.Height);

        //Image_1
        FastMove(Header.Light, LHPSLight, SizeOf(TLightingParas9));
        //GUI.bUserChangeL := False;{LIGHT}
        //GUI.CheckBox_L_21.Checked := False;{LIGHT}


        //GUI.SetLightFromHeader(Para10);{LIGHT}


        //StoreUndoLight;
        //if Para10.Light.BGbmp[0] = 0 then GUI.Image_L_5.Visible := False else
        //  MakeLMPreviewImage(GUI.Image_L_5, @M3DBackGroundPic);{LIGHT}
        //SetSaveDialogNames(FileName);

        Label1.Caption := ExtractFileName(FileName);
        //GUI.Label_M_1.Caption := '';
      end;
    finally
      CloseFile(f);
    end;
   // Calc;
end;

//procedure PaintZeroVec;
//var v: TVec3D;
//    m: TMatrix3;
//    s, sx, sy, sx2, sy2: Single;
//    i: Integer;
//begin
//    with tmpBMP.Canvas do
//    begin
//      Brush.Color := clWhite;
//      FillRect(ClipRect);
//      m := NormaliseMatrixTo(1, @NaviHeader.hVGrads);
//      mCopyVec(@v, @NaviHeader.dXmid);
//      RotateVector(@v, @m);
//      NormaliseVectorVar(v);
//      if v[2] > 0 then Pen.Color := $50A0 else Pen.Color := $A000;
//      Brush.Color := Pen.Color;
//      s := 0.666666 * (3 + v[2]);
//      MoveTo(40, 38);
//      sx := 40 - v[0] * 18 * s;
//      sy := 38 - v[1] * 18 * s;
//      Pen.Width := 3;
//      LineTo(Round(sx), Round(sy));
//      Pen.Width := 2;
//      for i := 1 to 4 do
//      begin
//        sx2 := sx + v[0] * s * i * 2;
//        sy2 := sy + v[1] * s * i * 2;
//        Ellipse(Round(sx2 - s * i), Round(sy2 - s * i),
//                Round(sx2 + s * i), Round(sy2 + s * i));
//      end;
//    end;
//    SetStretchBltMode(Image2.Canvas.Handle, HALFTONE);
//    StretchBlt(Image2.Canvas.Handle, 0, 0, 40, 38,
//               tmpBMP.Canvas.Handle, 0, 0, 80, 76, SRCCOPY);
//    Image2.Invalidate;
//end;

//procedure PaintCoord;  //direct to bmp
//var m: TMatrix3;
//    sx, sy, sx2, sy2, tipsize: Single;
//    i, i2: Integer;
//    sorta: array[0..2] of Integer;
//const ca: array[0..2] of Cardinal = ($50FF,$40F030,$FFB000);
//begin
//  if not cb_coords.Checked then Image_N_6.Visible := False else
//  with Image_N_6.Picture.Bitmap.Canvas do
//  begin
//    Image_N_6.Transparent := False;
//    Font.Style := [fsBold];
//    Brush.Color := clBlack;
//    FillRect(ClipRect);
//    SetBkMode(Handle, TRANSPARENT);
//    m := NormaliseMatrixTo(1, @NaviHeader.hVGrads);
//    for i := 0 to 2 do sorta[i] := i;
//    if m[2, 0] < m[2, 1] then FlipI(sorta[0], sorta[1]);
//    if m[2, sorta[1]] < m[2, 2] then FlipI(sorta[1], sorta[2]);
//    if m[2, sorta[0]] < m[2, sorta[1]] then FlipI(sorta[0], sorta[1]);
//    for i := 0 to 2 do
//    begin
//      i2 := sorta[i];
//      Pen.Width := 2;
//      Pen.Color := ca[i2];
//      MoveTo(60, 60);
//      sx := 60 + m[0, i2] * 38;
//      sy := 60 + m[1, i2] * 38;
//      LineTo(Round(sx), Round(sy));
//      //tip:
//      tipsize := (2 - m[2, i2]) * 2 / MaxCS(0.1, Sqrt(Sqr(m[0, i2]) + (Sqr(m[1, i2]))));
//      sx2 := sx - m[0, i2] * 8 - m[1, i2] * tipsize;
//      sy2 := sy - m[1, i2] * 8 + m[0, i2] * tipsize;
//      LineTo(Round(sx2), Round(sy2));
//      MoveTo(Round(sx), Round(sy));
//      sx2 := sx - m[0, i2] * 8 + m[1, i2] * tipsize;
//      sy2 := sy - m[1, i2] * 8 - m[0, i2] * tipsize;
//      LineTo(Round(sx2), Round(sy2));
//      tipsize := (3 - m[2, i2]) * 4;
//      Font.Color := Pen.Color;
//      Font.Size := Round(-tipsize);
//      sx := sx + m[0, i2] * tipsize * 0.8;
//      sy := sy + m[1, i2] * tipsize * 0.8;
//      TextOut(Round(sx) - Round(tipsize * 0.35), Round(sy) - Round(tipsize * 0.7), Chr(Ord('X') + i2));
//    end;
//    Image_N_6.Transparent := True;
//    if not Image_N_6.Visible then Image_N_6.Visible := True;
//  end;
//end;

{
procedure TfM3P.Calc;
var I, x, nThreadCount: Integer;
    bAllOK: LongBool;
    //CalcThread: array of TNaviCalcThread;
    v3: TVec3D; t3:TMatrix3;
begin
//  GUI.bHideMessages := True;
//  bAllOK := False;
//  try
//    nThreadCount := Min(GUI.UpDownThread.Position, NaviHeader.Height);
//    if Nstep = 8 then
//    begin
//      with Header do
//      begin
        //Label_N_24.Caption := FloatToStrF(dZoom, ffGeneral, 4, 1);
        //if dZoom > 1e13 then Label_N_24.Font.Color := clRed else Label_N_24.Font.Color := clWindowText;

        //SetWindowSize(pn_bottom.Visible);
//        if Moving then   //if objectparts are nearer than DE..
//          NDEmultiplier := NDEmultiplier * MinMaxCD(0.5, NminDEcorrection * (dZoom * Width) / (LengthOfSize(@NaviHeader) * 2), 1);
          //  LengthOfSize(@NaviHeader) * 2 / (dZoom * Width) :=  AbsDE;
//        NminDEcorrection            := 1000;
//        mZstepDiv        := 0.7 - 0.35 * (Byte(cb_HiQ.Checked) and 1);
//        sRaystepLimiter  := MaxCS(sRaystepLimiter, mZstepDiv * 0.5);
//        bCalc3D          := 1;
//        dFOVy            := StrToFloatK(eFOV.Text);
//        bPlanarOptic     := rg_cam.ItemIndex;
//
//        eXrot.Text    := FloatToStr(v3[0] / Pid180);
//        eYrot.Text    := FloatToStr(v3[1] / Pid180);
//        eZrot.Text    := FloatToStr(v3[2] / Pid180);
//

//        if cb_zoom.Checked then eZoom.Value:=dZoom;
//
//        eXmid.Text    := FloatToStr(dXmid);
//        eYmid.Text    := FloatToStr(dYmid);
//        eZmid.Text    := FloatToStr(dZmid);
//        eZstart.Text  := FloatToStr(dZstart);
//        eZend.Text    := FloatToStr(dZend);
//
//        bGetMCTPverbose             := False;
//      end;
//      for I := 0 to nThreadCount - 1 do begin
        MCTparas[0]               := getMCTparasFromHeader(Header, True);
//        bGetMCTPverbose           := I = 0;
        if MCTparas[0].DEoption = 20 then MCTparas[0].iDEAddSteps := 7 else MCTparas[0].iDEAddSteps := 4;
//        MakeLightValsFromHeaderLightNavi(@NaviHeader, @NaviLightVals, 1);
        MCTparas[0].ZcMul        := MCTparas[0].ZcMul * 0.00390625;   //because navi uses old light paras
//        MCTparas[0].PLValsNavi   := @NaviLightVals;
        MCTparas[0].msDEsub      := 0;
//        if (NaviHeader.Light.TBoptions and $20000) = 0 then MCTparas[I].ColorOption := 9; //smoothits, else 2nd choice functions
//      end;
      //tests:
     // Label_N_18.Caption := 'Correction: ' + FloatToStr(NDEmultiplier);

//    end;

//    for I := 0 to nThreadCount - 1 do begin
      MCTparas[0].FSIstart      := Integer(Image_1.Picture.Bitmap.ScanLine[0]);
      MCTparas[0].FSIoffset     := Integer(Image_1.Picture.Bitmap.ScanLine[1]) - MCTparas[0].FSIstart;
      //MCTparas[0].NaviStep      := Nstep;
      MCTparas[0].SLwidMNpix    := MCTparas[0].FSIoffset div 4 - 16;
      //SetLength(CalcThread, nThreadCount);
      //for x := 0 to 5 do if MCTparas[I].nHybrid[x] > 0 then bAllOK := True;
//    end;

//  finally
//    GUI.bHideMessages := False;
//  end;
//  if bAllOK then
//  begin
//    for x := 0 to nThreadCount - 1 do
//    begin
//      MCTparas[x].iThreadId := x + 1;
//      try
//        CalcThread[x]                 := TNaviCalcThread.Create(True);          //-=-=-> TNaviCalcThread
//        CalcThread[x].FreeOnTerminate := True;
//        CalcThread[x].MCTparas        := MCTparas[x];
//        CalcThread[x].NaviLightVals   := NaviLightVals;
//        CalcThread[x].NaviLightVals.PLValignedNavi := TPLValignedNavi((Integer(@CalcThread[x].NaviLightVals.LColSbuf[0]) + 15) and $FFFFFFF0);
//        FastMove(NaviLightVals.PLValignedNavi^, CalcThread[x].NaviLightVals.PLValignedNavi^, SizeOf(TLValignedNavi));
//        CalcThread[x].Priority        := cTPrio[GUI.ComboBoxThread.ItemIndex];
//      except
//        nThreadCount := x;
//        Break;
//      end;
//    end;
//    iActiveThreads := nThreadCount;
//    MCTparas[0].PCalcThreadStats := GetNewThreadStatRecord(CalcThreadStatusID, nThreadCount, 0, Self.Handle);
//    NglobalCounter := CalcThreadStatusID;
//    if (CalcThreadStatusID = 0) or (MCTparas[0].PCalcThreadStats = nil) then
//    begin
//      GUI.OutMessage('Failed to create ThreadStats');
//      for x := 0 to nThreadCount - 1 do CalcThread[x].Free;
//      Exit;
//    end;
//    for x := 1 to nThreadCount do
//    begin
//      CalcThread[x - 1].MCTparas.iThreadCount := nThreadCount;
//      CalcThread[x - 1].MCTparas.PCalcThreadStats := MCTparas[0].PCalcThreadStats;
//    end;
//    for x := 0 to nThreadCount - 1 do CalcThread[x].Start;
//  end;
end;
}
end.
