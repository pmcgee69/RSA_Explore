program Project5;

uses
  Vcl.Forms,
  U_RSA_App in 'U_RSA_App.pas' {Form1},
  U_RSA in 'U_RSA.pas',
  U_BigInt_Calc in 'U_BigInt_Calc.pas',
  U_RSA_Gen_Keys in 'U_RSA_Gen_Keys.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
