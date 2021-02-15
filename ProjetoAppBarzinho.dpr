program ProjetoAppBarzinho;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmApp in 'View\frmApp.pas' {frmAppBarzinho},
  DataModule in 'Model\DataModule.pas' {dm: TDataModule},
  Classe.Produtos in 'Classes\Classe.Produtos.pas',
  Classe.Compras in 'Classes\Classe.Compras.pas',
  Classe.Funcionario in 'Classes\Classe.Funcionario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAppBarzinho, frmAppBarzinho);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
