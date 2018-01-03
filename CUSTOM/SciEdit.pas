unit SciEdit;
//--------------------------------TSciEdit v 1.0---------------------------
//--------This component is for entering of floating/integer values ---------
//////////////////////copyright by Andronov I.N 2001/////////////////////////
//
//
//

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,math;

type
  TZType = (ZtFloat,ZtInteger);
  TZActOnValueNotNumber = (ZrovnnSetDefault,ZrovnnUserMustCorrect);
  TZActOnValueOutOfMinMax = (ZrovoommSetDefault,ZrovoommSetNearestBound,ZrovoommUserMustcorrect);
  TZDecimalPointType = (ZdptDecimalSeparatorOnly,ZdptPointAndCommaAreEqual);
  TSciEdit = class(TEdit)
  private
    FZNFixedPrecisionDigits: Byte;
    FZNIntegerAllDigits: Byte;
    FZNFixedAllDigits: Byte;
    FZNFloatAllDigits: Byte;
    FZNFloatPrecisionDigits: Byte;
    FZFloatMax: Extended;
    FZFloatFixedMax: Extended;
    FZFloatMin: Extended;
    FZFloatDefault: Extended;
    FZFloatValue: Extended;
    FZFloatFixedMin: Extended;
    FZIntMax: Integer;
    FZIntegerValue: Integer;
    FZIntDefault: Integer;
    FZIntMin: Integer;
    FZNotNumberString: string;
    FZOutBoundsString: string;
    FZErrorColor: TColor;
    FZErrorFontColor: TColor;
    FZFloatPointType: TZDecimalPointType;
    FZActNotNumber: TZActOnValueNotNumber;
    FZActOutBounds: TZActOnValueOutOfMinMax;
    FZType: TZType;
    FOnNotNumber: TNotifyEvent;
    FOnNumberChange: TNotifyEvent;
    FOnOutOfBounds: TNotifyEvent;

    FTrueNumberColor : TColor;
    FTrueFontColor : TColor;
    FInternalColorChanging : Boolean;
    FZNIntegerPrecisionDigits: Byte;
    FTextToDataFailed : Boolean;

    procedure SetErrorColor(Value: TColor);
    procedure SetErrorFontColor(Value: TColor);
    procedure SetFloatDefault(Value: Extended);
    procedure SetFloatFixedMax(Value: Extended);
    procedure SetFloatFixedMin(Value: Extended);
    procedure SetFloatMax(Value: Extended);
    procedure SetFloatMin(Value: Extended);
    procedure SetFloatPointType(Value: TZDecimalPointType);
    procedure SetFloatValue(Value: Extended);
    procedure SetIntDefault(Value: Integer);
    procedure SetIntegerValue(Value: Integer);
    procedure SetIntMax(Value: Integer);
    procedure SetIntMin(Value: Integer);
    procedure SetNFixedAllDigits(Value: Byte);
    procedure SetNFixedPrecisionDigits(Value: Byte);
    procedure SetNFloatAllDigits(Value: Byte);
    procedure SetNFloatPrecisionDigits(Value: Byte);
    procedure SetNIntegerAllDigits(Value: Byte);
    procedure SetNotNumberString(Value: string);
    procedure SetOutBoundsString(Value: string);
    procedure SetActNotNumber(Value: TZActOnValueNotNumber);
    procedure SetActOutBounds(Value: TZActOnValueOutOfMinMax);
    procedure SetType(Value: TZType);
    procedure SetOnNotNumber(Value: TNotifyEvent);
    procedure SetOnNumberChange(Value: TNotifyEvent);
    procedure SetOnOutOfBounds(Value: TNotifyEvent);

    procedure NumberChanged;
    procedure NumberIsNotNumber;
    procedure NumberOutOfBounds;
    function GetColor: TColor;
    function GetFont: TFont;
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure InheritedFontIsChanged(Sender: TObject);
    procedure SetColorsToError;
    procedure SetColorsToNormal;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure TextToData;
    procedure DataToText;
    procedure SetNIntegerPrecisionDigits(Value: Byte);
    function GetFloatValue: Extended;
    function GetIntegerValue: Integer;
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure Change; override;
    function LastConversionIsOk : Boolean;
  published
    property ZType : TZType read FZType write SetType default ZtFloat;
    property IntegerValue : Integer read GetIntegerValue write SetIntegerValue default 0;
    property FloatValue : Extended read GetFloatValue write SetFloatValue;
    property IntDefault : Integer read FZIntDefault write SetIntDefault default 0;
    property FloatDefault : Extended read FZFloatDefault write SetFloatDefault;
    property IntMin : Integer read FZIntMin write SetIntMin default -127;
    property IntMax : Integer read FZIntMax write SetIntMax default 128;
    property FloatMin : Extended read FZFloatMin write SetFloatMin;
    property FloatMax : Extended read FZFloatMax write SetFloatMax;
    property ActNotNumber : TZActOnValueNotNumber read FZActNotNumber write SetActNotNumber
                                 default ZrovnnSetDefault;
    property ActOutBounds : TZActOnValueOutOfMinMax read FZActOutBounds write SetActOutBounds
                                 default ZrovoommSetDefault;
    property NotNumberString : string read FZNotNumberString write SetNotNumberString;
    property OutBoundsString : string read FZOutBoundsString write SetOutBoundsString;
    property ErrorColor : TColor read FZErrorColor write SetErrorColor default clBlack;
    property ErrorFontColor : TColor read FZErrorFontColor write SetErrorFontColor default clWhite;
    property FloatPointType : TZDecimalPointType read FZFloatPointType write SetFloatPointType
                                 default ZdptPointAndCommaAreEqual;
    property FloatFixedMin : Extended read FZFloatFixedMin write SetFloatFixedMin;
    property FloatFixedMax : Extended read FZFloatFixedMax write SetFloatFixedMax;
    property NIntegerAllDigits : Byte read FZNIntegerAllDigits write SetNIntegerAllDigits default 5;
    property NFloatAllDigits : Byte read FZNFloatAllDigits write SetNFloatAllDigits default 12;
    property NFixedAllDigits : Byte read FZNFixedAllDigits write SetNFixedAllDigits default 12;
    property NFloatPrecisionDigits : Byte read FZNFloatPrecisionDigits write SetNFloatPrecisionDigits default 5;
    property NFixedPrecisionDigits : Byte read FZNFixedPrecisionDigits write SetNFixedPrecisionDigits default 5;
    property NIntegerPrecisionDigits : Byte read FZNIntegerPrecisionDigits write SetNIntegerPrecisionDigits default 0;

    //Events
    property OnNumberChange : TNotifyEvent read FOnNumberChange write SetOnNumberChange;
    property OnNotNumber    : TNotifyEvent read FOnNotNumber write SetOnNotNumber;
    property OnOutOfBounds  : TNotifyEvent read FOnOutOfBounds write SetOnOutOfBounds;

    //Rewrited Properties
    property Font : TFont read GetFont write SetFont;
    property Color : TColor read GetColor write SetColor;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TIA', [TSciEdit]);
end;

{ TSciEdit }

procedure TSciEdit.Assign(Source: TPersistent);
begin
  if assigned(source) and (source is TSciEdit) then
    begin
      inherited Assign(Source);
      FZNFixedPrecisionDigits:=(source as TSciEdit).FZNFixedPrecisionDigits;
      FZNIntegerAllDigits:=(source as TSciEdit).FZNIntegerAllDigits;
      FZNFixedAllDigits:=(source as TSciEdit).FZNFixedAllDigits;
      FZNFloatAllDigits:=(source as TSciEdit).FZNFloatAllDigits;
      FZNFloatPrecisionDigits:=(source as TSciEdit).FZNFloatPrecisionDigits;
      FZFloatMax:=(source as TSciEdit).FZFloatMax;
      FZFloatFixedMax:=(source as TSciEdit).FZFloatFixedMax;
      FZFloatMin:=(source as TSciEdit).FZFloatMin;
      FZFloatDefault:=(source as TSciEdit).FZFloatDefault;
      FZFloatValue:=(source as TSciEdit).FZFloatValue;
      FZFloatFixedMin:=(source as TSciEdit).FZFloatFixedMin;
      FZIntMax:=(source as TSciEdit).FZIntMax;
      FZIntegerValue:=(source as TSciEdit).FZIntegerValue;
      FZIntDefault:=(source as TSciEdit).FZIntDefault;
      FZIntMin:=(source as TSciEdit).FZIntMin;
      FZNotNumberString:=(source as TSciEdit).FZNotNumberString;
      FZOutBoundsString:=(source as TSciEdit).FZOutBoundsString;
      FZErrorColor:=(source as TSciEdit).FZErrorColor;
      FZErrorFontColor:=(source as TSciEdit).FZErrorFontColor;
      FZFloatPointType:=(source as TSciEdit).FZFloatPointType;
      FZActNotNumber:=(source as TSciEdit).FZActNotNumber;
      FZActOutBounds:=(source as TSciEdit).FZActOutBounds;
      FZType:=(source as TSciEdit).FZType;
      FTrueNumberColor:=(source as TSciEdit).FTrueNumberColor;
      FTrueFontColor:=(source as TSciEdit).FTrueFontColor;
      FZNIntegerPrecisionDigits:=(source as TSciEdit).FZNIntegerPrecisionDigits;
    end else
    begin
      inherited Assign(Source);
    end;
end;

procedure TSciEdit.Change;
begin
  inherited Change;
end;

procedure TSciEdit.CMExit(var Message: TCMExit);
begin
  inherited;
  TextToData;
end;

constructor TSciEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FZNIntegerPrecisionDigits:=0;
  FZNFixedPrecisionDigits:=5;
  FZNIntegerAllDigits:=5;
  FZNFixedAllDigits:=12;
  FZNFloatAllDigits:=12;
  FZNFloatPrecisionDigits:=5;
  FZFloatMax:=1.0e8;
  FZFloatFixedMax:=1.0e5;
  FZFloatMin:=-1.0e8;
  FZFloatDefault:=0.0;
  FZFloatValue:=0.0;
  FZFloatFixedMin:=-1.0e5;
  FZIntMax:=128;
  FZIntegerValue:=0;
  FZIntDefault:=0;
  FZIntMin:=-127;
  FZNotNumberString:='The value is Not Number';
  FZOutBoundsString:='Out Of Bounds';
  FZErrorColor:=clBlack;
  FZErrorFontColor:=clWhite;
  FZFloatPointType:=ZdptPointAndCommaAreEqual;
  FZActNotNumber:=ZrovnnSetDefault;
  FZActOutBounds:=ZrovoommSetDefault;
  FZType:=ZtFloat;
  FOnNotNumber:=nil;
  FOnNumberChange:=nil;
  FOnOutOfBounds:=nil;
  inherited Font.OnChange:=InheritedFontIsChanged;
  FInternalColorChanging:=false;
  FTrueNumberColor:=inherited Color;
  FTrueFontColor:=(inherited Font).Color;
  DataToText;
end;

procedure TSciEdit.DataToText;
var ds : string;
begin
  case FZType of
    ZtFloat :
      begin
        if (FZFloatValue>=FZFloatFixedMin) and (FZFloatValue<=FZFloatFixedMax) then
          begin
            ds:='%'+inttostr(FZNFixedAllDigits)+'.'+inttostr(FZNFixedPrecisionDigits)+'f';
            Text:=Format(ds,[FZFloatValue]);
          end else
          begin
            ds:='%'+inttostr(FZNFloatAllDigits)+'.'+inttostr(FZNFloatPrecisionDigits)+'e';
            Text:=Format(ds,[FZFloatValue]);
          end;
      end;//Float
    ZtInteger :
      begin
        ds:='%'+inttostr(FZNIntegerAllDigits)+'.'+inttostr(FZNIntegerPrecisionDigits)+'d';
        Text:=Format(ds,[FZIntegerValue]);
      end;
  end;
end;

destructor TSciEdit.Destroy;
begin
  inherited Destroy;
end;

function TSciEdit.GetColor: TColor;
begin
  result:=inherited Color;
end;

function TSciEdit.GetFont: TFont;
begin
  result:=Inherited Font;
end;

function TSciEdit.GetFloatValue: Extended;
begin
  TextToData;
  result:=FZFloatValue;
end;

function TSciEdit.GetIntegerValue: Integer;
begin
  TextToData;
  result:=FZIntegerValue;
end;

procedure TSciEdit.InheritedFontIsChanged(Sender: TObject);
begin
  if not FInternalColorChanging then
  FTrueFontColor:=(inherited Font).Color;
end;

function TSciEdit.LastConversionIsOk: Boolean;
begin
  result:=not FTextToDataFailed;
end;

procedure TSciEdit.NumberChanged;
begin
  if assigned(FOnNumberChange) then FOnNumberChange(self);
end;

procedure TSciEdit.NumberIsNotNumber;
begin
  if assigned(FOnNotNumber) then FOnNotNumber(self);
end;

procedure TSciEdit.NumberOutOfBounds;
begin
  if assigned(FOnOutOfBounds) then FOnOutOfBounds(self);
end;

procedure TSciEdit.SetColor(Value: TColor);
begin
  inherited Color:=Value;
  FTrueNumberColor:=inherited Color;
end;

procedure TSciEdit.SetColorsToError;
begin
  FInternalColorChanging:=True;
  inherited Color:=ErrorColor;
  Font.Color:=ErrorFontColor;
  FInternalColorChanging:=False;
end;

procedure TSciEdit.SetColorsToNormal;
begin
  FInternalColorChanging:=True;
  inherited Color:=FTrueNumberColor;
  Font.Color:=FTrueFontColor;
  FInternalColorChanging:=False;
end;

procedure TSciEdit.SetFont(Value: TFont);
begin
  inherited Font:=Value;
  if not FInternalColorChanging then
  FTrueFontColor:=(inherited Font).Color;
end;

procedure TSciEdit.SetOnNotNumber(Value: TNotifyEvent);
begin
  FOnNotNumber := Value;
end;

procedure TSciEdit.SetOnNumberChange(Value: TNotifyEvent);
begin
  FOnNumberChange := Value;
end;

procedure TSciEdit.SetOnOutOfBounds(Value: TNotifyEvent);
begin
  FOnOutOfBounds := Value;
end;

procedure TSciEdit.SetErrorColor(Value: TColor);
begin
  if Value<>FZErrorColor then
    begin
      FZErrorColor := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetErrorFontColor(Value: TColor);
begin
  if Value<>FZErrorFontColor then
    begin
      FZErrorFontColor := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatDefault(Value: Extended);
begin
  if (Value<>FZFloatDefault) and (Value>=FZFloatMin) and (Value<=FZFloatMax) then
    begin
      FZFloatDefault := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatFixedMax(Value: Extended);
begin
  if (Value<>FZFloatFixedMax) then
    begin
      FZFloatFixedMax := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatFixedMin(Value: Extended);
begin
  if (Value<>FZFloatFixedMin) then
    begin
      FZFloatFixedMin := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatMax(Value: Extended);
begin
  if (Value<>FZFloatMax) then
    begin
      FZFloatMax := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatMin(Value: Extended);
begin
  if (Value<>FZFloatMin) then
    begin
      FZFloatMin := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatPointType(Value: TZDecimalPointType);
begin
  if (Value<>FZFloatPointType) then
    begin
      FZFloatPointType := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetFloatValue(Value: Extended);
begin
  if (Value>=FZFloatMin) and (Value<=FZFloatMax) and (Value<>FZFloatValue) then
    begin
      FZFloatValue := Value;
      DataToText;
      NumberChanged;
    end;
end;

procedure TSciEdit.SetIntDefault(Value: Integer);
begin
  if (Value<>FZIntDefault) and (Value>=FZIntMin) and (Value<=FZIntMax) then
    begin
      FZIntDefault := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetIntegerValue(Value: Integer);
begin
  if (Value>=FZIntMin) and (Value<=FZIntMax) and (Value<>FZIntegerValue) then
    begin
      FZIntegerValue := Value;
      DataToText;
      NumberChanged;
    end;
end;

procedure TSciEdit.SetIntMax(Value: Integer);
begin
  if (Value<>FZIntMax) then
    begin
      FZIntMax := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetIntMin(Value: Integer);
begin
  if (Value<>FZIntMin) then
    begin
      FZIntMin := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNFixedAllDigits(Value: Byte);
begin
  if (Value<>FZNFixedAllDigits) and (Value>0) then
    begin
      FZNFixedAllDigits := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNFixedPrecisionDigits(Value: Byte);
begin
  if (Value<>FZNFixedPrecisionDigits) then
    begin
      FZNFixedPrecisionDigits := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNFloatAllDigits(Value: Byte);
begin
  if (Value<>FZNFloatAllDigits) and (Value>0) then
    begin
      FZNFloatAllDigits := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNFloatPrecisionDigits(Value: Byte);
begin
  if (Value<>FZNFloatPrecisionDigits) then
    begin
      FZNFloatPrecisionDigits := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNIntegerAllDigits(Value: Byte);
begin
  if (Value<>FZNIntegerAllDigits) and (Value>0) then
    begin
      FZNIntegerAllDigits := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNIntegerPrecisionDigits(Value: Byte);
begin
  if (Value<>FZNIntegerPrecisionDigits) then
    begin
      FZNIntegerPrecisionDigits := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetNotNumberString(Value: string);
begin
  if (Value<>FZNotNumberString) then
    begin
      FZNotNumberString := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetOutBoundsString(Value: string);
begin
  if (Value<>FZOutBoundsString) then
    begin
      FZOutBoundsString := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetActNotNumber(Value: TZActOnValueNotNumber);
begin
  if (Value<>FZActNotNumber) then
    begin
      FZActNotNumber := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetActOutBounds(Value: TZActOnValueOutOfMinMax);
begin
  if (Value<>FZActOutBounds) then
    begin
      FZActOutBounds := Value;
      DataToText;
    end;
end;

procedure TSciEdit.SetType(Value: TZType);
begin
  if (Value<>FZType) then
    begin
      FZType := Value;
      DataToText;
    end;
end;

procedure TSciEdit.TextToData;
var s,DecimalSeparator : string;
    n,n1 : Integer;
    D : extended;
begin
  DecimalSeparator  := '.';
  s:=text;
  while pos(' ',s)=1 do delete(s,1,1);
  FTextToDataFailed:=True;
  case FZType of
    ZtFloat :
      begin
        case FZFloatPointType of
          ZdptPointAndCommaAreEqual :
            begin
              n:=pos('.',s);
              n1:=pos(',',s);
              if n1>0 then
                begin
                  if n>0 then
                    begin
                      n:=min(n,n1);
                    end else
                    begin
                      n:=n1;
                    end;
                end else
                begin
                  if n>0 then
                    begin
                      //n=n
                    end else
                    begin
                      n:=0;
                    end;
                end;
              if N>0 then
                begin
                  delete(s,n,1);
                  insert(DecimalSeparator,s,n);
                end;
            end;
          end;
          n:=pos(DecimalSeparator,s);
          if (N>0) or (pos('e',s)>0) or (pos('E',s)>0)then
            begin //This is Extended type ?
              if TextToFloat(PChar(S), D, fvExtended) then
              begin
                D:=strtofloat(s);
                if (D<FloatMin) or (D>FloatMax) then
                  begin
                    if FZOutBoundsString<>'' then showmessage(FZOutBoundsString);
                    case FZActOutBounds of
                      ZrovoommSetDefault :
                        begin
                          FZFloatValue:=FZFloatDefault;
                          SetColorsToNormal;
                          FTextToDataFailed:=false;
                          DataToText;
                        end;
                      ZrovoommSetNearestBound :
                        begin
                          SetColorsToNormal;
                          if (D<FloatMin) then
                            begin
                              FZFloatValue:=FloatMin;
                            end else
                            begin
                              FZFloatValue:=FloatMax;
                            end;
                          FTextToDataFailed:=false;
                          DataToText;
                        end;
                      ZrovoommUserMustcorrect :
                        begin
                          SetColorsToError;
                        end;
                    end;
                    NumberOutOfBounds;
                  end else
                  begin
                    FloatValue:=D;
                    SetColorsToNormal;
                    FTextToDataFailed:=false;
                  end;
              end else
              begin
                if FZNotNumberString<>'' then
                  begin
                    ShowMessage(FZNotNumberString);
                  end;
                case FZActNotNumber of
                  ZrovnnSetDefault :
                    begin
                      FloatValue:=FZFloatDefault;
                      FTextToDataFailed:=false;
                      DataToText;
                    end;
                  ZrovnnUserMustCorrect :
                    begin
                      SetColorsToError;
                    end;
                end;
                NumberIsNotNumber;
              end; //Convertion to float
            end else
            begin //This is integer type as extended?
              {$R-}
              Val(S,N,N1);
              {$R+}
              if N1=0 then
              begin
                if (N<FloatMin) or (N>FloatMax) then
                  begin
                    if FZOutBoundsString<>'' then showmessage(FZOutBoundsString);
                    case FZActOutBounds of
                      ZrovoommSetDefault :
                        begin
                          FZFloatValue:=FZFloatDefault;
                          SetColorsToNormal;
                          FTextToDataFailed:=false;
                          DataToText;
                        end;
                      ZrovoommSetNearestBound :
                        begin
                          SetColorsToNormal;
                          if (N<FloatMin) then
                            begin
                              FZFloatValue:=FloatMin;
                            end else
                            begin
                              FZFloatValue:=FloatMax;
                            end;
                          FTextToDataFailed:=false;
                          DataToText;
                        end;
                      ZrovoommUserMustcorrect :
                        begin
                          SetColorsToError;
                        end;
                    end;
                    NumberOutOfBounds;
                  end else
                  begin
                    FloatValue:=n;
                    FTextToDataFailed:=false;
                    SetColorsToNormal;
                  end;
              end else
              begin
                if FZNotNumberString<>'' then
                  begin
                    ShowMessage(FZNotNumberString);
                  end;
                case FZActNotNumber of
                  ZrovnnSetDefault :
                    begin
                      FloatValue:=FZFloatDefault;
                      FTextToDataFailed:=false;
                      DataToText;
                    end;
                  ZrovnnUserMustCorrect :
                    begin
                      SetColorsToError;
                    end;
                end;
                NumberIsNotNumber;
              end;     //To Integer...

        end;//point type
      end;//Float
    ZtInteger :
      begin
        {$R-}
        Val(S,N,N1);
        {$R+}
        if N1=0 then
        begin
          if (N<IntMin) or (N>IntMax) then
            begin
              if FZOutBoundsString<>'' then showmessage(FZOutBoundsString);
              case FZActOutBounds of
                ZrovoommSetDefault :
                  begin
                    FZIntegerValue:=FZIntDefault;
                    SetColorsToNormal;
                    FTextToDataFailed:=false;
                    DataToText;
                  end;
                ZrovoommSetNearestBound :
                  begin
                    SetColorsToNormal;
                    if (N<IntMin) then
                      begin
                        FZIntegerValue:=IntMin;
                      end else
                      begin
                        FZIntegerValue:=IntMax;
                      end;
                    FTextToDataFailed:=false;
                    DataToText;
                  end;
                ZrovoommUserMustcorrect :
                  begin
                    SetColorsToError;
                  end;
              end;
              NumberOutOfBounds;
            end else
            begin
              IntegerValue:=n;
              FTextToDataFailed:=false;
              SetColorsToNormal;
            end;
        end else
        begin
          if FZNotNumberString<>'' then
            begin
              ShowMessage(FZNotNumberString);
            end;
          case FZActNotNumber of
            ZrovnnSetDefault :
              begin
                IntegerValue:=FZIntDefault;
                FTextToDataFailed:=false;
                DataToText;
              end;
            ZrovnnUserMustCorrect :
              begin
                SetColorsToError;
              end;
          end;
          NumberIsNotNumber;
        end;
      end;//to integer
  end;
end;

procedure TSciEdit.WMKeyDown(var Message: TWMKeyDown);
begin
  inherited;
  if Message.CharCode=VK_RETURN then TextToData;
end;

end.
