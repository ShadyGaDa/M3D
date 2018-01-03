unit TrackBarPercent;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, ComCtrls, StdCtrls;

type
  TCNHScroll = TWMHScroll;

  TTrackBar = class(comctrls.TTrackBar)  // interposer class for quick test
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure CNHScroll(var Message: TCNHScroll); message CN_HSCROLL;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TForm1 = class(TForm)
    Label1: TLabel;
    TrackBar1: TTrackBar;
    procedure TrackBar1Change(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses
  commctrl;

{$R *.dfm}

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  // account for non-linear scaling for a sensible value
  if TrackBar1.Position <= 8 then
    Label1.Caption := IntToStr(TrackBar1.Position * 125)
  else
    Label1.Caption := IntToStr(TrackBar1.Position * 1000 - 7000)
end;

{ TTrackBar }

constructor TTrackBar.Create(AOwner: TComponent);
begin
  inherited;

  // We'll have 15 positions which should account for the following values 
  // 125 250 - 500 - - - 1000 2000 3000 4000 5000 6000 7000 8000
  // positions 3, 5..7 will be skipped when tracking
  Min := 1;
  Max := 15;
  LineSize := 1;
  PageSize := 1;
end;

procedure TTrackBar.CreateParams(var Params: TCreateParams);
begin
  inherited;
  // remove automatic ticks so that we don't have ticks at 3 and 5..7
  Params.Style := Params.Style and not TBS_AUTOTICKS;
end;

procedure TTrackBar.CreateWnd;
begin
  inherited;
  // first and last tick not required
  SetTick(2);  //  250
  SetTick(4);  //  500
  SetTick(8);  // 1000
  SetTick(9);  // 2000
  SetTick(10); 
  SetTick(11);
  SetTick(12);
  SetTick(13);
  SetTick(14); // 7000
end;

procedure TTrackBar.CNHscroll(var Message: TCNHScroll);
var
  Pos: Integer;
begin
  // prevent jumping back and forth while thumb tracking, do not slide to the
  // next tick until a threshold is passed
  if Message.ScrollCode = SB_THUMBTRACK then begin
    case Message.Pos of            
      5: SendMessage(Handle, TBM_SETPOS, 1, 4);
      6, 7: SendMessage(Handle, TBM_SETPOS, 1, 8);
    end;
  end;

  // for line and page and rest of the scrolling, skip certain ticks
  Pos := SendMessage(Handle, TBM_GETPOS, 0, 0);
  if Pos > Position then      // compare with previous position
    case Pos of
      3: SendMessage(Handle, TBM_SETPOS, 1, 4);
      5..7: SendMessage(Handle, TBM_SETPOS, 1, 8);
    end;
  if Pos < Position then
    case Pos of
      3: SendMessage(Handle, TBM_SETPOS, 1, 2);
      5..7: SendMessage(Handle, TBM_SETPOS, 1, 4);
    end;

  inherited;
end;

end.