unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, dmTest_U, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Samples.Calendar, Vcl.WinXCalendars, Vcl.Samples.Spin, Vcl.ExtCtrls, Report;

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
    btnApply: TButton;
    btnReport: TButton;
    procedure FormShow(Sender: TObject);
    procedure Attendance_Info(condition_emp: String; condition_work_opt: String);
    procedure rbAllClick(Sender: TObject);
    procedure rbDayOffClick(Sender: TObject);
    procedure rbSickLeaveClick(Sender: TObject);
    procedure rbAnnualLeaveClick(Sender: TObject);
    procedure rbWorkClick(Sender: TObject);
    procedure grdColSetWidth();
    procedure FormResize(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure dbgEmployeeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


procedure TfrmMain.btnApplyClick(Sender: TObject);
var
v_name, v_abs_type: String;
v_date: TDate;
v_emp_id, v_abs_id, v_d_number: integer;
v_new_opt: String;
v_new_opt_id: Integer;
v_old_opt_id: Integer;
v_tmp_id: Integer;
v_str: String;

begin
  v_name := cmbEmployee.Text;
  //v_emp_id :=
  v_abs_type := cmbAbsenceType.Text;
  //v_abs_id := cmbAbsenceType.ItemIndex;
  v_date := CalendarPicker1.Date;
  v_d_number := spnDays.Value;



  with DataModuleTest do
  begin
    v_new_opt := cmbAbsenceType.Text;
    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add('select OptionID from WorkOptions where Option = ''' + v_new_opt + '''');
    qryTemp.Open;
    v_new_opt_id := qryTemp.FieldByName('OptionID').AsInteger;

    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Text := 'select a.EmployeeID from employee a where a.name = ''' + cmbEmployee.Text + '''';
    qryTemp.Open;
    v_emp_id := qryTemp.FieldByName('EmployeeID').AsInteger;
    //showmessage(IntToStr(v_emp_id));

    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Text := 'select a.AttendanceID, a.WorkOptionID, c.Option, a.AttendanceID ' +
                        'from attendance a, employee b, workoptions c ' +
                         'where format(a.RecordDate, ''DD/MM/YYYY'') = ''' + DateToStr(v_date) + '''' +
                         ' and a.EmployeeID = b.EmployeeID and a.WorkOptionID = c.OptionID' +
                         ' and b.name = ''' + v_name + '''';
    qryTemp.Open;

    if qryTemp.RecordCount > 0 then
    begin
      v_old_opt_id := qryTemp.FieldByName('WorkOptionID').AsInteger;
      v_tmp_id := qryTemp.FieldByName('AttendanceID').AsInteger;
      if v_new_opt_id <> v_old_opt_id then
      begin
        qryTemp.Close;
        qryTemp.SQL.Clear;
        qryTemp.SQL.Text := 'update attendance a set a.WorkOptionID = ' + IntToStr(v_new_opt_id) +
                 ' where a.AttendanceID = ' + IntToStr(v_tmp_id);
        showmessage(qryTemp.SQL.Text);
        qryTemp.ExecSQL;
      end;
    end else
    begin
      qryTemp.Close;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Add('insert into attendance (RecordDate, EmployeeID, WorkOptionID) ');
      qryTemp.SQL.Add('values (''' + DateToStr(v_date) + ''', ');
      qryTemp.SQL.Add(IntToStr(v_emp_id));
      qryTemp.SQL.Add(', ' + IntToStr(v_new_opt_id) + ')');
      qryTemp.ExecSQL;
    end;
  end;
  showmessage('Your request has been applied!');
  Attendance_Info('', '');
  grdColSetWidth();
end;




procedure TfrmMain.btnReportClick(Sender: TObject);
begin
  if cmbEmployee.Text <> '' then
     frmReport.Show
  else
    showmessage('Enter Employee name!');
end;

procedure TfrmMain.dbgEmployeeDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DataModuleTest do
  begin
    if qryEmployee.FieldByName('Work_option').AsString = 'Work' then
    begin

      if dbgEmployee.Canvas.Brush.Color = dbgEmployee.Color then
         //if dbgEmployee.SelectedRows.CurrentRowSelected then
         dbgEmployee.Canvas.Font.Color := clWhite
         //dbgEmployee.Canvas.Brush.Color := clNavy
      else
         dbgEmployee.Canvas.Brush.Color := clSkyBlue;
    end else
    if qryEmployee.FieldByName('Work_option').AsString = 'Day Off' then
    begin
      //if dbgEmployee.Canvas.Brush.Color = dbgEmployee.Color then
         dbgEmployee.Canvas.Brush.Color := clMedGray;
    end; //else
    if qryEmployee.FieldByName('Work_option').AsString = 'Sick Leave' then
    begin
      //if dbgEmployee.Canvas.Brush.Color = dbgEmployee.Color then
         dbgEmployee.Canvas.Brush.Color := clWebPlum;
    end; //else
    if qryEmployee.FieldByName('Work_option').AsString = 'Annual Leave' then
    begin
      //if dbgEmployee.Canvas.Brush.Color = dbgEmployee.Color then
         dbgEmployee.Canvas.Brush.Color := clMoneyGreen;
    end; //else

  end;
  dbgEmployee.Canvas.FillRect(Rect);
  dbgEmployee.DefaultDrawColumnCell(Rect, DataCol, Column, State);
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


  // Query for Employee name
  with DataModuleTest do
  begin
   qryForCombo.Close;
   qryForCombo.SQL.Clear;
   qryForCombo.SQL.Text := 'select a.EmployeeID, a.name from employee a order by name';
   qryForCombo.Open;

  end; //end with

  // ComboBox items based on query
  with DataModuleTest do
  begin
    qryForCombo.First;
    while qryForCombo.Eof <> True do
    begin
      cmbEmployee.Items.AddObject(qryForCombo.FieldByName('name').AsString, TObject(qryForCombo.FieldByName('EmployeeID').AsInteger));
      qryForCombo.Next;
    end;

  end;
end; // end FormShow

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

procedure TfrmMain.rbDayOffClick(Sender: TObject);
begin
 Attendance_Info('', ' and a.WorkOptionID = 2');
 grdColSetWidth();
end;

procedure TfrmMain.rbSickLeaveClick(Sender: TObject);
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
      'where a.EmployeeID = b.EmployeeID ' + condition_emp + ' and c.OptionID = a.WorkOptionID' + condition_work_opt;
   qryEmployee.Open;
  end; //end with

end; // end attendance_info

end.
