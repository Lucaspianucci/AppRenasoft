unit Classe.Funcionario;

interface

uses
  Classe.Compras;

type
  TFuncionario = class(TCompra)
  private
    FFNome: String;
    FValorGasto: Currency;
    procedure SetFNome(const Value: String);
    procedure SetValorGasto(const Value: Currency);

  public
    property FNome: String read FFNome write SetFNome;
    property ValorGasto: Currency read FValorGasto write SetValorGasto;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create;
begin

end;

destructor TFuncionario.Destroy;
begin

  inherited;
end;

procedure TFuncionario.SetFNome(const Value: String);
begin
  FFNome := Value;
end;

procedure TFuncionario.SetValorGasto(const Value: Currency);
begin
  FValorGasto := Value;
end;

end.
