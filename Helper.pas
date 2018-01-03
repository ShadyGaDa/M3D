unit Helper;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  TypeDefinitions,
  DivUtils,
  FileHandling,
  MAIN;


//type

//  cHELP = Class

//public
//  procedure Make_HEADER;
  procedure SAVE_M3P(Sender: TObject; SaveDialog: TSaveDialog);
  procedure OPEN_M3P(Sender: TObject; OpenDialog: TOpenDialog; Image: TImage);
  procedure Init_ADDON(HA: PTHeaderCustomAddon);
  procedure Make_HEADER;
  procedure Init_HEADER;
//  procedure SetLightFrom_HEADER(var HEADER: TMandHeader10);
//  procedure PutLightFIn_HEADER(var HEADER: TMandHeader10);

//  End;

var
  //SaveDialog : TSaveDialog;    // Save dialog variable
  //OpenDialog : TOpenDialog;    // Open dialog variable
  HEADER     : TMandHeader10;
  ADDON      : THeaderCustomAddon;
  HybridCustoms: array[0..5] of TCustomFormula;
implementation

procedure BenchMark;
var
  Freq, StartCount, StopCount: Int64;
  TimingSeconds: real;
begin
  //(Freq);
  //QueryPerformanceCounter(StartCount);
  //->Execute process that you want to time: ...
  //QueryPerformanceCounter(StopCount);
  //TimingSeconds := (StopCount - StartCount) / Freq;
  //->Display timing: ...
end;

procedure SAVE_M3P(Sender: TObject; SaveDialog: TSaveDialog);  // save parameter
var f: file;         // was Button_M_4
begin
//    SaveDialog := TSaveDialog.Create(Self);
    SaveDialog.Title := 'Save MandelBulb3D Parameter *.m3p';
    SaveDialog.InitialDir := GetCurrentDir;
    SaveDialog.Filter := 'Text file|*.txt|M3P file|*.m3p';
    SaveDialog.FilterIndex := 2;
    if SaveDialog.Execute then
    begin
      Make_HEADER;
      AssignFile(f, ChangeFileExtSave(SaveDialog.FileName, '.m3p'));
      Rewrite(f, 1);
      InsertAuthorsToPara(@HEADER, GUI.Authors);
      try
        BlockWrite(f, HEADER, SizeOf(HEADER));
      finally
        Init_HEADER; //to get pointers back
      end;
      ADDON.bHCAversion := 16;
      BlockWrite(f, AddOn, SizeOf(THeaderCustomAddon));
      CloseFile(f);
      SetSaveDialogNames(SaveDialog.FileName);
    end;
end;

procedure OPEN_M3P(Sender: TObject; OpenDialog: TOpenDialog; Image: TImage);  // open parameter
begin        //was Button_M_5
    //PageCtrls.ActivePage := TabImage;
//    OpenDialog := TOpenDialog.Create(Self);
    OpenDialog.InitialDir := GetCurrentDir;
    OpenDialog.Options := [ofFileMustExist];
    OpenDialog.Filter := 'Text file|*.txt|M3P file|*.m3p';
    OpenDialog.FilterIndex := 2;
    if OpenDialog.Execute and LoadParameter(HEADER, OpenDialog.FileName, True) then
    begin
//  :AllPresetsUp; //pic size
//  :OutMessage('Parameters loaded, press "Calculate 3D" to render.');
//  :ClearScreen;
    Image.Picture.Bitmap.Canvas.FillRect(Image.Picture.Bitmap.Canvas.ClipRect);
//  :ParasChanged;  //write text on image
    //SetSaveDialogNames(SaveDialog.FileName);
    end;
end;

procedure Make_HEADER;
//var d: Double;
begin
    with HEADER do
    begin
      MandId := actMandId;
//      if TilingOptions = 0 then
//      begin
        Width  := 480;
        Height := 360;
//      end;
      Iterations        := 60; //StrToIntTrim(MaxIterEdit.Text);                      {FORMULA}
      MinimumIterations := 1;  //StrToIntTrim(MinIterEdit.Text);                      {FORMULA}
      iMaxItsF2         := 60; //StrToIntTrim(MaxIterHybridPart2Edit.Text);           {FORMULA}
      bNormalsOnDE      := 1;  //Byte(True);//Byte(CheckBox_M_1.Checked);
      bPlanarOptic      := 0;  //RadioGroup_M_2.ItemIndex;
      bStepsafterDEStop := 8;  //SpinEdit_M_5.Position;

//-. ppform....begin

      bCalculateHardShadow    := 0;
      bCalc1HSsoft            := 0;
      bCalcAmbShadowAutomatic := 1;
      sAmbShadowThreshold     := 2;
      byCalcNsOnZBufAuto      := 0;
      bSSAO24BorderMirrorSize := 0;

//      end;
      iOptions := (0 shl 6) or (1 and 1) or ((0 and 1) shl 1) or ((0 and 1) shl 2);
//      iOptions := (0 shl 6) or (Ord(True) and 1) or ((Ord(False) and 1) shl 1) or ((Ord(False) and 1) shl 2);
//      iOptions := (GUI.SpinEdit_M_2.Position shl 6) or              // smooth normals            // bit7..10=smoothNs(0..8)
//                  (Ord(GUI.CheckBox_M_3.Checked) and 1) or          // first random step         // bit1=FirstStepRandom
//                  ((Ord(GUI.CheckBox_M_8.Checked) and 1) shl 1) or  // Shortdistance check DE:   // bit2=Shortdist check DEs
//                  ((Ord(GUI.CheckBox_M_2.Checked) and 1) shl 2);    // Raystep sub DEstop:       // bit3=StepSubDEstop

      mZstepDiv        := 0.5;  //Max(0.001, Min(1, 0.5));    //Raystep multiplier:   Edit_M_6
      sDEstop          := 1.0;  // Edit_M_25
      sRaystepLimiter  := 1.0;  // Edit_M_8
      bVaryDEstopOnFOV := 1;    //Byte(True);//Byte(CheckBox_M_9.Checked);

      //pos & rot
      dZstart   := -2.0;  //Edit_M_1
      dZend     := 30.0;  //Edit_M_3
      dXmid     := 0.0;   //Edit_M_9
      dYmid     := 0.0;   //Edit_M_10
      dZmid     := 0.0;   //Edit_M_17
      dZoom     := 1.0;   //Edit_M_5

      RStop     := 16;    //RBailoutEdit {FORMULA}
      dXWrot    := 0.0;    //XWEdit       {FORMULA}
      dYWrot    := 0.0;    //YWEdit       {FORMULA}
      dZWrot    := 0.0;    //ZWEdit       {FORMULA}

      dFOVy     := 30;    //Edit_M_14


      bImageScale := ImageScale;
      bIsJulia    := Byte(False); //Byte(CheckBox_M_7.Checked);
      dJx         := 0.0;  //StrToFloatK(Edit_M_28.Text);
      dJy         := 0.0;  //StrToFloatK(Edit_M_29.Text);
      dJz         := 0.0;  //StrToFloatK(Edit_M_30.Text);
      dJw         := 0.0;  //StrToFloatK(Edit_M_7.Text);

      sColorMul       := 1;      //StrToFloatK(Edit_M_2.Text);
      byColor2Option  := 0; //RadioGroup_M_1.ItemIndex;
      bColorOnIt      := 0;    //Max(0, Min(255, StrToIntTrim(Edit_M_35.Text) + 1)); -1
      //if ButtonVolLight.Caption = 'Dyn. fog on It.:' then
      //begin
        bVolLightNr   := 2 shl 4;
        bDFogIt       := 0;     //StrToIntTrim(Edit_M_16.Text);
      //end
      //else bVolLightNr := Min(6, Max(1, StrToIntTrim(Edit_M_16.Text))) or ((UpDown_M_5.Position + 2) shl 4);

//- ----------------------------------------------------------------------
      dCutZ      := 0.00; //Edit_M_22
      dCutX      := 0.00; //Edit_M_23
      dCutY      := 0.00; //Edit_M_24
//      bCutOption := Byte(False) or (Byte(False) shl 1) or (Byte(False) shl 2);
//      bCutOption := Byte(CheckBox_M_4.Checked) or (Byte(CheckBox_M_5.Checked) shl 1)
//                     or (Byte(CheckBox_M_6.Checked) shl 2);   //todo side of cuts
      bCutOption            := 0 or (0 shl 1) or (0 shl 2);
      StereoScreenWidth     := 0.0; //Edit_M_15
      StereoScreenDistance  := 0.0; //Edit_M_18
      StereoMinDistance     := 0.0; //Edit_M_13
//----------------------------------------------------------------------------

      PCFAddon              := @ADDON;
//todo      PutLightFInHeader(HEADER);{LIGHT}
//      ADDON.bOptions1 := (HAddon.bOptions1 and $FC) or TabControl_F_2.TabIndex;{FORMULA}
      ADDON.bOptions1       := (ADDON.bOptions1 and $FC) or 0;{FORMULA}
//      ADDON.bOptions2 := (Ord(CheckBox_F_2.Checked) and 1) or
//                          (ComboBox_F_1.ItemIndex shl 1);{FORMULA}
      ADDON.bOptions2       := (0 and 1) or (0 shl 1);{FORMULA} //disable analytical DE / Outside render
//      ADDON.bOptions3 := DECombineCmb.ItemIndex;{FORMULA}
      ADDON.bOptions3       := 0;{FORMULA}
      //->>
      if ADDON.bOptions3 < 5 then
//        sDEcombS := Min0MaxCS(StrToFloatK(Edit_F_23.Text), 100)//{FORMULA}
        sDEcombS            := 0.5; {FORMULA}
      //else
      //begin
//        DEmixColorOption := Max(0, Min(2, StrToIntTrim(Edit_F_23.Text)));{FORMULA}
      //  DEmixColorOption    := 0.5; //Max(0, Min(2, StrToIntTrim(Edit_F_23.Text)));{FORMULA}
//        sFmixPow := sNotZero(MinMaxCS(-100, StrToFloatK(Edit_F_25.Text), 100));{FORMULA}
      //  sFmixPow            := 2.0; //sNotZero(MinMaxCS(-100, StrToFloatK(Edit_F_25.Text), 100));{FORMULA}
      //end;
    end;
end;

procedure Init_ADDON(HA: PTHeaderCustomAddon);
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

procedure Init_HEADER;  //to get pointers back
var i: Integer;
begin
    HEADER.PCFAddon := @ADDON;
    for i := 0 to 5 do HEADER.PHCustomF[i] := @HybridCustoms[i];
end;


//------------------------------------------------------------------------------

(*
procedure SetLightFrom_HEADER(var HEADER: TMandHeader10);
var i: Integer;
begin
    bUserChangeL := False;
    with HEADER do
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

procedure PutLightFIn_HEADER(var HEADER: TMandHeader10);
var i: Cardinal;
begin
    with HEADER do
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
*)
end.

