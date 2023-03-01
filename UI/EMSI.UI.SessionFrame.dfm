object frmSessionInfo: TfrmSessionInfo
  Left = 0
  Top = 0
  Width = 587
  Height = 468
  TabOrder = 0
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 581
    Height = 462
    Align = alClient
    Caption = ' Session Information '
    TabOrder = 0
    ExplicitLeft = -32
    ExplicitTop = -59
    ExplicitWidth = 619
    ExplicitHeight = 527
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 118
      Width = 571
      Height = 19
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 0
      ExplicitTop = 18
      object Label6: TLabel
        Left = 6
        Top = 3
        Width = 120
        Height = 13
        Caption = 'Authentication Package :'
      end
      object lblPackage: TLabel
        Left = 154
        Top = 3
        Width = 8
        Height = 13
        Caption = '--'
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 93
      Width = 571
      Height = 19
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      ExplicitTop = 18
      object Label1: TLabel
        Left = 6
        Top = 3
        Width = 56
        Height = 13
        Caption = 'Start Time :'
      end
      object lblStartTime: TLabel
        Left = 154
        Top = 3
        Width = 8
        Height = 13
        Caption = '--'
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 68
      Width = 571
      Height = 19
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 2
      ExplicitTop = 18
      object Label3: TLabel
        Left = 6
        Top = 3
        Width = 68
        Height = 13
        Caption = 'Domain/User :'
      end
      object lblUser: TLabel
        Left = 154
        Top = 3
        Width = 8
        Height = 13
        Caption = '--'
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 43
      Width = 571
      Height = 19
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 3
      ExplicitTop = 18
      object Label5: TLabel
        Left = 6
        Top = 3
        Width = 60
        Height = 13
        Caption = 'Logon Type:'
      end
      object lblLoginType: TLabel
        Left = 154
        Top = 3
        Width = 8
        Height = 13
        Caption = '--'
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 571
      Height = 19
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 4
      object Label9: TLabel
        Left = 6
        Top = 3
        Width = 49
        Height = 13
        Caption = 'Logon Id :'
      end
      object lblLoginID: TLabel
        Left = 154
        Top = 3
        Width = 8
        Height = 13
        Caption = '--'
      end
    end
  end
end
