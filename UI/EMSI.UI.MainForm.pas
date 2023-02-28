unit EMSI.UI.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls,EMSI.UI.TreeNode, Vcl.ExtCtrls,
  EMSI.SysInfo.Threads, Vcl.Menus
  ;

type


  TfrmMain = class(TForm)
    pnlMain: TPanel;
    pnlLeft: TPanel;
    tvMain: TTreeView;
    Splitter1: TSplitter;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Options1: TMenuItem;
    Updatespeed1: TMenuItem;
    mnu05Sec: TMenuItem;
    mnu1Sec: TMenuItem;
    mnu2Sec: TMenuItem;
    mnu5Sec: TMenuItem;
    mnu10Sec: TMenuItem;
    heme1: TMenuItem;
    Update1: TMenuItem;
    procedure tvMainCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure mnu10SecClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure tvMainCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tvMainHint(Sender: TObject; const Node: TTreeNode;
      var Hint: string);
  private
    { Private declarations }
    FProcessesThread : TEMSI_ProcessesListThread;
    procedure SetRefreshInterval(Interval:integer);
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

  end;


var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.AfterConstruction;
begin
  inherited;
  TEMSI_TreeProcedures.FillBaseNodes(tvMain);
  FProcessesThread := TEMSI_ProcessesListThread.Create(tvMain,2000);
  FProcessesThread.Start;
end;

procedure TfrmMain.BeforeDestruction;
begin
  inherited;
  FProcessesThread.Free;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.mnu10SecClick(Sender: TObject);
begin
  SetRefreshInterval(TMenuItem(Sender).Tag);
end;


procedure TfrmMain.SetRefreshInterval(Interval: integer);
begin
  FProcessesThread.Interval := Interval;
end;

procedure TfrmMain.tvMainCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
  NodeClass := TEMSI_TreeNode;
end;

procedure TfrmMain.tvMainCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if node = nil then exit;
  if TEMSI_TreeNode(Node).BackColor <> clDefault then
    tvMain.Canvas.Brush.Color := TEMSI_TreeNode(Node).BackColor;
end;

procedure TfrmMain.tvMainHint(Sender: TObject; const Node: TTreeNode;
  var Hint: string);
begin
  if node = nil then exit;
  Hint := TEMSI_TreeNode(Node).NodeHint;
end;

end.
