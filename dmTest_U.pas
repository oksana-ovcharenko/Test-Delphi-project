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
    //tblTest : TADOTable;       // Connect to the table
    //dsTable1 : TDataSource;
    qryTemp : TADOQuery;
    dsQueryTemp : TDataSource;
    qryEmployee : TADOQuery;
    dsQueryEmployee : TDataSource;
    qryForCombo : TADOQuery;
    dsQueryForCombo : TDataSource;
    qryWorkOpt : TADOQuery;
    dsQueryWorkOpt : TDataSource;

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
 //tblTest := TADOTable.Create(DataModuleTest);
 //dsTable1 := TDataSource.Create(DataModuleTest);

 //create ado query objects
 qryTemp := TADOQuery.Create(DataModuleTest);
 dsQueryTemp := Tdatasource.Create(DataModuleTest);

 qryEmployee := TADOQuery.Create(DataModuleTest);
 dsQueryEmployee := Tdatasource.Create(DataModuleTest);

 qryForCombo := TADOQuery.Create(DataModuleTest);
 dsQueryForCombo := Tdatasource.Create(DataModuleTest);

 qryWorkOpt := TADOQuery.Create(DataModuleTest);
 dsQueryWorkOpt := Tdatasource.Create(DataModuleTest);

 // setup our connection
 conTest.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DatabaseForDelphi1.mdb;Persist Security Info=False';
 conTest.LoginPrompt := FALSE;
 conTest.Open;


 // setup our table
 //tblTest.Connection := conTest;
 //tblTest.TableName := 'Employee';

 //connect ado query to connection
 qryTemp.Connection := conTest;

 qryEmployee.Connection := conTest;

 qryForCombo.Connection := conTest;

 qryWorkOpt.Connection := conTest;

 // setup data source
 //dsTable1.DataSet := tblTest;

 //connect datasource to ado query
 dsQueryTemp.DataSet := qryTemp;

 dsQueryEmployee.DataSet := qryEmployee;

 dsQueryForCombo.DataSet := qryForCombo;

 dsQueryWorkOpt.DataSet := qryWorkOpt;

 //tblTest.Open;
end;

end.
