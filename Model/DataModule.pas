unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.DBClient, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite, System.IOUtils;

type
  Tdm = class(TDataModule)
    fdCon: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    WProdutos: TFDQuery;
    ClientDataSet1: TClientDataSet;
    WProdutosCODINT: TFDAutoIncField;
    WProdutosNOMEPROD: TStringField;
    WProdutosVALORPROD: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  with fdCon do
  begin
{$IFDEF IOS}
    Params.Values['DriverID'] := 'SQLite';
    try
      Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,
        'DBAppRenasoft.db');
      Connected := true;
    except
      on E: Exception do
        raise Exception.Create('Erro de conex�o com o banco de dados: ' +
          E.Message);
    end;
{$ENDIF}
{$IFDEF ANDROID}
    Params.Values['DriverID'] := 'SQLite';
    try
      Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,
        'DBAppRenasoft.db');
      Connected := true;
    except
      on E: Exception do
        raise Exception.Create('Erro de conex�o com o banco de dados: ' +
          E.Message);
    end;
{$ENDIF}
{$IFDEF MSWINDOWS}
    try
      Params.Values['Database'] := 'C:\Users\LRC\Desktop\AppRenasoft\DB\DBAppRenasoft.db';
      Connected := true;
    except
      on E: Exception do
        raise Exception.Create('Erro de conex�o com o banco de dados: ' +
          E.Message);
    end;
{$ENDIF}
  end;
end;

end.
