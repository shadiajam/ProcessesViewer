object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Proccess Viewer - HmsiSoft - Code Challange - Shadi AJAM'
  ClientHeight = 423
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 423
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 425
      Top = 1
      Height = 421
      ExplicitLeft = 336
      ExplicitTop = 88
      ExplicitHeight = 100
    end
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 424
      Height = 421
      Align = alLeft
      Caption = 'pnlLeft'
      TabOrder = 0
      object tvMain: TTreeView
        Left = 1
        Top = 1
        Width = 422
        Height = 419
        Align = alClient
        Indent = 19
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        OnChange = tvMainChange
        OnCreateNodeClass = tvMainCreateNodeClass
        OnCustomDrawItem = tvMainCustomDrawItem
        OnHint = tvMainHint
      end
    end
    object PageControl: TPageControl
      Left = 428
      Top = 1
      Width = 451
      Height = 421
      ActivePage = TabBaseProcess
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 430
      object TabProcess: TTabSheet
        Caption = 'TabProcess'
        TabVisible = False
        inline FrameProcess: TFrameProcess
          Left = 0
          Top = 0
          Width = 443
          Height = 411
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 443
          ExplicitHeight = 411
          inherited GroupBox1: TGroupBox
            Width = 437
            Height = 405
            ExplicitLeft = 3
            ExplicitTop = 3
            ExplicitWidth = 437
            ExplicitHeight = 405
            inherited Panel1: TPanel
              Width = 433
              ExplicitWidth = 433
            end
            inherited Panel2: TPanel
              Width = 427
              ExplicitTop = 88
              ExplicitWidth = 427
              inherited Label1: TLabel
                Width = 415
              end
              inherited edtFullPath: TEdit
                Width = 415
                ExplicitLeft = 6
                ExplicitWidth = 415
              end
            end
            inherited Panel3: TPanel
              Width = 427
              ExplicitLeft = 5
              ExplicitTop = 141
              ExplicitWidth = 427
            end
          end
        end
      end
      object TabBaseProcess: TTabSheet
        Caption = 'Process'
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 3
        ExplicitTop = 9
        object Panel1: TPanel
          Left = 0
          Top = 370
          Width = 443
          Height = 41
          Align = alBottom
          BevelKind = bkFlat
          BevelOuter = bvNone
          Padding.Left = 4
          Padding.Top = 4
          Padding.Right = 4
          Padding.Bottom = 4
          TabOrder = 0
          object btnHashStartStop: TButton
            Left = 316
            Top = 4
            Width = 119
            Height = 29
            Align = alRight
            Caption = 'Hash All Proccess'
            TabOrder = 0
            OnClick = btnHashStartStopClick
            ExplicitLeft = 319
          end
          object ProgressHash: TProgressBar
            AlignWithMargins = True
            Left = 7
            Top = 7
            Width = 306
            Height = 23
            Align = alClient
            TabOrder = 1
            Visible = False
            ExplicitLeft = 4
            ExplicitTop = 4
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 443
          Height = 370
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 370
          ExplicitHeight = 41
          object memHashes: TMemo
            Left = 0
            Top = 0
            Width = 439
            Height = 366
            Align = alClient
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
        end
      end
      object TabSession: TTabSheet
        Caption = 'TabSession'
        ImageIndex = 2
        TabVisible = False
        inline FrameSession: TfrmSessionInfo
          Left = 0
          Top = 0
          Width = 443
          Height = 411
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 443
          ExplicitHeight = 411
          inherited GroupBox1: TGroupBox
            Width = 437
            Height = 405
            ExplicitLeft = 3
            ExplicitTop = 3
            ExplicitWidth = 437
            ExplicitHeight = 405
            inherited Panel4: TPanel
              Width = 427
              ExplicitTop = 118
              ExplicitWidth = 427
            end
            inherited Panel1: TPanel
              Width = 427
              ExplicitTop = 93
              ExplicitWidth = 427
            end
            inherited Panel2: TPanel
              Width = 427
              ExplicitTop = 68
              ExplicitWidth = 427
            end
            inherited Panel3: TPanel
              Width = 427
              ExplicitTop = 43
              ExplicitWidth = 427
            end
            inherited Panel5: TPanel
              Width = 427
              ExplicitWidth = 427
            end
          end
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 296
    Top = 144
    object File1: TMenuItem
      Caption = 'File'
      object heme1: TMenuItem
        Caption = 'Theme'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object Updatespeed1: TMenuItem
        Caption = 'Update speed'
        object mnu05Sec: TMenuItem
          Tag = 500
          Caption = '0.5 Sec'
          GroupIndex = 2
          RadioItem = True
          OnClick = mnu10SecClick
        end
        object mnu1Sec: TMenuItem
          Tag = 1000
          Caption = '1 Sec'
          GroupIndex = 2
          RadioItem = True
          OnClick = mnu10SecClick
        end
        object mnu2Sec: TMenuItem
          Tag = 2000
          Caption = '2 Sec'
          Checked = True
          Default = True
          GroupIndex = 2
          RadioItem = True
          OnClick = mnu10SecClick
        end
        object mnu5Sec: TMenuItem
          Tag = 5000
          Caption = '5 Sec'
          GroupIndex = 2
          RadioItem = True
          OnClick = mnu10SecClick
        end
        object mnu10Sec: TMenuItem
          Tag = 10000
          Caption = '10 Sec'
          GroupIndex = 2
          RadioItem = True
          OnClick = mnu10SecClick
        end
      end
      object Update1: TMenuItem
        Caption = 'Update now'
      end
    end
  end
end
