program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dmTest_U in 'dmTest_U.pas' {DataModuleTest: TDataModule},
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModuleTest, DataModuleTest);
  Application.Run;
end.
