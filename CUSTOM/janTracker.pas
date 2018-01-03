unit janTracker;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TonChangedValue= procedure (sender:TObject;NewValue:integer) of object;
  TjtbOrientation=(jtbHorizontal,jtbVertical);

  TjanTracker = class(TCustomControl)
  private
    FHitRect:TRect;
    FTrackRect:TRect;
    FThumbRect:TRect;
    FThumbPosition:integer;
    FThumbMin:integer;
    FThumbmax:integer;
    FValue: integer;
    FMinimum: integer;
    FMaximum: integer;
    FTrackColor: TColor;
    FThumbColor: TColor;
    FBackColor: TColor;
    FThumbWidth: integer;
    FThumbHeight: integer;
    FTrackHeight: integer;
    FonChangedValue: TonChangedValue;
    FShowCaption: boolean;
    FCaptionColor: TColor;
    FTrackBorder: boolean;
    FThumbBorder: boolean;
    FBackBorder: boolean;
    FCaptionBold: boolean;
    FOrientation: TjtbOrientation;
    FBackBitmap: TBitmap;
    procedure SetMaximum(const Value: integer);
    procedure SetMinimum(const Value: integer);
    procedure SetValue(const Value: integer);
    procedure SetBackColor(const Value: TColor);
    procedure SetTrackColor(const Value: TColor);
    procedure SetThumbColor(const Value: TColor);
    procedure SetThumbWidth(const Value: integer);
    procedure SetTrackRect;
    procedure SetThumbMinMax;
    procedure SetThumbRect;
    procedure SetThumbHeight(const Value: integer);
    procedure SetTrackHeight(const Value: integer);
    procedure UpdatePosition;
    procedure SetonChangedValue(const Value: TonChangedValue);
    procedure UpdateValue;
    procedure SetCaptionColor(const Value: TColor);
    procedure SetShowCaption(const Value: boolean);
    procedure SetBackBorder(const Value: boolean);
    procedure SetTrackBorder(const Value: boolean);
    procedure SetThumbBorder(const Value: boolean);
    procedure SetCaptionBold(const Value: boolean);
    procedure SetOrientation(const Value: TjtbOrientation);
    procedure SetBackBitmap(const Value: TBitmap);
    procedure BackBitmapChanged(sender:TObject);
    { Private declarations }
  protected
    { Protected declarations }
    procedure doChangedValue(NewValue:integer);
    procedure MouseMove(Shift: TShiftState; X, Y: Integer);override;
    procedure Resize; override;
  public
    { Public declarations }
    constructor Create (AOwner:TComponent);override;
    procedure Paint; override;
  published
    { Published declarations }
    property Minimum:integer read FMinimum write SetMinimum;
    property Maximum:integer read FMaximum write SetMaximum;
    property Value:integer read FValue write SetValue;
    property Orientation:TjtbOrientation read FOrientation write SetOrientation;
    property BackBitmap:TBitmap read FBackBitmap write SetBackBitmap;
    property BackColor:TColor read FBackColor write SetBackColor;
    property BackBorder:boolean read FBackBorder write SetBackBorder;
    property TrackColor:TColor read FTrackColor write SetTrackColor;
    property TrackBorder:boolean read FTrackBorder write SetTrackBorder;
    property ThumbColor:TColor read FThumbColor write SetThumbColor;
    property ThumbBorder:boolean read FThumbBorder write SetThumbBorder;
    property ThumbWidth:integer read FThumbWidth write SetThumbWidth;
    property ThumbHeight:integer read FThumbHeight write SetThumbHeight;
    property TrackHeight:integer read FTrackHeight write SetTrackHeight;
    property ShowCaption:boolean read FShowCaption write SetShowCaption;
    property CaptionColor:TColor read FCaptionColor write SetCaptionColor;
    property CaptionBold:boolean read FCaptionBold write SetCaptionBold;
    property onChangedValue:TonChangedValue read FonChangedValue write SetonChangedValue;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Jans 2', [TjanTracker]);
end;

{ TjanTracker }

constructor TjanTracker.Create(AOwner: TComponent);
begin
  inherited;
  width:=150;
  height:=24;
  FOrientation:=jtbHorizontal;
  FTrackHeight:=6;
  FThumbWidth:=20;
  FThumbHeight:=16;
  FBackColor:=clsilver;
  FTrackColor:=clgray;
  FTrackBorder:=true;
  FThumbColor:=clsilver;
  FCaptioncolor:=clblack;
  FShowCaption:=true;
  FMinimum:=0;
  FMaximum:=100;
  FValue:=0;
  FBackBitmap := TBitmap.Create;
  FBackBitmap.OnChange := BackBitmapChanged;
end;

procedure TjanTracker.UpdateValue;
begin
  FValue:=round(FMinimum+(FThumbPosition-FThumbMin)/(FThumbMax-FThumbMin)*(FMaximum-FMinimum));
end;

procedure TjanTracker.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if (ssleft in shift) then
    if ptinRect(FHitRect,point(x,y)) then
    begin
      case Orientation of
        jtbHorizontal: FThumbPosition:=x;
        jtbVertical  : FThumbPosition:=y;
      end;
      UpdateValue;
      SetThumbRect;
      invalidate;
      dochangedValue(FValue);
    end;
end;

procedure TjanTracker.SetThumbMinMax;
begin
  case Orientation of
  jtbHorizontal:
    begin
      FThumbMin:=5+(FThumbwidth div 2);
      FThumbMax:=Width-FThumbMin;
    end;
  jtbVertical:
    begin
      FThumbMin:=5+(FThumbHeight div 2);
      FThumbMax:=Height-FThumbMin;
    end;
  end;
end;

procedure TjanTracker.SetTrackRect;
var dy,dx:integer;
begin
  case Orientation of
  jtbHorizontal:
  begin
    dy:=(height-FTrackHeight) div 2;
    FTrackRect:=Rect(FThumbMin,dy,FThumbMax,height-dy);
    FHitRect:=FTrackrect;
    inflateRect(FHitRect,0,(FThumbHeight-FTrackHeight) div 2);
  end;
  jtbVertical:
  begin
    dx:=(Width-FTrackHeight) div 2;
    FTrackRect:=Rect(dx,FThumbMin,Width-dx,FThumbMax);
    FHitRect:=FTrackrect;
    inflateRect(FHitRect,(FThumbWidth-FTrackHeight) div 2,0);
  end;
  end;
end;

procedure TjanTracker.SetThumbRect;
var dx,dy:integer;
begin
  case Orientation of
  jtbHorizontal:
    begin
      dx:=FThumbWidth div 2;
      dy:=(height-FThumbHeight) div 2;
      FThumbrect:=Rect(FThumbPosition-dx,dy,FThumbPosition+dx,height-dy);
    end;
  jtbVertical:
    begin
      dy:=FThumbHeight div 2;
      dx:=(Width-FThumbWidth) div 2;
      FThumbrect:=Rect(dx,FThumbPosition-dy,Width-dx,FThumbPosition+dy);
    end;
  end;
end;


procedure TjanTracker.Paint;
var
  R:TRect;
  s:string;

 procedure DrawBackBitmap;
  var
    ix, iy: Integer;
    BmpWidth, BmpHeight: Integer;
    hCanvas, BmpCanvas: THandle;
    bm: Tbitmap;
  begin
    bm := FBackBitmap;
    begin
      BmpWidth := bm.Width;
      BmpHeight := bm.Height;
      BmpCanvas := bm.Canvas.Handle;
      hCanvas := THandle(canvas.handle);
      for iy := 0 to ClientHeight div BmpHeight do
        for ix := 0 to ClientWidth div BmpWidth do
          BitBlt(hCanvas, ix * BmpWidth, iy * BmpHeight,
            BmpWidth, BmpHeight, BmpCanvas,
            0, 0, SRCCOPY);
    end;
  end;


  procedure DrawBackGround;
  begin
    if FBackBorder then
      canvas.pen.style:=pssolid
    else
      canvas.pen.style:=psclear;
    canvas.brush.color:=FBackColor;
    canvas.Rectangle (rect(0,0,width,height));
  end;

  procedure DrawTrack;
  begin
    canvas.brush.color:=FTrackColor;
    canvas.FillRect(FTrackRect);
    canvas.pen.style:=pssolid;
    if FTrackBorder then
      Frame3D( Self.Canvas, FTrackRect, clBlack, clBtnHighlight, 1 );
  end;

  procedure DrawCaption;
  begin
    s:=inttostr(FValue);
    canvas.brush.style:=bsclear;
    if FCaptionBold then
      canvas.font.style:=canvas.font.style+[fsbold]
    else
      canvas.font.style:=canvas.font.style-[fsbold];
    canvas.font.color:=FCaptionColor;
    drawText(canvas.handle,pchar(s),-1,FThumbRect,DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS);
  end;

  procedure DrawThumb;
  begin
    canvas.brush.color:=FThumbColor;
    canvas.FillRect(FThumbRect);
    canvas.pen.style:=pssolid;
    Frame3D( Self.Canvas, FThumbRect, clBtnHighlight, clBlack, 1 );
  end;

begin
  SetThumbMinMax;
  SetThumbRect;
  SetTrackRect;
  if assigned(FBackBitmap) and (FBackBitmap.Height <> 0) and (FBackBitmap.Width <> 0) then
    DrawBackBitmap
  else
    DrawBackground;
  DrawTrack;
  DrawThumb;
  if FShowCaption then
    DrawCaption;
end;

procedure TjanTracker.SetBackColor(const Value: TColor);
begin
  FBackColor := Value;
  invalidate;
end;

procedure TjanTracker.SetMaximum(const Value: integer);
begin
  if value>FMinimum then
  begin
    FMaximum := Value;
    if FValue>FMaximum then
      FValue:=FMaximum;
    UpdatePosition;
  end;
end;

procedure TjanTracker.SetMinimum(const Value: integer);
begin
  if value<FMaximum then
  begin
    FMinimum := Value;
    if FValue<FMinimum then
      FValue:=FMinimum;
    UpdatePosition;
  end;
end;

procedure TjanTracker.UpdatePosition;
var fac:extended;
begin
  fac:=(FValue-FMinimum)/(FMaximum-FMinimum);
  FThumbPosition:=FThumbMin+round((FThumbMax-FThumbMin)*fac);
  invalidate;
end;

procedure TjanTracker.SetTrackColor(const Value: TColor);
begin
  FTrackColor := Value;
  invalidate;
end;

procedure TjanTracker.SetThumbColor(const Value: TColor);
begin
  FThumbColor := Value;
  invalidate;
end;

procedure TjanTracker.SetValue(const Value: integer);
begin
  if (FValue>=FMinimum) and (FValue<=FMaximum) then
  begin
    FValue := Value;
    UpdatePosition;
    invalidate;
  end;
end;



procedure TjanTracker.SetThumbWidth(const Value: integer);
begin
  FThumbWidth := Value;
  SetThumbMinMax;
  SetThumbrect;
  SetTrackRect;
  invalidate;
end;

procedure TjanTracker.SetThumbHeight(const Value: integer);
begin
  if value<height then
  begin
    FThumbHeight := Value;
    SetThumbMinMax;
    SetThumbrect;
    SetTrackrect;
    invalidate;
  end;
end;

procedure TjanTracker.SetTrackHeight(const Value: integer);
begin
  case Orientation of
  jtbHorizontal:
  begin
    if value<(Height) then
    begin
    FTrackHeight := Value;
    setTrackrect;
    invalidate;
    end;
  end;
  jtbVertical:
  begin
    if value<(Width) then
    begin
    FTrackHeight := Value;
    setTrackrect;
    invalidate;
    end;
  end;
  end;
end;

procedure TjanTracker.SetonChangedValue(const Value: TonChangedValue);
begin
  FonChangedValue := Value;
end;

procedure TjanTracker.doChangedValue(NewValue: integer);
begin
  if assigned(onChangedValue) then
   onchangedvalue(self,NewValue);
end;

procedure TjanTracker.Resize;
begin
  inherited;
  SetThumbMinMax;
  SetTrackRect;
  UpdatePosition;
end;

procedure TjanTracker.SetCaptionColor(const Value: TColor);
begin
  FCaptionColor := Value;
  invalidate;
end;

procedure TjanTracker.SetShowCaption(const Value: boolean);
begin
  FShowCaption := Value;
  invalidate;
end;

procedure TjanTracker.SetBackBorder(const Value: boolean);
begin
  FBackBorder := Value;
  invalidate
end;

procedure TjanTracker.SetTrackBorder(const Value: boolean);
begin
  FTrackBorder := Value;
  invalidate
end;

procedure TjanTracker.SetThumbBorder(const Value: boolean);
begin
  FThumbBorder := Value;
  invalidate;
end;

procedure TjanTracker.SetCaptionBold(const Value: boolean);
begin
  FCaptionBold := Value;
  invalidate;
end;

procedure TjanTracker.SetOrientation(const Value: TjtbOrientation);
var tmp:integer;
begin
    FOrientation:= Value;
    if (csDesigning in ComponentState) then
    begin
    tmp:=width;
    width:=height;
    height:=tmp;
    tmp:=FThumbWidth;
    FThumbWidth:=FThumbheight;
    FThumbHeight:=tmp;
    end;
    invalidate;
end;



procedure TjanTracker.SetBackBitmap(const Value: TBitmap);
begin
  FBackBitmap.assign(Value);
end;

procedure TjanTracker.BackBitmapChanged(sender: TObject);
begin
  invalidate;
end;

end.
