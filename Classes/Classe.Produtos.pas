unit Classe.Produtos;

interface

uses
  Classes, Contnrs, SysUtils, System.Generics.Collections;

type
  TProdutos = class
  private
    FFNomeProduto: String;
    FFValorProduto: Currency;
    FFQuantidadeProduto: Integer;
    FFCategoria: String;
    FIDProduto: integer;
    FIDCompra: Integer;
    procedure SetFNomeProduto(const Value: String);
    procedure SetFValorProduto(const Value: Currency);
    procedure SetFQuantidadeProduto(const Value: Integer);
    procedure SetFCategoria(const Value: String);
    procedure SetIDProduto(const Value: integer);
    procedure SetIDCompra(const Value: Integer);

  public
    constructor Create(NomeProduto: String; ValorProduto: Currency; Quantidade: Integer);
    destructor Destroy; override;
    property FNomeProduto: String read FFNomeProduto write SetFNomeProduto;
    property FValorProduto: Currency read FFValorProduto write SetFValorProduto;
    property FQuantidadeProduto: Integer read FFQuantidadeProduto
      write SetFQuantidadeProduto;
    property FCategoria: String read FFCategoria write SetFCategoria;
    property IDProduto: integer read FIDProduto write SetIDProduto;
    property IDCompra: Integer read FIDCompra write SetIDCompra;
  end;

implementation

{ TProdutos }

constructor TProdutos.Create(NomeProduto: String; ValorProduto: Currency;
  Quantidade: Integer);
begin
  FNomeProduto := NomeProduto;
  FValorProduto := ValorProduto;
  FQuantidadeProduto := Quantidade;
end;

destructor TProdutos.Destroy;
begin
  inherited;
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

procedure TProdutos.SetIDCompra(const Value: Integer);
begin
  FIDCompra := Value;
end;

procedure TProdutos.SetIDProduto(const Value: integer);
begin
  FIDProduto := Value;
end;

end.
