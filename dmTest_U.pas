unit dmTest_U;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB;

type
  TDataModuleTest = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conTest : TADOConnection;  // Connect to the DB
    tblTest : TADOTable;       // Connect to the table
    dsTable1 : TDataSource;
    qryTest1 : TADOQuery;
    dsQueryTest1 : TDataSource;
    qryEmployee : TADOQuery;
    dsQueryEmployee : TDataSource;
    qryForCombo : TADOQuery;
    dsQueryForCombo : TDataSource;

end;

var
  DataModuleTest: TDataModuleTest;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleTest.DataModuleCreate(Sender: TObject);
begin
 // create our objects
 conTest := TADOConnection.Create(DataModuleTest);
 tblTest := TADOTable.Create(DataModuleTest);
 dsTable1 := TDataSource.Create(DataModuleTest);

 //create ado query objects
 qryTest1 := TADOQuery.Create(DataModuleTest);
 dsQueryTest1 := Tdatasource.Create(DataModuleTest);

 qryEmployee := TADOQuery.Create(DataModuleTest);
 dsQueryEmployee := Tdatasource.Create(DataModuleTest);

 qryForCombo := TADOQuery.Create(DataModuleTest);
 dsQueryForCombo := Tdatasource.Create(DataModuleTest);

 // setup our connection
 conTest.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DatabaseForDelphi1.mdb;Persist Security Info=False';
 conTest.LoginPrompt := FALSE;
 conTest.Open;


 // setup our table
 tblTest.Connection := conTest;
 tblTest.TableName := 'Employee';

 //connect ado query to connection
 qryTest1.Connection := conTest;

 qryEmployee.Connection := conTest;

 qryForCombo.Connection := conTest;

 // setup data source
 dsTable1.DataSet := tblTest;

 //connect datasource to ado query
 dsQueryTest1.DataSet := qryTest1;

 dsQueryEmployee.DataSet := qryEmployee;

 dsQueryForCombo.DataSet := qryForCombo;

 tblTest.Open;
end;

end.
