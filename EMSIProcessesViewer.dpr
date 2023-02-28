program EMSIProcessesViewer;

uses
  Vcl.Forms,
  EMSI.UI.MainForm in 'UI\EMSI.UI.MainForm.pas' {frmMain},
  EMSI.SysInfo.Processes in 'SysInfo\EMSI.SysInfo.Processes.pas',
  EMSI.SysInfo.Base in 'SysInfo\EMSI.SysInfo.Base.pas',
  EMSI.SysInfo.Consts in 'SysInfo\EMSI.SysInfo.Consts.pas',
  EMSI.UI.TreeNode in 'UI\EMSI.UI.TreeNode.pas',
  Vcl.Themes,
  Vcl.Styles,
  EMSI.SysInfo.Threads in 'SysInfo\EMSI.SysInfo.Threads.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
