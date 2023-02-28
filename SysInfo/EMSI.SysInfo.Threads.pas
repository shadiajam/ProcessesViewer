unit EMSI.SysInfo.Threads;

interface

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  EMSI.SysInfo.Base,
  EMSI.SysInfo.Consts,
  EMSI.UI.TreeNode,
  EMSI.SysInfo.Processes
  ;

type
  TEMSI_RecurringThread = class(TThread)
  private
    FInterval: Integer;
  protected
    procedure DoWork; virtual; abstract;
    procedure UpdateInterface; virtual; abstract;
    procedure Execute; override;
  public
    constructor Create(AInterval: Integer);
    property Interval : integer read FInterval write FInterval;
  end;

  TEMSI_ProcessesListThread = class(TEMSI_RecurringThread)
  private
    FInterfaceObject : TObject;
    FProcessList: TEMSI_WinProcessList;
  protected
    procedure DoWork; override;
    procedure UpdateInterface; override;

  public
    constructor Create(InterfaceObject:TObject;AInterval: Integer);
    procedure BeforeDestruction; override;
  end;

implementation

uses Vcl.ComCtrls;

{ TEMSI_RecurringThread }

constructor TEMSI_RecurringThread.Create(AInterval: Integer);
begin
  inherited Create(True);
  FInterval := AInterval;
end;


procedure TEMSI_RecurringThread.Execute;
begin
  while not Terminated do
  begin
    DoWork;
    Synchronize(UpdateInterface);
    Sleep(FInterval);
  end;
end;



{ TEMSI_ProcessesListThread }

procedure TEMSI_ProcessesListThread.BeforeDestruction;
begin
  inherited;
  FProcessList.Free;
end;

constructor TEMSI_ProcessesListThread.Create(InterfaceObject: TObject;
  AInterval: Integer);
begin
  inherited Create(AInterval);
  FInterfaceObject := InterfaceObject;
  FProcessList:= TEMSI_WinProcessList.Create;

end;

procedure TEMSI_ProcessesListThread.DoWork;
begin
  FProcessList.FillList;
end;

procedure TEMSI_ProcessesListThread.UpdateInterface;
begin
    if FInterfaceObject is TTreeView then
      TEMSI_TreeProcedures.FillProcessesNodes(TTreeView(FInterfaceObject),FProcessList)


end;

end.
