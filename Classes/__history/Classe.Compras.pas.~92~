unit Classe.Compras;

interface

uses Classe.Produtos, System.Generics.Collections, Classes;

type
  TCompra = class(TProdutos)
  private
    FIDCompra: Integer;
    FDataCompra: String;
    procedure SetIDCompra(const Value: Integer);
    procedure SetDataCompra(const Value: String);
  public
    constructor Create(Data: String);
    destructor Destroy; override;
    function ValorTotalCarrinho: Currency;
    property IDCompra: Integer read FIDCompra write SetIDCompra;
    property DataCompra: String read FDataCompra write SetDataCompra;
    function ExibirProdutosCompra(Lista: TObjectList<TProdutos>): string;
  end;

implementation

{ TCompra }

constructor TCompra.Create(Data: String);
begin
  Data := FDataCompra;
end;

destructor TCompra.Destroy;
begin

  inherited;
end;

function TCompra.ExibirProdutosCompra(Lista: TObjectList<TProdutos>): string;
var
  LContador: Integer;
  LProdutosLista: String;
begin
  for LContador := 0 to Pred(Lista.Count) do
    LProdutosLista :=  (Lista[LContador].FNomeProduto);
    Result:= LProdutosLista;
end;

procedure TCompra.SetDataCompra(const Value: String);
begin
  FDataCompra := Value;
end;

procedure TCompra.SetIDCompra(const Value: Integer);
begin

end;

function TCompra.ValorTotalCarrinho: Currency;
begin

end;

end.
