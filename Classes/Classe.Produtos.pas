unit Classe.Produtos;

interface

uses
  Classes, Contnrs, SysUtils;

type
  TProdutos = class
  private
    FListaProdutos: TObjectList;
    FFNomeProduto: String;
    FFValorProduto: Currency;
    FFQuantidadeProduto: Integer;
    FFCategoria: String;
    procedure SetFNomeProduto(const Value: String);
    procedure SetFValorProduto(const Value: Currency);
    procedure SetFQuantidadeProduto(const Value: Integer);
    procedure SetFCategoria(const Value: String);

  public
    constructor Create;
    destructor Destroy; override;
    property FNomeProduto: String read FFNomeProduto write SetFNomeProduto;
    property FValorProduto: Currency read FFValorProduto write SetFValorProduto;
    property FQuantidadeProduto: Integer read FFQuantidadeProduto
      write SetFQuantidadeProduto;
    property FCategoria: String read FFCategoria write SetFCategoria;
    procedure AdicionarProduto(FProduto: TProdutos);
    function ExibiInformacoesProduto(Index: Integer): String;
    function Count: Integer;
  end;

implementation

{ TProdutos }

procedure TProdutos.AdicionarProduto(FProduto: TProdutos);
begin
  FListaProdutos.Add(FProduto);
end;

function TProdutos.Count: Integer;
begin
  Result := FListaProdutos.Count;
end;

constructor TProdutos.Create;
begin
  inherited Create;
  FListaProdutos := TObjectList.Create;
end;

destructor TProdutos.Destroy;
begin

  inherited;
end;

function TProdutos.ExibiInformacoesProduto(Index: Integer): String;
var
  i: Integer;
begin
  for i := 0 to FListaProdutos.Count - 1 do
    Result := ((FListaProdutos.Items[i] as TProdutos).FFNomeProduto);
end;

procedure TProdutos.SetFCategoria(const Value: String);
begin
  FFCategoria := Value;
end;

procedure TProdutos.SetFNomeProduto(const Value: String);
begin
  if (Value = '') then
    raise Exception.Create('Nome Produto Vazio');
  FFNomeProduto := Value;
end;

procedure TProdutos.SetFQuantidadeProduto(const Value: Integer);
begin
  if (Value = 0) then
    raise Exception.Create('Quantidade do Produto Invalida');
  FFQuantidadeProduto := Value;
end;

procedure TProdutos.SetFValorProduto(const Value: Currency);
begin
  if (Value = 0) then
    raise Exception.Create('Valor do Produto Invalido');
  FFValorProduto := Value;
end;

end.
