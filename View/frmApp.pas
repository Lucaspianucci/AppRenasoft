unit frmApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.Edit, FMX.Objects, FMX.TabControl, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.ScrollBox,
  FMX.DateTimeCtrls, System.Actions, FMX.ActnList, FMX.Gestures, FMX.Media,
  DataModule,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Classe.Produtos, Classe.Funcionario, Classe.Compras,
  System.Generics.Collections, FMX.Memo;

type
  TfrmAppBarzinho = class(TForm)
    TabControl1: TTabControl;
    tabInicial: TTabItem;
    tabListaProdutos: TTabItem;
    FundoLista: TRectangle;
    layList: TLayout;
    pPesquisa: TPanel;
    layPesquisa: TLayout;
    tabEntrarSistema: TTabItem;
    fundoEntrar: TRectangle;
    Layout2: TLayout;
    Image1: TImage;
    Label2: TLabel;
    EUsuario: TRectangle;
    edUsuario: TEdit;
    Label4: TLabel;
    ESenha: TRectangle;
    edSenha: TEdit;
    Label6: TLabel;
    tab: TActionList;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label3: TLabel;
    Rectangle2: TRectangle;
    edtPesquisa: TEdit;
    tabMenuInicial: TChangeTabAction;
    btnAcessar: TSpeedButton;
    DataSource1: TDataSource;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB1: TBindSourceDB;
    tabListaProdutoss: TChangeTabAction;
    LinkFillControlToField2: TLinkFillControlToField;
    lvProdutos: TListView;
    LinkFillControlToField3: TLinkFillControlToField;
    pBaixo: TPanel;
    imCarrinho: TImage;
    lTotalnoCarrinho: TLabel;
    Layout3: TLayout;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Image2: TImage;
    Image3: TImage;
    Label7: TLabel;
    Label8: TLabel;
    layCardeneta: TLayout;
    ICardeneta: TImage;
    Memo1: TMemo;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure lvProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure edtPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure imCarrinhoClick(Sender: TObject);
    procedure ICardenetaClick(Sender: TObject);
    procedure edtPesquisaChangeTracking(Sender: TObject);

  private
    { Private declarations }
    Lista: TObjectList<TProdutos>;
  public
    { Public declarations }
  end;

var
  frmAppBarzinho: TfrmAppBarzinho;
  TCompraADD: TCompra;
  Compra: TCompra;

implementation

{$R *.fmx}
{$R *.iPhone55in.fmx IOS}
{$R *.iPhone47in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TfrmAppBarzinho.btnAcessarClick(Sender: TObject);
begin
  if (edUsuario.Text <> 'LUCA') then
    raise Exception.Create('Usuario ou Senha Incorreto');
  if (edSenha.Text <> '123') then
    raise Exception.Create('Usuario ou Senha Incorreto');
  tabListaProdutoss.ExecuteTarget(tab);
end;

procedure TfrmAppBarzinho.btnPesquisarClick(Sender: TObject);
begin
  dm.fdCon.Open();
  dm.WProdutos.SQL.Clear;
  dm.WProdutos.SQL.Add('SELECT * FROM TBLPRODUTOS');
  dm.WProdutos.SQL.Add(' WHERE NOMEPROD LIKE :NOMEPRODUTO');
  dm.WProdutos.ParamByName('NOMEPRODUTO').AsString :=
    '%' + edtPesquisa.Text + '%';
  dm.WProdutos.Open();
end;

procedure TfrmAppBarzinho.edtPesquisaChangeTracking(Sender: TObject);
begin
  dm.fdCon.Open();
  dm.WProdutos.SQL.Clear;
  dm.WProdutos.SQL.Add('SELECT * FROM TBLPRODUTOS');
  dm.WProdutos.SQL.Add(' WHERE NOMEPROD LIKE :NOMEPRODUTO');
  dm.WProdutos.ParamByName('NOMEPRODUTO').AsString :=
    '%' + edtPesquisa.Text + '%';
  dm.WProdutos.Open();
end;

procedure TfrmAppBarzinho.edtPesquisaClick(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TfrmAppBarzinho.FormCreate(Sender: TObject);
begin
  Lista := TObjectList<TProdutos>.Create;
  Compra := TCompra.Create('16/02/2021');
end;

procedure TfrmAppBarzinho.ICardenetaClick(Sender: TObject);
begin
  ICardeneta.Visible := false;
end;

procedure TfrmAppBarzinho.imCarrinhoClick(Sender: TObject);
// ShowMessage(Compra.ExibirProdutosCompra(Lista));
var
  LContador: Integer;
  LProdutosLista: String;
  LValorProdutoLista: String;
begin
  ICardeneta.Visible := true;
  for LContador := 0 to Pred(Lista.Count) do
    LProdutosLista := (Lista[LContador].FNomeProduto);
  Memo1.Lines.Strings[LContador] := LProdutosLista;
end;

procedure TfrmAppBarzinho.lvProdutosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  LCodigoItemLV: Integer;
  LNomeProduto: String;
  LProdutoADD: TProdutos;
  LValorProduto: Currency;
begin
  LCodigoItemLV := AItem.Index;
  LNomeProduto := lvProdutos.Items[LCodigoItemLV].Text;
  LValorProduto := StrToCurr(lvProdutos.Items[LCodigoItemLV].Detail);

  MessageDlg('Deseja Comprar 1 ' + LNomeProduto + ' ?',
    System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo], 0,

    procedure(const AResult: System.UITypes.TModalResult)
    var
      LContador: Integer;
    begin
      case AResult of
        mrYES:
          begin
            Lista.Add(TProdutos.Create(LNomeProduto, LValorProduto, 1));
            ShowMessage('Adicionado o Produto a Compra');
          end;
        mrNo:
        end;
      end);
    end;

    procedure TfrmAppBarzinho.Rectangle4Click(Sender: TObject);
    begin
      Lista.Free;
    end;

end.
