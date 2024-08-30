object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main Form'
  ClientHeight = 546
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object pgclMain: TPageControl
    Left = 0
    Top = 0
    Width = 790
    Height = 497
    ActivePage = tshEmployees
    Align = alTop
    TabOrder = 0
    object tshEmployees: TTabSheet
      Caption = 'Employee'#39's Info'
      object dbgEmployee: TDBGrid
        Left = 137
        Top = 0
        Width = 645
        Height = 467
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbgEmployeeDrawColumnCell
      end
      object pnlFilter: TPanel
        Left = 0
        Top = 0
        Width = 137
        Height = 467
        Align = alLeft
        TabOrder = 1
        object rbAnnualLeave: TRadioButton
          Left = 10
          Top = 143
          Width = 127
          Height = 17
          Caption = 'Annual Leave'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = rbAnnualLeaveClick
        end
        object rbDayOff: TRadioButton
          Left = 10
          Top = 80
          Width = 113
          Height = 17
          Caption = 'Day Off'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rbDayOffClick
        end
        object rbSickLeave: TRadioButton
          Left = 10
          Top = 112
          Width = 113
          Height = 17
          Caption = 'Sick Leave'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = rbSickLeaveClick
        end
        object rbAll: TRadioButton
          Left = 10
          Top = 16
          Width = 113
          Height = 17
          Caption = 'All records'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = rbAllClick
        end
        object rbWork: TRadioButton
          Left = 10
          Top = 48
          Width = 113
          Height = 17
          Caption = 'Work'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = rbWorkClick
        end
      end
    end
    object tshAbsence: TTabSheet
      Caption = 'Request Absence'
      ImageIndex = 1
      object lblName: TLabel
        Left = 32
        Top = 40
        Width = 170
        Height = 19
        Caption = 'Select employee name:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblAbsenceType: TLabel
        Left = 32
        Top = 80
        Width = 172
        Height = 19
        Caption = 'Select type of absence:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblFrom: TLabel
        Left = 34
        Top = 128
        Width = 43
        Height = 19
        Caption = 'From:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblDays: TLabel
        Left = 272
        Top = 128
        Width = 121
        Height = 19
        Caption = 'Number of days:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbEmployee: TComboBox
        Left = 232
        Top = 40
        Width = 145
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cmbAbsenceType: TComboBox
        Left = 232
        Top = 80
        Width = 145
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'Day Off'
          'Sick Leave'
          'Annual Leave')
      end
      object CalendarPicker1: TCalendarPicker
        Left = 83
        Top = 122
        Height = 32
        CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
        CalendarHeaderInfo.DaysOfWeekFont.Height = -17
        CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        CalendarHeaderInfo.DaysOfWeekFont.Style = []
        CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
        CalendarHeaderInfo.Font.Color = clWindowText
        CalendarHeaderInfo.Font.Height = -25
        CalendarHeaderInfo.Font.Name = 'Segoe UI'
        CalendarHeaderInfo.Font.Style = []
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TextHint = 'select a date'
      end
      object spnDays: TSpinEdit
        Left = 407
        Top = 125
        Width = 121
        Height = 29
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 3
        Value = 0
      end
      object btnApply: TButton
        Left = 34
        Top = 344
        Width = 151
        Height = 41
        Caption = 'Apply'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnApplyClick
      end
      object btnReport: TButton
        Left = 386
        Top = 344
        Width = 151
        Height = 41
        Caption = 'Report'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnReportClick
      end
    end
  end
end
