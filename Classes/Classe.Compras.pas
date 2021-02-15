unit Classe.Compras;

interface

uses Classe.Produtos;

type
  TCompra = class(TProdutos)
  private
    FFDataCompra: String;
    FFFormadePagamento: String;
    procedure SetFDataCompra(const Value: String);
    procedure SetFFormadePagamento(const Value: String);
    property FDataCompra: String read FFDataCompra write SetFDataCompra;
    property FFormadePagamento: String read FFFormadePagamento
      write SetFFormadePagamento;
  public
    constructor Create;
    destructor Destroy; override;
    class function new: TProdutos;
    function ValorTotalCarrinho: Currency;

  end;

implementation

{ TCompra }

constructor TCompra.Create;
begin

end;

destructor TCompra.Destroy;
begin

  inherited;
end;

class function TCompra.new: TProdutos;
begin

end;

procedure TCompra.SetFDataCompra(const Value: String);
begin
  FFDataCompra := Value;
end;

procedure TCompra.SetFFormadePagamento(const Value: String);
begin
  FFFormadePagamento := Value;
end;

function TCompra.ValorTotalCarrinho: Currency;
begin

end;

end.
