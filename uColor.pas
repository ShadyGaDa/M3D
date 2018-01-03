unit uColor;  // return sat(0ff/1-240) lum(0ff/1-240) hue(0-239)=240
              // lum = black <0> white   increase sat for rel hue  dist up pole of bypyramid[sat] latitude north<>south
              //           <gr£y>        or change hue if ? sat
              // sat or chroma   distance from center  of bipyramid[hue] equatorial longitude polar coord east<>west
              //
interface

uses
  Winapi.Windows,
  System.Math,
  System.SysUtils,
  Vcl.Graphics,

//function ColorToRGB(Color: TColor): Longint;
//function ColorToString(Color: TColor): string;// inline;
//function StringToColor(const S: string): TColor;// inline;
//procedure GetColorValues(Proc: TGetStrProc);
//function ColorToIdent(Color: Longint; var Ident: string): Boolean;// inline;
//function IdentToColor(const Ident: string; var Color: Longint): Boolean;// inline;

  Vcl.GraphUtil;
{ Calculates Hue, Luminance and Saturation for the clrRGB value }
//procedure ColorRGBToHLS(clrRGB: TColorRef; var Hue, Luminance, Saturation: Word);      TColorRef = UInt32
{ Calculates a color given Hue, Luminance and Saturation values }
//function ColorHLSToRGB(Hue, Luminance, Saturation: Word): TColorRef;

type
  TColor = $7FFFFFFF-1..$7FFFFFFF;

//var
//  RGB := Point(0, 0, 0);

const
//eg.
//  Min = 0;
//  Max = 100;
//  Center = (Max - Min) div 2;
//  Beta = Chr(225);
//  NumChars = Ord('Z') - Ord('A') + 1;
//  Message = 'Out of memory';
//  ErrStr = ' Error: ' + Message + '. ';
//  ErrPos = 80 - Length(ErrStr) div 2;
//  Ln10 = 2.302585092994045684;
//  Ln10R = 1 / Ln10;
//  Numeric = ['0'..'9'];
//  Alpha = ['A'..'Z', 'a'..'z'];
//  AlphaNum = Alpha + Numeric;

  //----------------------------------------------------------------------------
  i8                    = $80000000;  //Cardinal > Uint32 / FixedUInt = 2147483648
  clScrollBar           = TColor(COLOR_SCROLLBAR or i8);
  clBackground          = TColor(COLOR_BACKGROUND or i8);
  clActiveCaption       = TColor(COLOR_ACTIVECAPTION or i8);
  clInactiveCaption     = TColor(COLOR_INACTIVECAPTION or i8);
  clMenu                = TColor(COLOR_MENU or i8);
  clWindow              = TColor(COLOR_WINDOW or i8);
  clWindowFrame         = TColor(COLOR_WINDOWFRAME or i8);
  clMenuText            = TColor(COLOR_MENUTEXT or i8);
  clWindowText          = TColor(COLOR_WINDOWTEXT or i8);
  clCaptionText         = TColor(COLOR_CAPTIONTEXT or i8);
  clActiveBorder        = TColor(COLOR_ACTIVEBORDER or i8);
  clInactiveBorder      = TColor(COLOR_INACTIVEBORDER or i8);
  clAppWorkSpace        = TColor(COLOR_APPWORKSPACE or i8);
  clHighlight           = TColor(COLOR_HIGHLIGHT or i8);
  clHighlightText       = TColor(COLOR_HIGHLIGHTTEXT or i8);
  clBtnFace             = TColor(COLOR_BTNFACE or i8);
  clBtnShadow           = TColor(COLOR_BTNSHADOW or i8);
  clGrayText            = TColor(COLOR_GRAYTEXT or i8);
  clBtnText             = TColor(COLOR_BTNTEXT or i8);
  clInactiveCaptionText = TColor(COLOR_INACTIVECAPTIONTEXT or i8);
  clBtnHighlight        = TColor(COLOR_BTNHIGHLIGHT or i8);
  cl3DDkShadow          = TColor(COLOR_3DDKSHADOW or i8);
  cl3DLight             = TColor(COLOR_3DLIGHT or i8);
  clInfoText            = TColor(COLOR_INFOTEXT or i8);
  clInfoBk              = TColor(COLOR_INFOBK or i8);

  clBlack   = TColor($000000);
  clMaroon  = TColor($000080);
  clGreen   = TColor($008000);
  clOlive   = TColor($008080);
  clNavy    = TColor($800000);
  clPurple  = TColor($800080);
  clTeal    = TColor($808000);
  clGray    = TColor($808080);
  clSilver  = TColor($C0C0C0);
  clRed     = TColor($0000FF);
  clLime    = TColor($00FF00);
  clYellow  = TColor($00FFFF);
  clBlue    = TColor($FF0000);
  clFuchsia = TColor($FF00FF);
  clAqua    = TColor($FFFF00);
  clLtGray  = TColor($C0C0C0);
  clDkGray  = TColor($808080);
  clWhite   = TColor($FFFFFF);
  clNone    = TColor($1FFFFFFF);
  clDefault = TColor($20000000);
                                                                                //  !!
//.-----------------------------------------------------------------------------

type
  TColorEntry = record
    Value: TColor;
    Name: string;
  end;

const
  Colors: array[0..41] of TColorEntry = (
    (Value: clBlack;               Name: 'clBlack'),
    (Value: clMaroon;              Name: 'clMaroon'),
    (Value: clGreen;               Name: 'clGreen'),
    (Value: clOlive;               Name: 'clOlive'),
    (Value: clNavy;                Name: 'clNavy'),
    (Value: clPurple;              Name: 'clPurple'),
    (Value: clTeal;                Name: 'clTeal'),
    (Value: clGray;                Name: 'clGray'),
    (Value: clSilver;              Name: 'clSilver'),
    (Value: clRed;                 Name: 'clRed'),
    (Value: clLime;                Name: 'clLime'),
    (Value: clYellow;              Name: 'clYellow'),
    (Value: clBlue;                Name: 'clBlue'),
    (Value: clFuchsia;             Name: 'clFuchsia'),
    (Value: clAqua;                Name: 'clAqua'),
    (Value: clWhite;               Name: 'clWhite'),
    //--------------------------------------------------------------------------
    (Value: clScrollBar;           Name: 'clScrollBar'),
    (Value: clBackground;          Name: 'clBackground'),
    (Value: clActiveCaption;       Name: 'clActiveCaption'),
    (Value: clInactiveCaption;     Name: 'clInactiveCaption'),
    (Value: clMenu;                Name: 'clMenu'),
    (Value: clWindow;              Name: 'clWindow'),
    (Value: clWindowFrame;         Name: 'clWindowFrame'),
    (Value: clMenuText;            Name: 'clMenuText'),
    (Value: clWindowText;          Name: 'clWindowText'),
    (Value: clCaptionText;         Name: 'clCaptionText'),
    (Value: clActiveBorder;        Name: 'clActiveBorder'),
    (Value: clInactiveBorder;      Name: 'clInactiveBorder'),
    (Value: clAppWorkSpace;        Name: 'clAppWorkSpace'),
    (Value: clHighlight;           Name: 'clHighlight'),
    (Value: clHighlightText;       Name: 'clHighlightText'),
    (Value: clBtnFace;             Name: 'clBtnFace'),
    (Value: clBtnShadow;           Name: 'clBtnShadow'),
    (Value: clGrayText;            Name: 'clGrayText'),
    (Value: clBtnText;             Name: 'clBtnText'),
    (Value: clInactiveCaptionText; Name: 'clInactiveCaptionText'),
    (Value: clBtnHighlight;        Name: 'clBtnHighlight'),
    (Value: cl3DDkShadow;          Name: 'cl3DDkShadow'),
    (Value: cl3DLight;             Name: 'cl3DLight'),
    (Value: clInfoText;            Name: 'clInfoText'),
    (Value: clInfoBk;              Name: 'clInfoBk'),
    (Value: clNone;                Name: 'clNone'));

//------------------------------------------------------------------------------
type
  THSV = record  // hue saturation value (HSV)
    Hue , Sat , Val : Double;
  end;


const
  HLSMAX = 240;            // H,L, and S vary over 0-HLSMAX
  RGBMAX = 255;            // R,G, and B vary over 0-RGBMAX
                           // HLSMAX BEST IF DIVISIBLE BY 6
                           // RGBMAX, HLSMAX must each fit in a byte.

  { Hue is undefined if Saturation is 0 (grey-scale)
    This value determines where the Hue scrollbar is
    initially set for achromatic colors }
  HLSUndefined = (HLSMAX*2/3);

procedure ColorRGBToHLS(clrRGB: TColorRef; var Hue, Luminance, Saturation: Word); //     TColorRef = UInt32
function ColorHLSToRGB(Hue, Luminance, Saturation: Word): TColorRef;




function IdentToColor(const Ident: string; var Color: Longint): Boolean;
function StringToColor(const S: string): TColor;

function RGB2HSV(R,G,B : Byte): THSV;

function RGBFP(R,G,B: Double): TColor;
function HSV2RGB(H,S,V: Double): TColor;

//function StringToColorU(Color: String): TColor;
function IntRange(const Value, Min, Max: Integer): Integer;
function GetColor(const AColor: TColor): TColor;

//function TweakColor(const AColor: TColor; const ADiff: Integer): TColor;



implementation


function Brighten(AColor: TColor): TColor;
var
  H, S, L: Word;
begin
  ColorRGBToHLS(AColor, H, L, S);
  Result := ColorHLSToRGB(H, 225, S);
end;


procedure ColorRGBToHLS(clrRGB: TColorRef; var Hue, Luminance, Saturation: Word);
var
  H, L, S: Double;
  R, G, B: Word;
  cMax, cMin: Double;
  Rdelta, Gdelta, Bdelta: Word; { intermediate value: % of spread from max }
begin
//  if clrRGB = CachedRGBToHLSclrRGB then
//  begin
//    Hue := CachedRGBToHLSHue;
//    Luminance := CachedRGBToHLSLum;
//    Saturation := CachedRGBToHLSSat;
//    exit;
//  end;
  R := GetRValue(clrRGB);
  G := GetGValue(clrRGB);
  B := GetBValue(clrRGB);

  { calculate lightness }
  cMax := System.Math.Max(System.Math.Max(R, G), B);
  cMin := System.Math.Min(System.Math.Min(R, G), B);
  L := ( ((cMax + cMin) * HLSMAX) + RGBMAX ) / ( 2 * RGBMAX);
  Luminance := Trunc(L);
  if cMax = cMin then  { r=g=b --> achromatic case }
  begin
    Hue := Trunc(HLSUndefined);
    Saturation := 0;
  end
  else                 { chromatic case }
  begin
    { saturation }
    if Luminance <= HLSMAX/2 then
      S := ( ((cMax-cMin)*HLSMAX) + ((cMax+cMin)/2) ) / (cMax+cMin)
    else
      S := ( ((cMax-cMin)*HLSMAX) + ((2*RGBMAX-cMax-cMin)/2) ) / (2*RGBMAX-cMax-cMin);

    { hue }
    Rdelta := Trunc(( ((cMax-R)*(HLSMAX/6)) + ((cMax-cMin)/2) ) / (cMax-cMin));
    Gdelta := Trunc(( ((cMax-G)*(HLSMAX/6)) + ((cMax-cMin)/2) ) / (cMax-cMin));
    Bdelta := Trunc(( ((cMax-B)*(HLSMAX/6)) + ((cMax-cMin)/2) ) / (cMax-cMin));

    if (R = cMax) then
      H := Bdelta - Gdelta
    else if (G = cMax) then
      H := (HLSMAX/3) + Rdelta - Bdelta
    else // B == cMax
      H := ((2 * HLSMAX) / 3) + Gdelta - Rdelta;

    if (H < 0) then
      H := H + HLSMAX;
    if (H > HLSMAX) then
      H := H - HLSMAX;

    Hue := Round(H);
    Saturation := Trunc(S);
  end;
//  CachedRGBToHLSclrRGB := clrRGB;
//  CachedRGBToHLSHue := Hue;
//  CachedRGBToHLSLum := Luminance;
//  CachedRGBToHLSSat := Saturation;
end;

function HueToRGB(Lum, Sat, Hue: Double): Integer;
var
  ResultEx: Double;
begin
  { range check: note values passed add/subtract thirds of range }
  if (hue < 0) then
     hue := hue + HLSMAX;

  if (hue > HLSMAX) then
     hue := hue - HLSMAX;

  { return r,g, or b value from this tridrant }
  if (hue < (HLSMAX/6)) then
    ResultEx := Lum + (((Sat-Lum)*hue+(HLSMAX/12))/(HLSMAX/6))
  else if (hue < (HLSMAX/2)) then
    ResultEx := Sat
  else if (hue < ((HLSMAX*2)/3)) then
    ResultEx := Lum + (((Sat-Lum)*(((HLSMAX*2)/3)-hue)+(HLSMAX/12))/(HLSMAX/6))
  else
    ResultEx := Lum;
  Result := Round(ResultEx);
end;

function ColorHLSToRGB(Hue, Luminance, Saturation: Word): TColorRef;

  function RoundColor(Value: Double): Integer;
  begin
    if Value > 255 then
      Result := 255
    else
      Result := Round(Value);
  end;

var
  R,G,B: Double;               { RGB component values }
  Magic1,Magic2: Double;       { calculated magic numbers (really!) }
begin
  if (Saturation = 0) then
  begin            { achromatic case }
     R := (Luminance * RGBMAX)/HLSMAX;
     G := R;
     B := R;
     if (Hue <> HLSUndefined) then
       ;{ ERROR }
  end
  else
  begin            { chromatic case }
     { set up magic numbers }
     if (Luminance <= (HLSMAX/2)) then
        Magic2 := (Luminance * (HLSMAX + Saturation) + (HLSMAX/2)) / HLSMAX
     else
        Magic2 := Luminance + Saturation - ((Luminance * Saturation) + (HLSMAX/2)) / HLSMAX;
     Magic1 := 2 * Luminance - Magic2;

     { get RGB, change units from HLSMAX to RGBMAX }
     R := (HueToRGB(Magic1,Magic2,Hue+(HLSMAX/3))*RGBMAX + (HLSMAX/2))/HLSMAX;
     G := (HueToRGB(Magic1,Magic2,Hue)*RGBMAX + (HLSMAX/2)) / HLSMAX;
     B := (HueToRGB(Magic1,Magic2,Hue-(HLSMAX/3))*RGBMAX + (HLSMAX/2))/HLSMAX;
  end;
  Result := RGB(RoundColor(R), RoundColor(G), RoundColor(B));
end;








function IdentToColor(const Ident: string; var Color: Longint): Boolean;
var
  I: Integer;
begin
  for I := Low(Colors) to High(Colors) do
    if CompareText(Colors[I].Name, Ident) = 0 then
    begin
      Result := True;
      Color := Longint(Colors[I].Value);
      Exit;
    end;
  Result := False;
end;
function StringToColor(const S: string): TColor;
begin
  if not IdentToColor(S, Longint(Result)) then
    Result := TColor(StrToInt(S));
end;

function RGB2HSV (R,G,B : Byte) : THSV;
var
  Min_, Max_, Delta : Double;
  H , S , V : Double ;
begin
  H := 0.0 ;
  Min_ := Min (Min( R,G ), B);
  Max_ := Max (Max( R,G ), B);
  Delta := ( Max_ - Min_ );
  V := Max_ ;
  If ( Max_ <> 0.0 ) then
    S := 255.0 * Delta / Max_
  else
    S := 0.0 ;
  If (S <> 0.0) then
    begin
      If R = Max_ then
        H := (G - B) / Delta
      else
        If G = Max_ then
          H := 2.0 + (B - R) / Delta
        else
          If B = Max_ then
            H := 4.0 + (R - G) / Delta
    end
  else
    H := -1.0 ;
  H := H * 60 ;
  If H < 0.0 then H := H + 360.0;
  with Result Do
    begin
      Hue := H ;            // Hue -> 0..360
      Sat := S * 100 / 255; // Saturation -> 0..100 %
      Val := V * 100 / 255; // Value - > 0..100 %
    end;
end;

function RGBFP(R,G,B: Double): TColor;
const
  RGBmax = 255;
begin
  Result := RGB(Round(RGBmax * R), Round(RGBmax * G), Round(RGBmax * B));
end;
function HSV2RGB(H,S,V: Double): TColor;
var
  i: Integer;
  f, p, q, t: Double;
begin
  Assert(InRange(H, 0.0, 1.0));
  Assert(InRange(S, 0.0, 1.0));
  Assert(InRange(V, 0.0, 1.0));

  if S = 0.0 then
  begin
    // achromatic (grey)
    Result := RGBFP(V, V, V);
    exit;
  end;

  H := H * 6.0; // sector 0 to 5
  i := floor(H);
  f := H - i; // fractional part of H
  p := V * (1.0 - S);
  q := V * (1.0 - S * f);
  t := V * (1.0 - S * (1.0 - f));
  case i of
  0: Result := RGBFP(V, t, p);
  1: Result := RGBFP(q, V, p);
  2: Result := RGBFP(p, V, t);
  3: Result := RGBFP(p, q, V);
  4: Result := RGBFP(t, p, V);
  else
     Result := RGBFP(V, p, q);
  end;
end;

function IntRange(const Value, Min, Max: Integer): Integer;
begin
  Result:= Value;
  if Result < Min then Result:= Min;
  if Result > Max then Result:= Max;
end;
function GetColor(const AColor: TColor): TColor;
var
  R, G, B: Byte;
  D: Integer;
  Dir: Integer;
begin
  R:= GetRValue(AColor);
  G:= GetGValue(AColor);
  B:= GetBValue(AColor);
//  D:= (R + G + B) div 3;     //D = average difference of all 3 color channels
//  if D >= (256 div 2) then begin   //If average is a lighter color...
//    Dir:= -ADiff;                  //Make the color darker
//  end else begin                   //If average is a darker color...
//    Dir:= ADiff;                   //Make the color lighter
//  end;
//  R:= IntRange(R + Dir, 0, 255);
//  G:= IntRange(G + Dir, 0, 255);
//  B:= IntRange(B + Dir, 0, 255);
  Result:= RGB(R, G, B);
end;

{
function TweakColor(const AColor: TColor; const ADiff: Integer): TColor;
var
  HSV: THSV;
  V, VAdj: Single;
begin
  HSV := RGB2HSV(AColor);
  V := GetVValue(HSV);
  VAdj := (ADiff / 128) * (V - 0.5);
  Result := HSV2RGB(HSV(GetHValue(HSV), GetSValue(HSV), V - VAdj));
end;
}
//function GetRGB(const AColor: TColor): TPoint;
//var
//  R, G, B: Byte;
//begin
//    Result.X := Max(0, Min(5, StrToIntTrim(lbl_frm2.Caption) - 1));
//    Result.Y := Max(0, Min(15, FSubIndexTop2 + iSlider));
//end;


{
function TweakColor(const AColor: TColor; const ADiff: Integer): TColor;
var
  R, G, B: Byte;
  D: Integer;
  Dir: Integer;
begin
  R:= GetRValue(AColor);
  G:= GetGValue(AColor);
  B:= GetBValue(AColor);
  D:= (R + G + B) div 3;     //D = average difference of all 3 color channels
  if D >= (256 div 2) then begin   //If average is a lighter color...
    Dir:= -ADiff;                  //Make the color darker
  end else begin                   //If average is a darker color...
    Dir:= ADiff;                   //Make the color lighter
  end;
  R:= IntRange(R + Dir, 0, 255);
  G:= IntRange(G + Dir, 0, 255);
  B:= IntRange(B + Dir, 0, 255);
  Result:= RGB(R, G, B);
end;
}
{
function StringToColorU(Color: String): TColor;
var
    RR, GG, BB: String;
    Dec: Integer;
begin
    // Change string Color from $RRGGBB to $BBGGRR and then convert to TColor
    if  (Length(Color) <> 7) or (Color[1] <> '$')  then  Result := $000000
    else
    begin
        RR := Color[2] + Color[3];
        GG := Color[4] + Color[5];
        BB := Color[6] + Color[7];
        Dec := StrToInt('$' + BB + GG + RR);
        Result := TColor(Dec);
    end;
end;
}

end.
