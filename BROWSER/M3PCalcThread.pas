unit M3PCalcThread;

interface

uses
  Winapi.Windows,
  System.Classes,
  Math3D,
  formulas,
  TypeDefinitions,
  FormulaClass;

type
    TLValignedM3P = packed record
      sDepthCol, sDepthCol2: TSVec;
      sAmbCol: TSVec;                  //32
      sDynFogCol: TSVec;               //48
      sLCols:  array[0..2] of TSVec;   //64
      ColDif, ColSpe, ColInt: array[0..3] of TSVec;  //112  9svecs->12svecs +48 new 0..3  for more compatibility
    end;
    TPLValignedM3P = ^TLValignedM3P;

type
    TLightValsM3P = packed record
      PLValignedM3P: TPLValignedM3P;  // 16 Bit aligned Pointer in the sObjectColBuffer at the end of record
      bColCycling: LongBool;       //
      bFarFog: LongBool;           //
      bGamma2: LongBool;           //
      bBlendDFog: LongBool;
      iBackBMP: Integer;           //new  bit1: use BGimage  bit2: direct coords
      BGLightMap: TPLightMap;
      pBGRotMatrix: TPSMatrix3;
      sColZmul: Single;            // var col on Z
      sZpos: Single;               // for var on Z, the corrected (linear) Zpos
      sDepth, sShadGr, sShad, sAmbShad: Single;    //   numbers for lightvals interpolation, -> 6 lights change
      sDiffuse, sCStart: Single;
      sCiStart, sCmul, sCimul: Single;   //72 bytes
      sXpos, sYpos: Single;
      iXangle: array[0..2] of Integer;
      iYangle: array[0..2] of Integer;
      bLightOption: array[0..2] of Byte;
      sLightFuncSpec: array[0..2] of Single;
      iLightFuncDiff: array[0..2] of Integer;
      AbsViewVec: TSVec;
      LColSbuf: array[0..20] of TSVec;         //18*16 bytes = 288 bytes +48
    end;
    TPLightValsM3P = ^TLightValsM3P;

type
   TM3PCalcThread = class(TThread)

  private
    { Private-Declarations }

  //  procedure maxLengthToCutPlane(var dLength: Double; var itmp: Integer; vPos: TPPos3D);
  public
    { Public-Declarations }


    M3PLightVals: TLightValsM3P;
    MCTparas: TMCTparameter;


    GaussTabSmall: array[0..127] of Single;
    Iteration3Dext: TIteration3Dext;
    Light3rec: TsiLight3;   //12bytes
    DiffCosTabM3P: array[0..3, 0..127] of Single; // old one for navigator + imageprocess

    procedure DoBinSearchS(var DE, RLastStepWidth, LastDE: Single);
    procedure CalculateNormals(var NN: Single);
    procedure CalcNanglesForCut(CutPlane: Integer; Zdif: Double);
    procedure DoColor;
    procedure CalcPixelColorM3P(SL: PCardinal; Npix, SLwidMNpix: Integer);
    function GetCosTabValM3P(Tnr, i1, i2: Integer): Single;
    function GetGaussFuncM3P(iL1, iL2: Integer): Single;

  protected
    procedure Execute; override;
  end;



implementation

uses
  MAIN,
  System.Math,
  DivUtils,
  Calc,
  uM3P,
  System.SysUtils,
  ImageProcess,
  uLight;   //????
//LightGUI

procedure TM3PCalcThread.CalcPixelColorM3P(SL: PCardinal; Npix, SLwidMNpix: Integer);    //Npix: square pixel array to be filled
var dTmp, dCtmp, dCtmp4, dTmp3: Single;
    ir, ig, ib, iL1, iL2: Integer;
    iDif, iSpe, sLiDif, sLiSpe, DepC: TSVec;
    sDep, sAmb: Single;
begin
  with M3PLightVals do
  begin
    DepC := LinInterpolate2SVecs(PLValignedM3P.sDepthCol2, PLValignedM3P.sDepthCol, sYpos);
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
        iSpe := LinInterpolate2SVecs(PLValignedM3P.ColInt[iL2], PLValignedM3P.ColInt[iL1], dTmp);
        iDif := iSpe;
      end else begin
        iSpe := LinInterpolate2SVecs(PLValignedM3P.ColSpe[iL2], PLValignedM3P.ColSpe[iL1], dTmp);
        iDif := LinInterpolate2SVecs(PLValignedM3P.ColDif[iL2], PLValignedM3P.ColDif[iL1], dTmp);
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
          sLiSpe := AddSVectors(sLiSpe, ScaleSVector(PLValignedM3P.sLCols[ir],
            GetGaussFuncM3P(iL1, iL2) * dCtmp4));
        sLiDif := AddSVectors(sLiDif, ScaleSVector(PLValignedM3P.sLCols[ir],
          GetCosTabValM3P(iLightFuncDiff[ir], Light3rec.LightAngleX + iXangle[ir], Light3rec.LightAngleY + iYangle[ir]) * dCtmp));
      end; //if poslight then... light zpos,
     //   PoslightAmount := DotOfVectors(ViewVec, (LightPos - CamPos)) * shape..
     //   AddObjectLight
     //   /DotOfVectors() 1 / (Stepwidth + LengthOfVec(SubtractVectors(LightPos[ir], TPVec3D(@Iteration3D.C1));

      DepC := Add2SVecsWeight(AddSVectors(MultiplySVectors(iDif, Add2SVecsWeight2(sLiDif, PLValignedM3P.sAmbCol, sAmb)),
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
    DepC := Add2SVecsWeight2(DepC, PLValignedM3P.sDynFogCol, dTmp);
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

procedure TM3PCalcThread.DoBinSearchS(var DE, RLastStepWidth, LastDE: Single);
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

procedure TM3PCalcThread.CalcNanglesForCut(CutPlane: Integer; Zdif: Double);
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

function TM3PCalcThread.GetGaussFuncM3P(iL1, iL2: Integer): Single;
var i1, i2: Integer;
    t1, t2: Single;
    p1, p2: TPSingleArray;
const s1d128: Single = 1/128;
begin
    i1 := iL1 shr 7;
    i2 := iL2 shr 7;
    t1 := (iL1 and $7F) * s1d128;
    t2 := (iL2 and $7F) * s1d128;
    if i1 > 126 then
    begin
      i1 := 126;
      t1 := 1;
    end;
    if i2 > 126 then
    begin
      i2 := 126;
      t2 := 1;
    end;
    p1 := @GaussTabSmall[i1];
    p2 := @GaussTabSmall[i2];
    Result := (p1[0] + t1 * (p1[1] - p1[0])) * (p2[0] + t2 * (p2[1] - p2[0]));
end;
                           //  0..16383 +edges
function TM3PCalcThread.GetCosTabValM3P(Tnr, i1, i2: Integer): Single;
var i1t, i2t: Integer;
    t1, t2: Single;
    p1, p2: TPSingleArray;
const s1d128: Single = 1/128;
begin
    i1t := (i1 and $7FFF) shr 1;
    i2t := (i2 and $7FFF) shr 1;
    t1 := (i1t and $7F) * s1d128;
    t2 := (i2t and $7F) * s1d128;
    i1t := i1t shr 7;
    i2t := i2t shr 7;
    if i1t > 126 then
    begin
      i1t := 126;
      t1 := 1;
    end;
    if i2t > 126 then
    begin
      i2t := 126;
      t2 := 1;
    end;
    p1 := @DiffCosTabM3P[Tnr][i1t];
    p2 := @DiffCosTabM3P[Tnr][i2t];
    Result := (p1[0] + t1 * (p1[1] - p1[0])) * (p2[0] + t2 * (p2[1] - p2[0]));
end;

function RdTsc: int64;
asm
   db $0f, $31 // RdTsc
end;

procedure TM3PCalcThread.CalculateNormals(var NN: Single);
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

procedure TM3PCalcThread.DoColor;
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

procedure TM3PCalcThread.Execute;
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
      y := NaviStep * (iThreadId - 1);        // try changing TCaldDEfunction = function   ..thread
      if NaviStep < 8 then y := y shl 1;
      while y < iMandHeight do
      begin
        CAFY := (y - s05 * iMandHeight) * FOVy / iMandHeight;
        bIsLargeStep := (NaviStep < 8) and (y and ((NaviStep shl 1) - 1) = 0);
        if bIsLargeStep then x := NaviStep else x := 0;
        SL := PCardinal(FSIstart + FSIoffset * y + x * 4);
 //       mCopyAddVecWeight(@CC, @Ystart, @Vgrads[1], y);

        while x < iMandWidth do // = iMandWidth - M3PStep do
        begin
          bInsideRendering := bInsideTmp;
          bCalcInside := bInsideTmp;
          RMCalculateVgradsFOV(@MCTparas, x);
          RMCalculateStartPos(@MCTparas, x, y);
          Light3rec.Zpos      := 32768;    //write of.. when not done Zcalc if stopped at minZ in M3P
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
          if (M3PLightVals.iBackBMP <> 0) and (Light3rec.Zpos = 32768) then
            M3PLightVals.AbsViewVec := DVecToSVec(mVgradsFOV);
          M3PLightVals.sXpos := x / iMandWidth;
          M3PLightVals.sYpos := y / iMandHeight;
          CalcPixelcolorM3P(SL, NaviStep, SLwidMNpix);

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

end.
