unit uM2T;
//lots of little ol men wiv brooms an cats
//                      wiv rooms an bats
//                      an toombs wiv rats
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
  Vcl.StdCtrls,
  TypeDefinitions,
  Math3D,
  FileHandling,
  System.Math,
  DivUtils;

  function Byte2Str(var B: Byte): String;
  function Word2Str(var W: Word): String;

type
  TfM2T = class(TForm)
    eM2T: TEdit;
    mM2T: TMemo;
  private
  public
    procedure MH2Txt(MH: TMandHeader10; CH: THeaderCustomAddon);
//    procedure UpdateFormulaOptionAbove20_M2T(var MH: TMandHeader10);
  end;

var
  fM2T: TfM2T;
    HC: array[0..5] of TCustomFormula;
   //MH: TMandHeader10;
   //CH: THeaderCustomAddon;
   //CF: TCustomFormula;

implementation

uses MAIN, NavGui;
{$R *.dfm}

function Byte2Str(var B: Byte): String;
var x,l: Integer;
begin
  l:=1; Result:='';
  for x:=0 to 7 do
    begin
      if (B and l)=l then Result:='1'+Result else Result:='0'+Result;
      l:=l*2;
    end;
end;
function Word2Str(var W: Word): String;
var x,l: Integer;
begin
  l:=1; Result:='';
  for x:=0 to 15 do
    begin
      if (W and l)=l then Result:='1'+Result else Result:='0'+Result;
      l:=l*2;
    end;
end;


{function ShortFloatToStr(sf: ShortFloat): String;  //DivUtils
begin
    if sf[0] = 0 then Result := '0.0' else
    Result := FormatFloat('#.#', sf[0] * 0.1) + 'e' + IntToStr(sf[1]);
end;}



procedure TfM2T.MH2Txt(MH: TMandHeader10; CH: THeaderCustomAddon);
var
  s,r,T,ot,ov,os,ots,ao: String;
  ps: PWideChar;
  min, max : Byte;
  v3: TVec3D;
  X,Y,OC: Integer;
  begin


//if value:=0 then ....
    r:= #13#10;
    T:= #9#9#9;
// TMandHeader10 = packed record                        //       Mainparametersforstoring/loading
       s:= 'MandId:                   Integer;   #0   ?   '+IntToStr(MH.MandId)+'';                       //       M3D Header
   s:= s+r+'Width:                    Integer;   #2   ?   '+IntToStr(MH.Width)+'';
   s:= s+r+'Height:                   Integer;   #4   ?   '+IntToStr(MH.Height)+'';
   s:= s+r+'Iterations:               Integer;   #6   ?   '+IntToStr(MH.Iterations)+'';
   s:= s+r+'iOptions:                 Word;      #7   ?   '+Word2Str(MH.iOptions)+'';                      //  0..65535 | 16bits unsigned int     iOptions: SmoothNs: (SpinEdit2.Value shl 6) or FirstStepRandom=bit1 or StepSubDEstop=bit3
   s:= s+r+'bNewOptions:              Byte;      #9   ?   '+Byte2Str(MH.bNewOptions)+'';                   //       bit1: Quaternion instead of RotationMatrix! bit2: color on it nr:
   s:= s+r+'bColorOnIt:               Byte;      #10  ?   '+Byte2Str(MH.bColorOnIt)+'';                    //       0:disabled 1: outputvec:=inputvec (1)2..255 iterate n-1 times + docolor
//??? 10
   s:= s+r+'dZstart:                  Double;    #20      '+FloatToStr(MH.dZstart)+'';                    // #20
   s:= s+r+'dZend:                    Double;    #28  ?   '+FloatToStr(MH.dZend)+'';                      // #28
   s:= s+r+'dXmid:                    Double;    #36      '+FloatToStr(MH.dXmid)+'';                      // #36
   s:= s+r+'dYmid:                    Double;    #44  ?   '+FloatToStr(MH.dYmid)+'';                      // #44
   s:= s+r+'dZmid:                    Double;    #52  ?   '+FloatToStr(MH.dZmid)+'';                      // #52
   s:= s+r+'dXWrot:                   Double;    #60      '+FloatToStr(MH.dXWrot)+'';                     // #60   4D rotation
   s:= s+r+'dYWrot:                   Double;    #68  ?   '+FloatToStr(MH.dYWrot)+'';                     // #68   4D rotation
   s:= s+r+'dZWrot:                   Double;    #72  ?   '+FloatToStr(MH.dZWrot)+'';                     // #72   4D rotation
   s:= s+r+'dZoom:                    Double;    #84      '+FloatToStr(MH.dZoom)+'';                      // #84
   s:= s+r+'RStop:                    Double;    #92  ?   '+FloatToStr(MH.RStop)+'';                      // #92
   s:= s+r+'iReflectsCalcTime:        Integer;   #100     '+IntToStr(MH.iReflectsCalcTime)+'';            // #100  in MCmode: OldAvrgRayCount
   s:= s+r+'sFmixPow:                 Single;    #104     '+FloatToStr(MH.sFmixPow)+'';                   // #104  for formula DE Mix combs
   s:= s+r+'dFOVy:                    Double;    #108     '+FloatToStr(MH.dFOVy)+'';                      // #108  in single  (added 4 bytes)
   s:= s+r+'sTRIndex:                 Single;    #116     '+FloatToStr(MH.sTRIndex)+'';                   // #116  for transmission calculation
   s:= s+r+'sTRscattering:            Single;    #120     '+FloatToStr(MH.sTRscattering)+'';              // #120  light scattering amount
   s:= s+r+'MCoptions:                Byte;      #124     '+Byte2Str(MH.MCoptions)+'';                    // #124  bit1: HDR   bit2: bSecantSearch  bit3: autoclipS+D  bit5..7: DoFbokeh  bit8: newMCrecordYUV
   s:= s+r+'MCdiffReflects:           Byte;      #125     '+Byte2Str(MH.MCdiffReflects)+'';               // #125  D2Byte 0.00 .. 2.50  reflects diffusity  bit4: aa box/gauss
   s:= s+r+'bStereoMode:              Byte;      #126     '+Byte2Str(MH.bStereoMode)+'';                  // #126  0: no  1: very left  3:right  4:left
   s:= s+r+'bSSAO24BorderMirrorSize:  Byte;      #127     '+Byte2Str(MH.bSSAO24BorderMirrorSize)+'';      // #127  0 to 0.5
   s:= s+r+'iAmbCalcTime:             Integer;   #128     '+IntToStr(MH.iAmbCalcTime)+'';                 // #128
   s:= s+r+'bNormalsOnDE:             Byte;      #132     '+Byte2Str(MH.bNormalsOnDE)+'';                         // #132
   s:= s+r+'bCalculateHardShadow:     Byte;      #133     '+Byte2Str(MH.bCalculateHardShadow)+'';                 // #133  calc automatic=bit1,  setLdifFuncToCos=bit2   + 6 bits yes/no of light1-6
   s:= s+r+'bStepsafterDEStop:        Byte;      #134     '+Byte2Str(MH.bStepsafterDEStop)+'';                    // #134  = bin search
   s:= s+r+'MinimumIterations:        Word;      #135     '+Word2Str(MH.MinimumIterations)+'';                    // #135  -> word is enough + 2bytes (no down compatibility)
   s:= s+r+'MClastY:                  Word;      #137     '+Word2Str(MH.MClastY)+'';                              // #137
   s:= s+r+'bCalc1HSsoft:             Byte;      #139     '+Byte2Str(MH.bCalc1HSsoft)+'';                         // #139  -> bCalc1HSsoft, option to calculate only 1 HS but 6 bit as amount
   s:= s+r+'iAvrgDEsteps:             Integer;   #140     '+IntToStr(MH.iAvrgDEsteps)+'';                 // #140  val * 10
   s:= s+r+'iAvrgIts:                 Integer;   #142 ?   '+IntToStr(MH.iAvrgIts)+'';                     // #142  val * 10
//??? 6
   s:= s+r+'bPlanarOptic:             Byte;      #148     '+Byte2Str(MH.bPlanarOptic)+'';                 // #148  camera planar optic:0/1  /2: spherePano  ..3: dome
   s:= s+r+'bCalcAmbShadowAutomatic:  Byte;      #149     '+Byte2Str(MH.bCalcAmbShadowAutomatic)+'';      // #149  bit1: yes/no, bit2: kindof: threshold maxclip/thr. down to 0  bit3+4: type(0:15bit,1:24bit,2:24bit rand,3:DEAO)
   s:= s+r+'sNaviMinDist:             Single;    #150     '+FloatToStr(MH.sNaviMinDist)+'';               // #150  necessary bit5+6(+7): DE raycount (3,7,17,33),  bit8: FSR (first step random)
   s:= s+r+'dStepWidth:               Double;    #154     '+FloatToStr(MH.dStepWidth)+'';                 // #154  related to zoom
   s:= s+r+'bVaryDEstopOnFOV:         Byte;      #162     '+Byte2Str(MH.bVaryDEstopOnFOV)+'';             // #162
   s:= s+r+'bHScalculated:            Byte;      #163     '+Byte2Str(MH.bHScalculated)+'';                // #163  if it was calculated,  6 bits yes/no of light1-6  = bit 3..8
   s:= s+r+'sDOFZsharp:               Single;    #164     '+FloatToStr(MH.sDOFZsharp)+'';                 // #164
   s:= s+r+'sDOFclipR:                Single;    #164     '+FloatToStr(MH.sDOFclipR)+'';                  // #164
   s:= s+r+'sDOFaperture:             Single;    #172     '+FloatToStr(MH.sDOFaperture)+'';               // #172
   s:= s+r+'bCutOption:               Byte;      #176     '+Byte2Str(MH.bCutOption)+'';                   // #176
   s:= s+r+'sDEstop:                  Single;    #177     '+FloatToStr(MH.sDEstop)+'';                    // #177
   s:= s+r+'bCalcDOFtype:             Byte;      #181     '+Byte2Str(MH.bCalcDOFtype)+'';                 // #181  0: dont calc, bit 2+3: passes bit4: function sorted/forward
   s:= s+r+'mZstepDiv:                Single;    #182     '+FloatToStr(MH.mZstepDiv)+'';                  // #182
   s:= s+r+'MCDepth:                  Byte;      #186     '+Byte2Str(MH.MCDepth)+'';                      // #186
   s:= s+r+'SSAORcount:               Byte;      #187     '+Byte2Str(MH.SSAORcount)+'';                   // #187
   s:= s+r+'AODEdithering:            Byte;      #188     '+Byte2Str(MH.AODEdithering)+'';                // #188
   s:= s+r+'bImageScale:              Byte;      #189     '+Byte2Str(MH.bImageScale)+'';                  // #189
   s:= s+r+'bIsJulia:                 Byte;      #190     '+Byte2Str(MH.bIsJulia)+'';                     // #190
   s:= s+r+'dJx:                      Double;    #191     '+FloatToStr(MH.dJx)+'';                        // #191  Julia vals
   s:= s+r+'dJy:                      Double;    #199 ?   '+FloatToStr(MH.dJy)+'';                        // #199  Julia vals
   s:= s+r+'dJz:                      Double;    #207 ?   '+FloatToStr(MH.dJz)+'';                        // #207  Julia vals
   s:= s+r+'dJw:                      Double;    #215 ?   '+FloatToStr(MH.dJw)+'';                        // #215  Julia vals
   s:= s+r+'bDFogIt:                  Byte;      #223     '+Byte2Str(MH.bDFogIt)+'';                      // #223
   s:= s+r+'MCSoftShadowRadius:       ShortFloat;#224     '+ShortFloatToStr(MH.MCSoftShadowRadius)+'';    // #224
   s:= s+r+'HSmaxLengthMultiplier:    Single;    #226     '+FloatToStr(MH.HSmaxLengthMultiplier)+'';      // #226
   s:= s+r+'StereoScreenWidth:        Single;    #230     '+FloatToStr(MH.StereoScreenWidth)+'';          // #230
   s:= s+r+'StereoScreenDistance:     Single;    #234     '+FloatToStr(MH.StereoScreenDistance)+'';       // #234
   s:= s+r+'StereoMinDistance:        Single;    #238     '+FloatToStr(MH.StereoMinDistance)+'';          // #238
   s:= s+r+'sRaystepLimiter:          Single;    #242     '+FloatToStr(MH.sRaystepLimiter)+'';            // #242
   s:= s+r+'hVGrads:                  TMatrix3;  #246.....';                                                   // #246  complete 3x3 matrix for navigating, can change to Quaternion if wNewOptions and 1
//   s:= s+r+'hVGrads:                TMatrix3;  #246     '+(MH.hVGrads)+'';                              // #???  complete 3x3 matrix for navigating, can change to Quaternion if wNewOptions and 1
   s:= s+r+'bMCSaturation:            Byte;      #318     '+Byte2Str(MH.bMCSaturation)+'';                // #318
   s:= s+r+'sAmbShadowThreshold:      Single;    #319     '+FloatToStr(MH.sAmbShadowThreshold)+'';        // #319  z/r
   s:= s+r+'iCalcTime:                Integer;   #323     '+IntToStr(MH.iCalcTime)+'';                    // #323  Seconds * 10
   s:= s+r+'iCalcHStime:              Integer;   #327     '+IntToStr(MH.iCalcHStime)+'';                  // #327
   s:= s+r+'byCalcNsOnZBufAuto:       Byte;      #331     '+Byte2Str(MH.byCalcNsOnZBufAuto)+'';           // #331
   s:= s+r+'SRamount:                 Single;    #332     '+FloatToStr(MH.SRamount)+'';                   // #332  Amount of reflection light
   s:= s+r+'bCalcSRautomatic:         Byte;      #336     '+Byte2Str(MH.bCalcSRautomatic)+'';             // #336  bit1 auto,  bit2 trans, bit3 only dIFS
   s:= s+r+'SRreflectioncount:        Byte;      #337     '+Byte2Str(MH.SRreflectioncount)+'';            // #337
   s:= s+r+'sColorMul:                Single;    #338     '+FloatToStr(MH.sColorMul)+'';                  // #338  multiplier for color option 'last vectorlength increase'
   s:= s+r+'byColor2Option:           Byte;      #342     '+Byte2Str(MH.byColor2Option)+'';               // #342
   s:= s+r+'bVolLightNr:              Byte;      #343     '+Byte2Str(MH.bVolLightNr)+'';                  // #343  was: byRepeatFrom -> in HAddon  lower 3(4)bits: lightnr, upper 4 bits: mapsize +/-7 in 20% steps
   s:= s+r+'bCalc3D:                  Byte;      #344     '+Byte2Str(MH.bCalc3D)+'';                      // #344
   s:= s+r+'bSliceCalc:               Byte;      #345     '+Byte2Str(MH.bSliceCalc)+'';                   // #345
   s:= s+r+'dCutX:                    Double;    #346     '+FloatToStr(MH.dCutX)+'';                      // #346
   s:= s+r+'dCutY:                    Double;    #354 ?   '+FloatToStr(MH.dCutY)+'';                      // #354
   s:= s+r+'dCutZ:                    Double;    #362 ?   '+FloatToStr(MH.dCutZ)+'';                      // #362
   s:= s+r+'sTransmissionAbsorption:  Single;    #370     '+FloatToStr(MH.sTransmissionAbsorption)+'';    // #370
   s:= s+r+'sDEAOmaxL:                Single;    #374     '+FloatToStr(MH.sDEAOmaxL)+'';                  // #374
   s:= s+r+'sDEcombS:                 Single;    #378     '+FloatToStr(MH.sDEcombS)+'';                   // #378  DEcombAvrg absolute smooth distance;  was: pointer to a custom formula.. obsolete
   s:= s+r+'------------------------------------------------------------';
   s:= s+r+'PHCustomF: array[0..5]of Pointer;    #382.....';// THeaderCustomAddon.Formulas                                               // #382  must not be here, 24(28) bytes free - just 1 pointer to formulastruct would be enough
//   s:= s+r+'--------------------------------------------------------------------------';
//s:= s+r+'PHCustomF: array[0..5]of Pointer;     #382                                                     // #???  must not be here, 24(28) bytes free - just 1 pointer to formulastruct would be enough
//------------------------------------------------------------------------------
  s:= s+r+'bHCAversion:                                   '+IntToStr(CH.bHCAversion);//total itcount still in header!
  s:= s+r+'bOptions1:                                     '+IntToStr(CH.bOptions1);  //type of hybrid: 0:alt  1:interpolhybrid  2:DEcombinated  3: (K/L?)IFS
  s:= s+r+'bOptions2:                                     '+Byte2Str(CH.bOptions2);  //bit1: Disable analytical DE bit2+3: 0: outside, 1: inside, 2: in+outside rendering; bit4(+5): map interpolation cos/bicubic
  s:= s+r+'bOptions3:                                     '+Byte2Str(CH.bOptions3);  //bit1+2+3  type of DEcombination
  s:= s+r+'iFCount:                                       '+IntToStr(CH.iFCount);    //for save as txt to spare chars..only if one array[0..5] of TFaddon
  s:= s+r+'bHybOpt1:                                      '+IntToStr(CH.bHybOpt1);    //end1, repeat1            2x 4bit
  s:= s+r+'bHybOpt2:                                      '+Word2Str(CH.bHybOpt2);    //start2, end2, repeat2    3x 4bit
//------------------------------------------------------------------------------
  s:= s+r+'------------------------------------------------------------';
    for X := 0 to 5 do    //how many formulas?
      begin
        if CH.Formulas[X].iFnr <> -1 then
          begin
            //OC:=CH.Formulas[X].iOptionCount;
            s:= s+r+'--------------------['+IntToStr(X)+']------------------------';
            s:= s+r+'iItCount:                                     '+IntToStr(CH.Formulas[X].iItCount);
            s:= s+r+'iFnr:                                         '+IntToStr(CH.Formulas[X].iFnr);  //4    intern < 20 nr of formula, extern 20 or higher: CustomFname for identification
            s:= s+r+'iOptionCount:                                 '+IntToStr(CH.Formulas[X].iOptionCount);
            s:= s+r+'CustomFname[32]:                              '+Trim(CustomFtoStr(CH.Formulas[X].CustomFname));  //1>6

            ot:=''; ov:=''; os:=''; ot:=''; ots:='';

            s:= s+r+'------------------------------------------------------------';
            s:= s+r+'Formulas:    array[0..5] of THAformula;.....................'; //=8+188*6=1136bytes
            for Y := 0 to 15 do
            begin
                ot  := ot+IntToStr(CH.Formulas[X].byOptionType[Y])+'|';
                ov  := ov+FloatToStr(CH.Formulas[X].dOptionValue[Y])+'|';
                os  := os+PTCustomFormula(MH.PHCustomF[X]).sOptionStrings[Y]+'|';
                ots := ots+IntToStr(PTCustomFormula(MH.PHCustomF[X]).byOptionTypes[Y])+'|';
            end;
                s:= s+r+'byOptionType(s):'+ot;
                s:= s+r+'dOptionValue(s):'+ov;
                s:= s+r+'sOptionStrings(s):'+os;
                s:= s+r+'byOptionTypes(s):'+ots;
          //        s:= s+r+ CF(MH.PHCustomF[X]).sOptionStrings[Y]
          //                 + '[' + IntToStr(Y) + ']: '
          //                 + FloatToStr(CF(MH.PHCustomF[X]).dOptionValue[Y]);
          end;
      end;
  s:= s+r+'------------------------------------------------------------';
//------------------------------------------------------------------------------
  s:= s+r+'PCFAddon:                 Pointer;   #406.....';                             // #406  pointer to the Header Addon for the customF's data, must also not be here
  //iniMheader
  MH.PCFAddon := @CH;
  for X := 0 to 5 do MH.PHCustomF[X] := @HC[X];
  X:=0;
  s:= s+r+'SIMDlevel:                Integer;           '+IntToStr(HC[X].SIMDlevel);
  s:= s+r+'iCFOptionCount:           Integer;           '+IntToStr(HC[X].iCFOptionCount);
  s:= s+r+'dDEscale:                 Double;            '+FloatToStr(HC[X].dDEscale);
  s:= s+r+'dADEscale:                Double;            '+FloatToStr(HC[X].dADEscale);
  s:= s+r+'dSIpow:                   Double;            '+FloatToStr(HC[X].dSIpow);
  s:= s+r+'dRstop:                   Double;            '+FloatToStr(HC[X].dRstop);
  s:= s+r+'iConstCount:              Integer;           '+IntToStr(HC[X].iConstCount);
  s:= s+r+'iDEoption:                Integer;           '+IntToStr(HC[X].iDEoption);
  s:= s+r+'iVersion:                 Integer;           '+IntToStr(HC[X].iVersion);
  //s:= s+r+'pConstPointer16:         pointer;            '+IntToStr(HC[X].pConstPointer16);
  //s:= s+r+'VarBuffer:               Integer;            '+IntToStr(HC[X].VarBuffer); array of byte
  //s:= s+r+'bCPmemReserved:           LongBool;          '+IntToStr(HC[X].bCPmemReserved);
  //s:= s+r+'pCodePointer:           ThybridIteration;     '+IntToStr(HC[X].pCodePointer);  ThybridIteration
  //s:= s+r+'LastModTime:           TDateTime;     '+IntToStr(HC[X].LastModTime);  TDateTime

  s:= s+r+'sDOFZsharp2:              Single;    #410     '+FloatToStr(MH.sDOFZsharp2)+'';                // #410  ->2nd focuspoint                  \.. be used to store username in here! 28Bytes
  s:= s+r+'iMaxIts:                  Integer;   #414     '+IntToStr(MH.iMaxIts)+'';                      // #414  in statistics                     \.. 1 original author, 2nd author 14 bytes * 8/7bits
  s:= s+r+'iMaxItsF2:                Integer;   #418     '+IntToStr(MH.iMaxItsF2)+'';                    // #418  DEcomb maxits for formula 2
  s:= s+r+'DEmixColorOption:         Byte;      #422     '+Byte2Str(MH.DEmixColorOption)+'';             // #422
  s:= s+r+'MCcontrast:               Byte;      #423     '+Byte2Str(MH.MCcontrast)+'';                   // #423
  s:= s+r+'sM3dVersion:              Single;    #424     '+FloatToStr(MH.sM3dVersion)+'';                // #424
  s:= s+r+'TilingOptions:            Integer;   #428     '+IntToStr(MH.TilingOptions)+'';                // #428  in MCmode: OldAvrgSqrNoise as Single
  //s:= s+r+'Light:            TLightingParas9;    #432                                                     // #432  +408 = 840 bytes

  fM2T.mM2T.Text:=s;
  end;

{$REGION '============================================================================= > | REGION'}



//  THAformula = packed record
//    iItCount:     Integer;                 //4
//    iFnr:         Integer;                 //4    intern < 20 nr of formula, extern 20 or higher: CustomFname for identification
//    iOptionCount: Integer;                 //4
//    CustomFname:  array[0..31] of Byte;    //32
//    byOptionType: array[0..15] of Byte;    //16
//    dOptionValue: array[0..15] of Double;  //128
//  end;                                     //=188bytes
//  PTHAformula = ^THAformula;

//  THeaderCustomAddon = packed record  //will be obsolete when doing a general formula hybridization
//    bHCAversion: Byte;   //total itcount still in header!
//    bOptions1:   Byte;   //type of hybrid: 0:alt  1:interpolhybrid  2:DEcombinated  3: (K/L?)IFS
//    bOptions2:   Byte;   //bit1: Disable analytical DE bit2+3: 0: outside, 1: inside, 2: in+outside rendering; bit4(+5): map interpolation cos/bicubic
//    bOptions3:   Byte;   //bit1+2+3  type of DEcombination
//    iFCount:     Byte;   //for save as txt to spare chars..only if one array[0..5] of TFaddon
//    bHybOpt1:    Byte;   //end1, repeat1            2x 4bit
//    bHybOpt2:    Word;   //start2, end2, repeat2    3x 4bit
//    Formulas:    array[0..5] of THAformula;  //=8+188*6=1136bytes
//  end;
//  PTHeaderCustomAddon = ^THeaderCustomAddon;
//------------------------------------------------------------------------------
//  TCustomFormula = record
//    SIMDlevel:       Integer;    // 0: no simd, 1: SSE2, 2: SSE3, 4: SSSE3, 8: SSE4.1
//    sOptionStrings:  array[0..15] of String;
//    byOptionTypes:   array[0..15] of Byte;
//    iCFOptionCount:  Integer;
//    dDEscale:        Double;
//    dADEscale:       Double;
//    dSIpow:          Double;
//    dRstop:          Double;
//    iConstCount:     Integer;
//    iDEoption:       Integer;
//    iVersion:        Integer;
//    pConstPointer16: Pointer;
//    VarBuffer:       array of Byte;
//    bCPmemReserved:  LongBool;
//    pCodePointer:    TPhybridIteration;
//    LastModTime:     TDatetime;
//  //  LastCFloaded:    String;
//  end;
//  PTCustomFormula = ^TCustomFormula;

  //sbm2tClick(Sender);

  // TMandHeader10 = packed record                        //       Mainparametersforstoring/loading
//   MandId:                     Integer;               //       orbyte+3 free bytes
//   Width:                      Integer;               //       MandId,Iterations could be Word?
//   Height:                     Integer;               //       MandId,Iterations could be Word?
//   Iterations:                 Integer;               //       MandId,Iterations could be Word?
//   iOptions:                   Word;                  //       iOptions: SmoothNs: (SpinEdit2.Value shl 6) or FirstStepRandom=bit1 or StepSubDEstop=bit3
//   bNewOptions:                Byte;                  //       bit1: Quaternion instead of RotationMatrix! bit2: color on it nr:
//   bColorOnIt:                 Byte;                  //       0:disabled 1: outputvec:=inputvec (1)2..255 iterate n-1 times + docolor
//   dZstart:                    Double;                // #20
//   dZend:                      Double;                // #20
//   dXmid:                      Double;                // #36
//   dYmid:                      Double;                // #36
//   dZmid:                      Double;                // #36
//   dXWrot:                     Double;                // #60   4D rotation
//   dYWrot:                     Double;                // #60   4D rotation
//   dZWrot:                     Double;                // #60   4D rotation
//   dZoom:                      Double;                // #84
//   RStop:                      Double;                // #84
//   iReflectsCalcTime:          Integer;               // #100  in MCmode: OldAvrgRayCount
//   sFmixPow:                   Single;                // #104  for formula DE Mix combs
//   dFOVy:                      Double;                // #108  in single? (added 4 bytes)
//   sTRIndex:                   Single;                // #116  for transmission calculation
//   sTRscattering:              Single;                // #120  light scattering amount
//   MCoptions:                  Byte;                  // #124  bit1: HDR   bit2: bSecantSearch  bit3: autoclipS+D  bit5..7: DoFbokeh  bit8: newMCrecordYUV
//   MCdiffReflects:             Byte;                  // #125  D2Byte 0.00 .. 2.50  reflects diffusity         bit4: aa box/gauss
//   bStereoMode:                Byte;                  // #126  0: no  1: very left  3:right  4:left
//   bSSAO24BorderMirrorSize:    Byte;                  // #127  0 to 0.5
//   iAmbCalcTime:               Integer;               // #128
//   bNormalsOnDE:               Byte;                  // #132
//   bCalculateHardShadow:       Byte;                  // #133  calc automatic=bit1,  setLdifFuncToCos=bit2   + 6 bits yes/no of light1-6
//   bStepsafterDEStop:          Byte;                  // #134  = bin search
//   MinimumIterations:          Word;                  // #135  -> word is enough + 2bytes (no down compatibility)
//   MClastY:                    Word;                  // #137
//   bCalc1HSsoft:               Byte;                  // #139  -> bCalc1HSsoft, option to calculate only 1 HS but 6 bit as amount
//   iAvrgDEsteps:               Integer;               // #140  val * 10
//   iAvrgIts:                   Integer;               // #140  val * 10
//   bPlanarOptic:               Byte;                  // #148  camera planar optic:0/1  /2: spherePano  ..3: dome?
//   bCalcAmbShadowAutomatic:    Byte;                  // #149  bit1: yes/no, bit2: kindof: threshold maxclip/thr. down to 0  bit3+4: type(0:15bit,1:24bit,2:24bit rand,3:DEAO)
//   sNaviMinDist:               Single;                // #150  necessary?                                                              bit5+6(+7): DE raycount (3,7,17,33),  bit8: FSR (first step random)
//   dStepWidth:                 Double;                // #154  related to zoom
//   bVaryDEstopOnFOV:           Byte;                  // #162
//   bHScalculated:              Byte;                  // #163  if it was calculated,  6 bits yes/no of light1-6  = bit 3..8
//   sDOFZsharp:                 Single;                // #164
//   sDOFclipR:                  Single;                // #164
//   sDOFaperture:               Single;                // #172
//   bCutOption:                 Byte;                  // #176
//   sDEstop:                    Single;                // #177
//   bCalcDOFtype:               Byte;                  // #181  0: dont calc, bit 2+3: passes bit4: function sorted/forward
//   mZstepDiv:                  Single;                // #182
//   MCDepth:                    Byte;                  // #186
//   SSAORcount:                 Byte;                  // #187
//   AODEdithering:              Byte;                  // #188
//   bImageScale:                Byte;                  // #189
//   bIsJulia:                   Byte;                  // #190
//   dJx:                        Double;                // #191  Julia vals
//   dJy:                        Double;                // #191  Julia vals
//   dJz:                        Double;                // #191  Julia vals
//   dJw:                        Double;                // #191  Julia vals
//   bDFogIt:                    Byte;                  // #223
//   MCSoftShadowRadius:         ShortFloat;            // #224
//   HSmaxLengthMultiplier:      Single;                // #226
//   StereoScreenWidth:          Single;                // #230
//   StereoScreenDistance:       Single;                // #234
//   StereoMinDistance:          Single;                // #238
//   sRaystepLimiter:            Single;                // #242
//   hVGrads:                    TMatrix3;              // #246  complete 3x3 matrix for navigating, can change to Quaternion if wNewOptions and 1
//   bMCSaturation:              Byte;                  // #318
//   sAmbShadowThreshold:        Single;                // #319  z/r
//   iCalcTime:                  Integer;               // #323  Seconds * 10
//   iCalcHStime:                Integer;               // #327
//   byCalcNsOnZBufAuto:         Byte;                  // #331
//   SRamount:                   Single;                // #332  Amount of reflection light
//   bCalcSRautomatic:           Byte;                  // #336  bit1 auto,  bit2 trans, bit3 only dIFS
//   SRreflectioncount:          Byte;                  // #337
//   sColorMul:                  Single;                // #338  multiplier for color option 'last vectorlength increase'
//   byColor2Option:             Byte;                  // #342
//   bVolLightNr:                Byte;                  // #343  was: byRepeatFrom -> in HAddon  lower 3(4)bits: lightnr, upper 4 bits: mapsize +/-7 in 20% steps
//   bCalc3D:                    Byte;                  // #344
//   bSliceCalc:                 Byte;                  // #345
//   dCutX:                      Double;                // #346
//   dCutY:                      Double;                // #346
//   dCutZ:                      Double;                // #346
//   sTransmissionAbsorption:    Single;                // #370
//   sDEAOmaxL:                  Single;                // #374
//   sDEcombS:                   Single;                // #378  DEcombAvrg absolute smooth distance;  was: pointer to a custom formula.. obsolete
//   PHCustomF:                  array[0..5]of Pointer; // #382  must not be here, 24(28) bytes free - just 1 pointer to formulastruct would be enough
//   PCFAddon:                   Pointer;               // #406  pointer to the Header Addon for the customF's data, must also not be here
//   sDOFZsharp2:                Single;                // #410  ->2nd focuspoint                  \.. be used to store username in here! 28Bytes
//   iMaxIts:                    Integer;               // #414  in statistics                     \.. 1 original author, 2nd author 14 bytes * 8/7bits
//   iMaxItsF2:                  Integer;               // #418  DEcomb maxits for formula 2
//   DEmixColorOption:           Byte;                  // #422
//   MCcontrast:                 Byte;                  // #423
//   sM3dVersion:                Single;                // #424
//   TilingOptions:              Integer;               // #428  in MCmode: OldAvrgSqrNoise as Single
//   Light:                      TLightingParas9;       // #432  +408 = 840 bytes
{$ENDREGION '========================================================================== > | REGION'}

end.
