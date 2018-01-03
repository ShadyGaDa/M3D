unit uFormula;
     //STANDALONE
interface

uses
  Winapi.Windows,
  System.Classes,
  System.Math,
  System.SysUtils,
  Vcl.Dialogs,
  TypeDefinitions,
  HeaderTrafos,
  uCPU,
  CustomFormulas,
  DivUtils,
  FileHandling,
  formulas;
  //  JITFormulas,
  //  FormulaCompiler;
type

  TFormulaClass = class

  procedure SetCFoptionsFromOldF(f: Integer; CF: PTCustomFormula);

  procedure GetHAddOnFromInternFormula(PMHeader: TPMandHeader10; f, t: Integer);

  function LoadCustomFormulaFromHeader(var CustomFname: array of Byte;
                                       var lCustomFormula: TCustomFormula;
                                       var dOptionVars: array of Double): Boolean;

  function LoadCustomFormula(FileName: String;
                             var lCustomFormula: TCustomFormula;
                             var CustomFname: array of Byte;
                             var dOptionValues: array of Double;
                             bVerbose: LongBool;
                             MinModTime: TDatetime;
                             //ParseResult: TJITFormula;
                             const IgnoreCodeError: Boolean): Boolean;
 end;

{$REGION '============================================================================= > | var'}

var
    //CustomFormulas
    CFdescription: String;
    CFdescriptionIntern: array[0..9] of String = (

      'The triplex math sine bulb, as suggested by Daniel White and Paul Nylander.'+#13#10+
      'These are fast implementions of powers of 2,3,4,5,6,7 and 8.'+#13#10+#13#10+
      'If you want to make an animation with smooth power changings, please use the ''Real Power'' formula.',

      'The sine bulb where arbitrary power values can be used, the calculation is slower than of integer powers.'+#13#10+#13#10+
        'r  = sqrt(x*x + y*y + z*z)'+#13#10+
        'th = ArcTan2(y, x) * Float_power'+#13#10+
        'ph = ArcSin(z/r) * Float_power'+#13#10+
        'r  = Power(r, Float_power)'+#13#10+
        'x  = r * cos(ph) * cos(th) + Cx'+#13#10+
        'y  = r * cos(ph) * sin(th) + Cy'+#13#10+
        'z  = Z_multiplier * r * sin(ph) + Cz',

      'A 4d quaternion formula, one iteration:'+#13#10+#13#10+
        'x'' = x*x - y*y - z*z - w*w + Cx'+#13#10+
        'y'' = 2*(y*x + z*w) + Cy'+#13#10+
        'z'' = 2*(z*x + YW_multiplier*y*w) + Cz'+#13#10+
        'w'' = 2*(w*x + y*z) + W_add + Cw',

      '', //Tricorn

      'The ''Amazing Box'' aka Mandbox formula, invented by TGlad at fractalforums.com.'+#13#10+#13#10+
      'The formula for one iteration looks like this:'+#13#10+#13#10+
        'x = abs(x+Fold) - abs(x-Fold) - x'+#13#10+
        'y = abs(y+Fold) - abs(y-Fold) - y'+#13#10+
        'z = abs(z+Fold) - abs(z-Fold) - z'+#13#10+
        'rr = x*x + y*y + z*z'+#13#10+
        'if rr < sqr(Min_R) then m = Scale/sqr(Min_R) else'+#13#10+
        'if rr < 1 then m = Scale/rr else m = Scale'+#13#10+
        'x = x * m + Cx'+#13#10+
        'y = y * m + Cy'+#13#10+
        'z = z * m + Cz',

      'A hybrid of a sine power 2 bulb and the amazing box, the 3d vector length decides which formula is used:'+#13#10+
      'If it is bigger than ''Box/Bulb R threshold'' the amazing box is used, else if smaller than ''..threshold 2'' the sine bulb,'+#13#10+
      'inbetween both formulas will be interpolated.  Make the second threshold a little smaller than the first for more smoothness.',

      'A sine integer power bulb with foldings before, like in the amazing box.',

       '',

       '',

      'A bulb formula as suggested by Aexion:'+#13#10+  //Aexion rotate c   [Power, Z mul, Enable RotC (0,1), Cond Phi (0,1), Power C, Cz mul]
      'http://www.fractalforums.com/the-3d-mandelbulb/iterating-c/'+#13#10#13#10+
      'Added two options to power-rotate the Constant by the distance of the current vectors of Z and C (Cond Phi=1),'+#13#10+
      'and the following Mode options:' +#13#10+
      '(Bits of Mode value)' +#13#10+
      'Bit1: Flip atan theta components' +#13#10+
      'Bit2: Flip atan phi components' +#13#10+
      'Bit3: Flip theta and phi' +#13#10+
      'Bit4: Flip CyCz for angle calc' +#13#10+
      'Bit5: Multiply powerC by the distance of vector Z and C');

    InternFNames: String = '.Integer Power.Real Power.Quaternion.Tricorn..Amazing Box.Bulbox.Folding Int Pow.test..testIFS....Aexion C.';
                           //2             17         28         39       48          60     67             83     89        100
                           //div11  1         2          3        4           5      6              7      8         9
    Fdescription: array of String;
    FdescrName: array of String;
    FdescrModTime: array of TDateTime;
    FdescCount: Integer = 0;
    //FileHandling
//    IniDirs: array[0..11] of String = (
//    '', //M3I
//    '', //M3P
//    '', //BMP
//    '', //Formula
//    '', //M3A
//    '', //AniOut
//    '', //BGpic
//    '', //Lightparas
//    '', //BigRenders
//    '', //LightMaps
//    '', //voxel
//    '');//M3C


{$ENDREGION '========================================================================== > | var'}

const
    actFormulaId: Integer = 9;
    InternFormulaNames: array[0..9] of AnsiString = (
      'Integer Power',
      'Real Power',
      'Quaternion',
      'Tricorn',
      'Amazing Box',
      'Bulbox',
      'Folding Int Pow',
      'test',
      'testIFS',
      'Aexion C');
    InternFormulaMax: Integer = 9; //headertrafos


implementation
//
uses
  MAIN;
//  uCPU,
//  CustomFormulas,
//  DivUtils,
//  FileHandling,
//  formulas;

//HeaderTrafos, taken
procedure TFormulaClass.GetHAddOnFromInternFormula(PMHeader: TPMandHeader10; f, t: Integer);
var i: Integer;
    pCF: PTCustomFormula;
const
    oa: array[0..9, 0..1] of Double = ((8,-1),(8,-1),(-1,0),(-2,1),(2,0.5),(2,0.5),(2,-1),(-1,0),(0,0),(8,1));
begin
    if f <= InternFormulaMax then
    with PTHeaderCustomAddon(PMHeader.PCFAddon).Formulas[t] do
    begin
      iFnr := f;
      pCF := PTCustomFormula(PMHeader.PHCustomF[t]);
      SetCFoptionsFromOldF(f, pCF);
      for i := 0 to 1 do dOptionValue[i] := oa[f][i];
      for i := 2 to 15 do dOptionValue[i] := 0;
      for i := 0 to 15 do byOptionType[i] := pCF.byOptionTypes[i];
      iOptionCount := pCF.iCFOptionCount;
      if f = 4 then dOptionValue[2] := 1  //Box
      else if f = 5 then begin  //BulBox
        dOptionValue[2] := 1;
        dOptionValue[3] := 1;
        dOptionValue[4] := 2;
        dOptionValue[5] := 2;
      end
      else if f = 6 then dOptionValue[2] := 2
      else if f = 7 then begin
        for i := 0 to testhybridOptionCount - 1 do dOptionValue[i] := testhybridOptionVals[i];
      end
      else if f = 8 then begin
        for i := 0 to testIFSOptionCount - 1 do dOptionValue[i] := testIFSOptionVals[i];
      end
      else if f = 9 then begin //Aexion C  [Power, Z mul, Enable RotC (0,1), Cond Phi (0,1), Power C, Cz mul, PowC on dist Z-C, Mod (0,1)]
        dOptionValue[2] := 1;
        dOptionValue[3] := 1;
        dOptionValue[4] := 8;
        dOptionValue[5] := 1;
      end;
      PutStringInCustomF(CustomFname, InternFormulaNames[f]);
      CFdescription := CFdescriptionIntern[f];
    end;
end;
//CustomFormulas still there
procedure TFormulaClass.SetCFoptionsFromOldF(f: Integer; CF: PTCustomFormula);
var i: Integer;
const
    sa: array[0..9, 0..1] of String = (
      ('Integer power (2..8)','Z multiplier'),
      ('Float power','Z multiplier'),
      ('YW multiplier','W add'),
      ('Z multiplier','CZ multiplier'),
      ('Scale','Min R'),
      ('Box Scale','Box Min R'),
      ('Integer power (2..8)','Z multiplier'),
      ('',''),
      ('',''),
      ('Float power','Z multiplier'));
begin
    if f in [0..9] then
    with CF^ do
    begin
      for i := 0 to 15 do byOptionTypes[i] := 0;  //Double       //write of in m3i load stream
      if f in [0, 6] then byOptionTypes[0] := 10; //IntPow=NoVar
      if f in [4, 5] then byOptionTypes[1] := 7;  //AmazBoxMinR
      iCFOptionCount := 2;
      for i := 0 to 1 do sOptionStrings[i] := sa[f][i];
      if f = 4 then begin
        iCFOptionCount := 3;
        sOptionStrings[2] := 'Fold';
        byOptionTypes[2] := 11;       //Folding16 R,R,-R,-R
      end
      else if f = 5 then begin //BulBox
        iCFOptionCount := 6;
        sOptionStrings[2] := 'Box fold';
        sOptionStrings[3] := 'Bulb scaling';
        sOptionStrings[4] := 'Box/Bulb R threshold';
        sOptionStrings[5] := 'Box/Bulb R threshold 2';
        byOptionTypes[2] := 11; //Folding16 R,R,-R,-R
        byOptionTypes[3] := 0; //13: reciproc
        byOptionTypes[4] := 9;  //Squared
        byOptionTypes[5] := 9;
      end
      else if f = 6 then begin  //FoldInt
        iCFOptionCount := 3;
        byOptionTypes[2] := 8;
        sOptionStrings[2] := 'R fold';
      end
      else if f = 7 then begin
        iCFOptionCount := testhybridOptionCount;
        for i := 0 to iCFOptionCount - 1 do begin
          sOptionStrings[i] := testhybridOptionsStrings[i];
          byOptionTypes[i] := testhybridOptionTypes[i];
        end;
      end
      else if f = 8 then begin
        iCFOptionCount := testIFSOptionCount;
        for i := 0 to iCFOptionCount - 1 do begin
          sOptionStrings[i] := testIFSOptionsStrings[i];
          byOptionTypes[i] := testIFSOptionTypes[i];
        end;
      end
      else if f = 9 then begin //Aexion rotate c   [Power, Z mul, Enable RotC (0,1), Cond Phi (0,1), Power C, Cz mul, PowC on dist Z-C, Mod (0,1) ]
        iCFOptionCount := 8;
        sOptionStrings[2] := 'Enable rotate C (0,1)';
        sOptionStrings[3] := 'Condi. Phi (0,1)';
        sOptionStrings[4] := 'Float power C';
    //    sOptionStrings[5] := 'Pow C multiplier';
        sOptionStrings[5] := 'Cz multiplier';
        sOptionStrings[6] := 'PowC on dist Vec-C (0,1)';
        sOptionStrings[7] := 'Mode (0..31)';
        byOptionTypes[2] := 2;
        byOptionTypes[3] := 2;
        byOptionTypes[6] := 2;
        byOptionTypes[7] := 2;
      end;
    end;
end;

function TFormulaClass.LoadCustomFormula(FileName: String;
                           var lCustomFormula: TCustomFormula;
                           var CustomFname: array of Byte;
                           var dOptionValues: array of Double;
                           bVerbose: LongBool;
                           MinModTime: TDatetime;
                           const IgnoreCodeError: Boolean): Boolean;

var n, i, j: Integer;
    d: Double;
    Formulaname, s, s2, s3:
    String; EndOfSection: Boolean;
    f: TextFile;
    pb: PByte;
    Code: TStringList;
    p: Pointer;
const                  //DEoption > 0 if analytic on X4
                        //    cOptions: String = '.SSE2.DESC.SIPO.RSTO.SSE3.SSSE.SSE4.VERS.DEOP.DIFS.ADES.';
    cOptions: String = '.SSE2.SSE3.DESC.SIPO.RSTO.VERS.DEOP.DIFS.ADES.'; //  .SSSE.SSE4
    cOptions2: String = '.DOUBLE.SINGLE.INTEGER.DOUBLEANGLE.SINGLEANGLE.3DOUBLEANGLES.3SINGLEANGLES.BOXSCALE.FOLDING.DSQUARE.'+
                        'NOVARIABLE.FOLDING16.6SINGLEANGLES.DRECIPRO.2DOUBLES..DSQRRECI..2SINGLES..4SINGLES..3SCALESANGLES.SCALESROT.2INTEGER..SRECI2....DRECI2.';
    cVars: String = 'DOUBLINTINT64SINGLE';
    sra: array[0..5] of String = (' YZ',' XZ',' XY',' XW',' YW',' ZW');

    procedure LoadNextStr;
    begin
      repeat
        Readln(f, s);
        s := Trim(s);
      until EOF(f) or (s > '');
    end;

begin
    Result := False;
    AssignFile(f, FileName);
    if FileExists(FileName) then with lCustomFormula do try
      Formulaname := ExtractFilename( FileName );
      SetLength(VarBuffer, 1024);
      pConstPointer16 := Pointer((Integer(@VarBuffer[0]) + 271) and $FFFFFFF0);
      pb              := PByte(pConstPointer16);
      SIMDlevel       := 0;
      iCFOptionCount  := 0;
      iConstCount     := 0;
      iDEoption       := 0;
      iVersion        := 0;
      dSIpow          := 0;
      dDEscale        := 1;
      dADEscale       := 1;
      dRstop          := 16;
      Reset(f);
      LoadNextStr;
//------------------------------------------------------------------------------
      if s = '[OPTIONS]' then
      begin
        repeat
          LoadNextStr;
          n := Pos(UpCaseN(s, 5), cOPtions);
          case n of
            //'.SSE2.SSE3.DESC.SIPO.RSTO.VERS.DEOP.ADES.';   .SSSE.SSE4.DIFS
            1:   SIMDlevel := SIMDlevel or 1;               //.SSE2
            6:   SIMDlevel := SIMDlevel or 2;               //.SSE3
            11:  dDEscale  := StrToFloatK(StrLastWord(s));  //.DESC
            16:  dSIpow    := StrToFloatK(StrLastWord(s));  //.SIPO
            21:  dRstop    := StrToFloatK(StrLastWord(s));  //.RSTO
            26:  iVersion  := StrToInt(StrLastWord(s));     //.VERS
            31:  iDEoption := StrToInt(StrLastWord(s));     //.DEOP
            36:  dADEscale := StrToFloatK(StrLastWord(s));  //.ADES              //-6                                                                 -6
            //.DOUBLE.SINGLE.INTEGER           1/8/15
            //.DOUBLEANGLE.SINGLEANGLE         23/35
            //.3DOUBLEANGLES.3SINGLEANGLES     47/61
            //.BOXSCALE.FOLDING.DSQUARE.NOVARIABLE.FOLDING16  75/84/92/100/111
            //.6SINGLEANGLES.DRECIPRO.2DOUBLES.DSQRRECI.'     121/129/138/148
            //.2SINGLES..4SINGLES..3SCALESANGLES.SCALESROT.  158/168/178/192-4
            else
            begin
              s2 := StrFirstWord(s);
              n := Pos(UpperCase(s2), cOPtions2);
              if n > 50 then Dec(n, 6);
              if n > 130 then Dec(n, 6);
              if n > 180 then Dec(n, 4);
              if (n > 0) and (iCFOptionCount < 16) then begin
                byOptionTypes[iCFOptionCount] := (n + 8) div 10;
                dOptionValues[iCFOptionCount] := StrToFloatK(StrLastWord(s));
                s3 := StrSecondWord(s);
                if byOptionTypes[iCFOptionCount] = 12 then begin  //6 singleangles
                  j := iCFOptionCount;
                  for i := 0 to 5 do begin
                    byOptionTypes[iCFOptionCount] := 12;
                    dOptionValues[iCFOptionCount] := dOptionValues[j];
                    sOptionStrings[iCFOptionCount] := s3 + sra[i];
                    Inc(iCFOptionCount);
                  end;
                  Dec(iCFOptionCount);
                end
                else begin
                  sOptionStrings[iCFOptionCount] := s3;
                  if byOptionTypes[iCFOptionCount] in [5, 6] then begin
                    d := dOptionValues[iCFOptionCount];
                    sOptionStrings[iCFOptionCount] := s3 + ' X';
                    Inc(iCFOptionCount);
                    byOptionTypes[iCFOptionCount] := byOptionTypes[iCFOptionCount - 1];
                    dOptionValues[iCFOptionCount] := d;
                    sOptionStrings[iCFOptionCount] := s3 + ' Y';
                    Inc(iCFOptionCount);
                    byOptionTypes[iCFOptionCount] := byOptionTypes[iCFOptionCount - 1];
                    dOptionValues[iCFOptionCount] := d;
                    sOptionStrings[iCFOptionCount] := s3 + ' Z';
                  end
                  else if byOptionTypes[iCFOptionCount] = 18 then begin
                    for i := 0 to 2 do begin
                      Inc(iCFOptionCount);
                      byOptionTypes[iCFOptionCount] := 6;
                      sOptionStrings[iCFOptionCount] := 'Rotation ' + Chr(65 + i);
                      dOptionValues[iCFOptionCount] := 0;
                    end;
                  end
                  else if byOptionTypes[iCFOptionCount] = 19 then begin
                    sOptionStrings[iCFOptionCount] := 'Scale ' + s3;
                    Inc(iCFOptionCount);
                    byOptionTypes[iCFOptionCount] := 6;
                    sOptionStrings[iCFOptionCount] := 'Rotation ' + s3;
                    dOptionValues[iCFOptionCount] := dOptionValues[iCFOptionCount - 1];
                    dOptionValues[iCFOptionCount - 1] := StrToFloatK(StrFirstWordAfterEqual(s));
                  end;
                end;
                Inc(iCFOptionCount);
              end;
            end;
          end;
        until n = 0;
        if (hasSIMDlevel and SIMDlevel) < SIMDlevel then begin
          s := '';
          if bVerbose then ShowMessage('This computer does not support the SIMD level required by this formula.')
          else GUI.OutMessage('This computer does not support the SIMD level required by this formula.');
        end;
      end;
      Result := (s > '') and (iVersion in [2..actFormulaId]);
      if s > '' then begin
        if iVersion < 2 then begin
          if bVerbose then ShowMessage('The formula is an old one, only versions 2 to ' + IntToStr(actFormulaId) + #13#10 + ' are allowed in this program version.')
          else GUI.OutMessage('The formula is an old one, only versions 2 to ' + IntToStr(actFormulaId) + ' are allowed in this program version.');
        end
        else if iVersion > actFormulaId then begin
          if bVerbose then ShowMessage('This formula was designed for a more actual version of Mandelbulb 3D')
          else GUI.OutMessage('This formula was designed for a more actual version of Mandelbulb 3D');
        end;
      end;
      if not Result then s := '';
//------------------------------------------------------------------------------
      if s = '[CONSTANTS]' then
      begin
        repeat
          LoadNextStr;
          if (Length(s) > 1) and (s[1]='.') then begin
            // new style constants with names
            n := Pos(UpCaseN(Copy(s, 2, Length(s)-1), 5), cVars);
            case n of
              1:  PDouble(pb)^  := StrToFloatK(StrLastWord(s));
              6:  PInteger(pb)^ := StrToInt(StrLastWord(s));
              9:  PInt64(pb)^   := StrToInt64(StrLastWord(s));
              14: PSingle(pb)^  := StrToFloatK(StrLastWord(s));
              else begin
                 Dec(pb, 8);
                 Dec(iConstCount);
              end;
            end;
          end
          else begin
            n := Pos(UpCaseN(s, 5), cVars);
            case n of
              1:  PDouble(pb)^  := StrToFloatK(StrLastWord(s));
              6:  PInteger(pb)^ := StrToInt(StrLastWord(s));
              9:  PInt64(pb)^   := StrToInt64(StrLastWord(s));
              14: PSingle(pb)^  := StrToFloatK(StrLastWord(s));
              else begin
                 Dec(pb, 8);
                 Dec(iConstCount);
              end;
            end;
          end;
          Inc(pb, 8);
          Inc(iConstCount);
        until (Length(s) > 0) and (s[1] = '[');
      end;
//------------------------------------------------------------------------------
      if s = '[CODE]' then
      begin
        if (not bCPmemReserved) or (pCodePointer = nil) then pCodePointer := VirtualAlloc(nil, 4096, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
        bCPmemReserved := True;
        n := 0;
        pb := Pointer(pCodePointer);
        repeat
          LoadNextStr;
          if (Length(s) > 0) and (s[1] <> '[') then begin
            while (Length(s) > 1) and (n < 4095) do begin
              pb^ := StrToInt('$' + s[1] + s[2]);
              Inc(pb);
              Inc(n);
              Delete(s, 1, 2);
            end;
          end;
        until EOF(f) or (s = '[END]');
        Result := (n > 10);
      end;
//------------------------------------------------------------------------------
      if Result and (s='[END]') then
      begin
        CFdescription := '';
        n := 0;     //load formula description
        repeat
          Readln(f, s);
          s := Trim(s);
        until (Length(s) > 0) or EOF(f);
        if Length(s) > 0 then
        repeat
          CFdescription := CFdescription + s + #13 + #10;
          if EOF(f) then n := 100 else Readln(f, s);
          Inc(n);
        until n > 100;
        LastModTime := GetFileModDate(FileName);
        s3 := ExtractFileName(FileName);
        n := 1;
        while (n < 32) and (s3[n] <> '.') do
        begin
          CustomFname[n - 1] := Ord(s3[n]);
          CustomFname[n] := 0;
          Inc(n);
        end;
        s := string(CustomFtoStr(CustomFname));
        InsertDescription(s, CFdescription, LastModTime);
      end;
    except
      Result := False;
    end;
    CloseFile(f);     //undeclared identifier

end;

function TFormulaClass.LoadCustomFormulaFromHeader(var CustomFname: array of Byte;
                           var lCustomFormula: TCustomFormula;
                           var dOptionVars: array of Double): Boolean;
var s: String;
begin
    CFdescription := '';
    s := string(CustomFtoStr(CustomFname) + '.m3f');                                                                             // nil,
    Result := LoadCustomFormula(IncludeTrailingPathDelimiter(IniDirs[3]) + s, lCustomFormula, CustomFname, dOptionVars, False, 0, False);
    if not Result then
    begin
      GUI.OutMessage(string(CustomFtoStr(CustomFname) + ' formula is missing! (Check Ini-dir for formulas)'));
      CustomFname[0] := 0;
    end;
end;





{
  function SameFName(Fn1, Fn2: String): LongBool;

  function isInternFormula(FName: String; var i: Integer): LongBool;
  function DescrOfFName(FName: String): String;

function SameFName(Fn1, Fn2: String): LongBool;
begin
    Result := UpperCase(Trim(Fn1)) = UpperCase(Trim(Fn2));
end;

function isInternFormula(FName: String; var i: Integer): LongBool;
var s: String;
begin
    s := Trim(FName);
    Result := False;
    i := -1;
    if s <> '' then
    begin
      s := '.' + s + '.';
      i := Pos(s, InternFNames);
      if i > 0 then
      begin
        i := (i + 1) div 11;
        Result := True;
      end
      else i := -1;
    end;
end;

function DescrOfFName(FName: String): String;
var i: Integer;
begin
    Result := '';
    if isInternFormula(FName, i) then
    begin
      Result := CFdescriptionIntern[i];
      Exit;
    end;
    for i := 0 to FdescCount - 1 do if SameFName(FName, FdescrName[i]) then
    begin
      Result := Fdescription[i];
      Break;
    end;
end;

procedure InsertDescription(Fname, Fdescr: String; ModTime: TDateTime);
var i: Integer;
    bIn: LongBool;
begin
    bIn := False;
    for i := 0 to FdescCount - 1 do
    begin
      if SameText(Fname, FdescrName[i]) then
      begin
        if High(Fdescription) < i then SetLength(Fdescription, i + 1);
        Fdescription[i] := Fdescr;
        FdescrModTime[i] := ModTime;
        bIn := True;
        Break;
      end;
    end;
    if not bIn then
    begin
      Inc(FdescCount);
      i := FdescCount;
      SetLength(FdescrName, i);
      SetLength(Fdescription, i);
      SetLength(FdescrModTime, i);
      Dec(i);
      FdescrName[i] := Fname;
      Fdescription[i] := Fdescr;
      FdescrModTime[i] := ModTime;
    end;
end;

//DivUtils
//FileHandling
//CustomFormulas
//headertrafos

}
end.
