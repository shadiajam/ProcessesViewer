object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Proccess Viewer - HmsiSoft - Code Challange - Shadi AJAM'
  ClientHeight = 503
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
    Height = 503
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 425
      Top = 1
      Height = 501
      ExplicitLeft = 336
      ExplicitTop = 88
      ExplicitHeight = 100
    end
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 424
      Height = 501
      Align = alLeft
      Caption = 'pnlLeft'
      TabOrder = 0
      object tvMain: TTreeView
        Left = 1
        Top = 1
        Width = 422
        Height = 499
        Align = alClient
        Indent = 19
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        OnCreateNodeClass = tvMainCreateNodeClass
        OnCustomDrawItem = tvMainCustomDrawItem
        OnHint = tvMainHint
        ExplicitLeft = -4
        ExplicitTop = 2
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 480
    Top = 256
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
