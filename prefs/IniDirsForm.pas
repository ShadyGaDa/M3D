unit IniDirsForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TIniDirForm = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Edit4: TEdit;
    Button5: TButton;
    Edit5: TEdit;
    Button6: TButton;
    Button7: TButton;
    Edit6: TEdit;
    Label1: TLabel;
    Button8: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    Button9: TButton;
    Button10: TButton;
    Edit9: TEdit;
    Button11: TButton;
    Edit10: TEdit;
    Button12: TButton;
    Edit11: TEdit;
    Button13: TButton;
    Edit12: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private-Deklarationen }
    FDir: String;
  public
    { Public-Deklarationen }
  end;

var
  IniDirForm: TIniDirForm;

implementation

{$R *.dfm}

uses
  DivUtils,
  FileHandling,
  MAIN;
//FormulaGUI
//LightGUI
//Animation,Tiling,VoxelExport, MonteCarloForm,
procedure TIniDirForm.Button1Click(Sender: TObject);
var i: Integer;
begin
    for i := 0 to high(IniDirs) do
      IniDirs[i] := (FindComponent('Edit' + IntToStr(i + 1)) as TEdit).Text;
    SaveIni(True);
    LoadIni;
    Visible := False;
    if FDir <> IniDirs[3] then GUI.LoadFormulaNames;
end;

procedure TIniDirForm.FormShow(Sender: TObject);
var i: Integer;
begin
    for i := 0 to high(IniDirs) do
      (FindComponent('Edit' + IntToStr(i + 1)) as TEdit).Text := IniDirs[i];
    FDir := IniDirs[3];
end;

procedure TIniDirForm.Button3Click(Sender: TObject);
var t: Integer;
    s: String;
    E: TEdit;
begin
    t := (Sender as TButton).Tag;
    E := FindComponent('Edit' + IntToStr(t + 1)) as TEdit;
    s := E.Text;
    IniDirs[t] := GetDirectory(IniDirs[t], IniDirForm);
    E.Text := IniDirs[t];
    if t = 6 then SetDialogDirectory(GUI.OpenDialogPic, IniDirs[6])//{LIGHT}
    else if t = 7 then
    begin
      SetDialogDirectory(GUI.OpenDialog_L_1, IniDirs[7]);{LIGHT}
      SetDialogDirectory(GUI.SaveDialog_L_1, IniDirs[7]);{LIGHT}
      if s <> E.Text then GUI.UpdateQuickLoadCB;{LIGHT}
    end
    else if t = 0 then
    begin
      SetDialogDirectory(GUI.OPD, IniDirs[0]);
      SetDialogDirectory(GUI.SaveDialog_M_3, IniDirs[0]);
    end
    else if t = 1 then
    begin
//      SetDialogDirectory(GUI.OpenDialog_M_1, IniDirs[1]);
//      SetDialogDirectory(GUI.SaveDialog_M_2, IniDirs[1]);
//      SetDialogDirectory(TilingForm.OpenDialog2, IniDirs[1]);
    end
    else if t = 2 then
    begin
      SetDialogDirectory(GUI.SaveDialog_M_4, IniDirs[2]);
      SetDialogDirectory(GUI.SaveDialog_M_6, IniDirs[2]);
    end
    else if t = 3 then
      SetDialogDirectory(GUI.OD_M3F, IniDirs[3])//{FORMULA} OpenDialog_F_3
    else if t = 4 then
    begin
//      SetDialogDirectory(AnimationForm.SaveDialog1, IniDirs[4]);
//      SetDialogDirectory(AnimationForm.OpenDialog4, IniDirs[4]);
    end
    else if t = 8 then
    begin
//      SetDialogDirectory(TilingForm.OpenDialog1, IniDirs[8]);
//      SetDialogDirectory(TilingForm.SaveDialog1, IniDirs[8]);
    end
    else if t = 10 then
    begin
//      SetDialogDirectory(FVoxelExport.OpenDialog4, IniDirs[10]);
//      SetDialogDirectory(FVoxelExport.SaveDialog1, IniDirs[10]);
//      FVoxelExport.OutputFolder := IniDirs[10];
    end
    else if t = 11 then
    begin
//      SetDialogDirectory(MCForm.OPDmc, IniDirs[11]);
//      SetDialogDirectory(MCForm.SaveDialog3, IniDirs[11]);
    end;
end;

end.
