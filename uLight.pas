unit uLight;

interface

uses
  MAIN,
  System.Math,
  Math3D,
  TypeDefinitions,
  uCPU,
  DivUtils,
  Vcl.Graphics,
  Interpolation;

{$REGION '============================================================================= > | METHODS'}

{LIGHT}
procedure SetCosTabFunction;
function GetCosTabVal(const Tnr: Integer; const DotP, Rough: Single): Single;
function GetCosTabValSqr(const Tnr: Integer; const DotP, Rough: Single): Single;
function FastPowLUT(base, expo: Single): Single; //for lighting spec calculation
procedure MakeCubicWeightsFromT(const t: Single; var sv: TSVec);
function GetDiffMapNr(LightPars: TPLightingParas9): Integer;
function GetCosTabValNavi(Tnr, i1, i2: Integer): Single;
function GetGaussFuncNavi(iL1, iL2: Integer): Single;
procedure PaintSDPreviewColors(LAtmpLight: TPLightingParas9; CanvasS, CanvasD: TCanvas; Wid: Integer);
function FindVecAngles(var d1, d2: Double; sv: TPSVec; m: TPMatrix3; bAbs: LongBool): Double;

function VisFuncToIndex(const Light: TLight8 {Lop: Byte}): Integer;
function IndexToVisFunc(i: Integer): Byte;
procedure RepaintColorHistory;
procedure MakeHistory;

{$ENDREGION '========================================================================== > | METHODS'}


{$REGION '============================================================================= > | VARIABLES'}

var
{LIGHT}
  //GUILight: TGUILight;
  //  LAFormCreated: LongBool = False;
  //  bLFfirstShow: LongBool = True;
  DiffCosTabNavi: array[0..3, 0..127] of Single; // old one for navigator + imageprocess
  DiffCosTabNsmall: array[0..7, 0..127] of Single;
  PowerTabSmall: array[0..127] of Single;
  GaussTabSmall: array[0..127] of Single;

  LColHisto: array[0..32767] of Integer;
  OTColHisto: array[0..32767] of Integer;
  LColInteriorHisto: array of Integer;
  LColHistoMaxN, LColInteriorHistoMaxN, LColInteriorHistoLength: Integer;
  OTColHistoMaxN: Integer;
  siLight5: array of TsiLight5;


  {  DiffNormalPicArr: array of Cardinal;  //-> lightmap ..todo: possible lightmaps for all lights
  DNPWidth, DNPHeight: Integer;
  DNPstart, DNPYinc: Integer;
  DNPXfactor, DNPYfactor: Single; }

  Presets: array[1..5] of TLpreset164 =
  ((AmbTop: $B1AA9F; AmbBot: $3464AA; DepthCol: $B1AA9F; DepthCol2: $3464AA;        //Sand
    ColDif: ($2537A0, $4E9FD1, $62AEB3, $71808E);
    ColSpec: ($0B1026, $132734, $273639, $1C2023);
    Lights: ((Loption: 0; LFunction: 51; Lcolor: $FFFFFF; LXangle: 3363; LYangle: 4000),             //spec,dif,amb
             (Loption: 0; LFunction: 3; Lcolor: $34628F; LXangle: -4915; LYangle: -6500));  TB578pos: (50, 50, 90)),
                                             // $6797C7
   (AmbTop: $FF6000; AmbBot: $40B0; DepthCol: $800000; DepthCol2: $50;
    ColDif: ($E0, $FF0000, $B800, $ABDD);                                           //Slime
    ColSpec: ($F0F0F0, $F0F0F0, $F0F0F0, $F0F0F0);
    Lights: ((Loption: 0; LFunction: 3; Lcolor: $FFFFFF; LXangle: 0; LYangle: 4005),
             (Loption: 1; LFunction: 3; Lcolor: $FFFFFF; LXangle: 0; LYangle: 0));  TB578pos: (110, 22, 220)),

   (AmbTop: $E89660; AmbBot: $304860; DepthCol: $A04B18; DepthCol2: $D0A488;
    ColDif: ($1D85F8, $C0C0C0, $47CCF8, $B9B69B);                                   //Metallic
    ColSpec: ($1D85F8, $C0C0C0, $47CCF8, $B9B69B);
    Lights: ((Loption: 0; LFunction: 2; Lcolor: $AADDFF; LXangle: -637; LYangle: 4915),
             (Loption: 0; LFunction: 2; Lcolor: 2894962; LXangle: 3368; LYangle: -6463));  TB578pos: (160, 50, 30)),

   (AmbTop: $EC974A; AmbBot: $5976A6; DepthCol: $EC974A; DepthCol2: $5976A6;
    ColDif: ($204080, $349120, $1E36C1, $C5AAE6);                                   //Flower
    ColSpec: (0, $40491C, $3B3D60, $60487F);
    Lights: ((Loption: 0; LFunction: 51; Lcolor: $B9EFFF; LXangle: 0; LYangle: 3000),
             (Loption: 1; LFunction: 3; Lcolor: $34628F; LXangle: -4915; LYangle: -6500));  TB578pos: (50, 70, 90)),

//   (AmbTop: $A0A0A0; AmbBot: $A0A0A0; DepthCol: $A0A0A0; DepthCol2: $A0A0A0;
   (AmbTop: $905838; AmbBot: $8BA8C7; DepthCol: $905838; DepthCol2: $8BA8C7;
    ColDif: ($A0A0A0, $A0A0A0, $A0A0A0, $A0A0A0);                                   //Neutral
    ColSpec: ($404040, $404040, $404040, $404040);
    Lights: ((Loption: 0; LFunction: 52; Lcolor: $B9EFFF; LXangle: 4063; LYangle: 6405),
             (Loption: 1; LFunction: 52; Lcolor: $6797C7; LXangle: -4915; LYangle: -7100));  TB578pos: (50, 70, 90)));

  CustomPresets: array[6..15] of TLpreset20;

  AccPreset: array[0..3] of TqualPreset =
  ((SmoothNormals: 0; DEstop: 1.0; RayMultiplier: 0.5; BinSearch: 6; ImageWidth: 480; ImageScale: 1; RayLimiter: 1),
   (SmoothNormals: 1; DEstop: 1.0; RayMultiplier: 0.4; BinSearch: 8; ImageWidth: 640; ImageScale: 1; RayLimiter: 0.75),
   (SmoothNormals: 2; DEstop: 1.2; RayMultiplier: 0.3; BinSearch: 10; ImageWidth: 1600; ImageScale: 2; RayLimiter: 0.5),
   (SmoothNormals: 3; DEstop: 1.2; RayMultiplier: 0.25; BinSearch: 12; ImageWidth: 3072; ImageScale: 3; RayLimiter: 0.3));


{$ENDREGION '========================================================================== > | VARIABLES'}


{$REGION '============================================================================= > | CONSTANTS'}

const
  //49 = 32 + 16 + 1 = diff3 + 16pow -> 0+32pow=2
  //LFunction: 3(4)bit spec func + 2bit diff,
  //Pow = 8 shl (LFunction and $07), diff = (LFunction shr 4) and 3
  defaultLight8: TLight8 =
    (Loption: 1;
      LFunction: 4;
      Lamp: 10;
      Lcolor: ($FF, $FF, $FF);
      LightMapNr: 0;
      LXpos: (0,0,0,0,0,0,0);
      AdditionalByteEx: 0;
      LYpos: (0,0,0,0,0,0,0);
      FreeByte: 0;
      LZpos: (0,0,0,0,0,0,0));

  defaultLight7: TLight7 =
      (Loption: 1;
        LFunction: 3;
        Lcolor: $FFFFFF;
        LXangle: 0;
        LYangle: 0);

  StartPreset: TLpreset16 =
      (Cols: (5873889, 8837614, $8B491D, 2988346, 12248958, $FFC49F, 11287584, 14579248, 7481121);
        Lights:
          ((Loption: 0;
            LFunction: 53;
            Lcolor: $A0E8FF;
            LXangle: 1500;
            LYangle: 5200),
           (Loption: 1;
            LFunction: 16;
            Lcolor: 2307911;
            LXangle: -2822;
            LYangle: -7737),
           (),
           ());
        DepthCol: $8B491D;
          TB578pos: (50, 120, 90); //spec,dif,amb
          DepthCol2: $FFC49F;
          Version: 1);


{$ENDREGION '========================================================================== > | CONSTANTS'}

implementation


{$REGION '============================================================================= > | METHODS'}


procedure SetCosTabFunction; //.. function to interpolate and less vals in tab. +Also a similar power function with some tabs + ipol
var i, j, k, l: Integer;
    d: Double;
    e: Extended;
    TmpTabSmall: array[0..127] of Single;
begin
    for i := 0 to 127 do
    begin
      d := Cos(i * 0.0490873852123405184);    //old for navi: 0 to 2pi angle
      DiffCosTabNavi[0][i] := Clamp0D(d);           //average: 0.318
      DiffCosTabNavi[1][i] := Sqr(Clamp0D(d));       //average: 0.25
      DiffCosTabNavi[2][i] := d * s05 + s05;        //average: 0.5
      DiffCosTabNavi[3][i] := Sqr(d * s05 + s05);   //average: 0.375
      d := 1 - (i - 2) / 60;
      if d > 0.15 then DiffCosTabNsmall[0][i] := (d - 0.08) * 1.0869565 else
      if d <= 0 then DiffCosTabNsmall[0][i] := 0 else
        DiffCosTabNsmall[0][i] := Power(d, Max(1, (0.505 - d) * 3.8));
      DiffCosTabNsmall[1][i] := Sqr(Clamp0D(d));
      DiffCosTabNsmall[2][i] := d * s05 + s05;
      DiffCosTabNsmall[3][i] := Sqr(d * s05 + s05);
      d := 1 - (i - 2) / 380;
      if d >= 1 then PowerTabSmall[i] := 1 else
      if d <= 0 then PowerTabSmall[i] := 0 else PowerTabSmall[i] := Power(d, 38);
      GaussTabSmall[i] := Power(enat, -Sqr(i * 0.0503936));
    end;
    for k := 0 to 3 do
    begin
      for j := 0 to 127 do TmpTabSmall[j] := Sqrt(Max0S(DiffCosTabNsmall[k][j]));
      for j := 0 to 127 do
      begin
        e := 0;
        for i := 0 to 60 do
        begin
          l := Abs(j + i - 30);
          if l < 128 then e := e + TmpTabSmall[l];
        end;
        DiffCosTabNsmall[k + 4][j] := Sqr(e * 0.011 + Sqr(e * 0.007)); //DiffCosTabN[k + 4][Round(Min0MaxCS((j - 2) * 16384/121, 16383))];
      end;
    end;
//    showmessage(floattostr(DiffCosTabN[6][16383]) + ' ' + floattostr(DiffCosTabN[3][16383]));
end;

function FastPowLUT(base, expo: Single): Single; //for lighting spec calculation with float exponent!
var w1: Single;
    ip: Integer;
    w: TSVec;
    p1: TPSingleArray;
begin
    if base <= 0 then Result := 0 else
    if base >= 1 then Result := 1 else
    begin
      w1 := (1 - base) * 10 * expo;
      ip := Trunc(w1);
      if ip < 0 then Result := 1 else
      if ip > 123 then Result := 13e-7 / (w1 - 120) else
      begin
        w := MakeSplineCoeff(Frac(w1));
        p1 := @PowerTabSmall[ip + 1]; //0
        Result := p1[0] * w[0] + p1[1] * w[1] + p1[2] * w[2] + p1[3] * w[3];
  {      p1 := @PowerTabSmall[1][ip + 1];
        w1 := Min0MaxCS((Expo - 8) * 0.02, 1); //weight LUT 0->1
        Result := (Result + w1 * (p1[0] * w[0] + p1[1] * w[1] + p1[2] * w[2] + p1[3] * w[3] - Result));  }
      end;
    end;
end;

                                  //  ebp+8          eax
procedure MakeCubicWeightsFromT(const t: Single; var sv: TSVec);  //all weights 6 times bigger!
const s3: Single = 3;
    s6: Single = 6;
{begin
    sv[3] := t*t*t;
    sv[2] := 3*t*t;
    sv[0] := -sv[3] + sv[2] - 2*t;
    sv[1] := 3*sv[3] - 2*sv[2] - 3*t + 6;
    sv[2] := -3*sv[3] + sv[2] + 6*t;
    sv[3] := sv[3] - t;              }
asm
    fld  dword [ebp + 8]
    fld  st
    fmul st, st      //t*t,t
    fld  st
    fmul st, st(2)   //t³,t²,t
    fld  s3
    fmul st(2), st   //3, t³=sv[3], 3*t²=sv[2], t
    fld  st(2)       //sv[2], 3, sv[3], sv[2], t
    fsub st, st(2)   //sv[2]-sv[3], 3, sv[3], sv[2], t
    fsub st, st(4)   //sv[2]-sv[3]-t, 3, sv[3], sv[2], t
    fsub st, st(4)   //sv[2]-sv[3]-2*t, 3, sv[3], sv[2], t
    fstp dword [eax] //3, sv[3], sv[2], t
    fld  st(1)       //sv[3], 3, sv[3], sv[2], t
    fmul st, st(1)   //3*sv[3], 3, sv[3], sv[2], t
    fsub st, st(3)   //3*sv[3]-sv[2], 3, sv[3], sv[2], t
    fsub st, st(3)   //3*sv[3]-2*sv[2], 3, sv[3], sv[2], t
    fld  st(4)
    fmul st, st(2)
    fsubp
    fadd s6
    fstp dword [eax + 4]
    fmul st, st(1)
    fsubp st(2), st  //t³,3*t²-3*t³,t
    fsub st, st(2)
    fstp dword [eax + 12]  //3*t²-3*t³,t
    fxch
    fmul s6
    faddp
    fstp dword [eax + 8]
end;
                        //0..16383
function GetGaussFuncNavi(iL1, iL2: Integer): Single;
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
function GetCosTabValNavi(Tnr, i1, i2: Integer): Single;
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
    p1 := @DiffCosTabNavi[Tnr][i1t];
    p2 := @DiffCosTabNavi[Tnr][i2t];
    Result := (p1[0] + t1 * (p1[1] - p1[0])) * (p2[0] + t2 * (p2[1] - p2[0]));
end;


                   // 0..3          -1..1  0..1           0..1
function GetCosTabVal(const Tnr: Integer; const DotP, Rough: Single): Single;
var ip: Integer;
    t: Single;
    w: TSVec;
    p1: TPSingleArray;
begin //new function for tabs[0..(127)255]  (62)122 is midpoint=0 of DotP
    t := 62 - 60 * DotP;
    ip := Trunc(t) - 1;
    if ip < 0 then
    begin
      ip := 0;
      t := 0;
    end
    else if ip > 124 then
    begin
      ip := 124;
      t := 1;
    end
    else t := Frac(t);
    w := MakeSplineCoeff(t);     // MakeCubicWeightsFromT(t, w);
    if SupportSSE then
    asm
      mov edx, Tnr
      shl edx, 7
      add edx, ip
      lea eax, DiffCosTabNsmall + edx * 4
      movups xmm2, w
      movups xmm0, [eax]
      movups xmm1, [eax + $800]
      mulps  xmm0, xmm2
      mulps  xmm1, xmm2
      movaps xmm3, xmm0
      unpcklps xmm3, xmm1
      unpckhps xmm0, xmm1
      addps   xmm3, xmm0
      movhlps xmm0, xmm3
      addps  xmm3, xmm0
      movaps xmm2, xmm3
      shufps xmm2, xmm2, 1
      subss  xmm2, xmm3
      mulss  xmm2, Rough
      addss  xmm2, xmm3
      movss  Result, xmm2
    end
    else
    begin
      p1 := @DiffCosTabNsmall[Tnr][ip];
      Result := p1[0] * w[0] + p1[1] * w[1] + p1[2] * w[2] + p1[3] * w[3];
      p1 := @DiffCosTabNsmall[Tnr + 4][ip];
      Result := (Result + Rough * (p1[0] * w[0] + p1[1] * w[1] + p1[2] * w[2] + p1[3] * w[3] - Result));
    end;
end;

function GetCosTabValSqr(const Tnr: Integer; const DotP, Rough: Single): Single;
var ip: Integer;
    t: Single;
    w: TSVec;
    p1: TPSingleArray;
begin //new function for tabs[0..127]  62 is midpoint=0 of DotP
    t := 62 - 60 * DotP;
    ip := Trunc(t) - 1;
    if ip < 0 then
    begin
      ip := 0;
      t := 0;
    end
    else if ip > 124 then
    begin
      ip := 124;
      t := 1;
    end
    else t := Frac(t);
    w := MakeSplineCoeff(t);
    if SupportSSE then
    asm
      mov edx, Tnr
      shl edx, 7
      add edx, ip
      lea eax, DiffCosTabNsmall + edx * 4
      movups xmm2, w
      movups xmm0, [eax]
      movups xmm1, [eax + $800]
      mulps  xmm0, xmm2
      mulps  xmm1, xmm2
      movaps xmm3, xmm0
      unpcklps xmm3, xmm1
      unpckhps xmm0, xmm1
      addps   xmm3, xmm0
      movhlps xmm0, xmm3
      addps  xmm3, xmm0
      mulps  xmm3, xmm3
      movaps xmm2, xmm3
      shufps xmm2, xmm2, 1
      subss  xmm2, xmm3
      mulss  xmm2, Rough
      addss  xmm2, xmm3
      movss  Result, xmm2
    end
    else
    begin
      p1 := @DiffCosTabNsmall[Tnr][ip];
      Result := Sqr(p1[0] * w[0] + p1[1] * w[1] + p1[2] * w[2] + p1[3] * w[3]);
      p1 := @DiffCosTabNsmall[Tnr + 4][ip];
      Result := (Result + Rough * (Sqr(p1[0] * w[0] + p1[1] * w[1] + p1[2] * w[2] + p1[3] * w[3]) - Result));
    end;
end;

procedure PaintSDPreviewColors(LAtmpLight: TPLightingParas9; CanvasS, CanvasD: TCanvas; Wid: Integer);
var x, xFrom, xTo, actN: Integer;                                                      //34
    w1, sm: Single;
    bNoColIpol: LongBool;
begin
    actN   := 1;
    xFrom  := 0;
    sm     := Wid * s1d32767;
    with LAtmpLight^ do
    begin
      bNoColIpol := (Lights[3].FreeByte and 1) <> 0;
      xTo := Round(LCols[1].Position * sm);
      for x := 0 to Wid - 1 do  //33
      begin
        if (x > xTo) and (actN < 10) then
        begin
          Inc(actN);
          xFrom := xTo;
          if actN > 9 then xTo := Wid - 1 else xTo := Round(LCols[actN].Position * sm);
          if xTo <= xFrom then xTo := xFrom + 1;
        end;
        w1 := 1 - (x - xFrom) / Max(1, xTo - xFrom);
        if bNoColIpol then CanvasD.Pen.Color := LCols[actN - 1].ColorDif and $FFFFFF else
        CanvasD.Pen.Color :=    //diff
          InterpolateColor(LCols[actN - 1].ColorDif, LCols[actN mod 10].ColorDif, w1, 1 - w1);
        CanvasD.MoveTo(x + 2, 1);
        CanvasD.LineTo(x + 2, 12);
        if bNoColIpol then CanvasS.Pen.Color := LCols[actN - 1].ColorSpe and $FFFFFF else
        CanvasS.Pen.Color :=    //Spec
          InterpolateColor(LCols[actN - 1].ColorSpe, LCols[actN mod 10].ColorSpe, w1, 1 - w1);
        CanvasS.MoveTo(x + 2, 4);
        CanvasS.LineTo(x + 2, 12);
        if bNoColIpol then CanvasS.Pen.Color := TransparencyToColor(LCols[actN - 1].ColorSpe) else
        CanvasS.Pen.Color :=    //Transp
          InterpolateColor(TransparencyToColor(LCols[actN - 1].ColorSpe),
                           TransparencyToColor(LCols[actN mod 10].ColorSpe), w1, 1 - w1);
        CanvasS.MoveTo(x + 2, 1);
        CanvasS.LineTo(x + 2, 4);
     end;
   end;
end;

function FindVecAngles(var d1, d2: Double; sv: TPSVec; m: TPMatrix3; bAbs: LongBool): Double;
var i, iskip, x, y: Integer;
    dmin, dt, db1, db2: Double;
    svt: TSVec;

    function AbsErr(sv1, sv2: TPSVec): Double;
    begin
        Result := Abs(sv1[0] - sv2[0]) + Abs(sv1[1] - sv2[1]) + Abs(sv1[2] - sv2[2]);
    end;

begin
    dmin := 1000;
    for y := -5 to 5 do for x := -5 to 5 do
    begin
      d1 := x * Pi * 0.2;
      d2 := y * Pi * 0.2;
      BuildViewVectorFOV(d2, d1, @svt);
      SVectorChangeSign(@svt);
      if bAbs then RotateSVectorReverse(@svt, m);
      NormaliseSVectorVar(svt);
      dt := AbsErr(sv, @svt);
      if dt < dmin then
      begin
        dmin := dt;
        db1 := d1;
        db2 := d2;
      end;
    end;
    d1 := db1;
    d2 := db2;

    i := 4000;
    repeat
      if (i and 1) = 1 then d1 := db1 + dmin * 0.001   //gradient proof
                       else d2 := db2 + dmin * 0.001;
      BuildViewVectorFOV(d2, d1, @svt);
      SVectorChangeSign(@svt);
      if bAbs then RotateSVectorReverse(@svt, m);
      NormaliseSVectorVar(svt);
      dt := AbsErr(sv, @svt);
      dt := dmin * dmin * 0.001 / NonZero(dmin - dt);  //stepwidth based on gradient and result
      if (i and 1) = 1 then d1 := db1 + dt else d2 := db2 + dt;
      BuildViewVectorFOV(d2, d1, @svt);
      SVectorChangeSign(@svt);
      if bAbs then RotateSVectorReverse(@svt, m);
      NormaliseSVectorVar(svt);
      dt := AbsErr(sv, @svt);
      if dt < dmin then
      begin
        dmin := dt;
        db1 := d1;
        db2 := d2;
      end else begin
        d1 := db1;
        d2 := db2;
      end;
      Dec(i);
    until (i < 0) or (dmin < 1e-7);

    while d1 < -Pi do d1 := d1 + Pi * 2;
    while d1 > Pi do d1 := d1 - Pi * 2;
    while d2 < -Pi do d2 := d2 + Pi * 2;
    while d2 > Pi do d2 := d2 - Pi * 2;
    Result := dmin;
end;

function GetDiffMapNr(LightPars: TPLightingParas9): Integer;
begin
    Result := LightPars.bColorMap or (LightPars.Lights[1].AdditionalByteEx shl 8);
end;

//------------------------------------------------------------------------------

function VisFuncToIndex(const Light: TLight8): Integer;
const Ctab: array[0..3] of Integer = (0, 3, 1, 2);
begin
    Result := Ctab[(Light.Loption shr 3) and 3] or ((Light.LFunction and 128) shr 5);
end;

function IndexToVisFunc(i: Integer): Byte;
const Ctab: array[0..3] of Byte = (0, $10, $18, 8);
begin
    Result := Ctab[i and 3];
end;

{$ENDREGION '========================================================================== > | METHODS'}


{$REGION '============================================================================= > | HISTORY'}
//------------------------------------------------------------------------------
//      L I G H T  H I S T O R Y
//------------------------------------------------------------------------------
procedure MakeHistory;
var x: Integer;
    PL: TPsiLight5;
    dHL: Double;
const dm: Double = 0.0000305175;
begin
    for x := 0 to 32767 do LColHisto[x] := 0;
    for x := 0 to 32767 do OTColHisto[x] := 0;
    LColInteriorHistoLength := GUI.Image_L_2.Width;
    SetLength(LColInteriorHisto, LColInteriorHistoLength);
    for x := 0 to LColInteriorHistoLength - 1 do LColInteriorHisto[x] := 0;
    PL := @siLight5[0];
    dHL := LColInteriorHistoLength - 1;
    for x := 0 to High(siLight5) do
    begin
      if PL.Zpos < 32768 then
      begin
        if PL.SIgradient < 32768 then
          Inc(LColHisto[PL.SIgradient])
        else
          Inc(LColInteriorHisto[Round(Sqrt(Sqrt((PL.SIgradient - 32768) * dm)) * dHL)]);
        Inc(OTColHisto[PL.OTrap and $7FFF]);
      end;
      Inc(PL);
    end;
    LColHistoMaxN := 1;
    LColInteriorHistoMaxN := 1;
    OTColHistoMaxN := 1;
    for x := 0 to 32767 do
      if LColHisto[x] > LColHistoMaxN then LColHistoMaxN := LColHisto[x];
    for x := 0 to 32767 do
      if OTColHisto[x] > OTColHistoMaxN then OTColHistoMaxN := OTColHisto[x];
    for x := 1 to LColInteriorHistoLength - 1 do
      if LColInteriorHisto[x] > LColInteriorHistoMaxN then
        LColInteriorHistoMaxN := LColInteriorHisto[x];
    RepaintColorHistory;
end;

procedure RepaintColorHistory;
var x, y, c, x2, x3, a, x2inc: Integer;
    d, dmin, dmul: Double;
begin
    y := GUI.Image_L_1.Height + 1;
    with GUI.Image_L_1.Picture.Bitmap do
    begin
      SetSize(GUI.Image_L_1.Width, y - 1);
    //  Width  := Image_L_1.Width;
    //  Height := y - 1;
      if GUI.sb_color_fine.Down then
      begin
        dmin := Sqr((GUI.TBcolStartPos + 30) / 90) * 32767 - 10900;
        dmul := (Sqr((GUI.TBcolStopPos + 30) / 90) * 32767 - 10900 - dmin) / 32767;
        x2   := Round(-16384 * dmul + dmin);
      end else begin
        dmin := 0;
        dmul := 1;
        x2   := 0;
      end;
      for x := 0 to Width - 1 do
      begin
        if GUI.sb_color_fine.Down then
          x3 := Round((x * 65535 / (Width - 1) - 16384) * dmul + dmin)
        else
          x3 := Round(Sqr(x * 4 / (3 * (Width - 1))) * 32767 - 10900);
        x2inc := Sign(x3 - x2);
        a := 0;
        d := 0;
        if GUI.CheckBox_L_2.Checked then
        begin
          repeat
            if (x2 >= 0) and (x2 < 32768) then
            begin
              d := d + OTColHisto[x2];
              Inc(a);
            end;
            x2 := x2 + x2inc;
          until x2 = x3;
          if (OTColHistoMaxN <> 0) and (a <> 0) then d := d / (a * OTColHistoMaxN); //was: int overflow
        end else begin
          repeat
            if (x2 >= 0) and (x2 < 32768) then
            begin
              d := d + LColHisto[x2];
              Inc(a);
            end;
            x2 := x2 + x2inc;
          until x2 = x3;
          if (LColHistoMaxN <> 0) and (a <> 0) then d := d / (a * LColHistoMaxN);
        end;
        c := 255 - Round(Sqrt(Sqrt(Clamp01D(d))) * 255);
        Canvas.Pen.Color := c or (c shl 8) or (((c and $FE) + 200)  shl 15);
        Canvas.MoveTo(x, 0);
        Canvas.LineTo(x, y);
      end;
    end;
    y := GUI.Image_L_2.Height + 1;
    if Length(LColInteriorHisto) >= GUI.Image_L_2.Width then
    with GUI.Image_L_2.Picture.Bitmap do
    begin
      Width  := GUI.Image_L_2.Width;
      Height := y - 1;
      for x := 0 to Width - 1 do
      begin
        d := LColInteriorHisto[x] / LColInteriorHistoMaxN;     //read of adr 0 when starting with parameter m3p file! ->CB2.click
        if d > 1 then d := 1;
        c := 255 - Round(Sqrt(Sqrt(d)) * 255);
        Canvas.Pen.Color := c or (c shl 8) or (((c and $FE) + 200)  shl 15);
        Canvas.MoveTo(x, 0);
        Canvas.LineTo(x, y);
      end;
    end;
end;

{$ENDREGION '========================================================================== > | HISTORY'}


end.
