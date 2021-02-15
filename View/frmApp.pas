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
  FMX.ListView, Classe.Produtos, Classe.Funcionario, Classe.Compras;

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
    btnPesquisar: TSpeedButton;
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
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure lvProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Label8Click(Sender: TObject);
    procedure edtPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imCarrinhoClick(Sender: TObject);

  private
    { Private declarations }
    tempListaProdutos: TProdutos;
  public
    { Public declarations }
  end;

var
  frmAppBarzinho: TfrmAppBarzinho;
  TCompraADD: TCompra;

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

procedure TfrmAppBarzinho.edtPesquisaClick(Sender: TObject);
begin
  edtPesquisa.Text := '';
end;

procedure TfrmAppBarzinho.FormCreate(Sender: TObject);
begin
  TCompraADD := TCompra.Create;
  tempListaProdutos := TProdutos.Create;
end;

procedure TfrmAppBarzinho.imCarrinhoClick(Sender: TObject);
begin
  ShowMessage(tempListaProdutos.ExibiInformacoesProduto(1));
end;

procedure TfrmAppBarzinho.Label8Click(Sender: TObject);

begin
  MessageDlg('Tem certeza que Deseja Confirmar a compra?',
    System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo], 0,

    procedure(const AResult: System.UITypes.TModalResult)
    begin
      case AResult of
        mrYES:
          begin
            try

            finally

            end;
          end;
        mrNo:
        end;
      end);
    end;

    procedure TfrmAppBarzinho.lvProdutosItemClick(const Sender: TObject;
    const AItem: TListViewItem);
    var
      LCodigoItemLV: integer;
      LNomeProduto: String;
      LProdutoADD: TProdutos;
      LValorProduto: Currency;

    begin
      LCodigoItemLV := AItem.Index;
      LNomeProduto := lvProdutos.Items[LCodigoItemLV].Text;
      LValorProduto := StrToCurr(lvProdutos.Items[LCodigoItemLV].Detail);

      MessageDlg('DESEJA COMPRAR 1 ' + LNomeProduto + ' ?',
        System.UITypes.TMsgDlgType.mtConfirmation,
        [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,

        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrYES:
              begin
                LProdutoADD := TProdutos.Create;
                try
                  // Adicionado os atributos ao objeto criado
                  LProdutoADD.FNomeProduto := LNomeProduto;
                  LProdutoADD.FValorProduto := LValorProduto;

                  // Exibindo no Label Total
                  lTotalnoCarrinho.Text := 'Total no Carrinho: ' +
                    FormatFloat('R$ ###,###,##0.00', (LValorProduto));

                  // Inserir o Objeto e seus Atributos em uma Lista
                  tempListaProdutos.AdicionarProduto(LProdutoADD);
                finally
//                  LProdutoADD.Free;
                    //Teste01GIT
                end;
              end;
            mrNo:
            end;
          end);
        end;

end.
