object dtmProduto: TdtmProduto
  OldCreateOrder = False
  Height = 246
  Width = 280
  object sdsProduto: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 40
    Top = 32
    object sdsProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsProdutoNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sdsProdutoVALORVENDA: TFMTBCDField
      FieldName = 'VALORVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 104
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    BeforePost = cdsProdutoBeforePost
    Left = 40
    Top = 168
    object cdsProdutoID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsProdutoNOMEPRODUTO: TStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsProdutoVALORVENDA: TFMTBCDField
      DisplayLabel = 'Valor Venda'
      FieldName = 'VALORVENDA'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsProdutoVALORVENDAGetText
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
  end
end
