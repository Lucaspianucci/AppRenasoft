object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 371
  Width = 564
  object fdCon: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 296
    Top = 32
  end
  object WProdutos: TFDQuery
    IndexesActive = False
    Connection = fdCon
    Left = 32
    Top = 80
    object WProdutosCODINT: TFDAutoIncField
      FieldName = 'CODINT'
      ReadOnly = True
    end
    object WProdutosNOMEPROD: TStringField
      FieldName = 'NOMEPROD'
      Size = 60
    end
    object WProdutosVALORPROD: TLargeintField
      FieldName = 'VALORPROD'
      Origin = 'VALORPROD'
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 144
  end
end
