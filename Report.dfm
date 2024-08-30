object frmReport: TfrmReport
  Left = 0
  Top = 0
  ClientHeight = 276
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlRep: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 276
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 272
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lblName: TLabel
      Left = 24
      Top = 32
      Width = 72
      Height = 19
      Caption = 'Employee'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblMonth: TLabel
      Left = 336
      Top = 32
      Width = 88
      Height = 19
      Caption = 'Enter month'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblWork: TLabel
      Left = 40
      Top = 147
      Width = 80
      Height = 19
      Caption = 'Work days'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDayOff: TLabel
      Left = 40
      Top = 195
      Width = 65
      Height = 19
      Caption = 'Days Off'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblSickLeave: TLabel
      Left = 320
      Top = 147
      Width = 80
      Height = 19
      Caption = 'Sick Leave'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblAnnualLeave: TLabel
      Left = 320
      Top = 195
      Width = 98
      Height = 19
      Caption = 'Annual Leave'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edtName: TEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtWork: TEdit
      Left = 144
      Top = 144
      Width = 121
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtOff: TEdit
      Left = 144
      Top = 192
      Width = 121
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtSick: TEdit
      Left = 432
      Top = 144
      Width = 121
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtAnnual: TEdit
      Left = 432
      Top = 192
      Width = 121
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cmbMonth: TComboBox
      Left = 448
      Top = 24
      Width = 145
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Items.Strings = (
        '1 - Jan'
        '2 - Feb'
        '3 - Mar'
        '4 - Apr'
        '5 - May'
        '6 - Jun'
        '7 - Jul'
        '8 - Aug'
        '9 - Sep'
        '10 - Oct'
        '11 - Nov'
        '12 - Dec')
    end
    object btnShow: TButton
      Left = 88
      Top = 88
      Width = 449
      Height = 25
      Caption = 'Show'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnShowClick
    end
  end
end
