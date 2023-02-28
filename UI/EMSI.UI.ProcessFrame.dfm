object FrameProcess: TFrameProcess
  Left = 0
  Top = 0
  Width = 625
  Height = 533
  TabOrder = 0
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 619
    Height = 527
    Align = alClient
    Caption = ' Image File Information '
    TabOrder = 0
    ExplicitLeft = -29
    ExplicitTop = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 615
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 0
      object Image1: TImage
        Left = 8
        Top = 9
        Width = 57
        Height = 57
      end
      object lblProcessName: TLabel
        Left = 77
        Top = 10
        Width = 67
        Height = 13
        Caption = 'Process Name'
      end
      object lblCompany: TLabel
        Left = 77
        Top = 31
        Width = 75
        Height = 13
        Caption = 'Company Name'
      end
      object lblVersion: TLabel
        Left = 77
        Top = 51
        Width = 35
        Height = 13
        Caption = 'Version'
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 97
      Width = 615
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      object Label1: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 603
        Height = 13
        Align = alTop
        Caption = 'Full Path'
        ExplicitLeft = 3
        ExplicitWidth = 609
      end
      object edtFullPath: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 25
        Width = 603
        Height = 21
        Align = alTop
        ReadOnly = True
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitWidth = 609
      end
    end
  end
end
