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
      Height = 70
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object imgProccess: TImage
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
        Top = 53
        Width = 35
        Height = 13
        Caption = 'Version'
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 88
      Width = 609
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      ExplicitTop = 100
      object Label1: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 597
        Height = 13
        Align = alTop
        Caption = 'Full Path'
        ExplicitLeft = 5
      end
      object edtFullPath: TEdit
        AlignWithMargins = True
        Left = 6
        Top = 25
        Width = 597
        Height = 21
        Align = alTop
        ReadOnly = True
        TabOrder = 0
        ExplicitLeft = 5
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 141
      Width = 609
      Height = 164
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 152
      object Label2: TLabel
        Left = 6
        Top = 4
        Width = 39
        Height = 13
        Caption = 'Parent :'
      end
      object lblParent: TLabel
        Left = 74
        Top = 5
        Width = 8
        Height = 13
        Caption = '--'
      end
      object Label4: TLabel
        Left = 6
        Top = 23
        Width = 29
        Height = 13
        Caption = 'User :'
      end
      object lblUser: TLabel
        Left = 74
        Top = 24
        Width = 8
        Height = 13
        Caption = '--'
      end
      object Label6: TLabel
        Left = 6
        Top = 45
        Width = 54
        Height = 13
        Caption = 'Session ID:'
      end
      object lblSession: TLabel
        Left = 74
        Top = 45
        Width = 8
        Height = 13
        Caption = '--'
      end
    end
  end
end
