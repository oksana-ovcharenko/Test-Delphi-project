unit Report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmTest_U;

type
  TfrmReport = class(TForm)
    pnlRep: TPanel;
    lblName: TLabel;
    lblMonth: TLabel;
    lblWork: TLabel;
    lblDayOff: TLabel;
    lblSickLeave: TLabel;
    lblAnnualLeave: TLabel;
    edtName: TEdit;
    edtWork: TEdit;
    edtOff: TEdit;
    edtSick: TEdit;
    edtAnnual: TEdit;
    cmbMonth: TComboBox;
    btnShow: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    function count_days(v_emp: String; v_opt: String; month_begin: String; month_end: String): integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport: TfrmReport;

implementation

{$R *.dfm}

uses Main;

procedure TfrmReport.btnShowClick(Sender: TObject);
var
v_month_num: integer;
v_emp_id: integer;
month_begin, month_end: String;
v_work, v_off, v_sick, v_annual: String;
begin

  v_month_num := StrToInt(copy(cmbMonth.Text, 1, pos(' ', cmbMonth.Text) - 1));
  month_begin := '01/' + IntToStr(v_month_num) + '/' + IntToStr(Integer(System.SysUtils.CurrentYear));
  month_end := month_end + IntToStr(v_month_num) + '/' + IntToStr(Integer(System.SysUtils.CurrentYear));
  if v_month_num = 2 then
  begin
    if IsLeapYear(Integer(System.SysUtils.CurrentYear)) then
      month_end := '29/2/' + IntToStr(Integer(System.SysUtils.CurrentYear))
    else
      month_end := '28/2/' + IntToStr(Integer(System.SysUtils.CurrentYear))
  end else
  begin
    if v_month_num in [1, 3, 5, 7, 8, 10, 12] then
      month_end := '31/' + IntToStr(v_month_num) + '/' + IntToStr(Integer(System.SysUtils.CurrentYear))
    else
      month_end := '30/' + IntToStr(v_month_num) + '/' + IntToStr(Integer(System.SysUtils.CurrentYear));
  end;

  with DataModuleTest do
  begin
    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Text := 'select a.EmployeeID from employee a where a.name = ''' + edtName.Text + '''';
    qryTemp.Open;
    v_emp_id := qryTemp.FieldByName('EmployeeID').AsInteger;
  end;

  v_work := IntToStr(count_days(IntToStr(v_emp_id), '1', month_begin, month_end));
  v_off := IntToStr(count_days(IntToStr(v_emp_id), '2', month_begin, month_end));
  v_sick := IntToStr(count_days(IntToStr(v_emp_id), '3', month_begin, month_end));
  v_annual := IntToStr(count_days(IntToStr(v_emp_id), '4', month_begin, month_end));

  edtWork.Text := v_work;
  edtOff.Text := v_off;
  edtSick.Text := v_sick;
  edtAnnual.Text := v_annual;

end;

function TfrmReport.count_days(v_emp: String; v_opt, month_begin, month_end: String) : integer;
begin
  with DataModuleTest do
  begin
    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add('select count(*) as cn from attendance a where a.EmployeeID = ' + v_emp);
    //qryTemp.SQL.Add(' and format(a.RecordDate, ''DD/MM/YYYY'') >= #' + month_begin + '#');
    //qryTemp.SQL.Add(' and format(a.RecordDate, ''DD/MM/YYYY'') <= #' + month_end + '#');
    qryTemp.SQL.Add(' and DateValue(a.RecordDate) >= #' + month_begin + '#');
    qryTemp.SQL.Add(' and DateValue(a.RecordDate) <= #' + month_end + '#');
    //qryTemp.SQL.Add(' and a.RecordDate between #'  + month_begin + '# and ' + month_end + '#');
    qryTemp.SQL.Add(' and a.WorkOptionID = ' + v_opt);
    //showmessage(qryTemp.SQL.Text);
    qryTemp.Open;
    Result :=  qryTemp.FieldByName('cn').AsInteger;
  end;
end;

procedure TfrmReport.FormShow(Sender: TObject);
begin
  edtName.Text := frmMain.cmbEmployee.Text;
  cmbMonth.Text := '';
  edtWork.Text := '';
  edtOff.Text := '';
  edtSick.Text := '';
  edtAnnual.Text := '';
end;

end.
