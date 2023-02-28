unit EMSI.UI.ProcessFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameProcess = class(TFrame)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Image1: TImage;
    lblProcessName: TLabel;
    lblCompany: TLabel;
    lblVersion: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    edtFullPath: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
