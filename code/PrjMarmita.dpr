program PrjMarmita;

uses
  Vcl.Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Green');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
