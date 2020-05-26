object dtmDistribuidor: TdtmDistribuidor
  OldCreateOrder = False
  Height = 312
  Width = 363
  object sdsDistribuidor: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM DISTRIBUIDOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 40
    Top = 32
    object sdsDistribuidorID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsDistribuidorNOMEDISTRIBUIDOR: TStringField
      FieldName = 'NOMEDISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sdsDistribuidorCNPJDISTRUIBUIDOR: TStringField
      FieldName = 'CNPJDISTRUIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
  end
  object dspDistribuidor: TDataSetProvider
    DataSet = sdsDistribuidor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 104
  end
  object cdsDistribuidor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDistribuidor'
    BeforePost = cdsDistribuidorBeforePost
    Left = 40
    Top = 168
    object cdsDistribuidorID_DISTRIBUIDOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDistribuidorNOMEDISTRIBUIDOR: TStringField
      DisplayLabel = 'Nome Distribuidor'
      FieldName = 'NOMEDISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsDistribuidorCNPJDISTRUIBUIDOR: TStringField
      DisplayLabel = 'Cnpj'
      FieldName = 'CNPJDISTRUIBUIDOR'
      ProviderFlags = [pfInUpdate]
      EditMask = '00.000.000/0000-00;1; '
      Size = 18
    end
  end
end
