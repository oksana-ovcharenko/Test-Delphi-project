unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, dmTest_U, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Samples.Calendar, Vcl.WinXCalendars, Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pgclMain: TPageControl;
    tshEmployees: TTabSheet;
    tshAbsence: TTabSheet;
    dbgEmployee: TDBGrid;
    lblName: TLabel;
    lblAbsenceType: TLabel;
    lblFrom: TLabel;
    lblDays: TLabel;
    cmbEmployee: TComboBox;
    cmbAbsenceType: TComboBox;
    CalendarPicker1: TCalendarPicker;
    spnDays: TSpinEdit;
    rbDayOff: TRadioButton;
    rbSickLeave: TRadioButton;
    rbAnnualLeave: TRadioButton;
    rbAll: TRadioButton;
    pnlFilter: TPanel;
    rbWork: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbgEmployeeDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Attendance_Info(condition_emp: String; condition_work_opt: String);
    procedure rbAllClick(Sender: TObject);
    procedure rbDayOffClick(Sender: TObject);
    procedure rbSickLeaveClick(Sender: TObject);
    procedure rbAnnualLeaveClick(Sender: TObject);
    procedure rbWorkClick(Sender: TObject);
    procedure grdColSetWidth();
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


procedure TfrmMain.Button1Click(Sender: TObject);
var
i: integer;
begin
  dbgEmployee.Visible := True;
  Attendance_Info('', '');

  grdColSetWidth();
//  dbgEmployee.Columns[0].Width := trunc(dbgEmployee.Width/4);
//  dbgEmployee.Columns[1].Width := dbgEmployee.Width - trunc(dbgEmployee.Width/2);
//  dbgEmployee.Columns[2].Width := trunc(dbgEmployee.Width/4);

end;



procedure TfrmMain.dbgEmployeeDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  dbgEmployee.Canvas.Font.Color := clWhite;
  //with dbgEmployee do
  //with Canvas do
  with DataModuleTest do
  begin
    if qryEmployee.FieldByName('Work_option').AsString = 'Work' then
     begin
      //dbgEmployee.Canvas.Font.Color := clWhite;
      dbgEmployee.Canvas.Brush.Color := clTeal;
     end else
     if qryEmployee.FieldByName('Work_option').AsString = 'Day Off' then
     begin
       //dbgEmployee.Canvas.Font.Color := clWhite;
       dbgEmployee.Canvas.Brush.Color := clGray;
     end else
     if qryEmployee.FieldByName('Work_option').AsString = 'Sick Leave' then
     begin
       //dbgEmployee.Canvas.Font.Color := clWhite;
       dbgEmployee.Canvas.Brush.Color := clRed;
     end else
     if qryEmployee.FieldByName('Work_option').AsString = 'Annual Leave' then
     begin
       //dbgEmployee.Canvas.Font.Color := clWhite;
       dbgEmployee.Canvas.Brush.Color := clOlive;
     end;
    dbgEmployee.Canvas.FillRect(Rect);
    dbgEmployee.DefaultDrawDataCell(Rect, Field, State);
  end;
end;


procedure TfrmMain.FormResize(Sender: TObject);
begin
  grdColSetWidth();
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 dbgEmployee.DataSource := DataModuleTest.dsQueryEmployee;
 dbgEmployee.Visible := True;
 Attendance_Info('', '');
 grdColSetWidth();


// with DataModuleTest do
// begin
//  qryEmployee.Close;
//  qryEmployee.SQL.Text :=
//   'select a.RecordDate as Record_date, b.name as Employee_name, c.option as Work_option from attendance a, employee b, WorkOptions c ' +
//      'where a.EmployeeID = b.EmployeeID and b.EmployeeID = 2 and c.OptionID = a.WorkOptionID';
//  qryEmployee.Open;
// end //end with
//
// showmessage('Collumn[0]: ' + IntToStr(dbgEmployee.Columns[0].Width));
// dbgEmployee.Columns[0].Width := 100;
// dbgEmployee.Columns[1].Width := 180;
// dbgEmployee.Columns[2].Width := 100;

  with DataModuleTest do
  begin
   qryForCombo.Close;
   qryForCombo.SQL.Clear;
   qryForCombo.SQL.Text := 'select a.EmployeeID, a.name from employee a order by name';
   qryForCombo.Open;
  end; //end with

  with DataModuleTest do
  begin
    qryForCombo.First;
    while qryForCombo.Eof <> True do
    begin
      cmbEmployee.Items.AddObject(qryForCombo.FieldByName('name').AsString, TObject(qryForCombo.FieldByName('EmployeeID').AsInteger));
      qryForCombo.Next;
    end;
  end;
end;

procedure TfrmMain.grdColSetWidth;
var
width1, width2: integer;
begin
  //showmessage('dbgEmployee.Width = ' + IntToStr(dbgEmployee.Width));
  width1 := trunc(dbgEmployee.Width/4);
  width2 := dbgEmployee.Width - 2*width1;
  dbgEmployee.Columns[0].Width := width1;
  dbgEmployee.Columns[1].Width := width2;
  dbgEmployee.Columns[2].Width := width1;
  //showmessage('Column0 = ' + IntToStr(dbgEmployee.Columns[0].Width));
  //showmessage('Column1 = ' + IntToStr(dbgEmployee.Columns[1].Width));
  //showmessage('Column2 = ' + IntToStr(dbgEmployee.Columns[2].Width));
end;

procedure TfrmMain.rbAllClick(Sender: TObject);
begin
 Attendance_Info('', '');
 grdColSetWidth();
end;

procedure TfrmMain.rbWorkClick(Sender: TObject);
begin
 Attendance_Info('', ' and a.WorkOptionID = 1');
 grdColSetWidth();
end;

procedure TfrmMain.rbSickLeaveClick(Sender: TObject);
begin
 Attendance_Info('', ' and a.WorkOptionID = 2');
 grdColSetWidth();
end;

procedure TfrmMain.rbDayOffClick(Sender: TObject);
begin
 Attendance_Info('', ' and a.WorkOptionID = 3');
 grdColSetWidth();
end;

procedure TfrmMain.rbAnnualLeaveClick(Sender: TObject);
begin
 Attendance_Info('', ' and a.WorkOptionID = 4');
 grdColSetWidth();
end;

procedure TfrmMain.Attendance_Info(condition_emp: String; condition_work_opt: String);
begin
  with DataModuleTest do
  begin
   qryEmployee.Close;
   qryEmployee.SQL.Clear;
   qryEmployee.SQL.Text :=
   'select a.RecordDate as Record_date, b.name as Employee_name, c.option as Work_option from attendance a, employee b, WorkOptions c ' +
      //'where a.EmployeeID = b.EmployeeID and b.EmployeeID > 0 and c.OptionID = a.WorkOptionID';
      'where a.EmployeeID = b.EmployeeID ' + condition_emp + ' and c.OptionID = a.WorkOptionID' + condition_work_opt;
   qryEmployee.Open;
  end; //end with

end; // end attendance_info

end.
