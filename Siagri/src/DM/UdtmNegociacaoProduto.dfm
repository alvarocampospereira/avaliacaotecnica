object dtmNegociacaoProduto: TdtmNegociacaoProduto
  OldCreateOrder = False
  Height = 261
  Width = 335
  object sdsNegProduto: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM NEGOCIACAOPRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 40
    Top = 32
    object sdsNegProdutoID_NEGOCIACAOPRODUTO: TIntegerField
      FieldName = 'ID_NEGOCIACAOPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNegProdutoID_NEGOCIACAO: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNegProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNegProdutoVALORPRODUTO: TFMTBCDField
      FieldName = 'VALORPRODUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object sdsNegProdutoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object sdsNegProdutoVALORTOTALPRODUTO: TFMTBCDField
      FieldName = 'VALORTOTALPRODUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object dspNegProduto: TDataSetProvider
    DataSet = sdsNegProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 104
  end
  object cdsNegProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNegProduto'
    BeforePost = cdsNegProdutoBeforePost
    Left = 40
    Top = 168
    object cdsNegProdutoID_NEGOCIACAOPRODUTO: TIntegerField
      FieldName = 'ID_NEGOCIACAOPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNegProdutoID_NEGOCIACAO: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNegProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNegProdutoVALORPRODUTO: TFMTBCDField
      FieldName = 'VALORPRODUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsNegProdutoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsNegProdutoVALORTOTALPRODUTO: TFMTBCDField
      FieldName = 'VALORTOTALPRODUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object sdsNegProdutoProdutos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT NEGOCIACAOPRODUTO.id_negociacaoproduto, NEGOCIACAOPRODUTO' +
      '.id_produto,'#13#10'NEGOCIACAOPRODUTO.valorproduto, NEGOCIACAOPRODUTO.' +
      'quantidade, NEGOCIACAOPRODUTO.valortotalproduto, PRODUTO.nomepro' +
      'duto'#13#10'FROM NEGOCIACAOPRODUTO, PRODUTO'#13#10'WHERE NEGOCIACAOPRODUTO.i' +
      'd_produto = PRODUTO.id_produto'#13#10'AND NEGOCIACAOPRODUTO.id_negocia' +
      'cao = :IDNEGOCIACAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDNEGOCIACAO'
        ParamType = ptInput
      end>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 154
    Top = 32
    object sdsNegProdutoProdutosID_NEGOCIACAOPRODUTO: TIntegerField
      FieldName = 'ID_NEGOCIACAOPRODUTO'
      Required = True
    end
    object sdsNegProdutoProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object sdsNegProdutoProdutosVALORPRODUTO: TFMTBCDField
      FieldName = 'VALORPRODUTO'
      Precision = 15
      Size = 2
    end
    object sdsNegProdutoProdutosQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 2
    end
    object sdsNegProdutoProdutosVALORTOTALPRODUTO: TFMTBCDField
      FieldName = 'VALORTOTALPRODUTO'
      Precision = 15
      Size = 2
    end
    object sdsNegProdutoProdutosNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 50
    end
  end
  object dspNegProdutoProdutos: TDataSetProvider
    DataSet = sdsNegProdutoProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 154
    Top = 104
  end
  object cdsNegProdutoProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDNEGOCIACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspNegProdutoProdutos'
    BeforePost = cdsNegProdutoBeforePost
    Left = 154
    Top = 168
    object cdsNegProdutoProdutosID_NEGOCIACAOPRODUTO: TIntegerField
      FieldName = 'ID_NEGOCIACAOPRODUTO'
      Required = True
      Visible = False
    end
    object cdsNegProdutoProdutosID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsNegProdutoProdutosNOMEPRODUTO: TStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'NOMEPRODUTO'
      Size = 50
    end
    object cdsNegProdutoProdutosVALORPRODUTO: TFMTBCDField
      DisplayLabel = 'Valor Unit'
      DisplayWidth = 10
      FieldName = 'VALORPRODUTO'
      OnGetText = cdsNegProdutoProdutosVALORPRODUTOGetText
      Precision = 15
      Size = 2
    end
    object cdsNegProdutoProdutosQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
      OnGetText = cdsNegProdutoProdutosQUANTIDADEGetText
      Precision = 15
      Size = 2
    end
    object cdsNegProdutoProdutosVALORTOTALPRODUTO: TFMTBCDField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTALPRODUTO'
      OnGetText = cdsNegProdutoProdutosVALORTOTALPRODUTOGetText
      Precision = 15
      Size = 2
    end
  end
end
