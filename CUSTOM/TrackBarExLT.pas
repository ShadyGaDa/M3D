unit TrackBarExLT;

interface

uses
  Windows, Messages, Graphics, Forms, Dialogs, ExtCtrls, StdCtrls,
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ComCtrls;

type
  TTrackBarExLT = class(TCustomControl)
  private
    { Private declarations }
    fChange: TTrackBar;
//    FEdit:     TEdit;
    fName:   TLabel;
    fValue:  TLabel;
    //procedure ButtonClick(Sender: TObject);
    //procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional', [TTrackBarExLT]);
  //RegisterComponents('Samples', [TTrackBarExLT]);
end;

constructor TTrackBarExLT.Create(AOwner: TComponent);
begin
  inherited;
  fChange := TTrackBar.Create(Self);
  fName   := TEdit.Create(Self);
  fValue  := TEdit.Create(Self);

end;


//procedure TTrackBarExLT.ButtonClick(Sender: TObject);
//begin
//  // do whatever you want here
//end;

//procedure TTrackBarExLT.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//begin
//  // do whatever you want here
//end;

//object fName: TLabel
//  Left = 0
//  Top = 8
//  Width = 103
//  Height = 13
//  Caption = 'fp name:'
//end

//object fValue: TLabel
//  Left = 52
//  Top = 22
//  Width = 51
//  Height = 17
//  Alignment = taCenter
//  AutoSize = False
//  Caption = '0.0'
//  Font.Charset = DEFAULT_CHARSET
//  Font.Color = clWindowText
//  Font.Height = -11
//  Font.Name = 'Consolas'
//  Font.Style = []
//  ParentFont = False
//end

//object fChange: TTrackBarEx
//  Left = 0
//  Top = 22
//  Width = 51
//  Height = 17
//  Ctl3D = True
//  LineSize = 0
//  Max = 60
//  Min = -60
//  ParentCtl3D = False
//  ParentShowHint = False
//  PageSize = 1
//  PositionToolTip = ptTop
//  ShowHint = True
//  TabOrder = 0
//  ThumbLength = 18
//  TickMarks = tmBoth
//  TickStyle = tsNone
//end

var
  fName: TLabel;
  fValue: TLabel;
  fChange: TTrackBarEx;

  fName := TLabel.Create(Self);
  fValue := TLabel.Create(Self);
  fChange := TTrackBarEx.Create(Self);

  with fName do
  begin
    Name := 'fName';
    Parent := Self;
    Left := 0;
    Top := 8;
    Width := 103;
    Height := 13;
    Caption := 'fp name:';
  end;
  with fValue do
  begin
    Name := 'fValue';
    Parent := Self;
    Left := 52;
    Top := 22;
    Width := 51;
    Height := 17;
    Alignment := taCenter;
    AutoSize := False;
    Caption := '0.0';
    ParentFont := False;
  end;
  with fChange do
  begin
    Name := 'fChange';
    Parent := Self;
    Left := 0;
    Top := 22;
    Width := 51;
    Height := 17;
    Ctl3D := True;
    LineSize := 0;
    Max := 60;
    Min := -60;
    ParentCtl3D := False;
    ParentShowHint := False;
    PageSize := 1;
    PositionToolTip := ptTop;
    ShowHint := True;
//    TabOrder := 0;
    ThumbLength := 18;
    TickMarks := tmBoth;
    TickStyle := tsNone;
  end;



end.
